package com.spring.catalk.Controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class HomeController {
    @GetMapping(path = {"/"})
    public String login() {
        return "login";
    }

    @GetMapping(path = {"/sign-up"})
    public String signUp() {
        return "sign-up";
    }

    @GetMapping(path = {"/friends"})
    public String friends() {
        return "friends";
    }
}