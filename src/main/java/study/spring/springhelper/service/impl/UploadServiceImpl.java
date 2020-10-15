package study.spring.springhelper.service.impl;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import lombok.extern.slf4j.Slf4j;
import study.spring.springhelper.model.UploadImage;
import study.spring.springhelper.service.UploadService;


@Service
@Slf4j
public class UploadServiceImpl implements UploadService{
	
    @Autowired
    SqlSession sqlSession;
	
	@Override
	public int addUploadItem(UploadImage input) throws Exception {
	 int result = 0;

     try {
         result = sqlSession.insert("UploadImageMapper.insertItem", input);
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
     * 이미지 한개 조회
     * @param UploadImage 조회할 교수의 일련번호를 담고 있는 Beans
     * @return 조회된 데이터가 저장된 Beans
     * @throws Exception
     */
    @Override
    public UploadImage getUploadImageItem(UploadImage input) throws Exception {
    	UploadImage result = null;

        try {
            result = sqlSession.selectOne("UploadImageMapper.selectItem", input);

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
     * goods_detail.jsp 에서 등록된 이미지 목록을 조회
     * @return 조회 결과에 대한 컬렉션
     * @throws Exception
     */
    @Override
    public List<UploadImage> getUploadImageList(UploadImage input) throws Exception {
        List<UploadImage> result = null;

        try {
            result = sqlSession.selectList("UploadImageMapper.selectList", input);

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
     * goods_edit.jsp 에서는 고정 5행 이미지를 불러와야함
     * @return 조회 결과에 대한 컬렉션
     * @throws Exception
     */
    @Override
    public List<UploadImage> getUploadImageList5(UploadImage input) throws Exception {
        List<UploadImage> result = null;

        try {
            result = sqlSession.selectList("UploadImageMapper.selectList5", input);

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

	@Override
	public int uptUploadItem(UploadImage input) throws Exception {
	 int result = 0;

     try {
         result = sqlSession.insert("UploadImageMapper.uptUploadItem", input);

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

	@Override
	public int delUploadItem(UploadImage input) throws Exception {
		int result = 0;
		
		try {
			result = sqlSession.insert("UploadImageMapper.delUploadItem", input);
			
		} catch (NullPointerException e) {
			log.error(e.getLocalizedMessage());
			throw new Exception("저장된 데이터가 없습니다.");
		} catch (Exception e) {
			log.error(e.getLocalizedMessage());
			throw new Exception("데이터 저장에 실패했습니다.");
		}
		
		return result;
	}

	@Override
	public int delUploadItemSeq(UploadImage input) throws Exception {
		int result = 0;
		
		try {
			result = sqlSession.insert("UploadImageMapper.delUploadItemSeq", input);
			
		} catch (NullPointerException e) {
			log.error(e.getLocalizedMessage());
			throw new Exception("저장된 데이터가 없습니다.");
		} catch (Exception e) {
			log.error(e.getLocalizedMessage());
			throw new Exception("데이터 저장에 실패했습니다.");
		}
		
		return result;
	}

}
