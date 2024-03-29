package com.edu.springboot.conf;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.sql.DataSource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.access.AccessDeniedException;
import org.springframework.security.authentication.AuthenticationManager;
import org.springframework.security.config.annotation.authentication.builders.AuthenticationManagerBuilder;
import org.springframework.security.config.annotation.authentication.configuration.AuthenticationConfiguration;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.crypto.factory.PasswordEncoderFactories;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.security.web.SecurityFilterChain;
import org.springframework.security.web.access.AccessDeniedHandler;
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
	public SecurityFilterChain filterChain(HttpSecurity httpSecurity) throws Exception {
	    httpSecurity.authorizeRequests()
	        .antMatchers("/").permitAll()
	        .antMatchers("/css/**", "/js/**", "/images/**").permitAll()
	        .antMatchers("/guest/**").permitAll()
	        .antMatchers("/member/**").hasAnyRole("admin", "member", "seller")
	        .antMatchers("/supports/voc.do").hasAnyRole("admin", "member", "seller")
	        .antMatchers("/supports/inquiry.do").hasAnyRole("admin", "member", "seller")
	        .antMatchers("/myroupang/**").hasAnyRole("admin", "member", "seller")
	        .antMatchers("/Sell_Authorized.do").hasAnyRole("member", "seller")
	        .antMatchers("/admin/index.do").hasAnyRole("admin", "seller")
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

	    httpSecurity.exceptionHandling()
	        .accessDeniedHandler(new CustomAccessDeniedHandler())
	        .accessDeniedPage("/");

	    httpSecurity.csrf().disable();

	    return httpSecurity.build();
	}

	public class CustomAccessDeniedHandler implements AccessDeniedHandler {
	    @Override
	    public void handle(HttpServletRequest request, HttpServletResponse response, AccessDeniedException accessDeniedException) throws IOException, ServletException {
	        String referer = request.getHeader("Referer");
	        String errMessage = "해당 페이지에 접근이 불가능합니다. 관리자에게 문의해주세요";
	        request.setAttribute("errMessage", errMessage);
	        response.sendRedirect(referer);
	        
	    }
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
