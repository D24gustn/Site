<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>FAQ List</title>
</head>
<body>
    <h1>FAQ List</h1>
    <c:if test="${not empty userVO}">
        <form action="/board/faq.do?action=add" method="post">
            <textarea name="question" required></textarea>
            <button type="submit">Add FAQ</button>
        </form>
    </c:if>
    <table>
        <tr>
            <th>ID</th>
            <th>Question</th>
            <th>Author</th>
            <th>Answer</th>
            <th>Action</th>
        </tr>
        <c:forEach items="${faqList}" var="faq">
            <tr>
                <td>${faq.faqId}</td>
                <td>${faq.question}</td>
                <td>${faq.author}</td>
                <td>${faq.answer}</td>
                <td>
                    <form action="/board/faq.do?action=delete" method="post">
                        <input type="hidden" name="faqId" value="${faq.faqId}">
                        <button type="submit">Delete</button>
                    </form>
                </td>
            </tr>
        </c:forEach>
    </table>
</body>
</html>
