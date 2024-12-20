package kr.ac.kopo.controller;

import java.util.List;
import org.apache.ibatis.session.SqlSession;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import kr.ac.kopo.board.vo.ProductVO;
import kr.ac.kopo.mybatis.MyConfig;

public class ProductController implements Controller {

    @Override
    public String handleRequest(HttpServletRequest request, HttpServletResponse response) throws Exception {
        String action = request.getParameter("action");
        
        int a = 0;
        a += 1;
        
        try (SqlSession sqlSession = new MyConfig().getInstance()) {
            if ("list".equals(action)) {
                // 제품 목록 조회
                List<ProductVO> productList = sqlSession.selectList("kr.ac.kopo.board.mapper.ProductMapper.getAllProducts");
                request.setAttribute("productList", productList);
                return "/jsp/board/product.jsp";

            } else if ("add".equals(action)) {
                // 제품 추가 (관리자용)
                String productName = request.getParameter("productName");
                String description = request.getParameter("description");
                String productImage = request.getParameter("productImage");

                ProductVO product = new ProductVO();
                product.setProductName(productName);
                product.setDescription(description);
                product.setProductImage(productImage);

                sqlSession.insert("kr.ac.kopo.board.mapper.ProductMapper.insertProduct", product);
                sqlSession.commit();
                return "redirect:/board/product.do?action=list";

            } else if ("delete".equals(action)) {
                // 제품 삭제 (관리자용)
                int productId = Integer.parseInt(request.getParameter("productId"));
                sqlSession.delete("kr.ac.kopo.board.mapper.ProductMapper.deleteProduct", productId);
                sqlSession.commit();
                return "redirect:/board/product.do?action=list";
            }
        } catch (Exception e) {
            e.printStackTrace();
            throw new Exception("제품 처리 중 오류 발생", e);
        }

        return "/jsp/board/product.jsp";
    }
}
