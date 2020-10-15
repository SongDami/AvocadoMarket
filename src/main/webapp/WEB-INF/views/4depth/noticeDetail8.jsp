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
            <p class="title-notice">제목 : 정부의 긴급 재난 지원금 거래 행위를 제한합니다.</p>
        </div>
        <!-- 글 박스-->
        <div class="notice-textbox">
        <p>
          <br/>&nbsp;코로나 19 바이러스 확산으로 힘든 지역 경제를 살리기 위해 정부에서는 긴급 재난<br/>&nbsp; 지원금을 지원하고 있어요.<br/>
          <br/>&nbsp; 정부 지원금 취지에 맞지 않는 거래 행위를 제한하고자 합니다. 
          <br/>&nbsp;&nbsp;<b>* 지역 화폐</b>
          <br/>&nbsp;&nbsp;<b>* 지역 상품권</b>
          <br/>&nbsp;&nbsp;<b>* 온누리 상품권</b>
          <br/>&nbsp;&nbsp;<b>* 재난기본소득카드</b>
          <br/>&nbsp;&nbsp;<b>* 선불카드</b>
          <br/>&nbsp;&nbsp;<b>* 제로페이</b>
          <br/>&nbsp; 아보카도마켓에서는 이를 포함한 정부 지원 상품권, 물품 등을 거래할 수 없어요. 관련 &nbsp; 게시글은 서비스에서 노출되지 않습니다. <br/> 
          <br/>&nbsp; 코로나 19로 인해 소비가 위축된 지금, 지역 소상광인에게 단비가 되어주세요.
          <br/>&nbsp; 힘든 시기를 서로 도와 이겨낼 수 있어요. 우리 함께 따듯한 지역 거래문화를 만들어<br/>&nbsp; 요.
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