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
            <p class="title-notice">제목 : 아보카도 마켓에 가입해주셔서 감사합니다.</p>
        </div>
        <!-- 글 박스-->
        <div class="notice-textbox">
        <br/><br/>
 		&nbsp;아보카도 마켓에 가입해 주셔서 감사합니다. <br/><br/><br/>
 		<p>
 		&nbsp;저희 아보카도마켓은 동네 이웃 간의 연결을 도와 따뜻하고  활발한 교류가 있는 <br/>
 		&nbsp;지역 사회를 꿈꾸고 있어요.<br/><br/>
		
		&nbsp;지역 내에서 발생하는 모든 생활정보(중고거래, 질문답변 등)들이 모이고,<br/> 
		&nbsp;그 정보들이 따뜻한 문화 안에서 교류되는 세상을 꿈꾸고 있어요. <br/><br/>
		&nbsp;아보카도마켓은 중고거래에서 시작하지만 지역커뮤니티 및 정보 서비스를 지향합니다.<br/>
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