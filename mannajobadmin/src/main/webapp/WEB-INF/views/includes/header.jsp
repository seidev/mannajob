<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">

<head>
  <meta charset="utf-8">
  <title>manajob</title>
  <meta name="viewport" content="width=device-width, initial-scale=1.0" />
  <meta name="description" content="" />
  <meta name="author" content="" />

  <!-- css -->
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
  
</head>
  <style>
    body,
    h1,
    h5 {
      font-family: 'Sunflower', sans-serif;
    }

    .height_40 {
      padding-top: 30px;
    }

  </style>

<body>
  <div id="wrapper">
      <!-- start header -->
    <header>
      <div class="container "> 
       
        <div class="row nomargin">
          <div class="span12">
            <div class="headnav">
              <ul>

                <!-- 로그인 체크 시작  <sytle.css : headnav>
                로그인일경우
                <li>홍길동님</li>
                <li><a href="#" data-toggle="modal"> 로그아웃</a></li> 
              
                 로그아웃일경우-->
                <li>
                	<c:choose>
						<c:when test="${userId eq null}">
							<a href="/login">로그인</a>
						</c:when>
					<c:otherwise>
							<a href="/profile/main">${userId}님</a>
						</c:otherwise>
					</c:choose>
				</li>
                <li>
               		<c:choose>
						<c:when test="${userId eq null}">
							<a href="/join/member_agree">회원가입</a>
						</c:when>
					<c:otherwise>
							<a href="/logout">로그아웃</a>
						</c:otherwise>
					</c:choose>

                <!-- 로그인 체크 끝-->
              </ul>
            </div>
          </div>
        </div>
        <div class="row nomargin">
           <!-- 상단 로고이미지 시작-->
          <div class="span4">
            <div class="logo">
              <a href="/main"><img src="/resources/img/MANNAJOB.png" alt="" class="logo" /></a>
              <h1>취업준비생 - 현직자</h1>
              <h1>직무지식 거래 매칭 시스템</h1>
            </div>
          </div>
          <div class="">
            <!-- 검색창 시작-->
             <div class="">
               <form class="form-search" method="get" action="/bmatch/search">
                 <input placeholder="기업명을 입력해주세요" type="text" class="input-medium search-query" name="b_corp">
                 <input type="submit" class="btn btn-square btn-theme" value="Search">
               </form>
             </div>
            <!-- 검색창 끝-->            
           </div>
           <!-- 상단 로고이미지 끝-->
           <div class="">
          <div class="navbar navbar-static-top">

              <!-- 상단 메뉴시작 navigation  style.css   menu> -->
              <div class="navigation">
                <nav>
                  <ul class="nav topnav">
                  <!-- <ul class="recent"> -->
                    <li>
                      <a href="/bmatch/list?b_category=A">매&nbsp&nbsp칭</a>
                    </li>
                    <li>
                      <a href="/qna/list">게시판</a>
                    </li>
                    <li>
                      <a href="/chart/chart_cnt">통&nbsp&nbsp계</a>
                    </li>
                    <li>
                      <a href="/match/matlist">마이페이지</a>
                    </li>
                    <li>
                      <a href="/admin/manage">관리자</a> 
                    </li> 
                  </ul>
                </nav>
              </div>
              <!-- 상단 메뉴시작 끝-->
              

            </div>
          </div>
        </div>
      </div>
    </header>
    <!-- end header -->
