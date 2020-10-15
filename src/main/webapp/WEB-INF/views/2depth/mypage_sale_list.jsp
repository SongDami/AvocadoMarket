<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:url var="getMenuListURL" value="/restMenu/getMenuList"></c:url>
<c:url var="uptDropboxURL" value="/restMenu/mypage_dropbox_update"></c:url>
<c:url var="deleteSaleURL" value="/restMenu/mypage_sale_list_delete"></c:url>

<!doctype html>
<html>
<head>
<meta charset="UTF-8" />
<title>Avocado Market 마이페이지</title>
</head>

<link rel="stylesheet" href="<%=request.getContextPath()%>/assets/css/reset.css?ver=<%=System.currentTimeMillis()%>" />
<link rel="stylesheet" href="<%=request.getContextPath()%>/assets/css/mypage_sale_list_style.css?ver=<%=System.currentTimeMillis()%>" />

<body>
	<!--method="post" action="${pageContext.request.contextPath}/professor/add_ok.do"-->
	
		<div id="menuList"></div>
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

	$(function() {
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
			nowPage : pg,
			perPgLine : 8
		};
		
		saleNowPgNum = pg;
		
		$.ajax({
			type	: "POST",
			url	    : "${getMenuListURL}",
			data	: paramData,
			dataType: 'json',
			success : function(result) {
				console.log(result);
				if (result.status == "OK") {
					
					updatePaging("pageMove", pg, result.totalCount, result.perPgLine, 5);

					var htmls = "";
					
					if ( result.menuList.length > 0 ) {
						
						result.menuList.forEach(function(e) {
							htmls +='<div class="sale-item-group">'
							htmls += '<div class="sale-item-list">';
							htmls += 	'<a href="'+contextPath+'/2depth/goods_detail.do?goods_id='+e.goods_id+'">';
							htmls += 		'<img src="'+contextPath+'/uploadimage'+e.thumbnailPath+'" class="img" />';
							htmls += 	'</a>';
							htmls += 	'<br/>';
							htmls += 	'<div class="name-price-group">';
							htmls += 		'<span class="name"><a href="'+contextPath+'/2depth/goods_detail.do?goods_id='+e.goods_id+'">'+e.goods_name+'</a></span><br/>';
							htmls += 		'<span class="price"><a href="'+contextPath+'/2depth/goods_detail.do?goods_id='+e.goods_id+'">'+e.priceNum+'</a></span>';
							htmls += 	'</div>';
							htmls += 	'<div class="clear"></div>';
							htmls += 	'<div class="sale-item-list-button-group">';
							htmls += 		'<div class="sale-item-list-button">';
							htmls += 			'<div class="change">';
							htmls += 				'<form action="'+contextPath+'/4depth/goods_edit.do">';
							htmls += 					'<button type="submit" class="change-btn">수정</button>';
							htmls += 					'<input name="goods_id" type="hidden" value="'+e.goods_id+'">';
							htmls += 				'</form>';
							htmls += 			'</div>';
							htmls += 			'<div class="delete">';
							htmls += 				'<button type="submit" class="delete-btn" onClick="fn_saleDelete('+e.goods_id+')">삭제</button>';
							htmls += 			'</div>';
							htmls += 		'</div>';
							htmls += 	'</div>';
							htmls += 	'<fieldset>';
							htmls += 		'<div class="sale-dropbox-list-group">';
							htmls += 			'<select name="sale-dropbox-list" class="sale-dropbox-list" onchange="updateDropbox('+e.goods_id+', this.value)">';
							if (e.state == "판매중") {
								htmls += 				'<option selected>판매중</option>';
								htmls += 				'<option>예약중</option>';
								htmls += 				'<option>판매완료</option>';
							} else if (e.state == "예약중") {
								htmls += 				'<option>판매중</option>';
								htmls += 				'<option selected>예약중</option>';
								htmls += 				'<option>판매완료</option>';
							} else if (e.state == "판매완료") {
								htmls += 				'<option>판매중</option>';
								htmls += 				'<option>예약중</option>';
								htmls += 				'<option selected>판매완료</option>';
							} else {
								htmls += 				'<option class="default">판매중</option>';
								htmls += 				'<option>예약중</option>';
								htmls += 				'<option>판매완료</option>';
							}
							htmls += 			'</select>';
							htmls += 		'</div>';
							htmls += 	'</fieldset>';
							htmls += '</div>';
							htmls += 	'</div>';

						});

					} else {
						htmls = '<div class="no-sale"><p>조회결과가 없습니다.</p></div>';
					}

					$('#menuList').html(htmls);
				}
			},
			error : function(e) {
				console.log(e);
			}
		});
	}
	
	function updatePaging(callFunc, page, allRowCnt, perPgLine, pgGrpCnt){
		var boardPager	= $('.board-pager');
		var	pager		= drawPager(callFunc, page, allRowCnt, perPgLine, pgGrpCnt);
				
		boardPager.empty();
		boardPager.append(pager);
	}
	
	// 미사용
	function mypage_sale_list () {
		alert("이거 뜨면 mypage_sale_list 찾아서 pageMove로 바꿔야함");
	}
	
	function updateDropbox (value1, value2) {
		var paramData = {
			goods_id : value1,
			state : value2
		};
		
		$.ajax({
			url : "${uptDropboxURL}"
			, type : "POST"
			, dataType : "json"
			, data : paramData
			, success : function(result){
				console.log(result);
				if (result.status == "OK") {
					alert(result.returnMsg);
				} else {
					alert(result.returnMsg);
					console.log("조회실패");
				}
			}
		});
	}
	
	function fn_saleDelete(value1) { // 삭제 버튼 alert

		if(!confirm("정말 삭제하시겠습니까?")) {
			return false;
		}
		
		var paramData = {
			goods_id : value1
		};
		
		$.ajax({
			url : "${deleteSaleURL}"
			, type : "POST"
			, dataType : "json"
			, data : paramData
			, success : function(result){
				console.log(result);
				if (result.status == "OK") {
					alert(result.returnMsg);
					pageMove(saleNowPgNum);
				} else {
					alert(result.returnMsg);
					console.log("조회실패");
				}
			}
		});
	}
	</script>
</body>