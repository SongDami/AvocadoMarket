<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<c:url var="addLikeURL" value="/restMenu/addLike"></c:url>
<c:url var="deleteLikeURL" value="/restMenu/deleteLike"></c:url>

<c:url var="getPopularListURL" value="/restMenu/getPopularList"></c:url>
<c:url var="getNewListURL" value="/restMenu/getNewList"></c:url>
<c:url var="getRecommendListURL" value="/restMenu/getRecommendList"></c:url>

<%@ include file="/WEB-INF/views/_inc/header.jsp"%>
<!-- ========== 컨텐츠 영역 시작 ========== -->

<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">

<link rel="stylesheet" href="<%=request.getContextPath()%>/assets/css/reset.css?ver=<%=System.currentTimeMillis()%>" />
<link rel="stylesheet" href="<%=request.getContextPath()%>/assets/css/Main_style2.css?ver=<%=System.currentTimeMillis()%>" />
<body>
    <div class="main-tbody">
        <section>
            <div class="content">
                <!-- 상단바 (카테고리버튼)-->
                <div id="slide_toggle" class="category-toggle">
                        <i class="fas fa-bars fa-2x" style="color:#356211;"></i>
                </div>
                <!-- 카테고리 영역 -->
                <div id="category">
                    <a href="<%=request.getContextPath()%>/2depth/map.do?category=전체상품">전체상품</a>
                    <a href="<%=request.getContextPath()%>/2depth/map.do?category=디지털/가전">디지털/가전</a>
                    <a href="<%=request.getContextPath()%>/2depth/map.do?category=가구/인테리어">가구/인테리어</a>
                    <a href="<%=request.getContextPath()%>/2depth/map.do?category=유아동">유아동</a>
                    <a href="<%=request.getContextPath()%>/2depth/map.do?category=생활/가공식품">생활/가공식품</a>
                    <a href="<%=request.getContextPath()%>/2depth/map.do?category=스포츠/레저">스포츠/레저</a>
                    <a href="<%=request.getContextPath()%>/2depth/map.do?category=잡화">잡화</a>
                    <a href="<%=request.getContextPath()%>/2depth/map.do?category=의류">의류</a>
                    <a href="<%=request.getContextPath()%>/2depth/map.do?category=게임/취미">게임/취미</a>
                    <a href="<%=request.getContextPath()%>/2depth/map.do?category=반려동물용품">반려동물용품</a>
                    <a href="<%=request.getContextPath()%>/2depth/map.do?category=기타">기타</a>
                    <a href="<%=request.getContextPath()%>/2depth/map.do?category=삽니다">삽니다</a>
                </div>
                
                <div id="carousel-example-generic" class="carousel slide" data-ride="carousel">
                  <!-- Indicators -->
                  <ol class="carousel-indicators">
                    <li data-target="#carousel-example-generic" data-slide-to="0" class="active"></li>
                    <li data-target="#carousel-example-generic" data-slide-to="1"></li>
                    <li data-target="#carousel-example-generic" data-slide-to="2"></li>
                  </ol>
                
                  <!-- Wrapper for slides -->
                  <div class="carousel-inner" role="listbox">
                    <div class="item active">
                        
                      <a href="<%=request.getContextPath()%>/2depth/map.do?category=스포츠/레저"><img src="<%= request.getContextPath() %>/assets/img/banner1.jpg" ></a>
                      <div class="carousel-caption">
                      </div>
                    </div>
                    <div class="item">
                      <a href="<%=request.getContextPath()%>/2depth/map.do?keyword=신발"><img src="<%= request.getContextPath() %>/assets/img/banner2.jpg"></a>
                      <div class="carousel-caption">
                      </div>
                    </div>
                    <div class="item">
                      <a href="<%=request.getContextPath()%>/2depth/map.do?category=의류"><img src="<%= request.getContextPath() %>/assets/img/banner4.jpg"></a>
                      <div class="carousel-caption">
                      </div>
                    </div>
                  </div>
                  <!-- Controls -->
                  <a id="left-control"class="left carousel-control" href="#carousel-example-generic" role="button" data-slide="prev">
                    <span class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
                    <span class="sr-only">Previous</span>
                  </a>
                  <a id="right-control"class="right carousel-control" href="#carousel-example-generic" role="button" data-slide="next">
                    <span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
                    <span class="sr-only">Next</span>
                  </a>
                </div>
                <!--  지도는 여기에-->
                <div class="main-map">
                    <a href="<%=request.getContextPath()%>/2depth/map.do">👀 지도로 상품 찾기</a></div>
                <!-- 인기/신규/추천상품 -->
                <div class="item-list">
                    <div class="popular-item-title">
                        <p class="list-title">인기상품</p>
                    </div>
                    <div class="popular-item" id="popular-item">
                    </div>
                    
                    
                    <div class="new-item-title">
                        <p class="list-title">신규상품</p>
                    </div>
                    <div class="new-item" id="new-item">                    
                    </div>
                    <div class="recommend-item-title">
                        <p class="list-title">추천상품</p>
                    </div>
                    <div class="recommend-item" id="recommend-item">

                    </div>
                </div>
            </div>
        </section>
    </div>
