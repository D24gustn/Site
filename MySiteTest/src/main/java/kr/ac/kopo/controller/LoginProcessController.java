package kr.ac.kopo.controller;

import org.apache.ibatis.session.SqlSession;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import kr.ac.kopo.board.vo.UserVO;
import kr.ac.kopo.mybatis.MyConfig;
import kr.ac.kopo.util.PasswordUtil;

public class LoginProcessController implements Controller {

	@Override
	public String handleRequest(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String email = request.getParameter("email");
		String password = request.getParameter("password");
		UserVO loginVO = new UserVO();
		loginVO.setEmail(email);
		loginVO.setPassword(password);
		
		System.out.println(email + " : " + password);

		String url = "";
		
		try (SqlSession sqlSession = new MyConfig().getInstance()) {
			UserVO user = sqlSession.selectOne("UserMapper.login", loginVO);

			System.out.println("user : " + user);
			
			if (user != null) {
				HttpSession session = request.getSession();
				session.setAttribute("userVO", user);

				if ("ADMIN".equalsIgnoreCase(user.getRole())) {
					//response.sendRedirect("/MySiteTest/jsp/board/adminDashboard.jsp");
					System.out.println("ADMIN 로그인...");
					url = "redirect:/";
				} else {
					//response.sendRedirect("/MySiteTest/jsp/board/userDashboard.jsp");
					url = "redirect:/";
				}
			} else {
				request.setAttribute("message", "로그인 실패: 이메일 또는 비밀번호를 확인하세요.");
				//request.getRequestDispatcher("/MySiteTest/jsp/login/login.jsp").forward(request, response);
				url = "redirect:/board/login.do";
			}
		} catch (Exception e) {
			e.printStackTrace();
			request.setAttribute("message", "로그인 중 오류가 발생했습니다.");
			//request.getRequestDispatcher("/MySiteTest/jsp/login/login.jsp").forward(request, response);
			url = "redirect:/board/login.do";
		}
		return url;
	}

}
