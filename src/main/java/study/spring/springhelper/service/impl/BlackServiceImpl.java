package study.spring.springhelper.service.impl;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import lombok.extern.slf4j.Slf4j;
import study.spring.springhelper.model.Black;
import study.spring.springhelper.service.BlackService;

/** 블랙리스트 데이터 관리 기능을 제공하기 위한 Service 계층에 대한 구현체 */
//--> import org.springframework.stereotype.Service;
@Service
@Slf4j
public class BlackServiceImpl implements BlackService{
	
    /** MyBatis */
    // --> import org.apache.ibatis.session.SqlSession
    @Autowired
    SqlSession sqlSession;
    
    //===============신고 하기===============//
    
    /**
     * 신고리스트 데이터 목록 조회
     * @return 조회 결과에 대한 컬렉션
     * @throws Exception
     */
    @Override
    public List<Black> getReportList(Black input) throws Exception {
        List<Black> result = null;

        try {
            result = sqlSession.selectList("BlackMapper.reportselectList", input);

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
     * 신고 데이터가 저장되어 있는 갯수 조회
     * @return int
     * @throws Exception
     */
    @Override
    public int getReportCount(Black input) throws Exception {
        int result = 0;
        
        try {
            result = sqlSession.selectOne("BlackMapper.reportselectCount", input);
        } catch (Exception e) {
            log.error(e.getLocalizedMessage());
            throw new Exception("데이터 조회에 실패했습니다.");
        }
        
        return result;
    }

	/**
	 * 신고 데이터 등록하기
	 * @param Professor 저장할 정보를 담고 있는 Beans
	 * @throws Exception
	 */
	@Override
	public int addReport(Black input) throws Exception {
		int result = 0;

		try {
			result = sqlSession.selectOne("BlackMapper.chkReportCnt", input);
			if (result > 0) {
				return 9999;
			} else {
				result = sqlSession.insert("BlackMapper.reportinsert", input);
			}

			if (result == 0) {
				throw new NullPointerException("result=0");
			}
		} catch (NullPointerException e) {
			log.error(e.getLocalizedMessage());
			throw new Exception("저장된 데이터가 없습니다.");
		} catch (Exception e) {
			log.error(e.getLocalizedMessage());
			throw new Exception("차단에 실패하였습니다.");
		}

        return result;
    }

    /**
     * 신고 상품을 삭제하기(10개 이상)
     * @param Professor 삭제할 블랙리스트의 일련번호를 담고 있는 Beans
     * @throws Exception
     */
    @Override
    public int deleteReport(Black input) throws Exception {
        int result = 0;

        try {
            result = sqlSession.delete("BlackMapper.reportdelete", input);
        } catch (NullPointerException e) {
            log.error(e.getLocalizedMessage());
            throw new Exception("삭제된 데이터가 없습니다.");
        } catch (Exception e) {
            log.error(e.getLocalizedMessage());
            throw new Exception("차단해제에 실패했습니다.");
        }

        return result;
    }
    
    
    //===============신고 하기===============//    
    /**
     * 쪽지보내기 차단여부 확인 
     * @param Professor 조회할 교수의 일련번호를 담고 있는 Beans
     * @return 조회된 데이터가 저장된 Beans
     * @throws Exception
     */
    @Override
    public Black getBlackItem(Black input) throws Exception {
    	Black result = null;

        try {
            result = sqlSession.selectOne("BlackMapper.selectItem", input);

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
     * 블랙리스트 데이터 목록 조회
     * @return 조회 결과에 대한 컬렉션
     * @throws Exception
     */
    @Override
    public List<Black> getBlackList(Black input) throws Exception {
        List<Black> result = null;

        try {
            result = sqlSession.selectList("BlackMapper.selectList", input);

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
     * 블랙리스트 데이터가 저장되어 있는 갯수 조회
     * @return int
     * @throws Exception
     */
    @Override
    public int getBlackCount(Black input) throws Exception {
        int result = 0;
        
        try {
            result = sqlSession.selectOne("BlackMapper.selectCountAll", input);
        } catch (Exception e) {
            log.error(e.getLocalizedMessage());
            throw new Exception("데이터 조회에 실패했습니다.");
        }
        
        return result;
    }

    /**
     * 블랙리스트 데이터 등록하기
     * @param Professor 저장할 정보를 담고 있는 Beans
     * @throws Exception
     */
    @Override
    public int addBlack(Black input) throws Exception {
        int result = 0;

        try {
        	result = sqlSession.selectOne("BlackMapper.chkListCnt", input);
        	if (result > 0) {
        		return 9999;
        	} else {
        		result = sqlSession.insert("BlackMapper.insertItem", input);
        	}

            if (result == 0) {
                throw new NullPointerException("result=0");
            }
        } catch (NullPointerException e) {
            log.error(e.getLocalizedMessage());
            throw new Exception("저장된 데이터가 없습니다.");
        } catch (Exception e) {
            log.error(e.getLocalizedMessage());
            throw new Exception("차단에 실패하였습니다.");
        }

        return result;
    }

    /**
     * 블랙리스트 데이터 삭제하기
     * @param Professor 삭제할 블랙리스트의 일련번호를 담고 있는 Beans
     * @throws Exception
     */
    @Override
    public int deleteBlack(Black input) throws Exception {
        int result = 0;

        try {
            result = sqlSession.delete("BlackMapper.deleteItem", input);

            if (result == 0) {
                throw new NullPointerException("result=0");
            }
        } catch (NullPointerException e) {
            log.error(e.getLocalizedMessage());
            throw new Exception("삭제된 데이터가 없습니다.");
        } catch (Exception e) {
            log.error(e.getLocalizedMessage());
            throw new Exception("차단해제에 실패했습니다.");
        }

        return result;
    }

}
