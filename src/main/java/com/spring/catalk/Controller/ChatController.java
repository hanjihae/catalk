package com.spring.catalk.Controller;

import com.spring.catalk.Dto.ChatDto;
import com.spring.catalk.Dto.UserDto;
import com.spring.catalk.Service.ChatService;
import jakarta.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import java.util.List;

@Controller
@RequestMapping("/chats")
public class ChatController {

    @Autowired
    @Qualifier("chatService")
    private ChatService chatService;

    @RequestMapping(path={"/chat-list"})
    public String chats(HttpSession session, Model model) {
        // user 정보를 받아옴
        UserDto user = (UserDto) session.getAttribute("loginUser");
        if (user == null) {
            return "redirect:/home";
        }
        // 사용자 번호를 받아옴
        int userNum = user.getUserNum();
        // 채팅 리스트 가져오기
        List<ChatDto> chatList = chatService.getChatListByUserNum(userNum);
        // 모델에 채팅 리스트 추가
        model.addAttribute("chatList", chatList);

        return "chats/chat-list";
    }

}
