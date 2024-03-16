package com.spring.catalk.Service;

import com.spring.catalk.Common.Util;
import com.spring.catalk.Dto.UserDto;
import com.spring.catalk.Mapper.UserMapper;
import jakarta.servlet.http.HttpServletResponse;
import lombok.Setter;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.stereotype.Service;

import java.io.IOException;
import java.util.List;

@Service("userService") @Repository
public class UserServiceImpl implements UserService {

    @Setter @Autowired
    private UserMapper userMapper;

    public void saveUser(UserDto user){
        String passwd = Util.getHashedString(user.getUserPw(), "SHA-256");
        user.setUserPw(passwd);
        userMapper.insertUser(user);
    }

    public UserDto findUserByIdAndPasswd(String userId, String userPw){
        userPw = Util.getHashedString(userPw, "SHA-256");
        return userMapper.selectUserByIdAndPasswd(userId, userPw);
    }

    public void userIdCheck(String userId, HttpServletResponse response) throws IOException {
        int userCheck = userMapper.selectUserIdCount(userId);
        if(userCheck==0){
            response.getWriter().print("1");
        }else{
            response.getWriter().print("0");
        }
    }

    public String findUserData( String userData1, String userData2, String userData3 ){
        if(userData3.equals("id")){
            return userMapper.selectUserId(userData1, userData2);
        }else{
            return userMapper.selectUserPasswd(userData1, userData2);
        }
    }

    public void changePw(String userId, String userPw){
        userPw = Util.getHashedString(userPw, "SHA-256");
        userMapper.updateUserPw(userId, userPw);
        }

    public List<UserDto> findUserList(int userNo, String findFriendSearch){
        return userMapper.selectFindUserList(userNo, findFriendSearch);
    }

}
