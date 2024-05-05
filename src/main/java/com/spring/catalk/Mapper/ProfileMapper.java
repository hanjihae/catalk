package com.spring.catalk.Mapper;

import com.spring.catalk.Dto.ProfileDto;
import com.spring.catalk.Dto.ProfileFileDto;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Options;
import org.apache.ibatis.annotations.Select;

import java.util.List;

@Mapper
public interface ProfileMapper {

    @Select("SELECT * FROM profile WHERE userNum = #{userNum}")
    public ProfileDto selectUserProfile(int userNum);

    @Select("SELECT * FROM profile WHERE userNum = #{userNum}")
    public ProfileDto selectMyProfile(int userNum);

    @Select("SELECT * FROM profileFile WHERE profileNum = #{profileNum} " +
            "AND ((profileMain = 'Main' AND profileFileNum = (SELECT MAX(profileFileNum) FROM profileFile WHERE profileMain = 'Main' AND profileActive = 1)) " +
            "    OR (profileMain = 'Back' AND profileFileNum = (SELECT MAX(profileFileNum) FROM profileFile WHERE profileMain = 'Back' AND profileActive = 1))) " +
            "LIMIT 2")
    public List<ProfileFileDto> selectMyProfileFiles(int profileNum);

    @Insert("INSERT INTO profile (profileName, userNum) VALUES (#{userNum}, #{userName})")
    @Options(useGeneratedKeys = true, keyProperty = "profileNum")
    public void insertBasicProfile(int userNum, String userName);

    @Insert("INSERT INTO profilefile (profileNum, profileFileName, profileMain) VALUES (#{profileNum}, #{fileName}, #{profileMain})")
    public void insertProfilefile(int profileNum, String fileName, String profileMain );

}
