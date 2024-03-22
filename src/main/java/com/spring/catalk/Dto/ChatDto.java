package com.spring.catalk.Dto;

import lombok.Data;

import java.time.Instant;
import java.time.LocalDate;
import java.time.LocalDateTime;
import java.time.ZoneId;
import java.time.temporal.ChronoUnit;
import java.util.Date;

@Data
public class ChatDto {
    private int chatNum;

    private String chatName;
    private boolean chatActive;
    private Date chatDate;

    private int userNum;
}
