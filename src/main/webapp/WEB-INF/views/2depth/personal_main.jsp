<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ include file="/WEB-INF/views/_inc/header.jsp"%>
<!doctype html>
<script src="https://kit.fontawesome.com/5aa651adbf.js" crossorigin="anonymous"></script>
<link rel="stylesheet" href="<%=request.getContextPath()%>/assets/css/personal_write_style.css?ver=<%=System.currentTimeMillis()%>" />
<link rel="stylesheet" href="<%=request.getContextPath()%>/assets/css/reset.css?ver=<%=System.currentTimeMillis()%>" />
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css"/>

<meta charset="utf-8"/>
<meta http-equiv="X-UA-Compatible" content="IE=edge"/>
<meta name="viewport" content="width=device-width,initial-scale=1.0,minimum-scale=1.0,maximum-scale=1.0,user-scalable=no"/>
<body>

	<div class="personal_write">
		<div class = "personal-title">
			문의하기
		</div>
		<div class="clear"></div>
		<!--글쓰기 내용 -->
		<div class="content_all">
			<!-- 문의하기 -->
			<div class="content_input" id="content_input2">
				<%@ include file="/WEB-INF/views/2depth/personal_write.jsp"%>
			</div>
			<!-- 문의내역 -->
			
		</div>
	</div>
	<%@ include file="/WEB-INF/views/_inc/footer.jsp"%>
	<script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
	<script src="<%=request.getContextPath()%>/assets/plugins/sweetalert/sweetalert2.all.min.js"></script>
	<script src="<%=request.getContextPath()%>/assets/plugins/validate/jquery.validate.min.js"></script>
	<script src="<%=request.getContextPath()%>/assets/plugins/validate/additional-methods.min.js"></script>  
	<script type="text/javascript">
	$(function(){
		/*===========탭===========*/
		
		/*===========탭===========*/
	});
	</script>
	<script src="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
</body>