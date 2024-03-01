package com.spring.catalk.Mapper;

import com.spring.catalk.Dto.ChatDto;
import com.spring.catalk.Dto.ChatJoinDto;
import org.apache.ibatis.annotations.*;

import java.util.List;

@Mapper
public interface ChatMapper {
    // 마지막 채팅 불러오기
    @Select("SELECT c.chatNum, c.chatName , c.chatActive, c.chatDate, c.chatContent " +
            "FROM chat c " +
            "INNER JOIN chatjoin cj ON c.chatNum = cj.chatNum " +
            "INNER JOIN user u ON cj.userNum = u.userNum " +
            "WHERE u.userNum = #{userNum} " +
            "AND c.chatDate = (SELECT MAX(chatDate) FROM chat c2 WHERE c2.chatNum = c.chatNum)")
    public List<ChatDto> getLastChatListByUserNum(int userNum);

    // 채팅 불러오기
    @Select("SELECT c.chatNum, c.chatName , c.chatActive, c.chatDate, c.chatContent " +
            "FROM chat c " +
            "INNER JOIN chatjoin cj ON c.chatNum = cj.chatNum " +
            "INNER JOIN user u ON cj.userNum = u.userNum " +
            "WHERE u.userNum = #{userNum}")
    public List<ChatDto> getChatListByUserNum(int userNum);

    // 채팅방 만들기
    @Insert("INSERT INTO chatjoin (userNum) VALUES (#{userNum})")
    @Options(useGeneratedKeys=true, keyProperty="chatNum", keyColumn="chatNum")
    public void insertChatJoin(ChatJoinDto chatJoin);

    // 회원번호로 채팅방번호 불러오기
    @Select("SELECT chatNum FROM chatjoin WHERE userNum = #{userNum}")
    public ChatJoinDto getChatByUserNum(int userNum);

    // 나와의 채팅 추가
    @Insert("INSERT INTO chat (chatNum, chatName, chatActive, chatDate, chatContent) " +
            "VALUES ( #{chatNum}, #{userName}, 1, NOW(), '나와의 채팅을 시작하라옹!')")
    public void insertMyChat(@Param("chatNum") int chatNum, @Param("userName") String userName);
}
