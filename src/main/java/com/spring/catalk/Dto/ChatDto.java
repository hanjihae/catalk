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
    private String formattedDate;

    public void formatChatDate() {
        LocalDateTime currentDate = LocalDateTime.now();
        Date date = this.chatDate;
        Instant instant = date.toInstant();
        LocalDateTime parsedChatDate = instant.atZone(ZoneId.systemDefault()).toLocalDateTime();
        LocalDate chatLocalDate = parsedChatDate.toLocalDate();
        LocalDate currentLocalDate = currentDate.toLocalDate();
        long daysDifference = ChronoUnit.DAYS.between(chatLocalDate, currentLocalDate);
        String formattedDateString = "";

        if (daysDifference == 0) {
            if (parsedChatDate.getHour() < 12) {
                formattedDateString = "오전 " + String.format("%02d:%02d", parsedChatDate.getHour(), parsedChatDate.getMinute());
            } else {
                formattedDateString = "오후 " + String.format("%02d:%02d", parsedChatDate.getHour() - 12, parsedChatDate.getMinute());
            }
        } else if (daysDifference == 1) {
            formattedDateString = "어제";
        } else if (parsedChatDate.getYear() == currentDate.getYear() && daysDifference <= 2) {
            formattedDateString = parsedChatDate.getMonthValue() + "월 " + parsedChatDate.getDayOfMonth() + "일";
        } else {
            formattedDateString = parsedChatDate.getYear() + "." + String.format("%02d", parsedChatDate.getMonthValue()) + "." + String.format("%02d", parsedChatDate.getDayOfMonth());
        }
        this.formattedDate = formattedDateString;
    }
}
