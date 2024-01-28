package com.spring.catalk.Service;

import com.spring.catalk.Dto.ProfileDto;
import com.spring.catalk.Mapper.ProfileMapper;
import lombok.Setter;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.stereotype.Service;

@Service("profileService") @Repository
public class ProfileServiceImpl implements ProfileService {

    @Setter
    @Autowired
    private ProfileMapper profileMapper;

    public ProfileDto findUserProfile(int userNum){

        return profileMapper.selectUserProfile(userNum);
    }


}
