package com.spring.catalk.Controller;

import com.spring.catalk.Dto.UserDto;
import com.spring.catalk.Service.UserService;
import jakarta.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;


@Controller @RequestMapping("/user")
public class UserController {

    @Autowired
    @Qualifier("userService")
    private UserService userService;

    @PostMapping("/showSignUp")
    public String showSignUp(){

        return "sign-up";
    }

    @PostMapping("/doSignUp")
    public String doSignUp(UserDto user, HttpSession session, Model model) throws ParseException {

        userService.saveUser(user);

        if (user != null) {
            session.setAttribute("loginUser", user);

        } else {
            model.addAttribute("signUpFail", "signUpFail");
            return "home";
        }

        //model.addAttribute(newUser);

        return "friends";
    }



}
