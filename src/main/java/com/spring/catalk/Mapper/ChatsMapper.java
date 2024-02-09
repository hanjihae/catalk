package com.spring.catalk.Mapper;

import com.spring.catalk.Dto.ChatsDto;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;

import java.util.List;

@Mapper
public interface ChatsMapper {
    @Select("SELECT c.chatNum, c.chatName , c.chatActive, c.chatDate, c.chatContent " +
            "FROM chat c " +
            "INNER JOIN chatjoin cj ON c.chatNum = cj.chatNum " +
            "INNER JOIN user u ON cj.userNum = u.userNum " +
            "WHERE u.userNum = #{userNum}")
    public List<ChatsDto> getChatListByUserNum(int userNum);
}
