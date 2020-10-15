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
            <p class="title-notice">제목 : 아보카도 마켓 약속</p>
        </div>
        <!-- 글 박스-->
        <div class="notice-textbox">
        <br/>
            &nbsp;우리 동네의 따뜻한 거래를 위해 다음과 같은 약속을 꼭꼭 지켜주세요. <br/>
            <br /><br />
            <p>
            &nbsp;1. 아보카도마켓의 거래 매너를 잘 지켜주세요. <br/><br/>
            &nbsp;2. 거래약속은 꼭 지켜주세요.<br/><br/>
            &nbsp;3. 이왕이면 근처에서 직거래를 해주세요.<br/><br/>
            &nbsp;4. 판매금지 물품은 판매할 수 없어요.<br /><br/>
            &nbsp;5. 전문판매업자의 게시글은 제한하고 있어요.<br/><br/>
            &nbsp;6. 중복 게시글이나 도배는 안 돼요.<br /><br/>
            &nbsp;7. 카테고리를 준수해주세요.<br/><br/>
            &nbsp;8.거래분쟁이 생겼을 때 상대방의 닉네임을 공개하면서 명예를 훼손하는 글을
            올리면 &nbsp;&nbsp;&nbsp;&nbsp;안 돼요. <br /><br/>
            

            &nbsp;우리 모두 위 사항을 잘 지켜 따듯한 거래를 해나가요 :) <br /><br />
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