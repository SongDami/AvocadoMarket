package study.spring.springhelper.service.impl;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import lombok.extern.slf4j.Slf4j;
import study.spring.springhelper.model.Category;
import study.spring.springhelper.service.CategoryService;

/** 상품 데이터 관리 기능을 제공하기 위한 Service 계층에 대한 구현체 */
@Slf4j
@Service  // --> import org.springframework.stereotype.Service;
public class CategoryServiceImpl implements CategoryService {

    /** MyBatis */
    // --> import org.apache.ibatis.session.SqlSession
    @Autowired
    SqlSession sqlSession;

    /**
     * 카테고리 목록 조회
     * @return 조회 결과에 대한 컬렉션
     * @throws Exception
     */
    @Override
    public List<Category> getCategoryList() throws Exception {
        List<Category> result = null;

        try {
            result = sqlSession.selectList("CategoryMapper.selectList");

            if (result == null) {
                throw new NullPointerException("result=null");
            }
        } catch (NullPointerException e) {
            log.error(e.getLocalizedMessage());
            throw new Exception("조회된 데이터가 없습니다.");
        } catch (Exception e) {
            log.error(e.getLocalizedMessage());
            throw new Exception("데이터 조회에 실패했습니다.");
        }

        return result;
    }
    
  
}