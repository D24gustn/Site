<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="kr.ac.kopo.board.vo.UserVO" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>관리자 대시보드</title>
    <link rel="stylesheet" href="/MySiteTest/resources/css/layout.css">
</head>
<body>
    <!-- 헤더 -->
    <header>
        <jsp:include page="/jsp/include/topMenu.jsp" />
    </header>

    <%
        UserVO user = (UserVO) session.getAttribute("userVO");
        if (user == null || !"ADMIN".equalsIgnoreCase(user.getRole())) {
            response.sendRedirect("/MySiteTest/jsp/login/login.jsp");
            return;
        }
    %>

    <!-- 메인 섹션 -->
    <section>
        <h1>관리자 대시보드</h1>
        <p>환영합니다, 관리자 <strong><%= user.getUsername() %></strong>님!</p>
        <div>
            <h2>메인 콘텐츠</h2>
            <ul>
                <li><a href="/MySiteTest/board/companyIntroduction.do">회사 소개</a></li>
                <li><a href="/MySiteTest/board/product.do">제품 보기</a></li>
                <li><a href="/MySiteTest/board/tidings.do">소식 보기</a></li>
            </ul>
        </div>

        <div>
            <h2>관리자 기능</h2>
            <ul>
                <li><a href="/MySiteTest/board/addProduct.do">제품 추가</a></li>
                <li><a href="/MySiteTest/board/addNews.do">뉴스 추가</a></li>
                <li><a href="/MySiteTest/board/manageQuestions.do">질문 관리</a></li>
            </ul>
        </div>
    </section>

    <!-- 푸터 -->
    <footer>
        <jsp:include page="/jsp/include/footer.jsp" />
    </footer>
</body>
</html>
