package com.spring.catalk.Mapper;

import com.spring.catalk.Dto.UserDto;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;

@Mapper
public interface UserMapper {

    @Insert("INSERT INTO user (userId, userPw, userName, userPhone, userDate) VALUES (#{userId}, #{userPw}, #{userName}, #{userPhone}, #{userDate})")
    void insertUser(UserDto user);

    @Select("SELECT * FROM USER WHERE userId = #{userId} and userPw = #{userPw}")
    UserDto selectUserByIdAndPasswd(String userId, String userPw);
}
