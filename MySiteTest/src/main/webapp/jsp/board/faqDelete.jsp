<%@ page import="kr.ac.kopo.board.dao.FAQDAO" %>
<%@ page import="java.sql.Connection" %>
<%
    int faqId = Integer.parseInt(request.getParameter("faqId"));

    try (Connection conn = new kr.ac.kopo.util.ConnectionFactory().getConnection()) {
        FAQDAO faqDAO = new FAQDAO(conn);
        faqDAO.deleteFAQ(faqId);
    } catch (Exception e) {
        e.printStackTrace();
    }

    response.sendRedirect("/board/faqList.jsp");
%>
