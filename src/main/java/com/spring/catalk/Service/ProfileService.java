package com.spring.catalk.Service;

import com.spring.catalk.Dto.ProfileDto;

public interface ProfileService {

    public ProfileDto findUserProfile(int userNum);

    public ProfileDto getMyProfile(int userNum);

    public void createBasicProfile(int userNum, String userName);

    public void saveProfileFile(int userNum, String fileName, String profileMain);
}
