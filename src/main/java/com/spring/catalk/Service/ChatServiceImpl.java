package com.spring.catalk.Service;

import com.spring.catalk.Dto.ChatDto;
import com.spring.catalk.Dto.ChatJoinDto;
import com.spring.catalk.Dto.UserDto;
import com.spring.catalk.Mapper.ChatMapper;
import lombok.Setter;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Service("chatService")
@Repository
public class ChatServiceImpl implements ChatService {

    @Setter
    @Autowired
    private ChatMapper chatMapper;

    // 채팅방 만들기
    @Override
    @Transactional
    public ChatJoinDto createChat(UserDto user) {
        // 채팅방 생성
        ChatJoinDto chatJoin = new ChatJoinDto();
        chatJoin.setUserNum(user.getUserNum());
        chatMapper.insertChatJoin(chatJoin);
        // 생성된 채팅방의 번호를 가져와서 반환
        return chatMapper.getChatByUserNum(user.getUserNum());
    }

    // 회원번호로 채팅방번호 불러오기
    public ChatJoinDto getChatByUserNum(int userNum) {
        return chatMapper.getChatByUserNum(userNum);
    };

    // 나와의 채팅 추가
    public void insertMyChat(int chatNum, String userName) {
        chatMapper.insertMyChat(chatNum, userName);
    };

    // chat 불러오기
    public List<ChatDto> getChatListByUserNum(int userNum) {
        return chatMapper.getChatListByUserNum(userNum);
    }
}
