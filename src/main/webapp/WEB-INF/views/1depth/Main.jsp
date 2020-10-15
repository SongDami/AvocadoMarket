<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ include file="/WEB-INF/views/_inc/header.jsp"%>
<!-- ========== 컨텐츠 영역 시작 ========== -->
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/assets/css/reset.css?ver=<%=System.currentTimeMillis()%>" />
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/assets/css/Main_style2.css?ver=<%=System.currentTimeMillis()%>" />

<body>


<div class="main-tbody">
	<section>
		<div class="content">
			<!-- 상단바 (카테고리버튼)-->
			<div id= "slide_toggle" class="category_toggle">
				<a href="#"><i class="fas fa-bar fa-2x"></i>
				
					</a>
			</div>
            <!-- 카테고리 영역 -->
            <div id="category">
                <a href="<%= request.getContextPath()%>/2depth/map.do">전체카테고리</a>
                <a href="#">인기매물</a>
                <a href="#">디지털/가전</a>
                <a href="#">가구/인테리어</a>     
                <a href="#">유아동</a>     
                <a href="#">생활/가공식품</a>     
                <a href="#">스포츠/레저</a>     
                <a href="#">잡화</a>     
                <a href="#">의류</a>     
                <a href="#">게임/취미</a>     
                <a href="#">반려동물용품</a>
                <a href="#">기타</a>     
                <a href="#">삽니다</a>                
            </div>
            
			<!-- 지도 -->
			<div class="map-container" >          
					<div id="map"></div>
			</div>
			<!-- 인기/신규/추천상품 -->
			<div class="item-list">
						<div class="popular-item-title">
					<a href="<%= request.getContextPath()%>/2depth/goods_detail.do" class="btn-more">+more</a>
					<p class="list-title">인기상품</p>
				</div>
				<div class="popular-item">
					<div class="popular-item-list">
						<a href="<%= request.getContextPath()%>/2depth/goods_detail.do"> <span class="item-img"><img
								src="http://placehold.it/210x210" /></span>
							<div class="text">
								<p class="item-name">상품명</p>
								<p class="price">가격</p>
								<p class="town">동네</p>
							</div>
						</a>
					</div>
					<div class="new-item-list">
						<a href="<%= request.getContextPath()%>/2depth/goods_detail.do"> <span class="item-img"><img
								src="http://placehold.it/210x210" /></span>
							<div class="text">
								<p class="item-name">상품명</p>
								<p class="price">가격</p>
								<p class="town">동네</p>
							</div>
						</a>
					</div>
					<div class="new-item-list">
						<a href="#"> <span class="item-img"><img
								src="http://placehold.it/210x210" /></span>
							<div class="text">
								<p class="item-name">상품명</p>
								<p class="price">가격</p>
								<p class="town">동네</p>
							</div>
						</a>
					</div>
					<div class="new-item-list">
						<a href="#"> <span class="item-img"><img
								src="http://placehold.it/210x210" /></span>
							<div class="text">
								<p class="item-name">상품명</p>
								<p class="price">가격</p>
								<p class="town">동네</p>
							</div>
						</a>
					</div>
				</div>
				<div class="new-item-title">
					<a href="#" class="btn-more">+more</a>
					<p class="list-title">신규상품</p>
				</div>
				<div class="new-item">
					<div class="new-item-list">
						<a href="#"> <span class="item-img"><img
								src="http://placehold.it/210x210" /></span>
							<div class="text">
								<p class="item-name">상품명</p>
								<p class="price">가격</p>
								<p class="town">동네</p>
							</div>
						</a>
					</div>
					<div class="new-item-list">
						<a href="#"> <span class="item-img"><img
								src="http://placehold.it/210x210" /></span>
							<div class="text">
								<p class="item-name">상품명</p>
								<p class="price">가격</p>
								<p class="town">동네</p>
							</div>
						</a>
					</div>
					<div class="new-item-list">
						<a href="#"> <span class="item-img"><img
								src="http://placehold.it/210x210" /></span>
							<div class="text">
								<p class="item-name">상품명</p>
								<p class="price">가격</p>
								<p class="town">동네</p>
							</div>
						</a>
					</div>
					<div class="new-item-list">
						<a href="#"> <span class="item-img"><img
								src="http://placehold.it/210x210" /></span>
							<div class="text">
								<p class="item-name">상품명</p>
								<p class="price">가격</p>
								<p class="town">동네</p>
							</div>
						</a>
					</div>
				</div>
				<div class="recommend-item-title">
					<a href="#" class="btn-more">+more</a>
					<p class="list-title">추천상품</p>

				</div>
				<div class="recommend-item">
					<div class="recommend-item-list">
						<a href="#"> <span class="item-img"><img
								src="http://placehold.it/210x210" /></span>
							<div class="text">
								<p class="item-name">상품명</p>
								<p class="price">가격</p>
								<p class="town">동네</p>
							</div>
						</a>
					</div>
					<div class="recommend-item-list">
						<a href="#"> <span class="item-img"><img
								src="http://placehold.it/210x210" /></span> <span>
								<div class="text">
									<p class="item-name">상품명</p>
									<p class="price">가격</p>
									<p class="town">동네</p>
								</div>
						</span>
						</a>
					</div>
					<div class="recommend-item-list">
						<a href="#"> <span class="item-img"><img
								src="http://placehold.it/210x210" /></span>
							<div class="text">
								<p class="item-name">상품명</p>
								<p class="price">가격</p>
								<p class="town">동네</p>
							</div>
						</a>
					</div>
					<div class="recommend-item-list">
						<a href="#"> <span class="item-img"><img
								src="http://placehold.it/210x210" /></span>
							<div class="text">
								<p class="item-name">상품명</p>
								<p class="price">가격</p>
								<p class="town">동네</p>
							</div>
						</a>
					</div>
				</div>
			</div>
		</div>
	</section>
