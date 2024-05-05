package com.spring.catalk.Dto;

import lombok.Data;

import java.util.List;

@Data
public class ProfileDto {

    private int profileNum;
    private String profileName;
    private String profileMessage;
    private int userNum;

    private List<ProfileFileDto> profileFiles;
}
