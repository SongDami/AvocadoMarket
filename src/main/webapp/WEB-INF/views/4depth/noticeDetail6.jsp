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
            <p class="title-notice">제목 : 서비스 장애로 불편드려 죄송합니다.</p>
        </div>
        <!-- 글 박스-->
        <div class="notice-textbox">
        <p>
          <br/>&nbsp; 안녕하세요. 아보카도 마켓 팀입니다.<br/><br/>
          &nbsp; 금일 9/14(월) 오후 8시~11시 까지 예상치 못한 오류로 동네 변경이 불가한 장애 상<br/>&nbsp; 황이 발생하였습니다.<br/>
          &nbsp; 장시간 이어진 오류로 인해 많은 사용자분들의 서비스 이용에 불편을 끼쳐드린 점 깊<br/>&nbsp; 은 사과의 말씀을 드립니다. <br/>&nbsp;
          
          현재는 정상적으로 서비스 이용이 가능하도록 조치해 두었으며, 추후 서비스 불편이 <br/>&nbsp;  발생하지 않도록 오류에 대한 대비를 철저히 하여 오늘과 같은 문제가 재발되지 않도<br/>&nbsp; 록
         최선의 준비를 다하겠습니다. 
          
          <br/>&nbsp;&nbsp;다시 한 번 서비스 이용에 불편을 드려 진심으로 죄송합니다. <br/><br/>&nbsp;
          
          아보카도 마켓 팀 드림 <br/><br/>
          
           
          
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