</div>
    <!-- <div id="slidemenu">
        <ul>
            <li><p>최근 본 상품</p></li>
            <li><img src="http://placehold.it/100x100" ><a href="#">메뉴1</a></li>
            <li><a href="#"><img src="http://placehold.it/100x100" >메뉴2</a></li>
            <li><a href="#"><img src="http://placehold.it/100x100" >메뉴3</a></li>
            <li><a href="#"><img src="http://placehold.it/100x100" >메뉴4</a></li>
        </ul>
    </div> -->
    <div id="slidemenu" >

            <p>최근 본 상품</p>
            <a href="<%=request.getContextPath()%>/2depth/goods_detail.jsp"><img src="http://placehold.it/80x80" ><p>상품1</p></a>
            <a href="<%=request.getContextPath()%>/2depth/goods_detail.jsp"><img src="http://placehold.it/80x80" ><p>상품2</p></a>
            <a href="<%=request.getContextPath()%>/2depth/goods_detail.jsp"><img src="http://placehold.it/80x80" ><p>상품3</p></a>
            <a href="<%=request.getContextPath()%>/2depth/goods_detail.jsp"><img src="http://placehold.it/80x80" ><p>상품4</p></a>


    </div>

<!--// ========== 컨텐츠 영역 끝 ========== -->
<%@ include file="/WEB-INF/views/_inc/footer.jsp"%>

<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=9ef4d81981f9d84116ba92caf3e2f392"></script>

<script type="text/javascript">

 $(function() {
    $("#slide_toggle").click(function() { $("#category").slideToggle(100); });

   /*  $(document).ready(function(){
        var currentPosition = parseInt($("#slidemenu").css("top"));
        $(window).scroll(function() {
            var position = $(window).scrollTop(); // 현재 스크롤바의 위치값을 반환합니다.
            $("#slidemenu").stop().animate({"top":position+currentPosition+"px"},1000);
        });
    }); */

}); 
 
 /* kakao map API */
 $(function() {
 var container = document.getElementById('map');
        var options = {
            center: new kakao.maps.LatLng(37.5025398, 127.0243207),
          level: 3
         };

       var map = new kakao.maps.Map(container, options);
  });

 /** 브라우저의 해상도 구간을 판정하는 함수 */
 function check_responsive() {
     var w = $(window).width(); // 브라우저의 넓이
     var responsive = 'xs';

     // 브라우저의 구간 판정
     if (w >= 1200) { responsive = 'lg'; } else if (w >= 992) { responsive = 'md'; } else if (w >= 768) { responsive = 'sm'; }

     // 해상도에 따라 xs, sm, md, lg중 하나 리턴
     return responsive;

 }

 /** 브라우저 크기에 따라 동작할 함수 정의*/
 function set_responsive() {
     // q브라우저의 구간 판정 --> 해상도에 따라 xs, sm, md, lg중 하나 리턴
     var responsive = check_responsive();
     // 리턴된 값의 case에 다라 분기한다.
     switch (responsive) {
         case 'xs':
             $("#slidemenu").html("<div class='box1'></div>");
             break;
         case 'sm':
             $("#slidemenu").html("<div class='box2'></div>");
             break;
         case 'md':
             $("#slidemenu").html("<div class='box3'></div>");
             break;
         default:
             $("#slidemenu").html("<div class='box4'></div>");
             break;
     }

 }
 $(function() {
     // 브라우저가 열리면 현재 크기에 맞게 실행하기 위해서 우선 호출.
     set_responsive();
     // 브라우저의 창 크기가 변경될 때 함수가 호출되도록 이벤트 처리
     $(window).resize(function(e) {
         set_responsive();
     });

 });


  
    </script>
</body>
