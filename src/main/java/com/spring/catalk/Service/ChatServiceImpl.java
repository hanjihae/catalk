package com.spring.catalk.Service;

import com.spring.catalk.Dto.ChatDto;
import com.spring.catalk.Dto.ChatJoinDto;
import com.spring.catalk.Dto.MessageDto;
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

    // 1-1. 채팅방 불러오기
    public List<ChatDto> getChatListByUserNum(int userNum) {
        return chatMapper.getChatListByUserNum(userNum);
    }

    // 1-2. 마지막 메세지 불러오기
    public MessageDto getLastMessageByUserNumAndChatNum(int userNum, int chatNum) {
        return chatMapper.getLastMessageByUserNumAndChatNum(userNum, chatNum);
    }

    // 2. 채팅방 생성 + chatjoin에 정보 저장
    @Override
    public int createChatRoomAndJoin(String userName, int userNum) {
        // 채팅방 생성
        ChatDto chat = new ChatDto();
        chat.setChatName(userName);
        chatMapper.insertChatRoom(chat);
        // 생성된 채팅방의 번호 가져오기
        int chatNum = chat.getChatNum();

        // 채팅방에 사용자 추가
        ChatJoinDto chatJoin = new ChatJoinDto();
        chatJoin.setChatNum(chatNum);
        chatJoin.setUserNum(userNum);
        chatMapper.insertChatJoin(chatJoin);

        return chatNum;
    }

    @Override
    // 3. 채팅 추가
    public void addMessageToChat(MessageDto message, int chatNum, int userNum) {
        message.setChatNum(chatNum);
        message.setUserNum(userNum);
        chatMapper.insertMessage(message);
    }



    // 채팅방 만들기
//    @Override
//    @Transactional
//    public ChatJoinDto createChat(UserDto user) {
//        // 채팅방 생성
//        ChatJoinDto chatJoin = new ChatJoinDto();
//        chatJoin.setUserNum(user.getUserNum());
//        chatMapper.insertChatJoin(chatJoin);
//        // 생성된 채팅방의 번호를 가져와서 반환
//        return chatMapper.getChatByUserNum(user.getUserNum());
//    }

    // 회원번호로 채팅방번호 불러오기
//    public ChatJoinDto getChatByUserNum(int userNum) {
//        return chatMapper.getChatByUserNum(userNum);
//    };

    // 채팅 추가
//    public void insertChat(ChatDto chat) {
//        chatMapper.insertChat(chat);
//    };

}
