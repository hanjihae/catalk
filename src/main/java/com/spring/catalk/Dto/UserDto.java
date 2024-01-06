package com.spring.catalk.Dto;

import lombok.Data;

import java.util.Date;

@Data
public class UserDto {

    private Integer userNum;

    private String userId;

    private String userPw;

    private String userName;

    private String userDate;

    private String userType;

    private String userPhone;

    private boolean userActive;

    private boolean userSearch;

}
