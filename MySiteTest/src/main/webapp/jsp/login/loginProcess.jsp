<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="kr.ac.kopo.mybatis.MyConfig" %>
<%@ page import="kr.ac.kopo.board.vo.UserVO" %>
<%@ page import="kr.ac.kopo.util.PasswordUtil" %>
<%@ page import="org.apache.ibatis.session.SqlSession" %>

<%
    request.setCharacterEncoding("UTF-8");

    String email = request.getParameter("email");
    String password = request.getParameter("password");

    String message = "";
    String redirectUrl = "";

    try (SqlSession sqlSession = new MyConfig().getInstance()) {
        UserVO user = sqlSession.selectOne("kr.ac.kopo.board.mapper.UserMapper.getUserByEmail", email);

        if (user != null && PasswordUtil.verifyPassword(password, user.getPassword())) {
            session.setAttribute("userVO", user);

            if ("ADMIN".equalsIgnoreCase(user.getRole())) {
                message = "관리자로 로그인되었습니다.";
                redirectUrl = "/MySiteTest/jsp/board/adminDashboard.jsp";
            } else {
                message = "로그인 성공! 환영합니다.";
                redirectUrl = "/MySiteTest/jsp/board/userDashboard.jsp";
            }
        } else {
            message = "로그인 실패: 이메일 또는 비밀번호를 확인하세요.";
            redirectUrl = "/MySiteTest/jsp/login/login.jsp";
        }
    } catch (Exception e) {
        e.printStackTrace();
        message = "로그인 처리 중 오류가 발생했습니다.";
        redirectUrl = "/MySiteTest/jsp/login/login.jsp";
    }
%>
<script>
    alert('<%= message %>');
    location.href = '<%= redirectUrl %>';
</script>
