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
            <p class="title-notice">제목 : 폭리 방지를 위해 마스크 장당 판매가격을 제한합니다.</p>
        </div>
        <!-- 글 박스-->
        <div class="notice-textbox">
        <p>
          <br/>&nbsp;코로나19 바이러스가 지역사회까지 퍼져 마스크 구하기가 더 힘들어졌어요. 혹시나 하<br/>&nbsp;는 마음으로 매일 아보카도마켓에서 마스크를 검색하고 계시죠?<br/>
          <br/>&nbsp;마스크를 근처 이웃들에게 나눔 하거나 저렴하게 판매하는 사용자분께도 이런 공지를 &nbsp;노출하게 되어 마음이 아파요.지난 공지에도 불구하고 아직도 일부 사용자들이 
          부당하<br/>&nbsp;게  마스크 가격을 올려 판매하는 현상이 나타나고 있어요. <br/>
          <br/>&nbsp;아보카도마켓 내에서라도 폭리 및 부당 행위를 막기 위해 마스크 개당 판매 가격을 제<br/>&nbsp;한하고자 합니다.
          <br/>&nbsp;&nbsp; <b>* KF80 이상 마스크 개당 판매 가격: 2,000원 이하</b> <br/>
          <br/>&nbsp; 꼭 필요한 분들만 적정한 가격으로 아보카도마켓을 통해 거래하여 주시고, 더 비싼 가<br/>&nbsp; 격으로 판매를 원하시는 분들은 다른 서비스를 사용하여 주시기 바랍니다. 
          <br/>&nbsp; 공지한 가격을 초과하여 판매하는 게시글은 서비스에서 노출되지 않으며, 판매자에게 &nbsp; 삭제를 요청할 예정입니다.
          
           
          
          
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