package study.spring.springhelper.service;

import java.util.List;

import study.spring.springhelper.model.UploadImage;

public interface UploadService {
	
	
    /**
     * 이미지  저장하기
     * @param UploadImage 저장할 정보를 담고 있는 Beans
     * @return int
     * @throws Exception
     */
    public int addUploadItem(UploadImage input) throws Exception;

    /**
     * goods_detail.jsp 에서 등록된 이미지 목록을 조회
     * @param UploadImage 검색조건과 페이지 구현 정보를 담고 있는 Beans
     * @return 조회 결과에 대한 컬렉션
     * @throws Exception
     */
    public List<UploadImage> getUploadImageList(UploadImage input) throws Exception;

    /**
     * goods_edit.jsp 에서는 고정 5행 이미지를 불러와야함
     * @param UploadImage 검색조건과 페이지 구현 정보를 담고 있는 Beans
     * @return 조회 결과에 대한 컬렉션
     * @throws Exception
     */
    public List<UploadImage> getUploadImageList5(UploadImage input) throws Exception;
    
    /**
     * 이미지 데이터 한개 조회
     * @param UploadImage 조회할 교수의 일련번호를 담고 있는 Beans
     * @return 조회된 데이터가 저장된 Beans
     * @throws Exception
     */
    public UploadImage getUploadImageItem(UploadImage input) throws Exception;
    
    /**
     * 이미지  저장하기
     * @param UploadImage 저장할 정보를 담고 있는 Beans
     * @return int
     * @throws Exception
     */
    public int uptUploadItem(UploadImage input) throws Exception;
    
    /**
     * 이미지  삭제하기
     * @param UploadImage 저장할 정보를 담고 있는 Beans
     * @return int
     * @throws Exception
     */
    public int delUploadItem(UploadImage input) throws Exception;
    
    
    /**
     * 이미지  삭제하기
     * @param UploadImage 저장할 정보를 담고 있는 Beans
     * @return int
     * @throws Exception
     */
    public int delUploadItemSeq(UploadImage input) throws Exception;
    
}
