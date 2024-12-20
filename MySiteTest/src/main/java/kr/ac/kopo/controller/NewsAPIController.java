package kr.ac.kopo.controller;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

public class NewsAPIController implements Controller {

	@Override
	public String handleRequest(HttpServletRequest request, HttpServletResponse response) throws Exception {
		// TODO Auto-generated method stub
		return null;
	}

	/*
    private static final String API_URL = "https://newsapi.org/v2/top-headlines";
    private static final String API_KEY = "1c44d75b299d4644a432c1f0cfcf1d4a";

    @Override
    public String handleRequest(HttpServletRequest request, HttpServletResponse response) throws Exception {
        List<NewsVO> newsList = fetchNews();

        request.setAttribute("newsList", newsList);

        return "/jsp/board/newsList.jsp";
    }

    private List<NewsVO> fetchNews() throws Exception {
        List<NewsVO> newsList = new ArrayList<>();
        String urlString = API_URL + "?country=kr&apiKey=" + API_KEY;

        URL url = new URL(urlString);
        HttpURLConnection conn = (HttpURLConnection) url.openConnection();
        conn.setRequestMethod("GET");

        int responseCode = conn.getResponseCode();
        if (responseCode == 200) {
            BufferedReader in = new BufferedReader(new InputStreamReader(conn.getInputStream()));
            StringBuilder response = new StringBuilder();
            String inputLine;

            while ((inputLine = in.readLine()) != null) {
                response.append(inputLine);
            }
            in.close();

            JSONObject jsonResponse = new JSONObject(response.toString());
            JSONArray articles = jsonResponse.getJSONArray("articles");

            for (int i = 0; i < articles.length(); i++) {
                JSONObject article = articles.getJSONObject(i);
                NewsVO news = new NewsVO();

                news.setTitle(article.optString("title"));
                news.setNewsLink(article.optString("url"));
                news.setPublishDate(article.optString("publishedAt"));

                newsList.add(news);
            }
        } else {
            System.out.println("API 호출 실패: HTTP 응답 코드 " + responseCode);
        }
        return newsList;
    }
    */
}
