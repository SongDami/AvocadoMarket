<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:url var="getblackListURL" value="/restMenu/getblackList"></c:url>
<c:url var="deleteBlackURL" value="/restMenu/deleteBlack"></c:url>


<!doctype html>
<html>
<head>
    <meta charset="UTF-8" />
    <title>Avocado Market 마이페이지</title>
</head>

<link rel="stylesheet" href="<%=request.getContextPath()%>/assets/css/reset.css?ver=<%=System.currentTimeMillis()%>" />
<link rel="stylesheet" href="<%=request.getContextPath()%>/assets/css/mypage_black_list_style.css?ver=<%=System.currentTimeMillis()%>" />

<body>
	<div id="black_list"></div>
	<div class="clear"></div>

	<!-- 갤러리 하단 영역 -->
	<div class="black_board-pager">
	</div>
	<!-- 갤러리 하단 영역 끝 -->
	
<!--Google CDN 서버로부터 jQuery 참조 -->
<script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
<script src="${pageContext.request.contextPath}/assets/js/pager.js"></script>
<script>
	var blackNowPgNum = 1;
	
	$(function() {
		mypage_black_list(blackNowPgNum);
	});

	function mypage_black_list(pg) {
		var contextPath = '<%= request.getContextPath() %>';
		
		var paramData = {
			nowPage : pg,
			perPgLine : 8
		};
		
		blackNowPgNum = pg;
		
		$.ajax({
			url : "${getblackListURL}"
			, type : "POST"
			, dataType :  "json"
			, data : paramData
			, success : function(result){
				console.log(result);
				if (result.status == "OK"){
					
					blackupdatePaging("mypage_black_list", pg, result.totalCount, result.perPgLine, 5);
	
					var htmls = "";
					
					if ( result.menuList.length > 0 ) {
						result.menuList.forEach(function(e) {
			htmls += '<div class="black-item-group">'
			htmls += '<div class="black-item-list">'
	
			htmls += '<form action="'+contextPath+'/3depth/seller_list_page.do">'
			htmls += '<img src="'+contextPath+'/uploadimage'+e.thumbnailPath+'" class="img" />'
		    htmls += '<input name="goods_id" type="hidden" value="'+e.member_id_to+'">'						    
		    htmls += '</form>'
			htmls += '<br/>'
			htmls += '<div class="name-group">'
			htmls += '<span class="user-name"><a href="#">'+e.nick+'</a></span>'
			htmls += '</div>'
			htmls += '<div class="clear"></div>'
			htmls += '<div class="black-clear-list-button-group">'
			htmls += '<div class="black-clear-list-button">'
			htmls += '<div class="black-clear">'
			htmls += '<button type="submit" class="black-clear-btn" onClick="deleteBlack('+ e.black_id +')">차단 해제</button>'
			htmls += '</div>'
			htmls += '</div>'
			htmls += '</div>'
			htmls += '</div>'
			htmls += '</div>'
			
						});
	
					} else {
						htmls = '<div class="no-black"><p>조회결과가 없습니다.</p></div>';
					}
	
					$('#black_list').html(htmls);
				}
			},
			error : function(e) {
				console.log(e);
			}
		});
	}

	function blackupdatePaging(callFunc, page, allRowCnt, perPgLine, pgGrpCnt){
		var boardPager	= $('.black_board-pager');
		var	pager		= drawPager(callFunc, page, allRowCnt, perPgLine, pgGrpCnt);
				
		boardPager.empty();
		boardPager.append(pager);
	}

	// 차단해제 버튼 alert
	function deleteBlack(value1) {

		if(!confirm("정말 차단해제 하시겠습니까?")) {
			return false;
		}
		
		var paramData = {
			black_id : value1
		};
		
		$.ajax({
			url : "${deleteBlackURL}"
			, type : "POST"
			, dataType : "json"
			, data : paramData
			, success : function(result){
				console.log(result);
				if (result.status == "OK") {
					alert(result.returnMsg);
					mypage_black_list(blackNowPgNum);
				} else {
					alert(result.returnMsg);
					console.log("조회실패");
				}
			}
		});
	}



</script>

</body>