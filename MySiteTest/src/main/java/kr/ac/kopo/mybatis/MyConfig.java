package kr.ac.kopo.mybatis;

import java.io.InputStream;
import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

public class MyConfig {
    private static SqlSessionFactory sqlSessionFactory;
    
    

    public MyConfig() {
    	  try {
              String resource = "kr/ac/kopo/mybatis/mybatis-config.xml"; // 설정 파일 경로
              InputStream inputStream = Resources.getResourceAsStream(resource);
              sqlSessionFactory = new SqlSessionFactoryBuilder().build(inputStream);
          } catch (Exception e) {
              e.printStackTrace();
              throw new RuntimeException("MyBatis 설정 파일 로드 실패", e);
          }
	}

	    public SqlSession getInstance() {
        return sqlSessionFactory.openSession();
    }
}
