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
            <p class="title-notice">제목 : 나눔의날 함께해주세요!</p>
        </div>
        <!-- 글 박스-->
        <div class="notice-textbox">
        <p>
          <br/>&nbsp;<b># 나눔의날 동참하는 방법</b> <br/>
          <br/>&nbsp;1. 언제?
          <br/>&nbsp;&nbsp; * 9월 26일(토),27일(일)<br/>
          <br/>&nbsp;2. 누가?
           <br/>&nbsp;&nbsp; * 누구나 다!<br/>
           <br/>&nbsp;3. 무엇을?
           <br/>&nbsp;&nbsp; * 어떤 것이어도 상관없어요!(카메라, 아기용품,커피 등등 모든 것)<br/>
           <br/>&nbsp;4. 나눔 글은 어떻게 올리나요?
           <br/>&nbsp;&nbsp; * 거래 게시글에 올리는 것과 똑같이 글을 작성해주시면 돼요.
           <br/>&nbsp;&nbsp; * 글 제목에 꼭 [나눔]말머리를 달아주세요!
           <br/>&nbsp;&nbsp; * 가격 설정을 "0원"으로 하면 돼요. <br/>
           <br/>&nbsp;&nbsp;많이 많이 참여해주세요!!
           
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