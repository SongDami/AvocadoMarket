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
            <p class="title-notice">제목 : 아보카도 마켓 로고 소개</p>
        </div>
        <!-- 글 박스-->
        <div class="notice-textbox">
        <p>
        <img src="<%= request.getContextPath() %>/assets/img/Logo.png" width="270px" height="200px">&nbsp;&nbsp;&nbsp;
        <img src="<%= request.getContextPath() %>/assets/img/profile-img.png" width="200px" height="200px"><br/>
        &nbsp;아보카도 마켓 로고는 자신에게 필요 없는 씨앗을 다른 아보카도에게 판매하므로써<br/>&nbsp;따듯하고 활발한 교류가 이루어짐을 상징합니다. 
        	이런 로고 처럼 저희 아보카도 마켓은 <br/>&nbsp;서로에게 필요한 물건들을 사고 팔며 지역사회의 활성화를 지향합니다.
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