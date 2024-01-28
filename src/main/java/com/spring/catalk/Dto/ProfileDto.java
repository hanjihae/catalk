package com.spring.catalk.Dto;

import lombok.Data;

@Data
public class ProfileDto {

    private int profileNum;
    private String profileName;
    private String profileMain;
    private boolean profileActive;
    private String profileMessage;
    private int userNum;

}
