<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<c:url var="addLikeURL" value="/restMenu/addLike"></c:url>
<c:url var="deleteLikeURL" value="/restMenu/deleteLike"></c:url>

<!doctype html>
<html>
<head>
<meta charset="UTF-8" />
<!-- 아래의 문장을 사용하면 검색어 노출이 안된다. -->
<!-- <meta name="robots" content="noindex"> -->

<!--SEO 태그들이다. 검색했을 때에 노출되는 검색어들이다. -->
<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no">
<meta name="description" content="좋은조의 아보카도마켓 프로젝트 페이지 입니다."/>
<meta name="keywords" content="김혜조, 송다미, 임유빈 이젠IT아카데미,이젠컴퓨터아카데미" />
<meta name="author" content="김혜조, 송다미, 임유빈" />
<meta property="og:type" content="website" />
<meta property="og:title" content="Avocado Market" />
<meta property="og:description" content="4조의 아보카도마켓 프로젝트 페이지 입니다." />


<title>Avocado Market</title>
<!-- 웹브라우저에 뜨는 url기준이다. -->
<!--http://localhost:8080/프로젝트이름/폴더1/폴더2/파일이름 -->


<%-- <link rel="stylesheet" href="<%=request.getContextPath()%>/assets/css/non-responsive.css" /> --%>
<link rel="stylesheet" href="<%=request.getContextPath()%>/assets/css/bs3-multi-columns-row.css" />
<link rel="stylesheet" href="<%=request.getContextPath()%>/assets/css/style.css?ver=<%=System.currentTimeMillis()%>" />
<link rel="stylesheet" href="<%=request.getContextPath()%>/assets/css/reset.css?ver=<%=System.currentTimeMillis()%>" />
<link rel="stylesheet" href="<%=request.getContextPath()%>/assets/css/map_style.css?ver=<%=System.currentTimeMillis()%>" />
<!--Faviticon Chrome, Safari, IE --> 
<link rel="shortcut icon" href="<%= request.getContextPath() %>/assets/img/favicon.ico">



<script type="text/javascript" src="//code.jquery.com/jquery-3.4.1.min.js"></script>
<script type="text/javascript" src="//stackpath.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<script type="text/javascript" src="//kit.fontawesome.com/79c58b9006.js"></script>
<script type="text/javascript" src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
</head>

    <header>
    <div class="header-container">
        <div id="top1" class="clear">
            <div class="star">
                <a href="#" id="favorite" class="star"><i class="fas fa-star"></i>즐겨찾기</a>
                <script src="https://kit.fontawesome.com/15bed712b0.js" crossorigin="anonymous"></script>

            </div>

        </div>
        <div id="top2" class="clear">
            <div class="clear top-2">
                <div class="logo">
                    <a href="<%= request.getContextPath()%>/"><img src="<%= request.getContextPath() %>/assets/img/Logo.png" width="220px" height="150px"></a>
                </div>
                
                <form method="get" action="${pageContext.request.contextPath}/2depth/map.do">
                    <div class="search_bar">
                        <div class="inbar">
                            <input type="hidden" name="category" id="category" value="${category}">
                            <input type="search" name="keyword" id="keyword" placeholder=" 상품명으로 검색" value="${keyword}">
                            <input type="hidden" name="dong" id="dong" value="${dongN}">
                            <button class="search" type="submit"><i class="fas fa-search"></i></button>
                        </div>
                    </div>
                </form>
                <div class="mymenu">
                    <c:choose>
                        <c:when test="${loginInfo != null && loginInfo != '' }">
                             <a href="<%= request.getContextPath()%>/2depth/goods_up.do">상품등록 </a>
                             <a href="<%= request.getContextPath()%>/2depth/logout.do">로그아웃 </a>
                             <a href="<%= request.getContextPath()%>/2depth/mypage.do">마이페이지 </a>
                        </c:when>
                        <c:otherwise>
                            <a href="<%= request.getContextPath()%>/2depth/login.do">상품등록 </a>
                            <a href="<%= request.getContextPath()%>/2depth/login.do">로그인 </a>
                            <a href="<%= request.getContextPath()%>/2depth/login.do">마이페이지 </a>
                        </c:otherwise>
                    </c:choose>
                </div>
            </div>
        </div>
        </div>
    </header>
