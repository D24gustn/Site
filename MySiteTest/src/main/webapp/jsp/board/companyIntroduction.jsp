<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>회사소개</title>
    <link rel="stylesheet" href="/resources/css/layout.css">
    <style>
        .container {
            width: 80%;
            margin: 0 auto;
            font-family: Arial, sans-serif;
        }
        h1, h2 {
            text-align: center;
            color: #333;
            margin-bottom: 20px;
        }
        p {
            font-size: 16px;
            line-height: 1.6;
            color: #555;
            text-align: justify;
        }
        .section {
            display: flex;
            justify-content: space-between;
            align-items: center;
            margin-bottom: 50px;
        }
        .section img {
            width: 30%; /* 이미지 크기를 줄임 */
            height: auto;
            border-radius: 8px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
        }
        .section .text {
            width: 65%; /* 텍스트 영역을 조금 더 넓게 */
            padding: 0 20px;
        }
        .organization {
            text-align: center;
            margin-top: 50px;
        }
        .organization h2 {
            margin-bottom: 20px;
        }
        .department-list {
            display: flex;
            justify-content: center;
            flex-wrap: wrap;
            gap: 20px;
        }
        .department-list div {
            padding: 10px 20px;
            border: 1px solid #ddd;
            border-radius: 8px;
            background-color: #f9f9f9;
            box-shadow: 0 2px 5px rgba(0, 0, 0, 0.1);
            font-size: 14px;
            color: #555;
        }
        .employee-list {
            margin-top: 10px;
            font-size: 14px;
            color: #666;
        }
        .employee-list ul {
            list-style-type: none;
            padding: 0;
            margin: 0;
        }
        .employee-list li {
            margin: 5px 0;
        }
    </style>
</head>
<body>
    <!-- 상단 메뉴 -->
    <header>
        <jsp:include page="/jsp/include/topMenu.jsp" />
    </header>

    <div class="container">
        <!-- 회사 이름 -->
        <h1>${companyName}</h1>

        <!-- 회사 정보 섹션 -->
        <div class="section">
            <img src="/MySiteTest/resources/images/사진.PNG" alt="회사 이미지">
            <div class="text">
                <h2>회사 정보</h2>
                <p>
                    세계방역협회는 방역과 안전을 넘어 환경까지 고려하며, 더 나은 삶을 위한 서비스를 제공합니다.
                    창의적이고 혁신적인 기술을 바탕으로 대한민국을 넘어 아시아 전역으로 진출하며,
                    글로벌 리더로 자리잡고자 끊임없이 노력하고 있습니다.
                </p>
                <p>
                    협회는 사회적 책임을 다하고, 안전한 환경과 지속 가능한 발전을 목표로,
                    파트너와의 신뢰를 바탕으로 성장하고 있습니다.
                </p>
            </div>
        </div>

        <!-- 회사 비전 섹션 -->
        <div class="section">
            <div class="text">
                <h2>우리의 비전</h2>
                <p>
                    세계방역협회는 현재의 성과에 만족하지 않고, 생활방역으로 전환되는 대한민국의 방역과 안전,
                    더 나아가 환경까지 고려한 혁신적인 서비스를 제공하기 위해 노력하고 있습니다.
                </p>
                <p>
                    협회는 주변의 이웃 중소기업과 자영업자들을 지원하며, 안전하고 방역과 소독이 철저하게 이루어지는
                    기업문화를 선도하고, 환경문화를 구축해 나갈 것입니다. 우리는 모두가 더 나은 삶을 누릴 수 있는
                    세상을 만들기 위해 앞장서겠습니다.
                </p>
            </div>
            <img src="/MySiteTest/resources/images/사진2.PNG" alt="비전 이미지">
        </div>

        <!-- 회사 조직도 -->
        <div class="organization">
            <h2>회사 부서</h2>
            <div class="department-list">
                <div>
                    <strong>CEO</strong>
                    <div class="employee-list">
                        <ul>
                            <li>John Doe</li>
                        </ul>
                    </div>
                </div>
                <div>
                    <strong>CTO</strong>
                    <div class="employee-list">
                        <ul>
                            <li>Jane Smith</li>
                            <li>Emily Brown</li>
                        </ul>
                    </div>
                </div>
                <div>
                    <strong>COO</strong>
                    <div class="employee-list">
                        <ul>
                            <li>Michael Johnson</li>
                        </ul>
                    </div>
                </div>
                <div>
                    <strong>HR</strong>
                    <div class="employee-list">
                        <ul>
                            <li>Sarah Connor</li>
                        </ul>
                    </div>
                </div>
                <div>
                    <strong>Finance</strong>
                    <div class="employee-list">
                        <ul>
                            <li>Robert Taylor</li>
                        </ul>
                    </div>
                </div>
                <div>
                    <strong>Marketing</strong>
                    <div class="employee-list">
                        <ul>
                            <li>Anna White</li>
                        </ul>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <!-- 하단 메뉴 -->
    <footer>
        <jsp:include page="/jsp/include/footer.jsp" />
    </footer>
</body>
</html>
