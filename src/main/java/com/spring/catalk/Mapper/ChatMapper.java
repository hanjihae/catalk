package com.spring.catalk.Mapper;

import com.spring.catalk.Dto.ChatDto;
import com.spring.catalk.Dto.ChatJoinDto;
import com.spring.catalk.Dto.MessageDto;
import org.apache.ibatis.annotations.*;

import java.util.List;

@Mapper
public interface ChatMapper {
    // 1-1. 채팅방 불러오기
    @Select("SELECT c.chatNum, c.chatName , c.chatActive, c.chatDate " +
            "FROM chat c " +
            "INNER JOIN chatjoin cj ON c.chatNum = cj.chatNum " +
            "INNER JOIN user u ON cj.userNum = u.userNum " +
            "WHERE u.userNum = #{userNum}")
    public List<ChatDto> getChatListByUserNum(int userNum);

    // 1-2. 마지막 메세지 불러오기
    @Select("SELECT * FROM message " +
            "WHERE userNum = #{userNum} " +
            "AND chatNum = #{chatNum} " +
            "ORDER BY messageNum DESC " +
            "LIMIT 1")
    public MessageDto getLastMessageByUserNumAndChatNum(int userNum, int chatNum);

    // 2-1. 채팅방 만들기
    @Insert("INSERT INTO chat(chatName, chatActive, chatDate) VALUES (#{chatName}, 1, NOW())")
    @Options(useGeneratedKeys=true, keyProperty="chatNum", keyColumn="chatNum")
    public void insertChatRoom(ChatDto chat);

    // 2-2. chatjoin에 userNum, chatNum 넣기
    @Insert("INSERT INTO chatjoin(chatNum, userNum) VALUES (#{chatNum}, #{userNum})")
    public void insertChatJoin(ChatJoinDto chatJoin);

    // 3. 채팅 추가
    @Insert("INSERT INTO message (chatNum, userNum, messageContent, messageTime, messageActive, messageCheck) " +
            "VALUES ( #{chatNum}, #{userNum}, #{messageContent}, NOW(), 1, 1)")
    @Options(useGeneratedKeys=true, keyProperty="messageNum", keyColumn="messageNum")
    public void insertMessage(MessageDto message);

    // 4. 모든 메세지 불러오기
    @Select("SELECT * FROM message " +
            "WHERE userNum = #{userNum} " +
            "AND chatNum = #{chatNum} " +
            "ORDER BY messageNum")
    public List<MessageDto> getMessageListByUserNumAndChatNum(int userNum, int chatNum);



    // 채팅방 불러오기
//    @Select("SELECT c.chatNum, c.chatName , c.chatActive, c.chatDate, c.chatContent " +
//            "FROM chat c " +
//            "INNER JOIN chatjoin cj ON c.chatNum = cj.chatNum " +
//            "INNER JOIN user u ON cj.userNum = u.userNum " +
//            "WHERE u.userNum = #{userNum}")
//    public List<ChatDto> getChatListByUserNum(int userNum);

    // 채팅방 만들기
//    @Insert("INSERT INTO chat(userNum) VALUES (#{userNum})")
//    @Options(useGeneratedKeys=true, keyProperty="chatNum", keyColumn="chatNum")
//    public void insertChatJoin(ChatJoinDto chatJoin);

    // 회원번호로 채팅방번호 불러오기
//    @Select("SELECT chatNum FROM chatjoin WHERE userNum = #{userNum}")
//    public ChatJoinDto getChatByUserNum(int userNum);

//    @Select("SELECT c.* FROM chat c " +
//            "INNER JOIN chatjoin cj WHERE cj.chatNum = #{chatNum}")
//    public ChatDto getChatByUserNum(int userNum);

    // 채팅 추가
//    @Insert("INSERT INTO chat (chatNum, chatName, chatActive, chatDate, chatContent) " +
//            "VALUES ( #{chatNum}, #{chatName}, 1, NOW(), #{chatContent})")
//    @Options(useGeneratedKeys=true, keyProperty="chatOrderNum", keyColumn="chatOrderNum")
//    public void insertChat(ChatDto chat);

}
