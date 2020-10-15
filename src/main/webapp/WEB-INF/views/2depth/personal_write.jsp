<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>

<!doctype html>
<script src="https://kit.fontawesome.com/5aa651adbf.js" crossorigin="anonymous"></script>
<link rel="stylesheet" href="<%=request.getContextPath()%>/assets/css/personal_write_style.css?ver=<%=System.currentTimeMillis()%>" />
<link rel="stylesheet" href="<%=request.getContextPath()%>/assets/css/reset.css?ver=<%=System.currentTimeMillis()%>" />
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css"/>

<meta charset="utf-8"/>
<meta http-equiv="X-UA-Compatible" content="IE=edge"/>
<meta name="viewport" content="width=device-width,initial-scale=1.0,minimum-scale=1.0,maximum-scale=1.0,user-scalable=no"/>
<body>
	<form class="input_form" id="input_form"  enctype="multipart/form-data">
		<div class="input_class">
			<div class="content_title_class">
				<p class="title"><b>제목</b></p>
				<textarea maxlength="20" type="text" name="title" class="title_input" id="comment_origin_input" placeholder="제목 : 공지사항/ 제목 20글자 이하" ></textarea>
			</div>
		</div>
		<div class="input_class">
			<div class="content_last">
				<p class="content_last_title"><b>내용</b></p>
				<textarea maxlength="300" type="text" name="content" class="content_last_input" id="content_last_input" placeholder="내용을 입력해주세요"></textarea>
			</div>
		</div>
		<div class="botton_class">
			<button type="submit" class="botton_submit" id="comment_origin_submit">문의신청</button>
		</div>
	</form>
	<script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
	<script src="<%=request.getContextPath()%>/assets/plugins/sweetalert/sweetalert2.all.min.js"></script>
	<script src="<%=request.getContextPath()%>/assets/plugins/validate/jquery.validate.min.js"></script>
	<script src="<%=request.getContextPath()%>/assets/plugins/validate/additional-methods.min.js"></script>
	<script type="text/javascript">
	$(function(){

		$('#comment_origin_submit').click(function(e) {
			
			/* 플러그인의 기본 설정 옵션 */
			jQuery.validator.setDefaults({
				onkeyUp:false,
				onclick:false,
				onfocusout:false,
				showErrors:function(errorMap, errorList){
					// 에러가 있을 때만
					if(this.numberOfInvalids()){
						alert(errorList[0].message);
						$(errorList[0].element).focus();
					}
				},
				submitHandler: function(form) {
					//$(form).submit();
					alert('등록되었습니다');
					
					$("#tab1").removeClass("selected");
					
					$("#tab2").addClass("selected");
					
					var target = $("#tab2").attr('href');
					
					$(target).removeClass('hide');
					$(".content_all > div").not($(target)).addClass('hide');
					
					$('tbody .tr_reply').hide();
					$('tbody').find('.tr_origin').show();
				
				}
				
			});
			/*===========문의하기 글자수  버튼===========*/
			/* form 태그에 부여한 id속성에 대한 유효성 검사 함수 호출 */
			$("#input_form").validate({
				/* 입력검사 규칙 */
				rules: {
					// [제목] 필수, 길이 제한
					title: { required: true, maxlength: 30 },
				
					// [본문] 필수
					content: { required : true, maxlength: 300}
				},
				/* 규칙이 맞지 않을 경우의 메시지 */
				messages: {
					title: {
						required: "제목을 입력하세요.",
						maxlength: "제목은 최대 30자까지 가능합니다."
					},
					content: {
						required: "내용을 입력해주세요"
					}
				}
			}); // end validate()
		});
		
		/* $("#comment_origin_submit").click(function(){
			var form = document.title_input_form;
			var form2 = document.content_last_input_form;
			
			if (form.title_input.value.length == 0) {
				alert('제목을 입력하세요');
			}else{
				if (form2.content_last_input.value.length == 0) {
					alert('내용을 입력하세요');
				
				}else{
					alert('문의 신청이 완료 되었습니다.');
					form.title_input.value = "";
					form2.content_last_input.value = "";
				}
			} 
		}); */
		/*===========문의하기 글자수  버튼===========*/

		$("#tab1").click(function(e){
			$("#comment_origin_input").val("");
			$("#content_last_input").val("");
			//document.input_form.title_input.value = "";
// 			document.input_form.content_last_input.value = "";
		});
	});
	</script>
	<script src="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
</body>