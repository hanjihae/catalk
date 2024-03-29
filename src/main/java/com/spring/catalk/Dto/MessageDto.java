package com.spring.catalk.Dto;

import lombok.Data;

import java.text.SimpleDateFormat;
import java.time.Instant;
import java.time.LocalDate;
import java.time.LocalDateTime;
import java.time.ZoneId;
import java.time.temporal.ChronoUnit;
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

    private String formattedDate;
    private String formattedDate2;
    private String formattedTime;

    // chat-list formattedDate2
    public void formatMessageDate() {
        LocalDateTime currentDate = LocalDateTime.now();
        Date date = this.messageTime;
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

    // chat-room formattedDate
    public void formatMessageDate2() {
        LocalDateTime currentDate = LocalDateTime.now();
        Date date = this.messageTime;
        Instant instant = date.toInstant();
        LocalDateTime parsedChatDate = instant.atZone(ZoneId.systemDefault()).toLocalDateTime();

        String formattedDateString = parsedChatDate.getYear() + "년 "
                + parsedChatDate.getMonthValue() + "월 "
                + parsedChatDate.getDayOfMonth() + "일";

        this.formattedDate2 = formattedDateString;
    }

    // chat-room formattedTime
    public void formatMessageTime() {
        LocalDateTime localDateTime = messageTime.toInstant().atZone(ZoneId.systemDefault()).toLocalDateTime();
        SimpleDateFormat sdf = new SimpleDateFormat("a hh:mm");
        this.formattedTime = sdf.format(Date.from(localDateTime.atZone(ZoneId.systemDefault()).toInstant()));
    }

}
