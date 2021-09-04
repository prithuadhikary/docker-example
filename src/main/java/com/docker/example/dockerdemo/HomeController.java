package com.docker.example.dockerdemo;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.UUID;

@RestController
public class HomeController {

    private static final String RANDOM_ID = UUID.randomUUID().toString();

    @GetMapping("/")
    public String hello() {
        return "Hello World from " + RANDOM_ID;
    }

}
