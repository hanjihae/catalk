package com.spring.catalk.Dto;

import lombok.Data;

import java.util.Date;

@Data
public class ChatsDto {
    private int chatNum;

    private String chatName;
    private boolean chatActive;
    private Date chatDate;
    private String chatContent;

}
