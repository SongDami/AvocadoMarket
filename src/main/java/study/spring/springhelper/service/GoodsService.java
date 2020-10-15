package study.spring.springhelper.service;

import java.util.List;

import study.spring.springhelper.model.Goods;


public interface GoodsService {


    /**
     * 상품 데이터 목록 조회
     * @return 조회 결과에 대한 컬렉션
     * @throws Exception
     */
    public List<Goods> getGoodsList(Goods input) throws Exception;
    
    /**
     * 동별 상품 갯수 조회
     * @return 조회 결과에 대한 컬렉션
     * @throws Exception
     */
    public List<Goods> getGoodsCountList(Goods input) throws Exception;

    /**
     * 상품 데이터가 저장되어 있는 갯수 조회
     * @return int
     * @throws Exception
     */
    public int getGoodsCount(Goods input) throws Exception;
    


}
