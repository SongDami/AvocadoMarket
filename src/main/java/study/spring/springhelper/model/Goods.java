package study.spring.springhelper.model;

import lombok.Data;

@Data
public class Goods {

    private int goods_id;
    private String goods_name;
	private int like_num;
	private String goods_content;
	private int price;
	private String state;
	private String buyer_member_id;
	private int hit;
	private String created_at;
	private String updated_at;
	private String deleted_at;
	private int member_id;	
	private int dong_dong_id;	
	private int keyword_keyword_id;	
	private String keyword_name;	
	private int category_category_id;
	
	
	// 2) JOIN절에 따른 추가 컬럼
	private String dong_name;
	
	private String category_type;
	
	// 사진
	
	private String thumbnailPath;
	private String upload_type;
	
	// 현재 조회하는 사람이 이 상품을 찜하기 했는지 여부 (Y,N)
	private String like_yn; 
	
	private int like_id;
	
	
	 // 3) 페이지 구현을 위한 static 변수
    /** LIMIT 절에서 사용할 조회 시작 위치 */
    private static int offset;
    
    /** LIMIT 절에서 사용할 조회할 데이터 수 */
    private static int listCount;
    
    public static int getOffset() {
        return offset;
    }
    
    public static void setOffset(int offset) {
        Goods.offset = offset;
    }
    
    public static int getListCount() {
        return listCount;
    }
    
    public static void setListCount(int listCount) {
        Goods.listCount = listCount;
    }
}
