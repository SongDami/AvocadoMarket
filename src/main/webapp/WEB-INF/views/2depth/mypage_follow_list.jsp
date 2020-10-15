<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>


<!doctype html>
<html>
<head>
    <meta charset="UTF-8" />
    <title>Avocado Market 마이페이지</title>
</head>



<link rel="stylesheet" href="<%=request.getContextPath()%>/assets/css/reset.css?ver=<%=System.currentTimeMillis()%>" />
<link rel="stylesheet" href="<%=request.getContextPath()%>/assets/css/mypage_follow_list_style.css?ver=<%=System.currentTimeMillis()%>" />


<body>


        <div class="follow-item-group">

            <div class="follow-item-list">
                <a href="<%= request.getContextPath()%>/3depth/seller_list_page.do"><img src="//via.placeholder.com/250x250" class="img" /></a>
                <br/>
                <div class="name-price-group">
                <span class="name"><a href="#">닉네임</a></span>
                <br/>
                </div>
            <div class="clear"></div>
            <div class="follow-list-button-group">
                <div class="follow-list-button">
                    <div class="unfollow">
                        <button type="submit" class="unfollow-btn" onClick="unfollow()">팔로우 취소</button>
                    </div>
                </div>
            </div>
            </div>




            <div class="follow-item-list">
                <a href="<%= request.getContextPath()%>/3depth/seller_list_page.do"><img src="//via.placeholder.com/250x250" class="img" /></a>
                <br/>
                <div class="name-price-group">
                <span class="name"><a href="#">닉네임</a></span>
                <br/>
                </div>
            <div class="clear"></div>
            <div class="follow-list-button-group">
                <div class="follow-list-button">
                    <div class="unfollow">
                        <button type="submit" class="unfollow-btn" onClick="unfollow()">팔로우 취소</button>
                    </div>
                </div>
            </div>
            </div>




            <div class="follow-item-list">
                <a href="<%= request.getContextPath()%>/3depth/seller_list_page.do"><img src="//via.placeholder.com/250x250" class="img" /></a>
                <br/>
                <div class="name-price-group">
                <span class="name"><a href="#">닉네임</a></span>
                <br/>
                </div>
            <div class="clear"></div>
            <div class="follow-list-button-group">
                <div class="follow-list-button">
                    <div class="unfollow">
                        <button type="submit" class="unfollow-btn" onClick="unfollow()">팔로우 취소</button>
                    </div>
                </div>
            </div>
            </div>




            <div class="follow-item-list">
                <a href="<%= request.getContextPath()%>/3depth/seller_list_page.do"><img src="//via.placeholder.com/250x250" class="img" /></a>
                <br/>
                <div class="name-price-group">
                <span class="name"><a href="#">닉네임</a></span>
                <br/>
                </div>
            <div class="clear"></div>
            <div class="follow-list-button-group">
                <div class="follow-list-button">
                    <div class="unfollow">
                        <button type="submit" class="unfollow-btn" onClick="unfollow()">팔로우 취소</button>
                    </div>
                </div>
            </div>
            </div>




            <div class="follow-item-list">
                <a href="<%= request.getContextPath()%>/3depth/seller_list_page.do"><img src="//via.placeholder.com/250x250" class="img" /></a>
                <br/>
                <div class="name-price-group">
                <span class="name"><a href="#">닉네임</a></span>
                <br/>
                </div>
            <div class="clear"></div>
            <div class="follow-list-button-group">
                <div class="follow-list-button">
                    <div class="unfollow">
                        <button type="submit" class="unfollow-btn" onClick="unfollow()">팔로우 취소</button>
                    </div>
                </div>
            </div>
            </div>




            <div class="follow-item-list">
                <a href="<%= request.getContextPath()%>/3depth/seller_list_page.do"><img src="//via.placeholder.com/250x250" class="img" /></a>
                <br/>
                <div class="name-price-group">
                <span class="name"><a href="#">닉네임</a></span>
                <br/>
                </div>
            <div class="clear"></div>
            <div class="follow-list-button-group">
                <div class="follow-list-button">
                    <div class="unfollow">
                        <button type="submit" class="unfollow-btn" onClick="unfollow()">팔로우 취소</button>
                    </div>
                </div>
            </div>
            </div>




            <div class="follow-item-list">
                <a href="<%= request.getContextPath()%>/3depth/seller_list_page.do"><img src="//via.placeholder.com/250x250" class="img" /></a>
                <br/>
                <div class="name-price-group">
                <span class="name"><a href="#">닉네임</a></span>
                <br/>
                </div>
            <div class="clear"></div>
            <div class="follow-list-button-group">
                <div class="follow-list-button">
                    <div class="unfollow">
                        <button type="submit" class="unfollow-btn" onClick="unfollow()">팔로우 취소</button>
                    </div>
                </div>
            </div>
            </div>




            <div class="follow-item-list">
                <a href="<%= request.getContextPath()%>/3depth/seller_list_page.do"><img src="//via.placeholder.com/250x250" class="img" /></a>
                <br/>
                <div class="name-price-group">
                <span class="name"><a href="#">닉네임</a></span>
                <br/>
                </div>
            <div class="clear"></div>
            <div class="follow-list-button-group">
                <div class="follow-list-button">
                    <div class="unfollow">
                        <button type="submit" class="unfollow-btn" onClick="unfollow()">팔로우 취소</button>
                    </div>
                </div>
            </div>
            </div>







        </div>
        <div class="clear"></div>


        <!-- 갤러리 하단 영역 -->
                        <div class="gallery-footer">
                            <div class="gallery-index">
                                <button class="prev-btn"><span>&lt;</span></button>
                                <ul class="index-list">
                                    <li><a class="index-indiv index-active">1</a></li>
                                    <li><a class="index-indiv">2</a></li>
                                    <li><a class="index-indiv">3</a></li>
                                    <li><a class="index-indiv">4</a></li>
                                    <li><a class="index-indiv">5</a></li>
                                    <li><a class="index-indiv">6</a></li>
                                    <li><a class="index-indiv">7</a></li>
                                </ul>
                                <button class="next-btn"><span>&gt;</span></button>
                            </div>
                        </div>
                        <!-- 갤러리 하단 영역 끝 -->





<script src="https://kit.fontawesome.com/f78786fc85.js" crossorigin="anonymous"></script>

<script type="text/javascript">

function unfollow() {
    
    var del = confirm("팔로우를 취소하시겠습니까?");
    
    if (del) {
        alert("팔로우가 취소되었습니다.");
        return true;
    }
    else {
        alert("팔로우가 취소되지 않았습니다.");
        return false;
    }
    
    
}


</script>



</body>
