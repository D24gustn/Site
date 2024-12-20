<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="kr.ac.kopo.board.vo.UserVO" %>
<%@ page import="kr.ac.kopo.mybatis.MyConfig" %>
<%@ page import="kr.ac.kopo.util.PasswordUtil" %>
<%@ page import="org.apache.ibatis.session.SqlSession" %>

<%
    request.setCharacterEncoding("UTF-8");

    String username = request.getParameter("username");
    String email = request.getParameter("email");
    String password = request.getParameter("password");
    String confirmPassword = request.getParameter("confirmPassword");

    String message = "";
    String redirectUrl = "";

    if (!password.equals(confirmPassword)) {
        message = "비밀번호가 일치하지 않습니다.";
        redirectUrl = "/MySiteTest/jsp/login/signup.jsp";
    } else {
        try (SqlSession sqlSession = new MyConfig().getInstance()) {
            UserVO existingUser = sqlSession.selectOne("kr.ac.kopo.board.mapper.UserMapper.getUserByEmail", email);

            if (existingUser != null) {
                message = "이미 사용 중인 이메일입니다.";
                redirectUrl = "/MySiteTest/jsp/login/signup.jsp";
            } else {
                // 비밀번호 해싱 처리
                String hashedPassword = PasswordUtil.hashPassword(password);

                UserVO newUser = new UserVO();
                newUser.setUsername(username);
                newUser.setEmail(email);
                newUser.setPassword(hashedPassword);
                newUser.setRole("USER");

                sqlSession.insert("kr.ac.kopo.board.mapper.UserMapper.insertUser", newUser);
                sqlSession.commit();

                message = "회원가입이 완료되었습니다!";
                redirectUrl = "/MySiteTest/jsp/login/login.jsp";
            }
        } catch (Exception e) {
            e.printStackTrace();
            message = "회원가입 처리 중 오류가 발생했습니다.";
            redirectUrl = "/MySiteTest/jsp/login/signup.jsp";
        }
    }
%>
<script>
    alert('<%= message %>');
    location.href = '<%= redirectUrl %>';
</script>
