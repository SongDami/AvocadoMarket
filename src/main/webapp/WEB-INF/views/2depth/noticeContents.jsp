<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>

<!-- ========== 컨텐츠 영역 시작 ========== -->
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/assets/css/reset.css?ver=<%=System.currentTimeMillis()%>" />
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/assets/css/noticeContents_style.css?ver=<%=System.currentTimeMillis()%>" />
<div class="tbody-notice">
<div class="notice-contents">
	<table class="table-notice">
		<thead>
			<tr>
				<th>No.</th>
				<th>제목</th>
				<th>업로드 날짜</th>
			
			</tr>
		</thead>
		<tbody>
			<tr>
				<td>10</td>
				<td><a href="<%= request.getContextPath()%>/4depth/noticeDetail10.do">서비스 점검 안내</a></td>
				<td>2020-10-08</td>
				

			</tr>
			<tr>
				<td>9</td>
				<td><a href="<%= request.getContextPath()%>/4depth/noticeDetail9.do">폭리 방지를 위해 마스크 장당 판매가격을 제한합니다.</a></td>
				<td>2020-10-05</td>
			

			</tr>
			<tr>
				<td>8</td>
				<td><a href="<%= request.getContextPath()%>/4depth/noticeDetail8.do">정부의 긴급 재난 지원금 거래 행위를 제한합니다.</a></td>
				<td>2020-09-28</td>
				

			</tr>
			<tr>
				<td>7</td>
				<td><a href="<%= request.getContextPath()%>/4depth/noticeDetail7.do">나눔의날 함께해주세요!</a></td>
				<td>2020-09-22</td>
			
			</tr>
			<tr>
				<td>6</td>
				<td><a href="<%= request.getContextPath()%>/4depth/noticeDetail6.do">서비스 장애로 불편드려 죄송합니다.</a></td>
				<td>2020-09-14</td>
			

			</tr>
			<tr>
				<td>5</td>
				<td> <a href="<%= request.getContextPath()%>/4depth/noticeDetail5.do">블랙리스트 안내</a></td>
				<td>2020-09-01</td>
				

			</tr>
			<tr>
				<td>4</td>
				<td><a href="<%= request.getContextPath()%>/4depth/noticeDetail4.do">아보카도 마켓 로고 소개</a></td>
				<td>2020-08-20</td>
				

			</tr>
			<tr>
				<td>3</td>
				<td><a href="<%= request.getContextPath()%>/4depth/noticeDetail3.do">아보카도 마켓 이용안내</a></td>
				<td>2020-08-11</td>
				

			</tr>
			<tr>
				<td>2</td>
				<td><a href="<%= request.getContextPath()%>/4depth/noticeDetail2.do">아보카도 마켓 약속</a></td>
				<td>2020-07-30</td>
				

			</tr>
			<tr>
				<td>1</td>
				<td><a href="<%= request.getContextPath()%>/4depth/noticeDetail.do">아보카도 마켓에 가입해주셔서 감사합니다.</a></td>
				<td>2020-07-25</td>
				

			</tr>
		</tbody>
	</table>
</div>
<!-- 페이징버튼 -->
			<div class="notice-footer">
				
				
			</div>
		</div>
	
<!--// ========== 컨텐츠 영역 끝 ========== -->