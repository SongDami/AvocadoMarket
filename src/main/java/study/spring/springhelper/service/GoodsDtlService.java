package study.spring.springhelper.service;

import study.spring.springhelper.model.GoodsDtl;
import study.spring.springhelper.model.GoodsUp;

public interface GoodsDtlService {

	//상품 상세체이지 조회 
	public GoodsDtl getGoodsDtl(GoodsUp input) throws Exception;

    /**
     * 조회수 증가를 위한 hit 기능정의
     * @param GoodsUp 저장할 정보를 담고 있는 Beans
     * @return int
     * @throws Exception
     */
    public int updatehit(GoodsUp input) throws Exception;
	
}
