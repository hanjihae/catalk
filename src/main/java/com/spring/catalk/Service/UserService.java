package com.spring.catalk.Service;

import com.spring.catalk.Dto.UserDto;

public interface UserService {

    public void saveUser(UserDto user);

    public UserDto findUserByIdAndPasswd(String userId, String userPw);
}
