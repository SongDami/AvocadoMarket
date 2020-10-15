package study.spring.springhelper.service.impl;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import lombok.extern.slf4j.Slf4j;
import study.spring.springhelper.model.GoodsUp;
import study.spring.springhelper.service.GoodsUpService;


@Service
@Slf4j
public class GoodsUpServiceImpl implements GoodsUpService{
	
    /** MyBatis */
    // --> import org.apache.ibatis.session.SqlSession
    @Autowired
    SqlSession sqlSession;
    
    /**
     * 상품삭제를 위한 신고 카운트
     * @return int
     * @throws Exception
     */
    @Override
    public int reportCount(GoodsUp input) throws Exception {
        int result = 0;
        
        try {
            result = sqlSession.selectOne("GoodsUpMapper.getreportCnt", input);
        } catch (Exception e) {
            log.error(e.getLocalizedMessage());
            throw new Exception("데이터 조회에 실패했습니다.");
        }
        
        return result;
    }
    
    /**
     * 상품삭제를 위한 댓글 카운트
     * @return int
     * @throws Exception
     */
    @Override
    public int commentCount(GoodsUp input) throws Exception {
        int result = 0;
        
        try {
            result = sqlSession.selectOne("GoodsUpMapper.getcommentCnt", input);
        } catch (Exception e) {
            log.error(e.getLocalizedMessage());
            throw new Exception("데이터 조회에 실패했습니다.");
        }
        
        return result;
    }
    
    /**
     * 상품삭제를 위한 찜하기 카운트
     * @return int
     * @throws Exception
     */
    @Override
    public int likeCount(GoodsUp input) throws Exception {
        int result = 0;
        
        try {
            result = sqlSession.selectOne("GoodsUpMapper.getlikeCnt", input);
        } catch (Exception e) {
            log.error(e.getLocalizedMessage());
            throw new Exception("데이터 조회에 실패했습니다.");
        }
        
        return result;
    }
    
    /**
     * 상품삭제를 위한 차단 카운트
     * @return int
     * @throws Exception
     */
    @Override
    public int blackCount(GoodsUp input) throws Exception {
        int result = 0;
        
        try {
            result = sqlSession.selectOne("GoodsUpMapper.getblackCnt", input);
        } catch (Exception e) {
            log.error(e.getLocalizedMessage());
            throw new Exception("데이터 조회에 실패했습니다.");
        }
        
        return result;
    }
    
    /**
     * 내가 등록한, 상태가 state 인 굿즈 판매목록 카운트
     * @return int
     * @throws Exception
     */
    @Override
    public int getSaleListCnt(GoodsUp input) throws Exception {
        int result = 0;
        
        try {
            result = sqlSession.selectOne("GoodsUpMapper.getSaleListCnt", input);
        } catch (Exception e) {
            log.error(e.getLocalizedMessage());
            throw new Exception("데이터 조회에 실패했습니다.");
        }
        
        return result;
    }

	/**
     * 상품 상태 변경하기
     * @param goodsup 저장할 정보를 담고 있는 Beans
     * @throws Exception
     */
    @Override
    public int dropboxGoodsUp(GoodsUp input) throws Exception {
        int result = 0;

        try {
            result = sqlSession.update("GoodsUpMapper.updatedropbox", input);

            if (result == 0) {
                throw new NullPointerException("result=0");
            }
        } catch (NullPointerException e) {
            log.error(e.getLocalizedMessage());
            throw new Exception("수정된 데이터가 없습니다.");
        } catch (Exception e) {
            log.error(e.getLocalizedMessage());
            throw new Exception("데이터 수정에 실패했습니다.");
        }

        return result;
    }
	
	/**
     * 상품 데이터 등록하기
     * @param goodsup 저장할 정보를 담고 있는 Beans
     * @throws Exception
     */
    @Override
    public int addGoodsUp(GoodsUp input) throws Exception {
        int result = 0;

        try {
            result = sqlSession.insert("GoodsUpMapper.insertItem", input);

            if (result == 0) {
                throw new NullPointerException("result=0");
            }
        } catch (NullPointerException e) {
            log.error(e.getLocalizedMessage());
            throw new Exception("저장된 데이터가 없습니다.");
        } catch (Exception e) {
            log.error(e.getLocalizedMessage());
            throw new Exception("데이터 저장에 실패했습니다.");
        }

        return result;
    }
    /**
     * 상품 데이터 상세 조회
     * @param goodsup 조회할 상품의 일련번호를 담고 있는 Beans
     * @return 조회된 데이터가 저장된 Beans
     * @throws Exception
     */
    @Override
    public GoodsUp getGoodsUpItem(GoodsUp input) throws Exception {
    	GoodsUp result = null;

        try {
            result = sqlSession.selectOne("GoodsUpMapper.selectItem", input);

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

    /**
     * mypage_sale_list.jsp 판매목록 조회
     * @return 조회 결과에 대한 컬렉션
     * @throws Exception
     */
    @Override
    public List<GoodsUp> getGoodsUpListSale(GoodsUp input) throws Exception {
        List<GoodsUp> result = null;

        try {
            result = sqlSession.selectList("GoodsUpMapper.selectListSale", input);

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

    /**
     * 상품 데이터 수정하기
     * @param goodsup 수정할 정보를 담고 있는 Beans
     * @throws Exception
     */
    @Override
    public int editGoodsUp(GoodsUp input) throws Exception {
        int result = 0;

        try {
            result = sqlSession.update("GoodsUpMapper.updateItem", input);

            if (result == 0) {
                throw new NullPointerException("result=0");
            }
        } catch (NullPointerException e) {
            log.error(e.getLocalizedMessage());
            throw new Exception("수정된 데이터가 없습니다.");
        } catch (Exception e) {
            log.error(e.getLocalizedMessage());
            throw new Exception("데이터 수정에 실패했습니다.");
        }

        return result;
    }

    /**
     * 상품 데이터 삭제하기
     * @param goodsup 삭제할 상품의 일련번호를 담고 있는 Beans
     * @throws Exception
     */
    @Override
    public int deleteGoodsUp(GoodsUp input) throws Exception {
        int result = 0;

        try {
        	sqlSession.delete("GoodsUpMapper.delReport", input);
        	sqlSession.delete("GoodsUpMapper.delComment", input);
        	sqlSession.delete("GoodsUpMapper.delLike", input);
        	sqlSession.delete("GoodsUpMapper.delFile", input);
        	
            result = sqlSession.delete("GoodsUpMapper.deleteItem", input);

            if (result == 0) {
                throw new NullPointerException("result=0");
            }
        } catch (NullPointerException e) {
            log.error(e.getLocalizedMessage());
            throw new Exception("삭제된 데이터가 없습니다.");
        } catch (Exception e) {
            log.error(e.getLocalizedMessage());
            throw new Exception("데이터 삭제에 실패했습니다.");
        }

        return result;
    }


}