<body>
    <!-- 브라우저에 보여질 부분 -->
    <!-- 페이지의 전체 폭을 결정하기 위한 영역 -->
    <!-- 중앙 영역 -->
    <div id="content">
        <div id="contentbox" class="clearfix">
            <div class="gallery">
                <!-- 갤러리 상단 영역 -->
                <div class="gallery-header">
                    <select name="category_select" id="category_select" onchange="changeOption()">
                        <c:forEach var="category" items="${categoryList}" varStatus="status">
                            <c:url value="/2depth/map.do" var="map_url">
                                <c:param name="category" value="${category.category_type}" />
                                <c:param name="keyword" value="${keyword}" />
                                <c:param name="dong" value="${param.dong}" />
                            </c:url>
                            <option value="${map_url}" <c:if test="${category.category_type == param.category}">selected</c:if>>${category.category_type}</option>
                        </c:forEach>
                    </select>
                    <c:choose>
                        <c:when test="${keyword != null && keyword != '' && fn:length(keyword) != 0}">
                            <span> '${keyword}' 에 대한 검색결과입니다. </span>
                        </c:when>
                    </c:choose>
<%--                     <span class="room-count">${totalCount}</span>
                    <span>개</span> --%>
                </div>
                <!-- 갤러리 상단 영역 끝 -->
                <!-- 갤러리 내용 + 하단 영역 -->
                <div class="gallery-container">
                    <!-- 갤러리 내용 영역 -->
                    <div class="gallery-content clear">
                        <ul id="goodsList">
                            <c:choose>
                                <c:when test="${output == null || fn:length(output) == 0}">
                                    <p class = "no_goods">등록된 상품이 없습니다. 상품을 등록해보세요!</p>
                                    <p><a class = "no_goods_link" href="<%= request.getContextPath()%>/2depth/goods_up.do">등록하러 가기</a></p>
                                    <img class="sad_avo" src="<%= request.getContextPath()%>/assets/img/sad_avo.jpg"/>
                                </c:when>
                                <c:otherwise>
                                    <c:forEach var="item" items="${output}" varStatus="status">
                                        <li>
                                            <div class="product-div5">
                                                <div class="product-div6">
                                                   <div class="product-div7">
                                                    <!-- 좋아요 버튼 -->
                                                    <c:choose>
                                                        <c:when test="${item.like_id !=0 && loginInfo != null}">
                                                            <div class="product-div8" onClick="like_deleteURL(${item.goods_id})" style="background: url(<%= request.getContextPath()%>/assets/img/like-on.svg);"></div>
                                                        </c:when>
                                                        <c:otherwise>
                                                            <div class="product-div8" onClick="like_insertURL(${item.goods_id})" style="background: url(<%= request.getContextPath()%>/assets/img/like.svg);"></div>
                                                        </c:otherwise>
                                                    </c:choose>
                                                    </div>
                                                    <!-- 좋아요 끝 -->
                                                    <!-- 전체 링크화 -->
                                                    <a target="_blank" rel="" class="product-a" href="<%=request.getContextPath()%>/2depth/goods_detail.do?goods_id=${item.goods_id}">
                                                        <!-- 이미지 -->
                                                        <c:set value="${item.thumbnailPath}" var="thumbnail_url"/>
                                                        <img class="product-a-div img" src="<%=request.getContextPath()%>/uploadimage${thumbnail_url}" />
                                                        <p class="product-a-p34">${item.goods_name}</p>
                                                        <p class="product-a-p2">
                                                        <c:if test="${item.category_category_id == 13}">
                                                            <span>[삽니다] </span>
                                                        </c:if>
                                                            <span>
                                                            <fmt:formatNumber value="${item.price}" pattern="#,###" />원
                                                            </span>
                                                        </p>
                                                        <p class="product-a-p1">${item.dong_name}</p>
                                                    </a>
                                                </div>
                                            </div>
                                        </li>
                                    </c:forEach>
                                </c:otherwise>
                            </c:choose>
                        </ul>
                    </div>
                    <!-- 갤러리 내용 영역 -->
                    <!-- 갤러리 하단 영역 -->
                            <c:if test="${output != null && fn:length(output) != 0}">
                            <div class="gallery-footer">
                                <%-- gallery-index --%>
                                <div class="gallery-index">
                                    <!-- 페이지 번호 구현 -->
                                    <%-- 이전 그룹에 대한 링크 --%>
                                    <button class="prev-btn" id="temp">
                                        <span>&lt;</span>
                                    </button>

                                    <%-- 페이지 번호 (시작 페이지 부터 끝 페이지까지 반복) --%>
                                    <ul class="index-list" id="index-list">
                                        <c:forEach var="i" begin="${pageData.startPage}" end="${pageData.endPage}" varStatus="status">

                                            <%-- 페이지 번호 출력 --%>
                                            <c:choose>
                                                <%-- 현재 머물고 있는 페이지 번호를 출력 --%>
                                                <c:when test="${pageData.nowPage == i}">
                                                    <li><a class="index-indiv index-active">${i}</a></li>
                                                </c:when>
                                                <%-- 나머지 페이지 --%>
                                                <c:otherwise>
                                                    <li><a class="index-indiv">${i}</a></li>
                                                </c:otherwise>
                                            </c:choose>
                                        </c:forEach>
                                    </ul>

                                    <%-- 다음 그룹에 대한 링크 --%>
                                    <button class="next-btn">
                                        <span>&gt;</span>
                                    </button>
                                </div>
                                <%-- gallery-index --%>
                            </div>
                        </c:if>
                        </div>

                <!-- 갤러리 하단 영역 끝 -->
            </div>
            <!-- 갤러리 내용 + 하단 영역 끝 -->
            <!-- 지도 -->
            <div class="map-container">
                <div class="map">
                    <div id="map"></div>
                </div>
            </div>
            <!-- 지도 끝 -->
        </div>
    </div>
    <!-- Javascript -->
    <script src="//code.jquery.com/jquery-3.5.1.min.js"></script>
    <script src="<%=request.getContextPath()%>/assets/js/bootstrap.min.js"></script>
    <!-- jQuery Ajax Setup -->
    <script src="${pageContext.request.contextPath}/assets/plugins/ajax/ajax_helper.js"></script>
    <script type="application/javascript" src="<%=request.getContextPath()%>/assets/js/seouldong.js"></script>
    <script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=9ef4d81981f9d84116ba92caf3e2f392&libraries=services"></script>
    <script type="text/javascript">
    
    /* 브라우저 크기에 따라 갤러리와 지도영역 높이 변경 */
    function contentSize() {
        var wHeight = $(window).height();
        var gHeight = wHeight - 206;
        var mHeight = wHeight - 136;
        $(".gallery-container").css("height", gHeight);
        $(".map").css("height", mHeight);
    }

    
    $(function() {
        contentSize();
        $(window).resize(function(e) {
            contentSize();
        });
    });
    
    //천단위 콤마 펑션
    function addComma(value){
         value = value.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
         return value; 
     }
    
    
    var dong = "${loginInfo.dong_name}";
    var startPage;
    var endPage;
    var groupCount;
    var totalPage;
    var nowPage;
    var nextPage;
    var prevPage;
    
    /************파라미터 보내기**************/
    function getDong(category, keyword, dong, page) {
        
        var params = {
            "category" : category,
            "keyword" : keyword,
            "dong" : dong,
            "page" : page
        };
        
        $.ajax({
          method:'get',
          url: "${pageContext.request.contextPath}/map",
          data: params,
          success: function(req){
              var goods = req.item; 
              var html = "";
              var source = document.getElementById("goodsList");
    /*           var renewURL= location.href;
              renewURL = renewURL.replace(/\&page=([0-9]+)/ig,'');
              
              renewURL +=  '&dong='+dong; 
              
              history.pushState(null, null, renewURL); */
              var thumbnailUrl = '';
              var contextPath = '<%= request.getContextPath() %>';
              if (goods.length == 0) {
                  html +=  '<p class = "no_goods">등록된 상품이 없습니다. 상품을 등록해보세요!</p>'
                  html += '<p><a class = "no_goods_link" href="<%= request.getContextPath()%>/2depth/goods_up.do">등록하러 가기</a></p>'
                  html +=  '<img class="sad_avo" src="<%= request.getContextPath()%>/assets/img/sad_avo.jpg"/>'
                      } else {
                
              for (var i = 0; i < goods.length; i++) {
                  thumbnailUrl = '<%= request.getContextPath() %>/uploadimage' + goods[i].thumbnailPath;
                 

                    html += '<li> <div class="product-div5">'
                    html +=   '<div class="product-div6">'
                    html +=   '<div class="product-div7">'
                    
                        if (goods[i].like_id != 0 && req.loginInfo) {
                            html +=    '<div class="product-div8" onClick="like_deleteURL('+goods[i].goods_id+')" style="background: url('+contextPath+'/assets/img/like-on.svg);"></div>';
                        } else {
                            html +=    '<div class="product-div8" onClick="like_insertURL('+goods[i].goods_id+')" style="background: url('+contextPath+'/assets/img/like.svg);"></div>';
                        }
                    
                    html +=    '</div>'
                    html +=    '<a target="_blank" rel="" class="product-a" href="<%=request.getContextPath()%>/2depth/goods_detail.do?goods_id=' + goods[i].goods_id + '">'
                    html +=    '<img src='+thumbnailUrl+' class="product-a-div img"/>'
                    html +=    '<p class="product-a-p34">' + goods[i].goods_name + '</p>'
                    html +=    '<p class="product-a-p2">'
                    if (goods[i].category_category_id == 13) {                      
                        html +=    '<span>[삽니다] </span>'
                    }
                    html +=    '<span>' +  addComma(goods[i].price)  + '원</span>'
                    html +=    '</p>'
                    html +=    '<p class="product-a-p1">' + goods[i].dong_name + '</p>'
                    html +=    '</a> </div> </div> </li>'
                }

              }
              
              source.innerHTML = html;

              
              startPage = req.pageData.startPage;
              endPage = req.pageData.endPage;
              groupCount = req.pageData.groupCount;
              totalPage = req.pageData.totalPage;
              nowPage = req.pageData.nowPage;
              nextPage = req.pageData.nextPage;
              prevPage = req.pageData.prevPage;
              
              /** 페이지 번호 출력 **/
              var index_list = new Array();
              for (var i=startPage; i<=endPage; i++) {
                  var indexno = i;
                  if (nowPage == indexno) {
                      index_list[i] = '<li><a class="index-indiv index-active">'+indexno+'</a></li> ';
                  } else {
                      index_list[i] = '<li><a class="index-indiv">'+indexno+'</a></li> ';
                  }
              }
              $("#index-list").html(index_list);
          }
        });
    }

    /* kakao map API */
    $(function() {
        var mapContainer = document.getElementById('map'), // 지도를 표시할 div  
        mapOption = {
            center : new kakao.maps.LatLng(37.502430,127.024407), // 지도의 중심좌표
            level : 3 // 지도의 확대 레벨
        };

        var map = new kakao.maps.Map(mapContainer, mapOption); // 지도를 생성합니다
        map.setMaxLevel(5);// 최대 확대레벨 설정
        
        if ("${loginInfo}") {
         // 장소 검색 객체를 생성합니다
            var ps = new kakao.maps.services.Places(); 

            // 키워드로 장소를 검색합니다
            ps.keywordSearch('${loginInfo.dong_name}', placesSearchCB); 

            // 키워드 검색 완료 시 호출되는 콜백함수 입니다
            function placesSearchCB (data, status, pagination) {
                if (status === kakao.maps.services.Status.OK) {

                    // 검색된 장소 위치를 기준으로 지도 범위를 재설정하기위해
                    // LatLngBounds 객체에 좌표를 추가합니다
                    var bounds = new kakao.maps.LatLngBounds();

                    for (var i=0; i<data.length; i++) {
                        bounds.extend(new kakao.maps.LatLng(data[i].y, data[i].x));
                    }

                    // 검색된 장소 위치를 기준으로 지도 범위를 재설정합니다
                    map.setBounds(bounds);
                } 
            }
        }
        
        var imageSrc = "<%=request.getContextPath()%>/assets/img/favicon.ico",
                        imageSize = new kakao.maps.Size(54, 59), // 마커이미지의 크기입니다
                        imageOption = {
                            offset : new kakao.maps.Point(27, 69)
                        }; // 마커이미지의 옵션입니다. 마커의 좌표와 일치시킬 이미지 안에서의 좌표를 설정합니다.

                        // 주소-좌표 변환 객체를 생성합니다
                        var geocoder = new kakao.maps.services.Geocoder();

                        var positions = hangjungdong.dong;

                        for (var i = 0; i < positions.length; i++) {
                            // 콜백함수 안에서 인식을 못하므로 상수로 선언해주기
                            const codeNm = positions[i].codeNm;
                            // 주소로 좌표를 검색합니다
                            geocoder.addressSearch(
                                            positions[i].codeNm,
                                            function(result, status) {

                                                // 정상적으로 검색이 완료됐으면 
                                                if (status === kakao.maps.services.Status.OK) {

                                                    var coords = new kakao.maps.LatLng(
                                                            result[0].y,
                                                            result[0].x);

                                                    // 마커의 이미지정보를 가지고 있는 마커이미지를 생성합니다
                                                    var markerImage = new kakao.maps.MarkerImage(
                                                            imageSrc,
                                                            imageSize,
                                                            imageOption), markerPosition = coords; // 마커가 표시될 위치입니다

                                                    // 결과값으로 받은 위치를 마커로 표시합니다
                                                    var marker = new kakao.maps.Marker(
                                                            {
                                                                map : map,
                                                                position : coords,
                                                                image : markerImage
                                                            // 마커이미지 설정 
                                                            });

                                                    // 인포윈도우로 장소에 대한 설명을 표시합니다
                                                    var infowindow = new kakao.maps.InfoWindow(
                                                            {
                                                                content : '<div class="info" style="text-align:center;padding:5px;color:#0b6613;font-weight:bold;margin:auto;">'
                                                                        + codeNm + '</div>'
                                                            });

                                                    // 마커에 클릭이벤트를 등록합니다
                                                    kakao.maps.event.addListener(marker,'click',
                                                                    function() {
                                                                        // 인포윈도우 html 가져오기
                                                                        dong = $('.info').html();
                                                                        // getDong 호출
                                                                        getDong("${param.category}", "${param.keyword}", dong, 1);
                                                                        // URl 강제 변경
                                                                        var url = "<%=request.getContextPath()%>/2depth/map.do?category=${param.category}&keyword=${param.keyword}&page=1&dong=" + dong;
                                                                        history.pushState(null, null, url);
                                                                        document.getElementById('dong').value = dong;
                                                                        document.getElementById('category').value = "${param.category}";

                                                                    });

                                                    // 마커에 마우스오버 이벤트를 등록합니다
                                                    kakao.maps.event.addListener(marker,'mouseover',
                                                                    function() {
                                                                        // 마커에 마우스오버 이벤트가 발생하면 인포윈도우를 마커위에 표시합니다
                                                                        infowindow.open(
                                                                        map,marker);
                                                                    });

                                                    // 마커에 마우스아웃 이벤트를 등록합니다
                                                    kakao.maps.event.addListener(marker,
                                                                    'mouseout',
                                                                    function() {
                                                                        // 마커에 마우스아웃 이벤트가 발생하면 인포윈도우를 제거합니다
                                                                        infowindow.close();
                                                                    });

                                                }
                                            });
                        }
                    });
    
    /** 페이징 처리 **/
    // 페이지 번호 클릭
    $(document).on('click', ".index-indiv", function(e){
        var index_no = $(this).html();
        getDong("${param.category}", "${param.keyword}", dong, index_no);
    });
    // 다음 그룹으로 가기 버튼 클릭
    $(document).on('click', ".next-btn", function(e){
        if (nextPage == undefined) { nextPage = ${pageData.nextPage}; }
        if (nextPage > 0) {
            getDong("${param.category}", "${param.keyword}", dong, nextPage);
            return;
        } else { return false; }
    });
    // 이전 그룹으로 가기 버튼 클릭
    $(document).on('click', ".prev-btn", function(e){
        if (prevPage > 0) {
            getDong("${param.category}", "${param.keyword}", dong, prevPage);
            return;
        } else { return false; }
    });
    
    /* ajax 카테고리 변경 함수 */
    function changeOption(){
        var categoryDong = "";
        var categorySelect = document.getElementById("category_select");
         
        // select element에서 선택된 option의 text가 저장된다.
        var selectText = categorySelect.options[categorySelect.selectedIndex].text;
        
        var url = "<%=request.getContextPath()%>/2depth/map.do?category=" + selectText + "&keyword=${param.keyword}&page=1&dong=" + dong;
        location.replace(url);
    }
    
    
                    /* 필터 -드롭다운 - 자동 toggle 해제 
                     $(document).off(".data-api");
                     $(".dropdown-toggle").dropdown(); */
 // 찜하기 등록
    function like_insertURL(value1) {

        var paramData = {
            goods_id : value1
        };
        
        $.ajax({
            url : "${addLikeURL}"
            , type : "POST"
            , dataType : "json"
            , data : paramData
            , success : function(result){
                console.log(result);
                
                if (result.status == "OK") {
                    alert(result.returnMsg);
                    getDong("${param.category}", "${param.keyword}", dong, nowPage);
                    
                } else {
                    alert(result.returnMsg);
                    console.log("조회실패");
                }
            }
        });
    }

    // 찜하기 취소
    function like_deleteURL(value1) {

        if(!confirm("정말 해제하시겠습니까?")) {
            return false;
        }
        
        var paramData = {
            goods_id : value1
        };
        
        $.ajax({
            url : "${deleteLikeURL}"
            , type : "POST"
            , dataType : "json"
            , data : paramData
            , success : function(result){
                console.log(result);
                
                if (result.status == "OK") {
                    alert(result.returnMsg);
                    getDong("${param.category}", "${param.keyword}", dong, nowPage);
                } else {
                    alert(result.returnMsg);
                    console.log("조회실패");
                }
            }
        });
    }
    </script>
    <%@ include file="/WEB-INF/views/_inc/footer.jsp"%>
</body>