package kr.ac.kopo.util;

import java.sql.Connection;

public class TestConnection {
    public static void main(String[] args) {
        try {
            Connection conn = ConnectionFactory.getConnection();
            if (conn != null) {
                System.out.println("DB 연결 성공!");
                conn.close(); // 연결 종료
            }
        } catch (Exception e) {
            System.out.println("DB 연결 실패");
            e.printStackTrace(); // 오류 원인 출력
        }
    }
}
