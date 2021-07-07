<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<script>
 window.onload=function(){
	 var result = "${result}"
	 if(result==1){
		 alert("신청되었습니다.");
		 window.close();
	 }else if(result==2){
		 alert("종료된 게시글입니다.");
		 window.close();
	 }
 }
</script>
<body>

</body>
</html>