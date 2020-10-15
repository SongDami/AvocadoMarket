package study.spring.springhelper.model;

import lombok.Data;

@Data
public class Black {

	//${output1}, 한페이지당 8개 출력
	private int black_id;			//id
	private String black_type;		//신고/차단
	private String black_state;		//신고구분
									//	A : 광고(신청홍보, 낚시글, 도배글)
									//	B : 물품정보 부정확(카테고리, 가격, 사진)
									//	C : 거리금지 품목(담배, 주류, 장물)
									//	D : 언어폭력(비방, 욕설, 성희롱)
									//	E : 기타사유
									//	F : 거래사기(1:1질문)
	private int member_id_from;		//신고 하는 사람
	private int goods_id;			//신고 당한 상품
	private int member_id_to;		//신고 당한 사람
	private String created_at;		//가입일시
	private String updated_at;		//편집일
	private String deleted_at;		//삭제일
	private int member_id;
		
	//신고 카운트 
	private int report_count;
	
	//사용자정보
	private String nick;
	
	//이미지 
    private String thumbnailPath;
    
    // 페이지 구현을 위한 static 변수
	private int startRow = 0;
	private int perPgLine = 0;
}
