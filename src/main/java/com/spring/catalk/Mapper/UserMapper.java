package com.spring.catalk.Mapper;

import com.spring.catalk.Dto.UserDto;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;

@Mapper
public interface UserMapper {

    @Insert("INSERT INTO user (userId, userPw, userName, userPhone, userDate) VALUES (#{userId}, #{userPw}, #{userName}, #{userPhone}, #{userDate})")
    void insertUser(UserDto user);

    @Select("SELECT * FROM USER WHERE userId = #{userId} and userPw = #{userPw} and userActive = 1")
    UserDto selectUserByIdAndPasswd(String userId, String userPw);

    @Select("SELECT COUNT(*) FROM USER WHERE userId = #{userId} and userActive = 1")
    int selectUserIdCount(String userId);

    @Select("SELECT userId FROM user WHERE userName=#{userData1} AND userPhone = #{userData2} and userActive = 1")
    String selectUserId(String userData1, String userData2);

    @Select("SELECT userPw FROM user WHERE userId=#{userData1} AND userPhone = #{userData2} and userActive = 1")
    String selectUserPasswd(String userData1, String userData2);
}
