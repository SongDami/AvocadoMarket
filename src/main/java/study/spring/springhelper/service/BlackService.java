package study.spring.springhelper.service;

import java.util.List;

import study.spring.springhelper.model.Black;
import study.spring.springhelper.model.Comment;

/** 블랙리스트 데이터 관리 기능을 제공하기 위한 Service 계층. */
public interface BlackService {
	
    /**
     * 블랙리스트 데이터 등록하기
     * @param Black 저장할 정보를 담고 있는 Beans
     * @return int
     * @throws Exception
     */
    public int addBlack(Black input) throws Exception;
    
	
	 /**
     * 쪽지보내기 차단여부 확인 
     * @param Professor 조회할 교수의 일련번호를 담고 있는 Beans
     * @return 조회된 데이터가 저장된 Beans
     * @throws Exception
     */
    public Black getBlackItem(Black input) throws Exception;
	
    /**
     * 블랙리스트 데이터 목록 조회
     * @param Black 검색조건과 페이지 구현 정보를 담고 있는 Beans
     * @return 조회 결과에 대한 컬렉션
     * @throws Exception
     */
    public List<Black> getBlackList(Black input) throws Exception;
    
    /**
     * 블랙리스트 데이터가 저장되어 있는 갯수 조회
     * @param Black 검색조건을 담고 있는 Beans
     * @return int
     * @throws Exception
     */
    public int getBlackCount(Black input) throws Exception;
        
    /**
     * 블랙리스트 데이터 삭제하기
     * @param Black 삭제할 블랙리스트의 일련번호를 담고 있는 Beans
     * @return int
     * @throws Exception
     */
    public int deleteBlack(Black input) throws Exception;
    
    //===============신고 하기===============//
    
    /**
     * 신고리스트 데이터 목록 조회
     * @param Black 검색조건과 페이지 구현 정보를 담고 있는 Beans
     * @return 조회 결과에 대한 컬렉션
     * @throws Exception
     */
    public List<Black> getReportList(Black input) throws Exception;
    
    /**
     * 신고 데이터가 저장되어 있는 갯수 조회
     * @param Black 검색조건을 담고 있는 Beans
     * @return int
     * @throws Exception
     */
    public int getReportCount(Black input) throws Exception;
    
    /**
     * 신고 데이터 등록하기
     * @param Black 저장할 정보를 담고 있는 Beans
     * @return int
     * @throws Exception
     */
    public int addReport(Black input) throws Exception;
    
    /**
     * 신고 데이터 멤버 삭제하기
     * @param Black 삭제할 블랙리스트의 일련번호를 담고 있는 Beans
     * @return int
     * @throws Exception
     */
    public int deleteReport(Black input) throws Exception;
}
