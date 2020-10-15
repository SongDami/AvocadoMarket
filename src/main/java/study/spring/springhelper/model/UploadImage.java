package study.spring.springhelper.model;

import lombok.Data;

@Data
public class UploadImage {

	private int file_id; // file pk
	
	private String goods_img;
	private String fieldName; // <input type="file">의 name속성
	private String orginName; // 원본 파일 이름
	private String contentType; // 파일의 형식
	private long fileSize; // 파일의 용량
	private String filePath; // 서버상의 파일 경로
	private String thumbnailPath; // 썸네일 이미지 경로
	private String fileUrl; // 서버상의 원본 이미지 URL
	private String thumbnailUrl; // 썸네일 이미지 URL

	private String upload_type; // 첨부파일구분("goods", "member")
	private int upload_id; // 첨부한 id(good_id, member_id)
	private int file_seq; // 첨부파일순번
}
