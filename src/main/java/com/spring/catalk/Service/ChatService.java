package com.spring.catalk.Service;

import com.spring.catalk.Dto.ChatDto;
import com.spring.catalk.Dto.ChatJoinDto;
import com.spring.catalk.Dto.MessageDto;
import com.spring.catalk.Dto.UserDto;

import java.util.List;

public interface ChatService {
    // 1. 채팅방 불러오기
    public List<ChatDto> getChatListByUserNum(int userNum);

    // 2+3 채팅방 생성 + chatjoin에 정보 저장
    public int createChatRoomAndJoin(String userName, int userNum);

    // 4. 채팅 추가
    public void addMessageToChat(MessageDto message, int chatNum, int userNum);

    // 채팅방 만들기
//    public void insertChatRoomAndJoin(ChatDto chat, int userNum);


    // 채팅방 만들기
//    public ChatJoinDto createChat(UserDto user);

    // 마지막 채팅 불러오기
//    public List<ChatDto> getLastChatByUserNum(int userNum);



    // 채팅 추가
//    public void insertChat(ChatDto chat);
}
