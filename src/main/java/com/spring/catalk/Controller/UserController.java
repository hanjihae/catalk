package com.spring.catalk.Controller;

import com.spring.catalk.Dto.UserDto;
import com.spring.catalk.Service.UserService;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import jakarta.validation.Valid;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;

import java.io.IOException;
import java.text.ParseException;


@Controller @RequestMapping("/user") @Slf4j
public class UserController {

    @Autowired
    @Qualifier("userService")
    private UserService userService;

    @RequestMapping("/showSignUp") //로그인창에서 가입하기 누르면 가입창 보여줌
    public String showSignUp(){
        return "sign-up";
    }

    @RequestMapping("/doSignUp") //가입창에서 가입하기 누르면 유저 정보 저장
    public String doSignUp(@Valid UserDto user, BindingResult br, HttpSession session, Model model) {
        if (br.hasErrors()) {
            model.addAttribute("signUpFail", "signUpFail");
            return "redirect:/user/showSignUp";
        }
        userService.saveUser(user);
        if (user != null) {
            session.setAttribute("loginUser", user);
            return "friends";
        } else {
            model.addAttribute("signUpFail", "signUpFail");
            return "home";
        }
    }

    @RequestMapping("/doLogin")//로그인처리
    public String doLogin(String userId, String userPw, HttpSession session, Model model) {
        UserDto user = userService.findUserByIdAndPasswd(userId, userPw);
        if (user != null) {
            session.setAttribute("loginUser", user);
            return "redirect:/friends";
        } else {
            model.addAttribute("loginfail", user);
            return "redirect:/home";
        }
    }

    @RequestMapping(value = {"/userIdCheck"}, method = RequestMethod.POST)
    public void userIdCheck(HttpServletResponse response, @RequestParam("userId") String UserId) throws IOException {
        userService.userIdCheck(UserId, response);
    }


}
