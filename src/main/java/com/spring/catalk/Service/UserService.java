package com.spring.catalk.Service;

import com.spring.catalk.Dto.UserDto;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.util.List;

public interface UserService {

    public void saveUser(UserDto user);

    public UserDto findUserByIdAndPasswd(String userId, String userPw);

    public void userIdCheck(String userId, HttpServletResponse response) throws IOException;

    public String findUserData( String userData1, String userData2, String userData3 );

    public void changePw(String userId, String userPw);

    public List<UserDto> findUserList(int userNo, String findFriendSearch);


}
