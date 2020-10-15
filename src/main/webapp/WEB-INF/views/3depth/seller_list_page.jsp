<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ include file="/WEB-INF/views/_inc/header.jsp"%>
<!doctype html>
<html>
<head>
<meta charset="UTF-8" />
<title>Avocado_Market 판매자 프로필</title>
</head>

<link rel="stylesheet" href="<%=request.getContextPath()%>/assets/css/reset.css?ver=<%=System.currentTimeMillis()%>" />
<link rel="stylesheet" href="<%=request.getContextPath()%>/assets/css/seller_list_page_style.css?ver=<%=System.currentTimeMillis()%>" />

<body>

	<div class="mytool">
		<div class="title">
			<h1>판매자 프로필</h1>
		</div>
		 <!-- 프로필 사진 -->
        <form id="profile_form" class="user_img" method="post" enctype="multipart/form-data">
        	<input type="hidden" id="member_id" value="${item.member_id}"/>
            <img id="profile_img" class="img-rounded" src="<%= request.getContextPath() %>/uploadimage${item.thumbnailPath}" width="140px" height="140px" />
        </form>
        
        <div class="usernick">
            <img src="<%= request.getContextPath() %>/uploadimage/favicon.ico"  width="23px" height="23px"/>
            <span>${item.nick}</span>
        </div>
		<div class="tab">
			<!-- 탭 버튼 영역 -->
			<ul class="tab-button clearfix">
				<li class="tab-button-item pull-left"><a class="tab-button-item-link selected" href="#tab-seller-sale-list">판매목록</a>
				</li>
			</ul>
			<!-- 내용 영역 -->
			<div class="tab-panel">
				<div id="tab-seller-sale-list">
					<%@ include file="/WEB-INF/views/3depth/seller_sale_list.jsp"%>
				</div>
			</div>
		</div>
	</div>


	<!-- 
<script src="https://kit.fontawesome.com/f78786fc85.js" crossorigin="anonymous"></script>
 -->
	<script src="http://code.jquery.com/jquery-3.2.1.min.js"></script>
	<script type="text/javascript">
	</script>
	
	<%@ include file="/WEB-INF/views/_inc/footer.jsp"%>
</body>
</html>