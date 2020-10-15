<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<c:url var="editMypageURL" value="/restMenu/editMypage"></c:url>

<%@ include file="/WEB-INF/views/_inc/header.jsp"%>

<!doctype html>
<html>
<head>
    <meta charset="UTF-8" />
    <title>Avocado Market 마이페이지</title>
</head>

<link rel="stylesheet" href="<%=request.getContextPath()%>/assets/css/reset.css?ver=<%=System.currentTimeMillis()%>" />
<link rel="stylesheet" href="<%=request.getContextPath()%>/assets/css/realmypage_style.css?ver=<%=System.currentTimeMillis()%>" />
<link rel="stylesheet" href="<%=request.getContextPath()%>/assets/plugins/sweetalert/sweetalert2.min.css" />



<body>

    <div class="mytool">
        <div class="title">
            <h1>마이페이지</h1>
        </div>
        <!-- 프로필 사진 -->
        <form id="profile_form" class="user_img" method="post" enctype="multipart/form-data">
        	<input type="hidden" id="member_id" value="${item.member_id}"/>
            <img id="profile_img" class="img-rounded" src="<%= request.getContextPath() %>/uploadimage${item.thumbnailPath}" width="140px" height="140px" />
           <div class="edit-profile">
              <label for="image_Input">프로필 수정</label>
              <input type="file" id="image_Input" name="image_Input" class="profile-input"accept="image/*"/>
           </div>
        </form>
        
        <div class="usernick">
            <img src="<%= request.getContextPath() %>/uploadimage/favicon.ico"  width="23px" height="23px"/>
            <span>${item.nick}</span>
        </div>
        <div class="bt">
            <button class="edit"><a href="<%= request.getContextPath()%>/3depth/member_edit.do">회원정보수정</a></button>
            <button class="bye" onClick="member_delete()">회원탈퇴</button>
        </div>
 
        <div class="tab">
            <!-- 탭 버튼 영역 -->
            <ul class="tab-button clearfix">
            
                <li class="tab-button-item pull-left">
                    <a class="tab-button-item-link selected" href="#tab-sale-list" >판매목록</a>
                </li>                
                <li class="tab-button-item pull-left">
                    <a class="tab-button-item-link" href="#tab-interest-list">관심상품</a>
                </li>                
                <li class="tab-button-item pull-left">
                    <a class="tab-button-item-link" href="#tab-black-list">블랙리스트</a>
                </li>
            </ul>
            <!-- 내용 영역 -->
            <div class="tab-panel">      
                <div id="tab-sale-list">
                   <%@ include file="/WEB-INF/views/2depth/mypage_sale_list.jsp"%>
                </div>
                <div id="tab-interest-list" class="hide"> 
                   <%@ include file="/WEB-INF/views/2depth/mypage_interest_list.jsp"%>
                </div>
                <div id="tab-black-list" class="hide">
                   <%@ include file="/WEB-INF/views/2depth/mypage_black_list.jsp"%>
                </div>
            </div>
        </div>
     </div>
     
<script src="http://code.jquery.com/jquery-3.2.1.min.js"></script>
<script src="<%=request.getContextPath()%>/assets/plugins/sweetalert/sweetalert2.all.min.js"></script>
<script type="text/javascript">
//프로필 사진 미리보기
$(function(){
	$("#image_Input").on('change', function(){
		readURL(this);

		// 이미지 디비 등록
		
		var form = $('#profile_form')[0];

		// FormData 객체 생성
		var formData = new FormData(form);
		formData.append("member_id", $("#member_id").val());

		$.ajax({
			url : "${editMypageURL}"
			, type : "POST"
			, data : formData
			, enctype: 'multipart/form-data'
			, processData: false
			, contentType: false
			, cache: false
			, timeout: 600000
			, success : function(result){
				console.log(result);
				if (result.status == "OK") {
					alert("수정되었다");
				} else {
					alert(result.returnMsg);
					console.log("수정실패");
				}
			}
		});
   });
});

   function readURL(input) {
      if(input.files && input.files[0]) {
         var reader = new FileReader();
         
         reader.onload = function(e) {
            $('#profile_img').attr('src',e.target.result);
         }
         
         reader.readAsDataURL(input.files[0]);
      }
   }
   
//프로필 사진 수정 alert
$(function(){
   $("#edit_btn").click(function(){
      
   });
});




$(function() {
   
   // 탭버튼의 클릭 처리
   $(".tab-button-item-link").click(function(e){
      e.preventDefault();
      
      // 클릭 된 요소를 제외한 나머지에게 seleced 클래스 제거하기. 
      $(".tab-button-item-link").not(this).removeClass("selected");
      
      // 클릭 된 요소에세 seleced 클래스 적용
      $(this).addClass("selected");
      
      var target = $(this).attr('href');
      $(target).removeClass('hide');
      $(".tab-panel > div").not($(target)).addClass('hide');
      
      if ("#tab-sale-list" == $(this).attr('href')) { // 판매목록
         pageMove(1);
      }else if("#tab-interest-list" == $(this).attr('href')){  // 관심목록
         mypage_interest_list(1);
      }else if("#tab-black-list" == $(this).attr('href')){  //블랙리스트목록
         mypage_black_list(1);
      }
   
   });
});



function member_delete() {            // 회원탈퇴 버튼 alert
    
    var del_member = confirm("정말 탈퇴하시겠습니까?");
    
    if (del_member) {
        alert("탈퇴되었습니다.");
        return true;
    }
    else {
        alert("취소되었습니다.");
        return false;
    }   
}

// 등급 안내 팝업 스크립트

function goGrade(){         
    var popup = window.open("../3depth/grade.jsp","popup","width=610,height=610, scrollbars=yes, resizable=yes"); 
    }


</script>

<%@ include file="/WEB-INF/views/_inc/footer.jsp"%>
</body>
</html>