<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>제품 목록</title>
</head>
<body>
    <h1>제품 목록</h1>

    <!-- 제품 추가 폼 (관리자 전용) -->
    <c:if test="${sessionScope.userVO.role == 'ADMIN'}">
        <form action="/board/product.do?action=add" method="post">
            제품 이름: <input type="text" name="productName" required><br>
            설명: <input type="text" name="description" required><br>
            이미지 경로: <input type="text" name="productImage" required><br>
            <button type="submit">제품 추가</button>
        </form>
        <hr>
    </c:if>

    <!-- 제품 목록 출력 -->
    <table border="1" width="80%">
        <tr>
            <th>ID</th>
            <th>제품명</th>
            <th>설명</th>
            <th>이미지</th>
            <c:if test="${sessionScope.userVO.role == 'ADMIN'}">
                <th>삭제</th>
            </c:if>
        </tr>
        <c:forEach var="product" items="${productList}">
            <tr>
                <td>${product.productId}</td>
                <td>${product.productName}</td>
                <td>${product.description}</td>
                <td><img src="${product.productImage}" width="100" height="100" /></td>
                <c:if test="${sessionScope.userVO.role == 'ADMIN'}">
                    <td>
                        <form action="/board/product.do?action=delete" method="post">
                            <input type="hidden" name="productId" value="${product.productId}">
                            <button type="submit">삭제</button>
                        </form>
                    </td>
                </c:if>
            </tr>
        </c:forEach>
    </table>
</body>
</html>
