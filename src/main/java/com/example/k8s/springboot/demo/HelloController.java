package com.example.k8s.springboot.demo;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
public class HelloController {
    public static final Logger logger = LoggerFactory.getLogger(HelloController.class);

    @RequestMapping("/hello/{name}")
    public ResponseEntity<String> hello(@PathVariable String name){
        logger.info("hello,{}", name);
        logger.error("hello,{}", name);
        logger.debug("hello,{}", name);
        logger.warn("hello,{}", name);
        logger.trace("hello,{}", name);
        return ResponseEntity.ok("hello,"+name);
    }

}
