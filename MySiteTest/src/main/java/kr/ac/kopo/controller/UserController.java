package kr.ac.kopo.controller;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

public class UserController implements Controller {

	@Override
	public String handleRequest(HttpServletRequest request, HttpServletResponse response) throws Exception {

		return "/jsp/login/login.jsp";
	}

	/*
	 * @Override protected void doPost(HttpServletRequest request,
	 * HttpServletResponse response) throws ServletException, IOException {
	 * request.setCharacterEncoding("UTF-8"); String action =
	 * request.getParameter("action");
	 * 
	 * if ("signup".equals(action)) { handleSignup(request, response); } else if
	 * ("login".equals(action)) { handleLogin(request, response); } }
	 * 
	 * private void handleSignup(HttpServletRequest request, HttpServletResponse
	 * response) throws ServletException, IOException { String username =
	 * request.getParameter("username"); String email =
	 * request.getParameter("email"); String password =
	 * PasswordUtil.hashPassword(request.getParameter("password"));
	 * 
	 * try (SqlSession sqlSession = MyConfig.getInstance()) { UserVO existingUser =
	 * sqlSession.selectOne("UserMapper.getUserByEmail", email);
	 * 
	 * if (existingUser != null) { request.setAttribute("message",
	 * "이미 존재하는 이메일입니다.");
	 * request.getRequestDispatcher("/MySiteTest/jsp/login/signup.jsp").forward(
	 * request, response); return; }
	 * 
	 * UserVO newUser = new UserVO(); newUser.setUsername(username);
	 * newUser.setEmail(email); newUser.setPassword(password);
	 * newUser.setRole("USER");
	 * 
	 * sqlSession.insert("UserMapper.insertUser", newUser); sqlSession.commit();
	 * 
	 * response.sendRedirect("/MySiteTest/jsp/login/login.jsp"); } catch (Exception
	 * e) { e.printStackTrace(); request.setAttribute("message",
	 * "회원가입 중 오류가 발생했습니다.");
	 * request.getRequestDispatcher("/MySiteTest/jsp/login/signup.jsp").forward(
	 * request, response); } }
	 * 
	 * private void handleLogin(HttpServletRequest request, HttpServletResponse
	 * response) throws ServletException, IOException { String email =
	 * request.getParameter("email"); String password =
	 * request.getParameter("password");
	 * 
	 * try (SqlSession sqlSession = MyConfig.getInstance()) { UserVO user =
	 * sqlSession.selectOne("UserMapper.getUserByEmail", email);
	 * 
	 * if (user != null && PasswordUtil.verifyPassword(password,
	 * user.getPassword())) { HttpSession session = request.getSession();
	 * session.setAttribute("userVO", user);
	 * 
	 * if ("ADMIN".equalsIgnoreCase(user.getRole())) {
	 * response.sendRedirect("/MySiteTest/jsp/board/adminDashboard.jsp"); } else {
	 * response.sendRedirect("/MySiteTest/jsp/board/userDashboard.jsp"); } } else {
	 * request.setAttribute("message", "로그인 실패: 이메일 또는 비밀번호를 확인하세요.");
	 * request.getRequestDispatcher("/MySiteTest/jsp/login/login.jsp").forward(
	 * request, response); } } catch (Exception e) { e.printStackTrace();
	 * request.setAttribute("message", "로그인 중 오류가 발생했습니다.");
	 * request.getRequestDispatcher("/MySiteTest/jsp/login/login.jsp").forward(
	 * request, response); } }
	 */
}
