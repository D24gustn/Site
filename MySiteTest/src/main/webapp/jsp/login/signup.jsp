<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>회원가입</title>
</head>
<body>
    <header>
        <jsp:include page="/jsp/include/topMenu.jsp" />
    </header>
    <section>
        <h1>회원가입</h1>
        <form action="/MySiteTest/board/signupProcess.do" method="post">
            <table>
                <tr>
                    <th>사용자 이름:</th>
                    <td><input type="text" name="username" required></td>
                </tr>
                <tr>
                    <th>이메일:</th>
                    <td><input type="email" name="email" required></td>
                </tr>
                <tr>
                    <th>비밀번호:</th>
                    <td><input type="password" name="password" required></td>
                </tr>
                <tr>
                    <th>비밀번호 확인:</th>
                    <td><input type="password" name="confirmPassword" required></td>
                </tr>
            </table>
            <button type="submit">회원가입</button>
        </form>
    </section>
</body>
</html>
