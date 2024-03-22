package com.spring.catalk.Dto;

import lombok.Data;

import java.util.Date;

@Data
public class MessageDto {
    private int messageNum;

    private String messageContent;
    private boolean messageCheck;
    private boolean messageActive;
    private Date messageTime;

    private int chatNum;
    private int userNum;
}
