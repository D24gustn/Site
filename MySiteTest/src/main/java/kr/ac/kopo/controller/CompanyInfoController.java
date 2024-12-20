package kr.ac.kopo.controller;

import org.apache.ibatis.session.SqlSession;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import kr.ac.kopo.board.vo.CompanyInfoVO;
import kr.ac.kopo.mybatis.MyConfig;

public class CompanyInfoController implements Controller {

	@Override
	public String handleRequest(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String action = request.getParameter("action");

		try (SqlSession session = new MyConfig().getInstance()) {
			if ("view".equals(action)) {
				CompanyInfoVO companyInfo = session.selectOne("CompanyInfoMapper.getCompanyInfo");
				request.setAttribute("companyInfo", companyInfo);
				return "/jsp/board/companyIntroduction.jsp";
			} else if ("edit".equals(action)) {
				CompanyInfoVO companyInfo = new CompanyInfoVO();
				companyInfo.setInfoId(Integer.parseInt(request.getParameter("infoId")));
				companyInfo.setTitle(request.getParameter("title"));
				companyInfo.setContent(request.getParameter("content"));

				session.update("CompanyInfoMapper.updateCompanyInfo", companyInfo);
				session.commit();
				return "redirect:/board/companyIntroduction.do?action=view";
			}
		}
		return "/jsp/board/companyIntroduction.jsp";
	}
}
