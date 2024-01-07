package com.spring.catalk.Dto;

import jakarta.validation.constraints.NotBlank;
import jakarta.validation.constraints.Pattern;
import lombok.Data;
import lombok.NonNull;

import java.util.Date;

@Data
public class UserDto {

    private Integer userNum;

    @NotBlank(message="아이디를 입력하세요.")
    @Pattern(regexp="[A-Za-z0-9]{3,20}")
    private String userId;

    @NotBlank
    @Pattern(regexp="[A-Za-z0-9]{3,20}")
    private String userPw;

    @NotBlank(message="이름을 입력하세요.")
    @Pattern(regexp=".{3,20}")
    private String userName;

    @NotBlank(message="생년월일을 입력하세요.")
    private String userDate;

    private String userType;

    private String userPhone;

    private boolean userActive;

    private boolean userSearch;

}
