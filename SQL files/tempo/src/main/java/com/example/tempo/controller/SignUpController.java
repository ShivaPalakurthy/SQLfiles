package com.example.tempo.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.example.tempo.model.SignUpModel;
import com.example.tempo.repo.SIgnUpRepo;
@CrossOrigin(origins = "null", allowedHeaders = "*")
@RestController
@RequestMapping("/api/v1")
public class SignUpController {
	@Autowired
    private SIgnUpRepo signuprepo  ;
	 @PostMapping("/signuprepo")
	    public SignUpModel createEmployee( @RequestBody SignUpModel  regi) {
	        return signuprepo.save(regi);
	    }

}
