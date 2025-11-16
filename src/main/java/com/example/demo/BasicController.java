package com.example.demo;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.time.LocalDateTime;

@RestController
@RequestMapping("/saludo")
public class BasicController {

    @GetMapping
    public String saludo() {
        return "Saludando el: " + LocalDateTime.now();
    }
}
