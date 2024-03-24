package com.spring.catalk.Controller;

import com.spring.catalk.Dto.ChatDto;
import com.spring.catalk.Dto.ChatJoinDto;
import com.spring.catalk.Dto.MessageDto;
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
import java.util.ArrayList;
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
        List<MessageDto> lastMessages = new ArrayList<>();
        for (ChatDto chat : chatList) {
            // 마지막 메세지 가져오기
            MessageDto lastMessage = chatService.getLastMessageByUserNumAndChatNum(userNum, chat.getChatNum());
            if (lastMessage != null) {
                lastMessage.formatMessageDate();
                lastMessages.add(lastMessage);
            }
        }

        model.addAttribute("userNum", userNum);
        model.addAttribute("chatList", chatList);
        model.addAttribute("lastMessages",lastMessages);

        return "chats/chat-list";
    }

    @RequestMapping(path={"/chat-room"})
    public String chatRoom(HttpSession session, Model model, int chatNum) {
        UserDto user = (UserDto) session.getAttribute("loginUser");
        if (user == null) {
            return "redirect:/home";
        }
        int userNum = user.getUserNum();

        List<ChatDto> chatList = chatService.getChatListByUserNum(user.getUserNum());
        String targetChatName = null;
        for (ChatDto chat : chatList) {
            if (chat.getChatNum() == chatNum) {
                targetChatName = chat.getChatName();
                break;
            }
        }

        List<MessageDto> messageList = chatService.getMessageListByChatNum(chatNum);
        for (MessageDto message : messageList) {
            message.formatMessageTime();
            message.formatMessageDate2();
        }

        model.addAttribute("userNum", userNum);
        model.addAttribute("messageList", messageList);
        model.addAttribute("chatNum", chatNum);
        model.addAttribute("chatName", targetChatName); // 수정된 부분

        return "chats/chat-room";
    }


    @PostMapping("/sendMessage")
    public String sendChat(HttpSession session, MessageDto message, int chatNum, int userNum) {
        chatService.addMessageToChat(message, chatNum, userNum);
        return "redirect:/chats/chat-room?chatNum=" + chatNum;
    }

}
