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
        // user 정보를 받아옴
        UserDto user = (UserDto) session.getAttribute("loginUser");
        if (user == null) {
            return "redirect:/home";
        }
        // 사용자 번호를 받아옴
        int userNum = user.getUserNum();
        // 채팅 리스트 가져오기
        List<ChatDto> chatList = chatService.getLastChatByUserNum(userNum);

        LocalDateTime currentDate = LocalDateTime.now();
        // 채팅 datetime에 따라 출력될 문자열 formattedDate에 저장
        for (ChatDto chat : chatList) {
            Date date = chat.getChatDate();
            Instant instant = date.toInstant();
            LocalDateTime parsedChatDate = instant.atZone(ZoneId.systemDefault()).toLocalDateTime();
            LocalDate chatLocalDate = parsedChatDate.toLocalDate();
            LocalDate currentLocalDate = currentDate.toLocalDate();
            long daysDifference = ChronoUnit.DAYS.between(chatLocalDate, currentLocalDate);
            String formattedDateString = "";

            if (daysDifference == 0) {
                if (parsedChatDate.getHour() < 12) {
                    formattedDateString = "오전 " + String.format("%02d:%02d", parsedChatDate.getHour(), parsedChatDate.getMinute());
                } else {
                    formattedDateString = "오후 " + String.format("%02d:%02d", parsedChatDate.getHour() - 12, parsedChatDate.getMinute());
                }
            } else if (daysDifference == 1) {
                formattedDateString = "어제";
            } else if (parsedChatDate.getYear() == currentDate.getYear() && daysDifference <= 2) {
                formattedDateString = parsedChatDate.getMonthValue() + "월 " + parsedChatDate.getDayOfMonth() + "일";
            } else {
                formattedDateString = parsedChatDate.getYear() + "." + String.format("%02d", parsedChatDate.getMonthValue()) + "." + String.format("%02d", parsedChatDate.getDayOfMonth());
            }
            chat.setFormattedDate(formattedDateString);
        }

        // 모델에 채팅 리스트 추가
        model.addAttribute("chatList", chatList);

        return "chats/chat-list";
    }

    @RequestMapping(path={"/chat-room"})
    public String chatRoom(HttpSession session, Model model) {
        UserDto user = (UserDto) session.getAttribute("loginUser");
        if (user == null) {
            return "redirect:/home";
        }
        int userNum = user.getUserNum();
        List<ChatDto> chatList = chatService.getChatListByUserNum(userNum);

        model.addAttribute("chatList", chatList);

        return "chats/chat-room";
    }

}
