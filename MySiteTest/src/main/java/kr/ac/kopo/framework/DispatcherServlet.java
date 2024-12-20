package kr.ac.kopo.framework;

import java.io.IOException;

import jakarta.servlet.ServletConfig;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import kr.ac.kopo.controller.Controller;

public class DispatcherServlet extends HttpServlet {

    private HandlerMapping mappings;

    @Override
    public void init(ServletConfig config) throws ServletException {
        String propName = config.getInitParameter("propName");
        if (propName == null || propName.isEmpty()) {
            throw new ServletException("propName 초기화 실패: web.xml에서 propName 파라미터를 확인하세요.");
        }
        mappings = new HandlerMapping(propName);
    }

    @Override
    public void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String contextPath = request.getContextPath();
        String uri = request.getRequestURI().substring(contextPath.length());
        System.out.println("요청 URI : " + uri);

        try {
            Controller control = mappings.getController(uri);
            if (control == null) {
                throw new ServletException("매핑된 컨트롤러를 찾을 수 없습니다. URI: " + uri);
            }
            System.out.println("매핑된 컨트롤러: " + control.getClass().getName());

            String callPage = control.handleRequest(request, response);
            if (callPage == null) {
                response.sendError(HttpServletResponse.SC_NOT_FOUND, "요청한 페이지를 찾을 수 없습니다.");
            } else if (callPage.startsWith("redirect:")) {
                callPage = callPage.substring("redirect:".length());
                System.out.println("callPage : " + callPage);
                response.sendRedirect(request.getContextPath() + callPage);
            } else {
                request.getRequestDispatcher(callPage).forward(request, response);
            }
        } catch (Exception e) {
            e.printStackTrace();
            throw new ServletException("요청 처리 중 오류 발생: " + e.getMessage(), e);
        }
    }
}
