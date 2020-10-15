package study.spring.springhelper.service;

import java.util.List;

import study.spring.springhelper.model.Main;



//메인 (인기상품, 신규상품, 추천상품)
public interface MainService {
	
    /**
     * 인기상품 데이터 목록 조회
     * @param Professor 검색조건과 페이지 구현 정보를 담고 있는 Beans
     * @return 조회 결과에 대한 컬렉션
     * @throws Exception
     */
    public List<Main> getMainTopList(Main input) throws Exception;
    
    /**
     * 신규상품 데이터 목록 조회
     * @param Professor 검색조건과 페이지 구현 정보를 담고 있는 Beans
     * @return 조회 결과에 대한 컬렉션
     * @throws Exception
     */
    public List<Main> getMainNewList(Main input) throws Exception;
    
    /**
     * 추천상품 데이터 목록 조회
     * @param Professor 검색조건과 페이지 구현 정보를 담고 있는 Beans
     * @return 조회 결과에 대한 컬렉션
     * @throws Exception
     */
    public List<Main> getKeywordList(Main input) throws Exception;
    


}
