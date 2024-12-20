<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>홈페이지</title>
    <link rel="stylesheet" href="/Mission-WEB/resources/css/layout.css">
    <link rel="stylesheet" href="/Mission-WEB/resources/css/board_layout.css">
    <style>
        .container {
            display: flex;
            justify-content: center;
            align-items: center;
            margin-top: 20px;
        }
        #gallery {
            display: flex;
            overflow: hidden;
            width: 500px;
            margin: 20px auto;
        }
        #gallery img {
            width: 100%;
            height: auto;
            display: none;
        }
        #gallery img.active {
            display: block;
        }
        button {
            height: 50px;
            background-color: rgba(0, 0, 0, 0.5);
            color: white;
            border: none;
            cursor: pointer;
        }
        button:hover {
            background-color: rgba(0, 0, 0, 0.8);
        }
        .section {
            margin: 40px auto;
            max-width: 800px;
            text-align: center;
        }
        .section h2 {
            font-size: 24px;
            margin-bottom: 10px;
        }
        .section p {
            font-size: 16px;
            line-height: 1.5;
            color: #333;
        }
        .products-grid {
            display: flex;
            justify-content: center;
            gap: 20px;
            flex-wrap: wrap;
        }
        .product-card {
            border: 1px solid #ddd;
            padding: 15px;
            text-align: center;
            width: 200px;
            box-shadow: 2px 2px 5px rgba(0, 0, 0, 0.1);
        }
        .product-card img {
            max-width: 100%;
            height: auto;
            margin-bottom: 10px;
        }
        .product-card h4 {
            margin: 10px 0;
        }
    </style>
    <script src="https://code.jquery.com/jquery-3.7.1.min.js"></script>
    <script>
        $(document).ready(function () {
            let currentIndex = 0;
            const images = $('#gallery img');
            const totalImages = images.length;

            function showImage(index) {
                images.removeClass('active');
                $(images[index]).addClass('active');
            }

            $('#prevBtn').click(function () {
                currentIndex = (currentIndex - 1 + totalImages) % totalImages;
                showImage(currentIndex);
            });

            $('#nextBtn').click(function () {
                currentIndex = (currentIndex + 1) % totalImages;
                showImage(currentIndex);
            });

            setInterval(function () {
                $('#nextBtn').trigger('click');
            }, 4000);

            showImage(currentIndex);
        });
    </script>
</head>
<body>
    <!-- 헤더 -->
    <header>
        <jsp:include page="/jsp/include/topMenu.jsp" />
    </header>

    <!-- 메인 섹션 -->
    <section>
        <div class="container">
            <button id="prevBtn">PREV</button>
            <div id="gallery">
                <img src="/MySiteTest/resources/images/이미지.PNG" alt="이미지 1">
                <img src="/MySiteTest/resources/images/이미지1.PNG" alt="이미지 2">
                <img src="/MySiteTest/resources/images/이미지2.PNG" alt="이미지 3">
            </div>
            <button id="nextBtn">NEXT</button>
        </div>

        <!-- 공지사항 섹션 -->
        <div class="section">
            <h2>공지사항</h2>
            <p>현재 진행 중인 이벤트와 최신 소식을 확인하세요.</p>
            <ul>
                <li><a href="/MySiteTest/jsp/board/notice.jsp">공지사항 1</a></li>
                <li><a href="/MySiteTest/jsp/board/notice.jsp">공지사항 2</a></li>
                <li><a href="/MySiteTest/jsp/board/notice.jsp">공지사항 3</a></li>
            </ul>
        </div>

        <!-- 인기 제품 섹션 -->
        <div class="section">
            <h2>인기 제품</h2>
            <div class="products-grid">
                <div class="product-card">
                    <img src="/MySiteTest/resources/images/product1.png" alt="제품 1">
                    <h4>제품 1</h4>
                    <p>설명: 훌륭한 제품입니다.</p>
                </div>
                <div class="product-card">
                    <img src="/MySiteTest/resources/images/product2.png" alt="제품 2">
                    <h4>제품 2</h4>
                    <p>설명: 믿을 수 있는 품질.</p>
                </div>
                <div class="product-card">
                    <img src="/MySiteTest/resources/images/product3.png" alt="제품 3">
                    <h4>제품 3</h4>
                    <p>설명: 많은 사랑을 받고 있습니다.</p>
                </div>
            </div>
        </div>
    </section>

    <!-- 푸터 -->
    <footer>
        <jsp:include page="/jsp/include/footer.jsp" />
    </footer>
</body>
</html>
