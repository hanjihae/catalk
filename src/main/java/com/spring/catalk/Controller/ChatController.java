package com.spring.catalk.Controller;

import com.spring.catalk.Dto.*;
import com.spring.catalk.Service.ChatService;
import com.spring.catalk.Service.FriendService;
import com.spring.catalk.Service.ProfileService;
import jakarta.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import java.io.IOException;
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
    @Qualifier("friendService")
    private FriendService friendService;

    @Autowired
    @Qualifier("profileService")
    private ProfileService profileService;

    @Autowired
    @Qualifier("chatService")
    private ChatService chatService;

    // 채팅 목록
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

    // 채팅방
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


    // 메세지 보내기
    @PostMapping("/sendMessage")
    public String sendChat(HttpSession session, MessageDto message, int chatNum, int userNum) {
        chatService.addMessageToChat(message, chatNum, userNum);
        return "redirect:/chats/chat-room?chatNum=" + chatNum;
    }

    //유저+프로필 정보 가져오기, 친구 리스트 가져오기 (by ys)
    private void getUserInfo (HttpSession session, Model model) {
        UserDto user = (UserDto) session.getAttribute("loginUser");
        ProfileDto profile = profileService.findUserProfile(user.getUserNum());
        List<FriendDto> friends = friendService.findFriendList(user.getUserNum());
        int friendCount = friendService.findFriendCount(user.getUserNum());

        model.addAttribute("profile", profile);
        model.addAttribute("friends", friends);
        model.addAttribute("friendCount", friendCount);
    }

    // 일반채팅
    @RequestMapping(path = {"/selectFriendPopup"})
    public String selectFriendPopup(HttpSession session, Model model) {
        getUserInfo(session, model);
        return "chats/selectFriendPopup";
    }

    // 팀채팅
    @RequestMapping(path = {"/selectTeamPopup"})
    public String selectTeamPopup(HttpSession session, Model model) {
        getUserInfo(session, model);
        return "chats/selectTeamPopup";
    }

    // 친구 목록 (by ys)
    @RequestMapping(value ="/friend_list_inner")
    public String findMyFriend(String searchVal, HttpSession session, Model model) throws IOException {
        UserDto user = (UserDto) session.getAttribute("loginUser");
        ProfileDto profile = profileService.findUserProfile(user.getUserNum());
        List<FriendDto> friends = friendService.findMyFriendList(user.getUserNum(), searchVal);
        int friendCount = friendService.findMyFriendCount(user.getUserNum(), searchVal);

        model.addAttribute("profile", profile);
        model.addAttribute("friends", friends);
        model.addAttribute("friendCount", friendCount);

        return "chats/friend_list_inner";
    }

}
