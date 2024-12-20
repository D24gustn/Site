package kr.ac.kopo.util;

import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;

public class PasswordUtil {

    /**
     * 비밀번호를 SHA-256 해싱으로 변환
     *
     * @param password 해싱할 비밀번호
     * @return 해싱된 비밀번호 (16진수 문자열)
     */
    public static String hashPassword(String password) {
        try {
            MessageDigest md = MessageDigest.getInstance("SHA-256");
            byte[] hash = md.digest(password.getBytes());
            StringBuilder sb = new StringBuilder();

            for (byte b : hash) {
                sb.append(String.format("%02x", b)); // 16진수로 변환
            }

            return sb.toString();
        } catch (NoSuchAlgorithmException e) {
            throw new RuntimeException("SHA-256 알고리즘을 찾을 수 없습니다.", e);
        }
    }

    /**
     * 입력된 비밀번호와 해싱된 비밀번호를 비교
     *
     * @param inputPassword 입력된 비밀번호
     * @param hashedPassword 저장된 해싱된 비밀번호
     * @return 두 비밀번호가 일치하면 true, 아니면 false
     */
    public static boolean verifyPassword(String inputPassword, String hashedPassword) {
        String inputHashed = hashPassword(inputPassword);
        return inputHashed.equals(hashedPassword);
    }
}
