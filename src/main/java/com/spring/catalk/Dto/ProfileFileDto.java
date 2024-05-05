package com.spring.catalk.Dto;

import lombok.Data;

@Data
public class ProfileFileDto {

    private int profileFileNum;
    private int profileNum;
    private String profileFileName;
    private String profileMain;
    private boolean profileActive;
}
