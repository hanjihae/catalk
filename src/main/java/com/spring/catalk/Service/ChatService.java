package com.spring.catalk.Service;

import com.spring.catalk.Dto.ChatDto;
import com.spring.catalk.Dto.ChatJoinDto;
import com.spring.catalk.Dto.MessageDto;
import com.spring.catalk.Dto.UserDto;

import java.util.List;

public interface ChatService {
    // 1-1. 채팅방 불러오기
    public List<ChatDto> getChatListByUserNum(int userNum);

    // 1-2. 마지막 메세지 불러오기
    public MessageDto getLastMessageByUserNumAndChatNum(int userNum, int chatNum);

    // 2. 채팅방 생성 + chatjoin에 정보 저장
    public int createChatRoomAndJoin(String userName, int userNum);

    // 3. 채팅 추가
    public void addMessageToChat(MessageDto message, int chatNum, int userNum);

    // 4. 모든 메세지 불러오기
    public List<MessageDto> getMessageListByChatNum(int chatNum);

}
