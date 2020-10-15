package study.spring.springhelper.model;

import lombok.Data;

@Data
public class Like {

	// 찜하기
	private String priceNum;
	private int like_id;
	private String created_at;
	private String updated_at;
	private String deleted_at;
	private int member_id;
	private int goods_id;

	// 상품정보
	private String goods_name;
	private int price;
	
	// 이미지
	private String thumbnailPath;
	
    // 페이지 구현을 위한 static 변수
	private int startRow = 0;
	private int perPgLine = 0;
}
