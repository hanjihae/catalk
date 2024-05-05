package com.spring.catalk.Service;

import com.spring.catalk.Dto.ProfileDto;
import com.spring.catalk.Dto.ProfileFileDto;
import com.spring.catalk.Mapper.ProfileMapper;
import lombok.Setter;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.stereotype.Service;

import java.util.List;

@Service("profileService")
@Repository
public class ProfileServiceImpl implements ProfileService {

    @Setter
    @Autowired
    private ProfileMapper profileMapper;

    public ProfileDto findUserProfile(int userNum) {

        return profileMapper.selectUserProfile(userNum);
    }

    public ProfileDto getMyProfile(int userNum) {
        ProfileDto myProfile = profileMapper.selectMyProfile(userNum);
        List<ProfileFileDto> profileFiles = profileMapper.selectMyProfileFiles(myProfile.getProfileNum());
        myProfile.setProfileFiles(profileFiles);

        return myProfile;
    }

    public void createBasicProfile(int userNum, String userName) {
        profileMapper.insertBasicProfile(userNum, userName);
    }

    public void saveProfileFile(int userNum, String fileName, String profileMain) {
        profileMapper.insertProfilefile(userNum, fileName, profileMain);
    }

    ;


}
