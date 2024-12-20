package kr.ac.kopo.controller;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import org.apache.ibatis.session.SqlSession;
import kr.ac.kopo.mybatis.MyConfig;
import kr.ac.kopo.board.vo.FAQVO;
import kr.ac.kopo.board.vo.UserVO;

import java.util.List;

public class FAQController implements Controller {
    @Override
    public String handleRequest(HttpServletRequest request, HttpServletResponse response) throws Exception {
        String action = request.getParameter("action");
        try (SqlSession session = new MyConfig().getInstance()) {
            if ("list".equals(action)) {
                List<FAQVO> faqList = session.selectList("FAQMapper.getAllFAQs");
                request.setAttribute("faqList", faqList);
                return "/jsp/board/faqList.jsp";
            } else if ("add".equals(action)) {
                FAQVO faq = new FAQVO();
                faq.setQuestion(request.getParameter("question"));
                faq.setAuthor(((UserVO) request.getSession().getAttribute("userVO")).getUsername());
                session.insert("FAQMapper.insertFAQ", faq);
                session.commit();
                return "redirect:/board/faq.do?action=list";
            } else if ("delete".equals(action)) {
                session.delete("FAQMapper.deleteFAQ", Integer.parseInt(request.getParameter("faqId")));
                session.commit();
                return "redirect:/board/faq.do?action=list";
            }
        }
        return null;
    }
}
