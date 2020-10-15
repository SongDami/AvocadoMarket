package study.spring.springhelper.model;

import lombok.Data;

@Data
public class GoodsUp {

    private int goods_id;
    private String goods_name;
	private int like_num;
	private String goods_content;
	private int price;
	private String priceNum;
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
	private String category_category_id;
	
	private String thumbnailPath;
	private int login_id; // 로그인한 사람의 member_id (판매자프로필에서 사용)
	private String like_yn;
	
    // 페이지 구현을 위한 static 변수

	private int startRow = 0;
	private int perPgLine = 0;
	
	
	
    /** LIMIT 절에서 사용할 조회 시작 위치 */
    private static int offset;
    
    /** LIMIT 절에서 사용할 조회할 데이터 수 */
    private static int listCount;
    
    public static int getOffset() {
        return offset;
    }
    
    public static void setOffset(int offset) {
    	GoodsUp.offset = offset;
    }
    
    public static int getListCount() {
        return listCount;
    }
    
    public static void setListCount(int listCount) {
    	GoodsUp.listCount = listCount;
    }
}
