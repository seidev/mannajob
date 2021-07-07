<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="https://fonts.googleapis.com/css?family=Noto+Serif:400,400italic,700|Open+Sans:300,400,600,700" rel="stylesheet">
  <link rel="preconnect" href="https://fonts.gstatic.com">
  <link href="https://fonts.googleapis.com/css2?family=Nanum+Gothic:wght@700&family=Sunflower:wght@500&display=swap"
    rel="stylesheet">
  <link href="/resources/css/bootstrap.css" rel="stylesheet" />
  <link href="/resources/css/bootstrap-responsive.css" rel="stylesheet" />
  <link href="/resources/css/fancybox/jquery.fancybox.css" rel="stylesheet">
  <link href="/resources/css/jcarousel.css" rel="stylesheet" />
  <link href="/resources/css/flexslider.css" rel="stylesheet" />
  <link href="/resources/css/style.css" rel="stylesheet" />
  <!-- Theme skin -->
  <link href="/resources/skins/default.css" rel="stylesheet" />
  <!-- Chart -->
  <link href="/resources/css/chart.css" rel="stylesheet">
  <!-- Fav and touch icons -->
  <link rel="apple-touch-icon-precomposed" sizes="144x144" href="/resources/ico/apple-touch-icon-144-precomposed.png" />
  <link rel="apple-touch-icon-precomposed" sizes="114x114" href="/resources/ico/apple-touch-icon-114-precomposed.png" />
  <link rel="apple-touch-icon-precomposed" sizes="72x72" href="/resources/ico/apple-touch-icon-72-precomposed.png" />
  <link rel="apple-touch-icon-precomposed" href="/resources/ico/apple-touch-icon-57-precomposed.png" />
  <link rel="shortcut icon" href="/resources/ico/MJfavi.png" />
<title>매칭 요청취소</title>
<script type="text/javascript">
function popclose(form) {
	form.target = opener.name;
	form.submit();
	
	if(opener != null) {
		opener.insert = null;
		self.close();
	}
}
</script>
<style type="text/css">
div{
	margin: 0 auto;
	padding-top:50px;
	padding-bottom:50px;
	width:200px;
}
h7{
	text-align: center;
}
form{
	margin:0 auto;
	align-content: center;
}
</style>
</head>
<body>
<div>
<h7>매칭 요청을 취소하시겠습니까?</h7>
<form action="/match/cancel" method="post" target="matlist">
<input type="hidden" name="mat_num" value="${mat_num}">
<input class="btn btn-theme margintop10 i_btn4" type="submit" value="확인" onclick="window.close()">
<input class="btn btn-inverse margintop10 i_btn4" type="button" value="취소" onclick="window.close()">
</div>

</form>
</body>
</html>