package study.spring.springhelper.model;


import lombok.Data;
import study.spring.springhelper.helper.UploadItem;

@Data

public class Members {
    
    
    private int member_id;              // 일련번호 / NOT NULL / PK
    private String user_id;             // 아이디 / NOT NULL
    private String name;                // 이름 / NOT NULL
    private String nick;                // 닉네임 /  NOT NULL
    private String tel;                 // 전화번호 / NOT NULL
    private String email;               // 이메일 / NOT NULL
    private String email_code;
    private String user_pw;             // 비밀번호(암호화) / NOT NULL
    private String grade;               // 등급 / NOT NULL
    private UploadItem member_img;      // 플필사진 / NULL
    private String member_type;         // 멤버타입(관리자유무) / NOT NULL
    private String created_at;          // 등록일 / NOT NULL
    private String updated_at;          // 수정일 / NOT NULL
    private String deleted_at;          // 삭제일 / NULL
    private int dong_dong_id;           // dong 참조키 / NOT NULL
    private int keyword_keyword_id;     // keyword 참조키 / NOT NULL

    private String si_name;             // 시 이름 / NOT NULL
    private String gu_name;             // 구 이름 / NOT NULL
    private String dong_name;           // 동 이름 / NOT NULL
    
    private String keyword_name;        // 키워드 알림 / NULL 
    private String thumbnailPath;       // 회원 이미지


}