</body>
    <!--// ========== 컨텐츠 영역 끝 ========== -->
    <%@ include file="/WEB-INF/views/_inc/footer.jsp"%>
    <script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
    <script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=9ef4d81981f9d84116ba92caf3e2f392"></script>
    <script type="text/javascript">
    
   $(function() {
      getPopularList();
      getNewList();
      getRecommendList();
   });
   
   function getPopularList() {

      var contextPath = '<%= request.getContextPath() %>';
      var paramData = {};
      
      $.ajax({
         url : "${getPopularListURL}"
         , type : "POST"
         , dataType :  "json"
         , data : paramData
         , success : function(result){
            console.log(result);
            if (result.status == "OK"){
               
               var htmls = "";
               
               if ( result.popularList.length > 0 ) {
                   
                  result.popularList.forEach(function(e) {
                      
                     htmls += '<div class="popular-item-list">';
                     htmls += '<div class="product-div6">';
                     htmls += '<div class="product-div7">';
                     
                     if (e.like_yn == "Y") {
                        htmls +=    '<div class="product-div8" onClick="like_deleteURL('+e.goods_id+')" style="background: url('+contextPath+'/assets/img/like-on.svg);"></div>';
                     } else {
                        htmls +=    '<div class="product-div8" onClick="like_insertURL('+e.goods_id+')" style="background: url('+contextPath+'/assets/img/like.svg);"></div>';
                     }
                     htmls += '</div>';
                     htmls += '</div>';
                     htmls += '<a href="'+contextPath+'/2depth/goods_detail.do?goods_id='+e.goods_id+'">';
                     htmls +=    '<span class="item-img"><img src="'+contextPath+'/uploadimage'+e.thumbnailPath+'"/></span>';
                     htmls +=    '<div class="text">';
                     if(e.category_category_id == 13){
                         htmls +=       '<p class="item-name"><span>[삽니다]</span>'+e.goods_name+'</p>';
                     }else{
                         htmls +=       '<p class="item-name">'+e.goods_name+'</p>';
                     }
                     htmls +=       '<p class="price">'+e.priceNum+'원</p>';
                     htmls +=       '<p class="town">'+e.dong_name+'</p>';
                     htmls +=    '</div>';
                     htmls += '</a>';
                     htmls += '</div>';
                  });
               } else {
                  htmls = '<div><p>조회결과가 없습니다.</p></div>';
               }
               
               $('#popular-item').html(htmls);
            }            
         },
         error : function(e) {
            console.log(e);
         }
      });
   }
   
   function getRecommendList() {

      var contextPath = '<%= request.getContextPath() %>';
      var paramData = {};
      
      $.ajax({
         url : "${getRecommendListURL}"
         , type : "POST"
         , dataType :  "json"
         , data : paramData
         , success : function(result){
            console.log(result);
            if (result.status == "OK"){
               
               var htmls = "";
               
               if ( result.recommendList.length > 0 ) {

                  result.recommendList.forEach(function(e) {
                      
                     htmls += '<div class="recommend-item-list">';
                     htmls += '<div class="product-div6">';
                     htmls += '<div class="product-div7">';
                     
                     if (e.like_yn == "Y") {
                        htmls +=    '<div class="product-div8" onClick="like_deleteURL('+e.goods_id+')" style="background: url('+contextPath+'/assets/img/like-on.svg);"></div>';
                     } else {
                        htmls +=    '<div class="product-div8" onClick="like_insertURL('+e.goods_id+')" style="background: url('+contextPath+'/assets/img/like.svg);"></div>';
                     }
                     htmls += '</div>';
                     htmls += '</div>';
                     htmls += '<a href="'+contextPath+'/2depth/goods_detail.do?goods_id='+e.goods_id+'">';
                     htmls +=    '<span class="item-img"><img src="'+contextPath+'/uploadimage'+e.thumbnailPath+'"/></span>';
                     htmls +=    '<div class="text">';
                     if(e.category_category_id == 13){
                         htmls +=       '<p class="item-name"><span>[삽니다]</span>'+e.goods_name+'</p>';
                     }else{
                         htmls +=       '<p class="item-name">'+e.goods_name+'</p>';
                     }
                     htmls +=       '<p class="price">'+e.priceNum+'원</p>';
                     htmls +=       '<p class="town">'+e.dong_name+'</p>';
                     htmls +=    '</div>';
                     htmls += '</a>';
                     htmls += '</div>';
                  });
               } else {
                  htmls = '<div><p>조회결과가 없습니다.</p></div>';
               }
               
               $('#recommend-item').html(htmls);
            }            
         },
         error : function(e) {
            console.log(e);
         }
      });
   }
   
   function getNewList() {

      var contextPath = '<%= request.getContextPath() %>';
      var paramData = {};
      
      $.ajax({
         url : "${getNewListURL}"
         , type : "POST"
         , dataType :  "json"
         , data : paramData
         , success : function(result){
            console.log(result);
            if (result.status == "OK"){
               
               var htmls = "";
               
               if ( result.newList.length > 0 ) {
                  result.newList.forEach(function(e) {

                     htmls += '<div class="new-item-list">';
                     htmls += '<div class="product-div6">';
                     htmls += '<div class="product-div7">';
                     
                     if (e.like_yn == "Y") {
                        htmls +=    '<div class="product-div8" onClick="like_deleteURL('+e.goods_id+')" style="background: url('+contextPath+'/assets/img/like-on.svg);"></div>';
                     } else {
                        htmls +=    '<div class="product-div8" onClick="like_insertURL('+e.goods_id+')" style="background: url('+contextPath+'/assets/img/like.svg);"></div>';
                     }
                     htmls += '</div>';
                     htmls += '</div>';
                     htmls += '<a href="'+contextPath+'/2depth/goods_detail.do?goods_id='+e.goods_id+'">';
                     htmls +=    '<span class="item-img"><img src="'+contextPath+'/uploadimage'+e.thumbnailPath+'"/></span>';
                     htmls +=    '<div class="text">';
                     if(e.category_category_id == 13){
                         htmls +=       '<p class="item-name"><span>[삽니다]</span>'+e.goods_name+'</p>';
                     }else{
                         htmls +=       '<p class="item-name">'+e.goods_name+'</p>';
                     }
                     
                     htmls +=       '<p class="price">'+e.priceNum+'원</p>';
                     htmls +=       '<p class="town">'+e.dong_name+'</p>';
                     htmls +=    '</div>';
                     htmls += '</a>';
                     htmls += '</div>';
                  });
               } else {
                  htmls = '<div><p>조회결과가 없습니다.</p></div>';
               }
               
               $('#new-item').html(htmls);
            }            
         },
         error : function(e) {
            console.log(e);
         }
      });
   }
   
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
               getPopularList();
               getNewList();
               getRecommendList();
               
               if (value1 == $('#goods_id').val()) {
                  $('#like_button').val("Y");
                  $('#like_button').text("찜취소");
               }
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
               getPopularList();
               getNewList();
               getRecommendList();
               if (value1 == $('#goods_id').val()) {
                  $('#like_button').val("N");
                  $('#like_button').text("찜하기");
               }
            } else {
               alert(result.returnMsg);
               console.log("조회실패");
            }
         }
      });
   }
   
   
   
                    $(function() {
                        $("#slide_toggle").click(function() {
                            $("#category").slideToggle(100);
                        });

                    });


                </script>
