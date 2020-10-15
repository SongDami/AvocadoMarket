<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:url var="getlikeListURL" value="/restMenu/getlikeList"></c:url>
<c:url var="likedeleteURL" value="/restMenu/deleteLike"></c:url>

<!doctype html>

<head>
    <meta charset="UTF-8" />
    <title>Avocado Market 마이페이지</title>
</head>

<link rel="stylesheet" href="<%=request.getContextPath()%>/assets/css/reset.css?ver=<%=System.currentTimeMillis()%>" />
<link rel="stylesheet" href="<%=request.getContextPath()%>/assets/css/mypage_interest_list_style.css?ver=<%=System.currentTimeMillis()%>" />

<body>
	<div id="interest_list"></div>
	<div class="clear"></div>
	
	<!-- 갤러리 하단 영역 -->
	<div class="like_pager">
	</div>
	<!-- 갤러리 하단 영역 끝 -->

<!--Google CDN 서버로부터 jQuery 참조 -->
<script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
<script src="${pageContext.request.contextPath}/assets/js/pager.js"></script>

<script>
	var interestNowPgNum = 1;

	$(function() {
		mypage_interest_list(interestNowPgNum);
	});
	
	function mypage_interest_list(pg) {

		var contextPath = '<%= request.getContextPath() %>';
		var paramData = {
			nowPage : pg,
			perPgLine : 8
		};

		interestNowPgNum = pg;
		
		$.ajax({
			url : "${getlikeListURL}"
			, type : "POST"
			, dataType :  "json"
			, data : paramData
			, success : function(result){
				console.log(result);
				if (result.status == "OK"){
					
					updatePaginglike("mypage_interest_list", pg, result.totalCount, result.perPgLine, 5);
					
					var htmls = "";
					
					if ( result.menuList.length > 0 ) {

						result.menuList.forEach(function(e) {
							
							htmls += '<div class="sold-item-group">'
							htmls += '<div class="sold-item-list">'
							htmls += '<div class="product-div6">'
						    htmls += '<div class="product-div7">'
						    htmls += '<div class="product-div8" onClick="like_deleteURL('+e.goods_id+')" style="background: url('+contextPath+'/assets/img/like-on.svg);"></div>';
						    htmls += '</div>'
						    htmls += '</div>'
							htmls += 	'<a href="'+contextPath+'/2depth/goods_detail.do?goods_id='+e.goods_id+'">';
							htmls += 		'<img src="'+contextPath+'/uploadimage'+e.thumbnailPath+'" class="img" />';
							htmls += 	'</a>';
						    htmls += '<br/>'
						    htmls += '<div class="name-price-group">'
						    htmls += '<span class="name"><a href="'+contextPath+'/2depth/goods_detail.do?goods_id='+e.goods_id+'">'+e.goods_name+'</a></span>'
						    htmls += '<br/>'
						    htmls += '<span class="price"><a href="'+contextPath+'/2depth/goods_detail.do?goods_id='+e.goods_id+'">'+e.priceNum+'</a></span>'
						    htmls += '</div>'
						    htmls += '<div class="clear"></div>'
						    htmls += '</div>'
						    htmls += '</div>'
							
						});
					} else {
						htmls = '<div class="no-interest"><p>조회결과가 없습니다.</p></div>';
					}
					
					$('#interest_list').html(htmls);
				}				
			},
			error : function(e) {
				console.log(e);
			}
		});
	}
	
	function updatePaginglike(callFunc, page, allRowCnt, perPgLine, pgGrpCnt){
		var boardPager	= $('.like_pager');
		var	pager		= drawPager(callFunc, page, allRowCnt, perPgLine, pgGrpCnt);
				
		boardPager.empty();
		boardPager.append(pager);
	}

    function like_deleteURL(value1) { // 삭제 버튼 alert

		if(!confirm("정말 해제하시겠습니까?")) {
			return false;
		}
		
		var paramData = {
			goods_id : value1
		};
		
		$.ajax({
			url : "${likedeleteURL}"
			, type : "POST"
			, dataType : "json"
			, data : paramData
			, success : function(result){
				console.log(result);
				
				if (result.status == "OK") {
					alert(result.returnMsg);
					mypage_interest_list(interestNowPgNum);
				} else {
					alert(result.returnMsg);
					console.log("조회실패");
				}
			}
		});
	}

</script>

</body>