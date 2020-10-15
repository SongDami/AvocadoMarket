package study.spring.springhelper.model;

import lombok.Data;

@Data
public class Comment {

	private int goods_comment_id;
	private String goods_c_content;
	private String created_at;
	private String updated_at;
	private String deleted_at;
	private int goods_id;
	private int member_id;

	private String nick;

	private String editYn; // 상품상세목록에서 댓글 조회시, 등록자와 로그인한 사람의 id가 같으면 Y, Y이면 수정 삭제버튼 활성화
	private int limitCnt; // 더보기용 댓글 조회목록 제한 갯수
}
