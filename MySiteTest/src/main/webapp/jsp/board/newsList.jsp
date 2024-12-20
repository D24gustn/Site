<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.io.BufferedReader" %>
<%@ page import="java.io.InputStreamReader" %>
<%@ page import="java.net.HttpURLConnection" %>
<%@ page import="java.net.URL" %>
<%@ page import="org.json.JSONObject" %>
<%@ page import="org.json.JSONArray" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>뉴스 데이터 표시</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 20px;
        }
        h1 {
            text-align: center;
        }
        .news-article {
            border: 1px solid #ccc;
            padding: 15px;
            margin-bottom: 10px;
            border-radius: 5px;
        }
        .news-article h2 {
            margin: 0 0 10px;
        }
        .news-article p {
            margin: 5px 0;
        }
        .show-more {
            color: blue;
            cursor: pointer;
            text-decoration: underline;
        }
    </style>
</head>
<body>
    <h1>자연재해 뉴스</h1>
<%
    String apiKey = "1c44d75b299d4644a432c1f0cfcf1d4a"; // API 키
    String query = "natural disaster"; // 검색 키워드
    String language = "en";
    int pageSize = 5; // 뉴스 개수
    String apiUrl = "https://newsapi.org/v2/everything?q=" + query + "&language=" + language + "&pageSize=" + pageSize + "&apiKey=" + apiKey;

    try {
        URL url = new URL(apiUrl);
        HttpURLConnection connection = (HttpURLConnection) url.openConnection();
        connection.setRequestMethod("GET");
        connection.setConnectTimeout(5000);
        connection.setReadTimeout(5000);

        int responseCode = connection.getResponseCode();
        if (responseCode == 200) {
            BufferedReader reader = new BufferedReader(new InputStreamReader(connection.getInputStream()));
            StringBuilder responseBuilder = new StringBuilder();
            String line;
            while ((line = reader.readLine()) != null) {
                responseBuilder.append(line);
            }
            reader.close();

            JSONObject jsonResponse = new JSONObject(responseBuilder.toString());
            JSONArray articles = jsonResponse.getJSONArray("articles");

            for (int i = 0; i < articles.length(); i++) {
                JSONObject article = articles.getJSONObject(i);
                String title = article.optString("title", "제목 없음");
                String description = article.optString("description", "설명 없음");
                String urlToArticle = article.optString("url", "#");
                String author = article.optString("author", "작성자 미상");
                String publishedAt = article.optString("publishedAt", "게시일 없음");
%>
                <div class="news-article">
                    <h2><%= title %></h2>
                    <p><strong>작성자:</strong> <%= author %></p>
                    <p><strong>게시일:</strong> <%= publishedAt %></p>
                    <p><strong>설명:</strong> <%= description %></p>
                    <!-- 더보기 버튼을 링크로 변경 -->
                    <a href="<%= urlToArticle %>" target="_blank" class="show-more">더보기</a>
                </div>
<%
            }
        } else {
            out.println("<p>뉴스를 가져오는데 실패했습니다. 응답 코드: " + responseCode + "</p>");
        }
        connection.disconnect();
    } catch (Exception e) {
        out.println("<p>오류 발생: " + e.getMessage() + "</p>");
    }
%>
</body>
</html>
