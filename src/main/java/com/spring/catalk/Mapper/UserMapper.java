package com.spring.catalk.Mapper;

import com.spring.catalk.Dto.UserDto;
import org.apache.ibatis.annotations.*;

import java.util.List;

@Mapper
public interface UserMapper {

    @Insert("INSERT INTO user (userId, userPw, userName, userPhone, userDate) VALUES (#{userId}, #{userPw}, #{userName}, #{userPhone}, #{userDate})")
    @Options(useGeneratedKeys = true, keyProperty = "userNum")
    void insertUser(UserDto user);

    @Select("SELECT * FROM USER WHERE userId = #{userId} and userPw = #{userPw} and userActive = 1")
    UserDto selectUserByIdAndPasswd(String userId, String userPw);

    @Select("SELECT COUNT(*) FROM USER WHERE userId = #{userId} and userActive = 1")
    int selectUserIdCount(String userId);

    @Select("SELECT userId FROM user WHERE userName=#{userData1} AND userPhone = #{userData2} and userActive = 1")
    String selectUserId(String userData1, String userData2);

    @Select("SELECT userPw FROM user WHERE userId=#{userData1} AND userPhone = #{userData2} and userActive = 1")
    String selectUserPasswd(String userData1, String userData2);

    @Update("UPDATE user SET userPw = #{userPw} WHERE userId=#{userId} AND userActive = 1")
    void updateUserPw(String userId, String userPw);

    @Select("SELECT u.* FROM user u LEFT JOIN friend f ON u.userNum = f.friendNum AND f.userNum = #{userNo} WHERE u.userNum <> #{userNo} " +
            "  AND f.friendNum IS NULL AND u.userActive = 1 AND u.userSearch = 1 AND u.userName LIKE '%${findFriendSearch}%'")
    List<UserDto> selectFindUserList(int userNo, String findFriendSearch);



}
