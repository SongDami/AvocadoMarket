package study.spring.springhelper.model;

import lombok.Data;

/** 테이블 구조에 맞춘 Java Beans 생성 si+gu+dong*/
@Data
public class Local {
    private int si_id;
    private String si_name;
    private String created_at;
    private String updated_at;
    private String deleted_at;

    // 페이지 구현이 필요한 경우 아래 속성도 추가한다.
    private static int offset;
    private static int listCount;

    public static int getOffset() {
        return offset;
    }

    public static void setOffset(int offset) {
        Local.offset = offset;
    }

    public static int getListCount() {
        return listCount;
    }

    public static void setListCount(int listCount) {
        Local.listCount = listCount;
    }
}