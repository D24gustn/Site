<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>로그인</title>
</head>
<body>
    <header>
        <jsp:include page="/jsp/include/topMenu.jsp" />
    </header>
    <section>
        <h1>로그인</h1>
        <form action="/MySiteTest/board/loginProcess.do" method="post">
            <table>
                <tr>
                    <th>이메일:</th>
                    <td><input type="email" name="email" required></td>
                </tr>
                <tr>
                    <th>비밀번호:</th>
                    <td><input type="password" name="password" required></td>
                </tr>
            </table>
            <button type="submit">로그인</button>
        </form>
    </section>
</body>
</html>
