package com.spring.catalk.Service;

import com.spring.catalk.Dto.ChatDto;
import com.spring.catalk.Dto.ChatJoinDto;
import com.spring.catalk.Dto.UserDto;

import java.util.List;

public interface ChatService {

    // 채팅방 만들기
    public ChatJoinDto createChat(UserDto user);

    // 회원번호로 채팅방번호 불러오기
    public ChatJoinDto getChatByUserNum(int userNum);

    // 나와의 채팅 추가
    public void insertMyChat(int chatNum, String userName);

    // 모든 채팅 불러오기
    public List<ChatDto> getChatListByUserNum(int userNum);
}
