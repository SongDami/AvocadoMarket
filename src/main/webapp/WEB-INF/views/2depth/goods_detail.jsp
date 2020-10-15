<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!-- 댓글관련 -->
<c:url var="insertcommentURL" value="/restMenu/insertcomment"></c:url>
<c:url var="selectcommentURL" value="/restMenu/selectcomment"></c:url>
<c:url var="deletecommentURL" value="/restMenu/deletecomment"></c:url>
<c:url var="updatecommentURL" value="/restMenu/updatecomment"></c:url>

<!-- 등록자 신고하기 -->
<c:url var="addReportURL" value="/restMenu/addReport"></c:url>

<!-- 찜하기 -->
<c:url var="addLikeURL" value="/restMenu/addLike"></c:url>
<c:url var="deleteLikeURL" value="/restMenu/deleteLike"></c:url>

<!-- 인기상품 조회 -->
<c:url var="getPopularListURL" value="/restMenu/getPopularList"></c:url>

<!-- 사용자 차단하기 -->
<c:url var="blackcommentURL" value="/restMenu/blackcomment"></c:url>

<%@ include file="/WEB-INF/views/_inc/header.jsp"%>
<!doctype html>
<link rel="stylesheet" href="<%=request.getContextPath()%>/assets/css/goods_detail_style.css?ver=<%=System.currentTimeMillis()%>" />
<link rel="stylesheet" href="<%=request.getContextPath()%>/assets/css/reset.css?ver=<%=System.currentTimeMillis()%>" />
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<link rel="stylesheet" href="<%=request.getContextPath()%>/assets/plugins/sweetalert/sweetalert2.min.css">
<body>
	<div class="goods_detail_content">
		<div class="product_view">
			<input type="hidden" id="goods_id" value="${output1.goods_id}"></input>
			<h2><strong>${output1.goods_name}</strong></h2>
			<p class="detail_price">${output1.priceNum}원</p>
					
			<!--이미지 슬라이딩 -->
			<div class="detail_main_img">
				<div id="carousel-example-generic" class="carousel slide" data-ride="carousel">
					<!-- Wrapper for slides -->
					<div class="carousel-inner" role="listbox">
						<!-- output2(첨부파일)이 1개도 없을 경우 기본이미지 세팅 -->
						<c:if test="${fn:length(output2) == 0}">
								<div class="item active">
									<img src="<%= request.getContextPath() %>/uploadimage/favicon.ico" />
									<div class="carousel-caption">
									</div>
								</div>
						</c:if>
						<c:if test="${fn:length(output2) > 0}">
							<c:forEach var="item" items="${output2}" varStatus="status">
								<c:if test="${status.index == 0}">
									<div class="item active">
										<img src="<%= request.getContextPath() %>/uploadimage${item.filePath}" />
										<div class="carousel-caption">
										</div>
									</div>
								</c:if>
								<c:if test="${status.index != 0}">
									<div class="item">
										<img src="<%= request.getContextPath() %>/uploadimage${item.filePath}" />
										<div class="carousel-caption">
										</div>
									</div>
								</c:if>
							</c:forEach>
						</c:if>
					</div>
					<!-- Controls -->
					<a class="left carousel-control" href="#carousel-example-generic" role="button" data-slide="prev">
						<span class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
						<span class="sr-only">Previous</span>
					</a>
					<a class="right carousel-control" href="#carousel-example-generic" role="button" data-slide="next">
						<span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
						<span class="sr-only">Next</span>
					</a>
				</div>
			</div>
			
			<div class="detail_counter">
				<div class="detail_counter_p1_div">
					<p class="detail_counter_p1">찜개수 : </p>
					<p class="detail_counter_p1">${output1.like_num}</p>
				</div>	
				<div class="detail_counter_p2_div">
					<p class="detail_counter_p2">조회수 : </p>
					<p class="detail_counter_p2">${output1.hit}</p>
				</div>
				<div class="detail_counter_p3_div">
					<p class="detail_counter_p3">올린시간 : </p>
					<p class="detail_counter_p3">${output1.updated_at}</p>
				</div>
				<div class="detail_div">
					<p class="detail_tr_last">거래지역 :</p>
					<p class="detail_area">${output1.dong_name}</p>
				</div>
				<div class="detail_nick">
					<a href="#layer" class="btn-black" id="btn_black"><i class="fas fa-exclamation-circle">신고하기</i></a>
					<div id="layer" class="layer-wrap">
						<div class="pop-layer">
							<div class="pop-container">
								<div class="pop-conts">
									<h3>신고하기</h3>
									<div class="layer-content">
										<button class="button" onclick="selectBlackState('A')">광고(신청홍보, 낚시글, 도배글)</button>
										<button class="button" onclick="selectBlackState('B')">물품정보 부정확(카테고리, 가격, 사진)</button>
										<button class="button" onclick="selectBlackState('C')">거래금지 품목(담배, 주류, 장물)</button>
										<button class="button" onclick="selectBlackState('D')">언어폭력(비방, 욕설, 성희롱)</button>
										<button class="button" onclick="selectBlackState('E')">기타사유</button>
									</div>
									<div class="btn-r">
										<a href="#" class="btn-layerClose">닫기</a>
										<a href="#" class="btn-layerSbmit">확인</a>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
			<div class="detail_send">
				<button type="button" class="btn-img1" id="like_button" value="${output1.like_yn}">
					<c:if test="${output1.like_yn == 'Y'}">찜취소</c:if>
					<c:if test="${output1.like_yn == 'N'}">찜하기</c:if>
				</button>
				<a href="<%=request.getContextPath()%>/3depth/seller_list_page.do?member_id=${output1.member_id}"><button class="btn-img2">닉네임 : ${output1.nick}</button></a>
				</div>
		</div>
		<div class="detail_content">
		<p style="white-space:pre;"><c:out value="${output1.goods_content}" /></p>
		</div>
		<div class="before">
			<a href="<%=request.getContextPath()%>/2depth/map.do"><button type="submit" class="before_btn">목록으로 가기</button></a>
		</div>
		
		<!-- 댓글 목록 시작============================================================================================================================== -->
		
		<!-- ajax 방식 댓글 위치 -->
		<div class="comment" id="commentHtml">
		</div>
		
		<!-- 댓글 목록 끝============================================================================================================================== -->
		
		<!-- 댓글 입력 폼 -->
		<div class="textarea">
			<form action="">
				<textarea class="textarea_input" id="comment_origin_input" placeholder="100글자 이하 입력해주세요"></textarea> 
				<button type="button" class="textarea_button" id="comment_origin_submit" onclick="fn_insertComment()">댓글 입력</button>
			</form>
		</div>
		
		<!-- 인기상품============================================================================================================================== -->
		
		<div class="item-list">
			<div class="popular-item-title">
				<p class="list-title">인기상품</p>
			</div>
			<div class="popular-item" id="popular-item"></div>
		</div>
		
		<!-- 인기상품 끝============================================================================================================================== -->
		
	</div>
	<%@ include file="/WEB-INF/views/_inc/footer.jsp"%>
	
    <!--Google CDN 서버로부터 jQuery 참조 -->
	<script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
    <!-- Handlebar CDN 참조 -->
    <script src="//cdnjs.cloudflare.com/ajax/libs/handlebars.js/4.4.2/handlebars.min.js"></script>
    <!-- jQuery Ajax Setup -->
    <script src="${pageContext.request.contextPath}/assets/plugins/ajax/ajax_helper.js"></script>
	
