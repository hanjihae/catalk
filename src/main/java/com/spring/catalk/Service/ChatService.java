package com.spring.catalk.Service;

import com.spring.catalk.Dto.ChatDto;
import com.spring.catalk.Dto.ChatJoinDto;
import com.spring.catalk.Dto.UserDto;

import java.util.List;

public interface ChatService {
    // 1. 채팅방 불러오기
    public List<ChatDto> getChatListByUserNum(int userNum);

    // 채팅방 만들기
    public void insertChatRoomAndJoin(ChatDto chat, int userNum);


    // 채팅방 만들기
//    public ChatJoinDto createChat(UserDto user);

    // 마지막 채팅 불러오기
//    public List<ChatDto> getLastChatByUserNum(int userNum);



    // 채팅 추가
//    public void insertChat(ChatDto chat);
}
