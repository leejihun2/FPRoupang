package com.edu.springboot.conf;

import javax.sql.DataSource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.authentication.AuthenticationManager;
import org.springframework.security.config.annotation.authentication.builders.AuthenticationManagerBuilder;
import org.springframework.security.config.annotation.authentication.configuration.AuthenticationConfiguration;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.crypto.factory.PasswordEncoderFactories;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.security.web.SecurityFilterChain;
import org.springframework.security.web.authentication.AuthenticationFailureHandler;

@Configuration
@EnableWebSecurity
public class SecurityConfig {
	
	@Autowired
	public AuthenticationFailureHandler authenticationFailureHandler;

	@Bean
	public AuthenticationManager authenticationManager(AuthenticationConfiguration
			authConfiguration) throws Exception {
		return authConfiguration.getAuthenticationManager();
	}
	
	@Bean
	public SecurityFilterChain filterChain(HttpSecurity httpSecurity) 
			throws Exception {
		httpSecurity.authorizeRequests()
		.antMatchers("/").permitAll()
		.antMatchers("/css/**","/js/**","/images/**").permitAll()
		.antMatchers("/guest/**").permitAll()
		.antMatchers("/member/**").hasAnyRole("admin", "member", "seller")
		.antMatchers("/supports/voc.jsp").hasAnyRole("admin", "member", "seller")
		.antMatchers("/supports/inquiry.jsp").hasAnyRole("admin", "member", "seller")
		.antMatchers("/admin/index.do").hasAnyRole("admin","seller")
		.antMatchers("/admin/**").hasRole("admin")
		.antMatchers("/product_insert").hasAnyRole("admin", "seller")
        .antMatchers("/agreement/**").hasAnyRole("admin", "seller")
        .antMatchers("/**").permitAll()
		.anyRequest().authenticated();
		
		httpSecurity.formLogin()
			.loginPage("/myLogin.do")
	        .loginProcessingUrl("/myLoginAction.do")
	        .defaultSuccessUrl("/")
	        .failureHandler(authenticationFailureHandler) 
	        .usernameParameter("my_id")	
	        .passwordParameter("my_pass")
        	.permitAll();
		
		httpSecurity.logout()
			.logoutUrl("/myLogout.do")
	        .logoutSuccessUrl("/")
			.permitAll();
	
		httpSecurity.exceptionHandling().accessDeniedPage("/denied.do");
		
		httpSecurity.csrf().disable();
		
		return httpSecurity.build();
	}
    @Autowired
    private DataSource dataSource;
    
    @Autowired
    protected void configure(AuthenticationManagerBuilder auth) 
    		throws Exception {
    	auth.jdbcAuthentication()
    		.dataSource(dataSource) 
    		.usersByUsernameQuery("select email, password, enabled"
    					+ " from member where email = ?")
    		.authoritiesByUsernameQuery("select email, authority "
    					+ " from member where email = ?")
    		.passwordEncoder(passwordEncoder());
    }
    
    public PasswordEncoder passwordEncoder() {
        return PasswordEncoderFactories.createDelegatingPasswordEncoder();
    }
}
