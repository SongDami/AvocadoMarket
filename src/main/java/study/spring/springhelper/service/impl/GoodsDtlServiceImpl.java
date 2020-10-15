package study.spring.springhelper.service.impl;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import lombok.extern.slf4j.Slf4j;
import study.spring.springhelper.model.GoodsDtl;
import study.spring.springhelper.model.GoodsUp;
import study.spring.springhelper.service.GoodsDtlService;

@Slf4j
@Service
//상세 페이지 조회 ServiceImpl
public class GoodsDtlServiceImpl implements GoodsDtlService {

	@Autowired
	SqlSession sqlSession;

	@Override
	public GoodsDtl getGoodsDtl(GoodsUp input) throws Exception {
		GoodsDtl result = null;

		try {
			result = sqlSession.selectOne("GoodsDtlMapper.getGoodsDtl", input);

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
     * 조회수 증가를 위한 hit 기능정의
     * @param goodsup 저장할 정보를 담고 있는 Beans
     * @throws Exception
     */
    @Override
    public int updatehit(GoodsUp input) throws Exception {
        int result = 0;

        try {
            result = sqlSession.update("GoodsDtlMapper.updatehit", input);

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
	
}
