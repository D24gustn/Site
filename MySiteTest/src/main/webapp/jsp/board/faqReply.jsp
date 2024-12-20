<%@ page import="kr.ac.kopo.board.dao.FAQDAO, kr.ac.kopo.board.vo.FAQVO" %>
<%@ page import="java.sql.Connection" %>
<%
    int faqId = Integer.parseInt(request.getParameter("faqId"));
    String answer = request.getParameter("answer");

    FAQVO faq = new FAQVO();
    faq.setFaqId(faqId);
    faq.setAnswer(answer);

    try (Connection conn = new kr.ac.kopo.util.ConnectionFactory().getConnection()) {
        FAQDAO faqDAO = new FAQDAO(conn);
        faqDAO.updateFAQ(faq);
    } catch (Exception e) {
        e.printStackTrace();
    }

    response.sendRedirect("/board/faqList.jsp");
%>
