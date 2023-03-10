package com.edu.springboot;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.security.crypto.factory.PasswordEncoderFactories;

@SpringBootApplication
public class FpRoupangApplication {

	public static void main(String[] args) {
		SpringApplication.run(FpRoupangApplication.class, args);
//		String passwd = 
//		PasswordEncoderFactories.createDelegatingPasswordEncoder().encode("1234");
//		System.out.println(passwd);
	} 

}
