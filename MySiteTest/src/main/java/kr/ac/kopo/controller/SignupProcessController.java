package kr.ac.kopo.controller;

import org.apache.ibatis.session.SqlSession;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import kr.ac.kopo.board.vo.UserVO;
import kr.ac.kopo.mybatis.MyConfig;
import kr.ac.kopo.util.PasswordUtil;

public class SignupProcessController implements Controller {

    @Override
    public String handleRequest(HttpServletRequest request, HttpServletResponse response) throws Exception {
        String username = request.getParameter("username");
        String email = request.getParameter("email");
        String password = request.getParameter("password");

        UserVO SignupVO = new UserVO();
        SignupVO.setUsername(username);
        SignupVO.setEmail(email);
        SignupVO.setPassword(password);
        
        String url = "";

        try (SqlSession sqlSession = new MyConfig().getInstance()) {
            UserVO existingUser = sqlSession.selectOne("UserMapper.getUserByEmail", email);

            if (existingUser != null) {
                request.setAttribute("message", "이미 존재하는 이메일입니다.");
                url = "redirect:/board/signup.do";
            } else {
                UserVO newUser = new UserVO();
                newUser.setUsername(username);
                newUser.setEmail(email);
                newUser.setPassword(password);
                newUser.setRole("USER");

                sqlSession.insert("UserMapper.insertUser", newUser);
                sqlSession.commit();

                url = "redirect:/board/login.do";
            }
        } catch (Exception e) {
            e.printStackTrace();
            request.setAttribute("message", "회원가입 중 오류가 발생했습니다.");
            url = "redirect:/board/signup.do";
        }

        return url;
    }
}
