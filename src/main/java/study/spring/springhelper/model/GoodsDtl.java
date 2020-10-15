package study.spring.springhelper.model;

import lombok.Data;

@Data
public class GoodsDtl {
	
	//제품 상세페이지
	private int goods_id;
	private String goods_name;
	private int price;
	private String priceNum;
	private String goods_content;
	private int like_num;
	private int hit;
	private int member_id;
	private String updated_at;
	private String dong_name;
	private String nick;

	private String like_yn; // 현재 조회하는 사람이 이 상품을 찜하기 했는지 여부 (Y,N)
}
