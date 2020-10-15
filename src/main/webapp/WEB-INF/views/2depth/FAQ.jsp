<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%-- <%@ include file="/_inc/header.jsp"%> --%>
<!-- ========== 컨텐츠 영역 시작 ========== -->
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/assets/css/reset.css?ver=<%=System.currentTimeMillis()%>" />
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/assets/css/FAQ_style.css?ver=<%=System.currentTimeMillis()%>" />

<body>
	<div class="FAQ-tbody">
		<div class= "faq-contents">
			<!-- 질문 테이블(accordion) -->
			<div class="table-title">
			<p class="number-title">NO.<p>
			<p>자주 묻는 질문</p></div>
			<button class="accordion"><p class="num-contents">5</p>상품 등록은 아무나 할 수 있나요?</button>
			<div class="panel">
				<p>
					저희 아보카도 마켓 회원이시면 누구나 상품을 등록하실 수 있습니다. <br> 로그인 후 페이지 상단의 상품등록
					버튼을 이용해주세요. <br> <br> 감사합니다.
				</p>
			</div>
			<button class="accordion"><p class="num-contents">4</p>판매금지 물품</button>
			<div class="panel">
				<p>
				 	- 가품, 이미테이션 (상표권, 저작권 침해 물품, 특정 브랜드의 스타일을 모방한 물품) <br><br>
					- 주류, 담배, 전자담배, 모의총포 및 그 부속품 일체 (ex.라이터, 비비탄 총알 등 청소년 유해 물건)<br><br>
					- 경유, LPG, 휘발유 등의 유류 거래 <br><br>
					- 반려동물 (무료분양, 열대어 포함) <br><br>
					- 한약, 의약품/의료기기,마약류 (청소년 유해약물, 유해화학물질)<br><br>
					- 수제 음식물, 건강기능식품 : 직접 만들거나 가공한 음식, 건강기능식품(지자체 및 영업 신고를 한 사람만 판매 가능)<br><br>
					- 유통기한이 지난 제품<br><br>
					- 도수 있는 안경, 콘택트 렌즈, 써클 렌즈 (온라인 판매 불법)<br><br>
					- 화장품 샘플 <br><br>
					- 개인정보 (게임 계정 포함)<br><br>
					- 조건부 무료 나눔 <br><br>
					- 헌혈증 <br><br>
					- 렌탈 제품<br><br> 
					- 암표매매 행위 <br>
				</p>
			</div>
			<button class="accordion"><p class="num-contents">3</p>동네 변경은 어떻게 하나요?</button>
			<div class="panel">
				<p>
					페이지 우측 상단에 [마이페이지 -> 회원정보 수정]에서 변경하면 됩니다.
				</p>
			</div>
			<button class="accordion"><p class="num-contents">2</p>사기를 당했을 때는 어떻게 하나요?</button>
			<div class="panel">
				<p>
					신고하기를 통해 아보카도마켓 팀에게 알려주신 이후에도 상대방이 탈퇴 했거나, 응답하지 않은 경우<br>
					아래 절차에 따라 수사기관으로 신고를 접수해주세요.<br><br>
					<b>1.사기 신고가 가능한 경우</b><br><br>
					- 물품 상태, 구성품 여부를 속여서 판매하는 경우<br><br><br>
					
					<b>2.경찰서에 신고하기</b><br><br>
				
					* 사기죄 신고는 국내법상 피해자가 직접 신고해야하기 때문에 관할 경찰서의 민원실에 직접 가셔서 신고해주셔야 해요!<br> 
					
				</p>
			</div>
			<button class="accordion"><p class="num-contents">1</p>거래 후기는 어떻게 쓰나요?</button>
			<div class="panel">
				<p>
				 거래 후기는 마이페이지에서 '구매내역' 탭을 통해 작성하실 수 있습니다.
					
				</p>
			</div>
		</div>

		<!-- 페이징 -->
		<div class="FAQ-footer">
		
		</div>
	</div>
</body>
<!--// ========== 컨텐츠 영역 끝 ========== -->
<%-- <%@ include file="/_inc/footer.jsp"%> --%>
<script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
<script>
	var acc = document.getElementsByClassName("accordion");
	var i;

	for (i = 0; i < acc.length; i++) {
		acc[i].addEventListener("click", function() {
			this.classList.toggle("active");
			var panel = this.nextElementSibling;
			if (panel.style.maxHeight) {
				panel.style.maxHeight = null;
			} else {
				panel.style.maxHeight = panel.scrollHeight + "px";
			}
		});
	}
</script>