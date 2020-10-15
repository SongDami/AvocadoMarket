package study.spring.springhelper.service;

import java.util.List;

import study.spring.springhelper.model.Like;

public interface LikeService {
	
    /**
     * 좋아요 데이터 목록 조회
     * @param Like 검색조건과 페이지 구현 정보를 담고 있는 Beans
     * @return 조회 결과에 대한 컬렉션
     * @throws Exception
     */
    public List<Like> getLikeList(Like input) throws Exception;
    
    /**
     * 좋아요 데이터가 저장되어 있는 갯수 조회
     * @param Like 검색조건을 담고 있는 Beans
     * @return int
     * @throws Exception
     */
    public int getLikeCount(Like input) throws Exception;
    
    /**
     * 좋아요 데이터 등록하기
     * @param Like 저장할 정보를 담고 있는 Beans
     * @return int
     * @throws Exception
     */
    public int addLike(Like input) throws Exception;
    
    /**
     * 좋아요 데이터 삭제하기
     * @param Like 삭제할 좋아요의 일련번호를 담고 있는 Beans
     * @return int
     * @throws Exception
     */
    public int deleteLike(Like input) throws Exception;

}
