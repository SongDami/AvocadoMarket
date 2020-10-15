package study.spring.springhelper.service;

import java.util.List;

import study.spring.springhelper.model.Category;


public interface CategoryService {


    /**
     * 카테고리 목록 조회
     * @return 조회 결과에 대한 컬렉션
     * @throws Exception
     */
    public List<Category> getCategoryList() throws Exception;
    


}
