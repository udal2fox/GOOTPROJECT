package org.rainbow.company.custMgmt.domain;

import java.util.Random;

public class PasswordGenerator {
    public static String generateRandomPassword(int length) {
        // 비밀번호로 사용할 문자열
        String CHAR_LOWER = "abcdefghijklmnopqrstuvwxyz";
        String CHAR_UPPER = CHAR_LOWER.toUpperCase();
        String NUMBER = "0123456789";
        String OTHER_CHAR = "!@#$%&*()_+-=[]?";

        String PASSWORD_ALLOW_BASE = CHAR_LOWER + CHAR_UPPER + NUMBER + OTHER_CHAR;

        // Random 객체 생성
        Random random = new Random();

        StringBuilder password = new StringBuilder(length);

        // 2개의 대문자, 소문자, 숫자, 특수 문자를 사용하여 비밀번호를 생성합니다.
        password.append(randomChar(CHAR_UPPER, random));
        password.append(randomChar(CHAR_LOWER, random));
        password.append(randomChar(NUMBER, random));
        password.append(randomChar(OTHER_CHAR, random));

        // 나머지 비밀번호 길이를 채웁니다.
        for (int i = 0; i < length - 4; i++) {
            password.append(randomChar(PASSWORD_ALLOW_BASE, random));
        }

        // 문자열을 섞습니다.
        String shuffledPassword = shuffleString(password.toString());
        return shuffledPassword;
    }

    private static char randomChar(String inputString, Random random) {
        int randomIndex = random.nextInt(inputString.length());
        return inputString.charAt(randomIndex);
    }

    private static String shuffleString(String inputString) {
        char[] charArray = inputString.toCharArray();
        for (int i = 0; i < charArray.length; i++) {
            int randomIndex = (int) (Math.random() * charArray.length);
            char temp = charArray[i];
            charArray[i] = charArray[randomIndex];
            charArray[randomIndex] = temp;
        }
        return new String(charArray);
    }
}

