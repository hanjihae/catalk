package com.spring.catalk.Controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class HomeController {
    @GetMapping(path = {"/"}) // FrontController에 연결 설정
    public String home() {
        return "home"; // /WEB-INF/views/ + home + .jsp
    }
}