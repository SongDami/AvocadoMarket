<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:url var="getSellerSaleListURL" value="/restMenu/getSellerSaleList"></c:url>

<c:url var="addLikeURL" value="/restMenu/addLike"></c:url>
<c:url var="deleteLikeURL" value="/restMenu/deleteLike"></c:url>

<!doctype html>
<html>
<head>
<meta charset="UTF-8" />
<title>Avocado_Market 판매자 프로필</title>
</head>


<link rel="stylesheet"
	href="<%=request.getContextPath()%>/assets/css/reset.css?ver=<%=System.currentTimeMillis()%>" />
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/assets/css/seller_sale_list_style.css?ver=<%=System.currentTimeMillis()%>" />





<body>
	<div id="seller_menuList"></div>
	<div class="clear"></div>
		
	<!-- 갤러리 하단 영역 -->
	<div class="board-pager">
	</div>
	<!-- 갤러리 하단 영역 끝 -->
		
	<!--Google CDN 서버로부터 jQuery 참조 -->
	<script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
	<script src="${pageContext.request.contextPath}/assets/js/pager.js"></script>

	<script>
	var saleNowPgNum = 1;

	/**
	 * 초기 페이지 로딩시 댓글 불러오기
	 */
	$(document).ready(function () {
		pageMove(saleNowPgNum);
	});

// 	drawPager()
// 	callFunc : 페이지 클릭 시 호출되는 함수이다. 1을 누르면 pagemove(1) 호출.
// 	page  : 현재 페이지
// 	allRowCnt : 전체 게시글 수
// 	perPgLine : 페이지당 게시글 수
// 	pgGrpCnt : 페이징을 몇개씩 묵을 것인가. ex.3인경우  (1,2,3) (4,5,6)

	function pageMove(pg) {
		
		var contextPath = '<%= request.getContextPath() %>';
		var paramData = {
			member_id : $("#member_id").val(),
			nowPage : pg,
			perPgLine : 8
		};
		
		saleNowPgNum = pg;
		
		$.ajax({
			type	: "POST",
			url	    : "${getSellerSaleListURL}",
			data	: paramData,
			dataType: 'json',
			success : function(result) {
				console.log(result);
				if (result.status == "OK") {
					
					updatePaginglike("pageMove", pg, result.totalCount, result.perPgLine, 5);

					var htmls = "";
					
					if ( result.menuList.length > 0 ) {

						result.menuList.forEach(function(e) {
							htmls +='<div class="sale-item-group">';
							htmls += '<div class="sale-item-list">';
							htmls += '<div class="product-div6">';
							htmls += '<div class="product-div7">';
							if (e.like_yn == "Y") {
								htmls += 	'<div class="product-div8" onClick="like_deleteURL('+e.goods_id+')" style="background: url('+contextPath+'/assets/img/like-on.svg);"></div>';
							} else {
								htmls += 	'<div class="product-div8" onClick="like_insertURL('+e.goods_id+')" style="background: url('+contextPath+'/assets/img/like.svg);"></div>';
							}
							htmls += '</div>';
							htmls += '</div>';
							htmls += 	'<a href="'+contextPath+'/2depth/goods_detail.do?goods_id='+e.goods_id+'">';
							htmls += 		'<img src="'+contextPath+'/uploadimage'+e.thumbnailPath+'" class="img" />';
							htmls += 	'</a>';
							htmls += 	'<br/>';
							htmls += 	'<div class="name-price-group">';
							htmls += 		'<span class="name"><a href="'+contextPath+'/2depth/goods_detail.do?goods_id='+e.goods_id+'">'+e.goods_name+'</a></span><br/>';
							htmls += 		'<span class="price"><a href="'+contextPath+'/2depth/goods_detail.do?goods_id='+e.goods_id+'">'+e.priceNum+'</a></span>';
							htmls += 	'</div>';
							htmls += 	'<div class="clear"></div>';
							htmls += '</div>';
						});

					} else {
						htmls = '<div class="no-sale-list"><p>조회결과가 없습니다.</p></div>';
					}

					$('#seller_menuList').html(htmls);
				}
			},
			error : function(e) {
				console.log(e);
			}
		});
	}
	
	function updatePaginglike(callFunc, page, allRowCnt, perPgLine, pgGrpCnt){
		var boardPager	= $('.board-pager');
		var	pager		= drawPager(callFunc, page, allRowCnt, perPgLine, pgGrpCnt);
				
		boardPager.empty();
		boardPager.append(pager);
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
					pageMove(saleNowPgNum);
					
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
					pageMove(saleNowPgNum);
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

	
	
	</script>
</body>