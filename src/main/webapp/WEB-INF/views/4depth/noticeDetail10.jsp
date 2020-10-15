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
            <p class="title-notice">제목 : 서비스 점검 안내</p>
        </div>
        <!-- 글 박스-->
        <div class="notice-textbox">
        <p>
          <br/>&nbsp;좀 더 빠르고 안정적인 아보카도마켓을 만들기 위해 오늘 저녁에 점검이 예정돼있어요.
          <br/>&nbsp;내일(10월 9일 금요일) 새벽 3시~5시 사이에 잠깐씩 접속이 안될 수도 있으니 참고해주<br/>&nbsp;세요.
          <br/>&nbsp;혹시나 그런 일은 없겠지만, 오늘 새벽에 약속을 잡으셔서 급하게 연락해야 될 일이 있으<br/>&nbsp;시면
          미리 카카오톡 아이디나 전화번호를 교환해서 계시면 좋아요~ <br/>
          <br/>&nbsp;앞으로 더 쉽고 편하게 아보카도마켓을 사용하실 수 있도록 노력할게요!
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