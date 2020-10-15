<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ include file="/WEB-INF/views/_inc/header.jsp"%>
<!-- ========== 컨텐츠 영역 시작 ========== -->
<link rel="stylesheet" href="<%=request.getContextPath()%>/assets/css/reset.css?ver=<%=System.currentTimeMillis()%>" />
<link rel="stylesheet" href="<%=request.getContextPath()%>/assets/css/noticeDetail_style.css?ver=<%=System.currentTimeMillis()%>" />
 <div class="noticeDetail-tbody">
        <!-- 공지사항 타이틀 -->
        <div class="noticeDetail-title">
            공지사항
        </div>
        <!-- 제목칸 -->
        <div class="title">
       <div class="title">
            <p class="title-notice">제목 : 블랙리스트 안내</p>
        </div>
        <!-- 글 박스-->
        <div class="notice-textbox">
        <p>
        <br/>&nbsp;아보카도 마켓에는 댓글의 차단 기능을 이용해 블랙리스트를 만들 수 있어요.
       <br/>&nbsp;소통 과정에서 무례하거나 욕설, 비방, 명예훼손 등의 언행을 할 경우 차단 버튼을 눌러 <br/>&nbsp;사용자를 차단하세요. 
        	블랙리스트는 마이페이지에서 관리 가능 합니다.
        	따듯한 거래가 <br/>&nbsp;되도록 노력해주세요! 
 		</p>
        </div>
        <!-- 목록 버튼 -->
        <div class="back-btn">
            <button type="submit" onclick="location.href='<%= request.getContextPath()%>/2depth/notice_tab.do'">목록으로 가기</button>
        </div>
        </div>
<!--// ========== 컨텐츠 영역 끝 ========== -->
<%@ include file="/WEB-INF/views/_inc/footer.jsp"%>
<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<script>
	
</script>