package com.spring.catalk.Controller;

import com.google.gson.JsonObject;
import com.google.gson.JsonParser;
import com.spring.catalk.Dto.ChatDto;
import com.spring.catalk.Dto.ChatJoinDto;
import com.spring.catalk.Dto.MessageDto;
import com.spring.catalk.Dto.UserDto;
import com.spring.catalk.Service.ChatService;
import com.spring.catalk.Service.ProfileService;
import com.spring.catalk.Service.UserService;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import jakarta.validation.Valid;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;

import java.io.IOException;
import java.time.LocalDateTime;


@Controller @RequestMapping("/user")
public class UserController {

    @Autowired
    @Qualifier("userService")
    private UserService userService;

    @Autowired
    @Qualifier("chatService")
    private ChatService chatService;

    @Autowired
    @Qualifier("profileService")
    private ProfileService profileService;

    @RequestMapping("/showSignUp") //로그인창에서 가입하기 누르면 가입창 보여줌
    public String showSignUp(){
        return "user/sign-up";
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

            // 채팅방 생성 및 사용자 추가
            int chatNum = chatService.createChatRoomAndJoin(user.getUserName(), user.getUserNum());
            // 채팅 추가
            MessageDto message = new MessageDto();
            message.setMessageContent("나와의 채팅을 시작하라옹!");
            chatService.addMessageToChat(message, chatNum, user.getUserNum());

            // 기본 프로필 생성
            profileService.createBasicProfile(user.getUserNum(), user.getUserName());

            return "friend/friend_list";
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
            return "redirect:/friend/friend_list";
        } else {
            model.addAttribute("loginfail", user);
            return "redirect:/home";
        }
    }

    @RequestMapping(value = {"/userIdCheck"}, method = RequestMethod.POST)
    public void userIdCheck(HttpServletResponse response, @RequestParam("userId") String UserId) throws IOException {
        userService.userIdCheck(UserId, response);
    }

    @RequestMapping("/findIdPopup")
    public String showFindIdPopup(){
        return "user/findIdPopup";
    }

    @RequestMapping("/findPwPopup")
    public String showFindPwPopup(){
        return "user/findPwPopup";
    }

    @RequestMapping(value ="/findUser", method = RequestMethod.POST, produces = "application/json; charset=utf8") @ResponseBody
    public String findUserData(@RequestBody String data) throws IOException{
        JsonParser jsonParser = new JsonParser();

        // JSON 문자열을 JsonElement로 파싱
        JsonObject jsonObject = jsonParser.parse(data).getAsJsonObject();

        // 특정 키의 값을 가져오기
        String userData1 = jsonObject.get("userData1").getAsString();
        String userData2 = jsonObject.get("userData2").getAsString();
        String userData3 = jsonObject.get("userData3").getAsString();

        return userService.findUserData(userData1, userData2, userData3);
    }

    @RequestMapping(value ="/changePw", method = RequestMethod.POST, produces = "application/json; charset=utf8") @ResponseBody
    public void changePw(@RequestBody String data){
        JsonParser jsonParser = new JsonParser();

        // JSON 문자열을 JsonElement로 파싱
        JsonObject jsonObject = jsonParser.parse(data).getAsJsonObject();

        // 특정 키의 값을 가져오기
        String userId = jsonObject.get("userId").getAsString();
        String userPw = jsonObject.get("userPw").getAsString();

        userService.changePw(userId, userPw);
    }



}
