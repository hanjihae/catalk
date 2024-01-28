package com.spring.catalk.Mapper;

import com.spring.catalk.Dto.ProfileDto;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;

@Mapper
public interface ProfileMapper {

    @Select("SELECT * FROM profile WHERE userNum = #{userNum}")
    public ProfileDto selectUserProfile(int userNum);

}
