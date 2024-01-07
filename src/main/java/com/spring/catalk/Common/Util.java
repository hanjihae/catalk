package com.spring.catalk.Common;

import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.util.UUID;

public class Util {

    /**
     * 지정된 암호화 알고리즘에 따라 문자열 데이터를 암호화 처리
     *
     * @param source 암호화 대상 문자열
     * @param algorithm 암호화 알고리즘 문자열 (SHA-1, MD5, SHA-256 ...)
     * @return 암호화된 데이터
     */
    public static byte[] getHashedData(String source, String algorithm) {

        byte[] hashedData = null;

        try {
            //암호화 처리 인스턴스 생성
            MessageDigest md = MessageDigest.getInstance(algorithm);
            hashedData = md.digest(source.getBytes());//지정된 알고리즘으로 암호화
        } catch (NoSuchAlgorithmException ex) {
            hashedData = null;
        }

        return hashedData;
    }

    /**
     * 문자열을 암호화 알고리즘에 따라 암호화 하고 결과를 문자열로 변환
     * @param source
     * @param algorithm
     * @return
     */
    public static String getHashedString(String source, String algorithm) {

        byte[] hashedData = getHashedData(source, algorithm);

        if (hashedData == null) return null;

        String hashedString = "";
        for (int i = 0; i < hashedData.length; i++) {
            String hexString =
                    Integer.toHexString((int)hashedData[i] & 0x000000ff);
            if (hexString.length() < 2)
                hexString = "0" + hexString;

            hashedString += hexString;
        }

        return hashedString;
    }


    //고유한 파일 이름 만들기
    public static String makeUniqueFileName(String fileName)
    {
        String ext = fileName.substring(fileName.lastIndexOf("."));

        String name = UUID.randomUUID().toString();

        return name + ext;
    }
}
