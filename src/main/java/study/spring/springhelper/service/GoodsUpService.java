package study.spring.springhelper.service;

import java.util.List;

import study.spring.springhelper.model.GoodsUp;
public interface GoodsUpService {
    /**
     * 상품삭제를 위한 신고 카운트
     * @param GoodsUp 저장할 정보를 담고 있는 Beans
     * @return int
     * @throws Exception
     */
    public int reportCount(GoodsUp input) throws Exception;
    
    /**
     * 상품삭제를 위한 댓글 카운트
     * @param GoodsUp 저장할 정보를 담고 있는 Beans
     * @return int
     * @throws Exception
     */
    public int commentCount(GoodsUp input) throws Exception;
    /**
     * 상품삭제를 위한 찜하기 카운트
     * @param GoodsUp 저장할 정보를 담고 있는 Beans
     * @return int
     * @throws Exception
     */
    public int likeCount(GoodsUp input) throws Exception;
    /**
     * 상품삭제를 위한 차단 카운트
     * @param GoodsUp 저장할 정보를 담고 있는 Beans
     * @return int
     * @throws Exception
     */
    public int blackCount(GoodsUp input) throws Exception;
	
	
    /**
     * 내가 등록한, 상태가 state 인 굿즈 판매목록 카운트
     * @param GoodsUp 검색조건을 담고 있는 Beans
     * @return int
     * @throws Exception
     */
    public int getSaleListCnt(GoodsUp input) throws Exception;
	
    /**
     * 상품 상태 변경하기
     * @param GoodsUp 저장할 정보를 담고 있는 Beans
     * @return int
     * @throws Exception
     */
    public int dropboxGoodsUp(GoodsUp input) throws Exception;
	
    /**
     * 상품 데이터 등록하기
     * @param GoodsUp 저장할 정보를 담고 있는 Beans
     * @return int
     * @throws Exception
     */
    public int addGoodsUp(GoodsUp input) throws Exception;
    
    /**
     * 상품 데이터 상세 조회
     * @param GoodsUp 조회할 상품의 일련번호를 담고 있는 Beans
     * @return 조회된 데이터가 저장된 Beans
     * @throws Exception
     */
    public GoodsUp getGoodsUpItem(GoodsUp input) throws Exception;
    
    /**
     * mypage_sale_list.jsp 판매목록 조회
     * @param GoodsUp 검색조건과 페이지 구현 정보를 담고 있는 Beans
     * @return 조회 결과에 대한 컬렉션
     * @throws Exception
     */
    public List<GoodsUp> getGoodsUpListSale(GoodsUp input) throws Exception;
    
    /**
     * 상품 데이터 수정하기
     * @param GoodsUp 수정할 정보를 담고 있는 Beans
     * @return int
     * @throws Exception
     */
    public int editGoodsUp(GoodsUp input) throws Exception;
    
    /**
     * 상품 데이터 삭제하기
     * @param GoodsUp 삭제할 상품의 일련번호를 담고 있는 Beans
     * @return int
     * @throws Exception
     */
    public int deleteGoodsUp(GoodsUp input) throws Exception;

}
