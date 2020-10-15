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
            <p class="title-notice">제목 : 아보카도 마켓 이용안내</p>
        </div>
        <!-- 글 박스-->
        <div class="notice-textbox">
        <br/><br />
         &nbsp;아보카도 마켓 이용 안내<br/><br/>
         <p>
         &nbsp;저희 아보카도 마켓은 지도를 통해 동네 근처에 판매 하는 물건을 확인하고,<br/>
         &nbsp;거래하는 마켓입니다.<br/>&nbsp;구매하고 싶은 물건이 있을 경우 댓글로 판매자와 소통하고,
         찜하기 버튼을 이용해 <br/>&nbsp;마음에 드는 물건들을 담아 보세요!<br/>
         &nbsp;또한 다양한 카테고리를 통해 필요한 물건들을 금방 찾을 수 있어요.<br/>
         	&nbsp;물건 판매 뿐만 아니라 필요한 물건들은 '삽니다.' 카테고리를 이용할 수 있습니다. <br/>
         	&nbsp;무엇을 사야할지 모르겠다면 동네 사람들에게 인기 있는 인기상품, 새로 올라오는 신규<br/>&nbsp;상품, 저희가 추천해드리는 신규 상품을 구경해 보세요!<br/>
         	
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