package study.spring.springhelper.model;
import lombok.Data;

@Data
public class Main {
	
	//썸네일
    private int goods_id;
    private String goods_name;
	private int price;
	private String priceNum;
	private int dong_dong_id;
	private String dong_name;
	
	//인기상품
	private int hit;
	private int category_category_id;
	
	//신규상품
	private String created_at;
	private String filePath;
	private String thumbnailPath;
	
	//추천상품
	private int keyword_keyword_id;
	private String keyword_name;
	private int member_id; 

	private String like_yn; // 현재 조회하는 사람이 이 상품을 찜하기 했는지 여부 (Y,N)
}