<!-- 	<script src="https://code.jquery.com/jquery-3.3.1.min.js"></script> -->
	<script type="text/javascript">

	var commentLimitCnt = 5;
	/**
	 * 초기 페이지 로딩시 댓글 불러오기
	 */
	$(document).ready(function () {
		getCommentList(commentLimitCnt);
	});
	
	/*
	 * 댓글 차단 확인버튼
	 */
	function fn_btn5click(value1) {
		var paramData = {
			member_id_to : value1
		};
		
		$.ajax({
			url : "${blackcommentURL}"
			, type : "POST"
			, dataType : "json"
			, data : paramData
			, success : function(result){
				console.log(result);
				if (result.status == "OK") {
					alert(result.returnMsg);
					getCommentList(commentLimitCnt);
				} else {
					alert(result.returnMsg);
					console.log("수정실패");
				}
			}
		});
	}
	
	/**
	 * 댓글 조회하기(Ajax)
	 */
	function getCommentList(cnt) {
		var contextPath = '<%= request.getContextPath() %>';
		var paramData = {
			goods_id : $('#goods_id').val(),
			limitCnt : cnt
		};
		
		$.ajax({
			type	 : "POST",
			url 	 : "${selectcommentURL}",
			dataType : "json",
			data	 : paramData,
			success : function(result) {
				console.log(result);
				if (result.status == "OK") {

					var htmls = "";
					var cCnt = result.commentList.length;
					var totCnt = result.cmtCount;
					
					htmls += '<p class="comment_1">댓글('+ cCnt +')</p>'; // 댓글리스트의 타이틀 급
					
					if (result.commentList.length > 0) {
						
						result.commentList.forEach(function(e) {
							
							htmls += '<p class="comment_2">'+e.nick+'</p> ';
							htmls += '<p class="comment_3">'+e.created_at+'</p> ';
							htmls += '<p class="comment_4">'+e.updated_at+'</p> ';
							
							if (e.editYn == "Y") {
								htmls += '<button type="button" class="comment_btn1" id="comment_btn1'+e.goods_comment_id+'" onclick="fn_btn1click('+e.goods_comment_id+')">수정</button>';
								htmls += '<button type="button" class="comment_btn2" id="comment_btn2'+e.goods_comment_id+'" onclick="fn_btn2click('+e.goods_comment_id+')">삭제</button>';
								htmls += '<button type="button" class="comment_btn4" id="comment_btn4'+e.goods_comment_id+'" onclick="fn_btn4click('+e.goods_comment_id+')">취소</button>';
								htmls += '<div class="comment_bottom" id="comment_bottom'+e.goods_comment_id+'">';
								htmls += 	'<textarea class="comment_input" id="comment_input'+
											e.goods_comment_id+'"maxlength="100" type="text" placeholder="100글자 이하 입력해주세요"></textarea>';
								htmls += 	'<button type="button" class="comment_btn3" id="comment_btn3'+e.goods_comment_id+'" onclick="fn_btn3click('+e.goods_comment_id+')">확인</button>';
								htmls += '</div>';
							}else{
								htmls += '<button type="button" class="comment_btn5" id="comment_btn5'+e.goods_comment_id+'" onclick="fn_btn5click('+e.member_id+')">차단</button>';
							}
							htmls += '<p class="comment_5">'+e.goods_c_content+' </p><hr>';
						});
						
						// 더보기 버튼
						if (totCnt > cCnt) { // 댓글 전체 갯수 > 현재 불러온 댓글의 갯수
							htmls += '<button class="comment_plus_div" onclick="fn_btnMore(5)">더보기</button>';
						}

					} else {
						htmls = "<h6><strong>등록된 댓글이 없습니다.</strong></h6>";
					}
					
					$("#cCnt").html(cCnt);
					$("#commentHtml").html(htmls);
				}
			},
			error : function(e) {
				console.log(e);
			}
		});
	}

	/*
	 * 더보기 버튼 클릭
	 */
	function fn_btnMore(moreCnt) {
		commentLimitCnt = commentLimitCnt + moreCnt;
		getCommentList(commentLimitCnt);
	}
	
	/*
	 * 댓글 등록하기
	 */
	function fn_insertComment() {
		
		var content = $('textarea[id=comment_origin_input]').val();
		
		if (content == "") {
			alert("내용이 입력되지 않았습니다.");
			return false;
		}

		var paramData = {
			goods_id : $('#goods_id').val(),
			goods_c_content : content
		};
		
		$.ajax({
			url : "${insertcommentURL}"
			, type : "POST"
			, dataType : "json"
			, data : paramData
			, success : function(result){
				console.log(result);
				if (result.status == "OK") {
					alert(result.returnMsg);
					$('textarea[id=comment_origin_input]').val("");
					getCommentList(commentLimitCnt);
				} else {
					alert(result.returnMsg);
					console.log("수정실패");
				}
			}
		});
	}
	
	/*
	 * 댓글 수정 버튼
	 */
	function fn_btn1click(goods_comment_id) {
		$('textarea[id=comment_input' + goods_comment_id + ']').toggle();
		$('button[id=comment_btn3' + goods_comment_id + ']').toggle();
		$('button[id=comment_btn3' + goods_comment_id + ']').css("color","#c9c9c9");
		$('button[id=comment_btn1' + goods_comment_id + ']').hide();
		$('button[id=comment_btn4' + goods_comment_id + ']').show();
	}

	/*
	 * 댓글 삭제버튼
	 */
	function fn_btn2click(value1) {

		if(!confirm("정말 삭제하시겠습니까?")) {
			return false;
		}
		
		var paramData = {
			goods_comment_id : value1
		};
		
		$.ajax({
			url : "${deletecommentURL}"
			, type : "POST"
			, dataType : "json"
			, data : paramData
			, success : function(result){
				console.log(result);
				if (result.status == "OK") {
					alert(result.returnMsg);
					getCommentList(commentLimitCnt);
				} else {
					alert(result.returnMsg);
					console.log("수정실패");
				}
			}
		});
	}

	/*
	 * 댓글 수정 확인버튼
	 */
	function fn_btn3click(value1) {
		
		var content = $('textarea[id=comment_input' + value1 + ']').val();
		
		if (content == "") {
			alert("내용이 입력되지 않았습니다.");
			return false;
		}
		
		var paramData = {
			goods_comment_id : value1,
			goods_c_content : content
		};
		
		$.ajax({
			url : "${updatecommentURL}"
			, type : "POST"
			, dataType : "json"
			, data : paramData
			, success : function(result){
				console.log(result);
				if (result.status == "OK") {
					alert(result.returnMsg);
					getCommentList(commentLimitCnt);
				} else {
					alert(result.returnMsg);
					console.log("수정실패");
				}
			}
		});
	}
	

	/*
	 * 댓글 수정 취소버튼
	 */
	function fn_btn4click(goods_comment_id) {
		$('textarea[id=comment_input' + goods_comment_id + ']').toggle();
		$('button[id=comment_btn3' + goods_comment_id + ']').toggle();
		$('button[id=comment_btn3' + goods_comment_id + ']').css("color","#c9c9c9");
		$('button[id=comment_btn1' + goods_comment_id + ']').show();
		$('button[id=comment_btn4' + goods_comment_id + ']').hide();
	}
	
	/*==============댓글 입력================*/
	
	$(function() {
		$('#comment_origin_submit').attr('disabled', 'disabled');
		
		$("#comment_origin_input").keyup(function() {
			var value = $(this).val();
			
			if (value.length >= 1) {
				$('#comment_origin_submit').removeAttr('disabled');
				$("#comment_origin_submit").css("color","white");
				$("#comment_origin_submit").css("background-color","#356211");
			} else {
				$('#comment_origin_submit').attr('disabled', 'disabled');
				$("#comment_origin_submit").css("color","#c9c9c9");
			}
		});
	});
	
	/*==========찜하기=============*/
	
	var priv_index = "#";
	var rindex = "a";
	
	$(function() {
		/*
		 * 인기상품 찜하기 버튼 클릭
		 */
		$('.product-div8').click(function(e) {
			e.preventDefault();
					
			if (priv_index == rindex) {
				$(this).css('background', 'url(<%=request.getContextPath()%>/assets/img/like.svg)');
				priv_index = "#";
				
			} else {
				$(this).css('background', 'url(<%=request.getContextPath()%>/assets/img/like-on.svg)');
				priv_index = rindex;
			}
		});

		/*
		 * 현재상품 찜하기 버튼 클릭
		 */
		$('#like_button').click(function(e) {
			e.preventDefault();
			
			var url = "${addLikeURL}";
			var paramData = {
				goods_id : $('#goods_id').val()
			};
			
			if ($('#like_button').val() == "N") { // 찜 안한 상태
				url = "${addLikeURL}";
			} else { // 이미 찜이 되어있으니 찜취소
				url = "${deleteLikeURL}";
			}
			
			$.ajax({
				url : url
				, type : "POST"
				, dataType : "json"
				, data : paramData
				, success : function(result) {
					console.log(result);
					if (result.status == "OK") {
						alert(result.returnMsg);
						$('#like_button').val(result.like_yn);
						
						if (result.like_yn == "N") {
							$('#like_button').text("찜하기");
						} else {
							$('#like_button').text("찜취소");
						}
						getPopularList();
					} else {
						alert(result.returnMsg);
						console.log("수정실패");
					}
				}
			});
		});
	}); 

	/*==========신고하기=============*/
	var blackState = ""; //신고상태
	
	$(function() {
		/*
		 * 신고하기 버튼 클릭
		 */
		$('.btn-black').on('click', function() {
			var target = $(this).attr('href');
			$(target).fadeIn();
		});

		/*
		 * 신고하기 닫기 버튼 클릭
		 */
		$('.btn-layerClose').on('click', function() {
			$('.layer-wrap').fadeOut();
		});

		/*
		 * 신고하기 확인 버튼 클릭
		 */
		$('.btn-layerSbmit').on('click', function() {

			if (blackState == "") {
				alert("신고구분을 선택해주시기 바랍니다.");
				return false;
			}
			
			// member_id_to   : 신고당한 사람, 상품 등록자
			var paramData = {
				goods_id : $('#goods_id').val(),
				member_id_to : ${output1.member_id},
				black_state : blackState
			};
			
			$.ajax({
				url : "${addReportURL}"
				, type : "POST"
				, dataType : "json"
				, data : paramData
				, success : function(result){
					console.log(result);
					if (result.status == "OK") {
						alert(result.returnMsg);
						$('.layer-wrap').fadeOut();
					} else {
						alert(result.returnMsg);
						console.log("수정실패");
					}
				}
			});
		});
	});

	/*
	 * 신고구분 선택
	 */
	function selectBlackState(value) {
		blackState = value;
	}
	
	/*==========연락하기=============*/

	/*========= 연락하기=============*/

	/*==========인기상품 조회=============*/

	$(function() {
		getPopularList();
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
								htmls += 	'<div class="product-div8" onClick="like_deleteURL('+e.goods_id+')" style="background: url('+contextPath+'/assets/img/like-on.svg);"></div>';
							} else {
								htmls += 	'<div class="product-div8" onClick="like_insertURL('+e.goods_id+')" style="background: url('+contextPath+'/assets/img/like.svg);"></div>';
							}
							htmls += '</div>';
							htmls += '</div>';
							htmls += '<a href="'+contextPath+'/2depth/goods_detail.do?goods_id='+e.goods_id+'">';
							htmls += 	'<span class="item-img"><img src="'+contextPath+'/uploadimage'+e.thumbnailPath+'"/></span>';
							htmls += 	'<div class="text">';
							htmls += 		'<p class="item-name">'+e.goods_name+'</p>';
							htmls += 		'<p class="price">'+e.priceNum+'원</p>';
							htmls += 		'<p class="town">'+e.dong_name+'</p>';
							htmls += 	'</div>';
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
	<script src="<%=request.getContextPath()%>/assets/plugins/sweetalert/sweetalert2.all.min.js"></script>
	<script src="https://kit.fontawesome.com/700af1b8de.js" crossorigin="anonymous"></script>
	<script src="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
	<script src="https://kit.fontawesome.com/700af1b8de.js" crossorigin="anonymous"></script>
</body>
