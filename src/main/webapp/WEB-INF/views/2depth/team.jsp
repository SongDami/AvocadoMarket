<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ include file="/WEB-INF/views/_inc/header.jsp"%>
<!-- ========== 컨텐츠 영역 시작 ========== -->
<link rel="stylesheet" href="<%=request.getContextPath()%>/assets/css/reset.css?ver=<%=System.currentTimeMillis()%>" />
<link rel="stylesheet" href="<%=request.getContextPath()%>/assets/css/team.css?ver=<%=System.currentTimeMillis()%>" />
 <div class="team-tbody">
        <!-- 공지사항 타이틀 -->
        <div class="team-title">
            팀소개
        </div>
        <!-- 제목칸 -->
        <div class="title">
            <p class="title-notice"> 4조 </p>
        </div>
        <!-- 글 박스-->
        <div class="team-contents">
        <div class="team2">
       <img class="img-team2" src="<%= request.getContextPath() %>/assets/img/hyejo.PNG" width="280px" height="400px" />
        <p class="team2-name"> 김혜조</p>
        </div>
        <div class="team2">
       <img class="img-team2" src="<%= request.getContextPath() %>/assets/img/dami.png" width="280px" height="400px" />
        <p class="team2-name"> 송다미</p>
        </div>
        <div class="team3">
         <img class="img-team3" src="<%= request.getContextPath() %>/assets/img/yoobin.PNG" width="280px" height="400px" />
        <p class="team3-name">   임유빈</p>
        </div>
           </div>     
    </div>
<!--// ========== 컨텐츠 영역 끝 ========== -->
<%@ include file="/WEB-INF/views/_inc/footer.jsp"%>
<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<script>
	
</script>