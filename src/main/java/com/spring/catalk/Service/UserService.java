package com.spring.catalk.Service;

import com.spring.catalk.Dto.UserDto;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;

public interface UserService {

    public void saveUser(UserDto user);

    public UserDto findUserByIdAndPasswd(String userId, String userPw);

    void userIdCheck(String userId, HttpServletResponse response) throws IOException;
}
