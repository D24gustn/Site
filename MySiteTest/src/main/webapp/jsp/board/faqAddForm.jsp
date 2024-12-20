<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>질문 작성</title>
</head>
<body>
    <form action="/board/faq.do?action=add" method="post">
        <textarea name="question" rows="5" placeholder="질문을 입력하세요" required></textarea>
        <button type="submit">등록</button>
    </form>
</body>
</html>
