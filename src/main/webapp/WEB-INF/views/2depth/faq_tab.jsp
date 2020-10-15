<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ include file="/WEB-INF/views/_inc/header.jsp"%>
<!-- ========== 컨텐츠 영역 시작 ========== -->
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/assets/css/reset.css?ver=<%=System.currentTimeMillis()%>" />
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/assets/css/faq_tab_style.css?ver=<%=System.currentTimeMillis()%>" />
<div class="tab-tbody">
	<!-- 공지사항 타이틀  -->
	<div class="tab-title" id="FAQ-title">자주묻는질문</div>
	<div id="faq_title" ></div>
	<!-- 공지 사항/자주 묻는 질문 탭 -->
	<div class="tab-btn">
	<ul class="notice-faq-tab">
		<li class="NAQ-btn-li">
			<a class="NAQ-btn" href="#notice_table_c">공지사항</a>
		</li>
		<li class="NAQ-btn-li">
			<a class="NAQ-btn selected" href="#faq_table_c">자주 묻는 질문</a>
		</li>
	</ul>
	</div>
	<!-- 검색창 -->
	<div class="tab-search">
		<form>
			<input type="text">
			<!-- <a href="#" class="btn"><i class="fas fa-search"></i></a> -->
			<button type="submit" class="tab-search-btn">검색</button>
		</form>
	</div>
	<!-- 공지사항 -->
	<div class="all_btn">
		<div class="hide" id="notice_table_c">
			<%@include file="/WEB-INF/views/2depth/noticeContents.jsp"%>
		</div>
		<!-- 자주묻는 질문 -->
		<div id="faq_table_c">
		<%@include file="/WEB-INF/views/2depth/FAQ.jsp"%>
		</div>

	</div>
</div>
<!--// ========== 컨텐츠 영역 끝 ========== -->
<%@ include file="/WEB-INF/views/_inc/footer.jsp"%>
<script>
	$(function() { 
		$(".NAQ-btn").click(function(e) {
			e.preventDefault();

			$(".NAQ-btn").not(this).removeClass("selected");

			$(this).addClass("selected");

			var target = $(this).attr('href');
			var value = $(this).html();
			$(".tab-title").html(value);
			$(target).removeClass('hide');
			$(".all_btn > div").not($(target)).addClass('hide');

		});

	});
</script>
