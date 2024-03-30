package com.spring.catalk.Controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class HomeController {
    @GetMapping(path = {"/","/home"})
    public String login() {
        return "user/login";
    }

    @GetMapping(path = {"/chats"})
    public String chats() {
        return "chats";
    }

    @GetMapping(path = {"/chat-room"})
    public String chatRoom() {
        return "chat-room";
    }

    @GetMapping(path = {"/settings"})
    public String settings() {
        return "settings";
    }

    @GetMapping(path = {"/my-page"})
    public String myPage() {
        return "my-page";
    }
}