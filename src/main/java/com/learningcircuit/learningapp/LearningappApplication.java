package com.learningcircuit.learningapp;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@SpringBootApplication
@RestController
public class LearningappApplication  {

    @RequestMapping("/")
    public String home() {
        return "Welcome to the Learning Circuit Session. Dockerizing Spring Boot Application";
    }

    public static void main(String[] args) {
        SpringApplication.run(LearningappApplication.class, args);
    }

}

