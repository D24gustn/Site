<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<table border="1" style="width: 100%; border-collapse: collapse;">
    <tr>
        <td rowspan="2" style="width: 100px; height: 45px;">
            <a href="/MySiteTest/jsp/index.jsp">
                <img src="/MySiteTest/resources/images/마크.PNG" alt="로고" style="width: 140px; height: 80px;">
            </a>
        </td>
        <td align="right" style="padding: 5px;">
            <c:if test="${not empty userVO}">
                [<strong>${userVO.username}</strong>님 로그인 중]
            </c:if>
        q</td>
    </tr>
    <tr>
        <td>
            <nav style="padding: 5px;">
                <a href="/MySiteTest/jsp/index.jsp">HOME</a> |
                <a href="/MySiteTest/jsp/board/companyIntroduction.do">회사소개</a> |
                <a href="/MySiteTest/jsp/board/product.do">제품 소개</a> |
                <a href="/MySiteTest/jsp/board/newsList.jsp">소식</a> |
                <c:if test="${empty userVO}">
                    <a href="/MySiteTest/board/signup.do">회원가입</a> |
                    <a href="/MySiteTest/board/login.do">로그인</a>
                </c:if>
                <c:if test="${not empty userVO}">
                    <a href="/MySiteTest/jsp/board/faq.do">질문게시판</a> |
                    <a href="/MySiteTest/jsp/login/logout.jsp">로그아웃</a>
                </c:if>
            </nav>
        </td>
    </tr>
</table>
