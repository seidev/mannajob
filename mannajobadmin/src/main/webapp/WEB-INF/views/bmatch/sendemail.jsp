<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<script type="text/javascript">
window.onload=function(){
	 var result = "${result}"
	 if(result==1){
		 alert("정상처리되었습니다.");
		 window.close();
	 }else if(result==2){
		 alert("현직자 등록이 필요합니다.");
		 window.close();
	 }else if(result==3){
		 alert("로그인이 필요합니다.");
	 }
	 
}
</script>
<body>

</body>
</html>