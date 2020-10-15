<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!doctype html>
<html lang='ko'>
<head>
<meta charset="utf-8" />
<title>Hello JSP</title>
</head>
<body>
    <h1>WebHelper를 활용한 파일 업로드 결과</h1>

    <h2>원본 이미지</h2>
    <img src="${item.fileUrl}" width="240" />

    <h2>썸네일 이미지 </h2>
    <img src="${item.thumbnailUrl}" width="64" />

    <h2>DB에 저장할 정보</h2>
    <ul>
        <li>fieldName: ${item.fieldName}</li>
        <li>orginName: ${item.orginName}</li>
        <li>contentType: ${item.contentType}</li>
        <li>fileSize: ${item.fileSize}</li>
        <li>filePath: ${item.filePath}</li>
        <li>thumbnail: ${item.thumbnailPath}</li>
    </ul>
</body>
</html>



