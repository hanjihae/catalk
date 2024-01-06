package com.spring.catalk.Service;

import com.spring.catalk.Dto.UserDto;
import com.spring.catalk.Mapper.UserMapper;
import lombok.Setter;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.stereotype.Service;

@Service("userService") @Repository
public class UserServiceImpl implements UserService {

    @Setter @Autowired
    private UserMapper userMapper;

    public void saveUser(UserDto user){

        userMapper.insertUser(user);
    }

}
