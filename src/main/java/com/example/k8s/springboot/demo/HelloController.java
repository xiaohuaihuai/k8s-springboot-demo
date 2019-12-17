package com.example.k8s.springboot.demo;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
public class HelloController {
    public static final Logger logger = LoggerFactory.getLogger(HelloController.class);

    @RequestMapping("/hello/{name}")
    public String hello(@PathVariable String name){
        logger.info("info name:{}", name);
        logger.error("error name:{}", name);
        logger.debug("debug name:{}", name);
        logger.warn("warn name:{}", name);
        logger.trace("trace name:{}", name);
        return "hello,"+name;
    }

}
