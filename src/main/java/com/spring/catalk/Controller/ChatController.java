package com.spring.catalk.Controller;

import com.spring.catalk.Dto.ChatDto;
import com.spring.catalk.Dto.ChatJoinDto;
import com.spring.catalk.Dto.UserDto;
import com.spring.catalk.Service.ChatService;
import jakarta.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import java.time.LocalDate;
import java.time.LocalDateTime;
import java.time.temporal.ChronoUnit;
import java.util.List;
import java.time.Instant;
import java.time.ZoneId;
import java.util.Date;

@Controller
@RequestMapping("/chats")
public class ChatController {

    @Autowired
    @Qualifier("chatService")
    private ChatService chatService;

    @RequestMapping(path={"/chat-list"})
    public String chats(HttpSession session, Model model) {
        UserDto user = (UserDto) session.getAttribute("loginUser");
        if (user == null) {
            return "redirect:/home";
        }
        int userNum = user.getUserNum();
        // 채팅 리스트 가져오기
        List<ChatDto> chatList = chatService.getChatListByUserNum(userNum);
        for (ChatDto chat : chatList) {
            chat.formatChatDate();
        }

        model.addAttribute("userNum", userNum);
        model.addAttribute("chatList", chatList);

        return "chats/chat-list";
    }

//    @RequestMapping(path={"/chat-room"})
//    public String chatRoom(HttpSession session, Model model, ChatDto chat) {
//        UserDto user = (UserDto) session.getAttribute("loginUser");
//        if (user == null) {
//            return "redirect:/home";
//        }
//        int userNum = user.getUserNum();
//        List<ChatDto> chatList = chatService.getChatListByUserNum(userNum);
//
//        ChatDto firstChat = chatList.get(0); // 예시로 첫 번째 채팅을 가져옴
//        int chatNum = firstChat.getChatNum();
//        String chatName = firstChat.getChatName();
//
//        model.addAttribute("chatList", chatList);
//        model.addAttribute("chatNum", chatNum);
//        model.addAttribute("chatName", chatName);
//
//        return "chats/chat-room";
//    }

//    @PostMapping("/sendChat")
//    public String sendChat(HttpSession session, ChatDto chat) {
//        chatService.insertChat(chat);
//        return "redirect:/chats/chat-room?chatNum=" + chat.getChatNum();
//    }

}
