package com.edu.springboot;

import org.springframework.beans.factory.annotation.Autowired;

import com.edu.springboot.jdbc.IStoreService;

public class RevieController {
	
	@Autowired
	IStoreService dao;
}
