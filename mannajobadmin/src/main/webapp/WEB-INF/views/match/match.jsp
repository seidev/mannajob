<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
	
<!DOCTYPE html>
<html lang="ko">

<head>
  <meta charset="utf-8">
  <title>Flattern - Flat and trendy bootstrap site template</title>
  <meta name="viewport" content="width=device-width, initial-scale=1.0" />
  <meta name="description" content="" />
  <meta name="author" content="" />

  <!-- css -->
  <link href="https://fonts.googleapis.com/css?family=Noto+Serif:400,400italic,700|Open+Sans:300,400,600,700"
    rel="stylesheet">
  <link rel="preconnect" href="https://fonts.gstatic.com">
  <link href="https://fonts.googleapis.com/css2?family=Nanum+Gothic:wght@700&family=Sunflower:wght@500&display=swap"
    rel="stylesheet">
  <link href="css/bootstrap.css" rel="stylesheet" />
  <link href="css/bootstrap-responsive.css" rel="stylesheet" />
  <link href="css/fancybox/jquery.fancybox.css" rel="stylesheet">
  <link href="css/jcarousel.css" rel="stylesheet" />
  <link href="css/flexslider.css" rel="stylesheet" />
  <link href="css/style.css" rel="stylesheet" />
  <!-- Theme skin -->
  <link href="skins/default.css" rel="stylesheet" />
  <!-- Fav and touch icons -->
  <link rel="apple-touch-icon-precomposed" sizes="144x144" href="ico/apple-touch-icon-144-precomposed.png" />
  <link rel="apple-touch-icon-precomposed" sizes="114x114" href="ico/apple-touch-icon-114-precomposed.png" />
  <link rel="apple-touch-icon-precomposed" sizes="72x72" href="ico/apple-touch-icon-72-precomposed.png" />
  <link rel="apple-touch-icon-precomposed" href="ico/apple-touch-icon-57-precomposed.png" />
  <link rel="shortcut icon" href="ico/favicon.png" />

  <!-- =======================================================
    Theme Name: Flattern
    Theme URL: https://bootstrapmade.com/flattern-multipurpose-bootstrap-template/
    Author: BootstrapMade.com
    Author URL: https://bootstrapmade.com
  ======================================================= -->
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
  
</head>

<body>
  <div id="wrapper">
    <!-- start header -->
    <header></header>
    <!-- end header -->


    <section id="" style="min-height:680px">
      <div class="container">
        <div class="row">
          <div class="span8">
            <article>
              

                <div class="row">
                  <div class="post-heading">
                    <p class="line_9"></p>
                    <p class="line_9"></p>
                    <h3 style="color: #f84002;"><strong></strong>신청현황</h3>
                    <p class="line_9"></p>
                  </div>
                  
                  <!-- 신청현황 -->
                  <div class="span9">                   
                    <h5>▶ 신청현황</h5>
                    <div class="">
                      <form method="post" action="profile/match" class="form-horizontal span12">
                      
                        <div class="control-group center">            
                          <div class="">
                              <table class="table table-bordered">
                                  <colgroup>
                                    <col style="width: 10%">
                                    <col style="width: 10%">
                                    <col style="width: 30%">
                                    <col style="width: 30%">
                                    <col style="width: 20%">
                                  </colgroup>
                                  <tr>
                                    <td>
                                      <p class="center" >선택</p>    
                                    </td>
                                    <td>
                                      <p class="center" >번호</p>    
                                    </td>
                                    <td>
                                      <p class="center">날짜</p>    
                                    </td>
                                    <td>
                                      <p class="center">시간</p>    
                                    </td>
                                    <td>
                                      <p class="center">아이디</p>    
                                    </td>
                                  </tr>
                                  <c:forEach items="${matchlist}" var="mat">
                                  <tr> 
                                    <td>
                                      <!-- 선택 -->
                                      <p class="center">
                                        <label style="font-weight: normal;">
                                          <input type="radio" name="test" value="" />
                                        </label>
                                      </p>
                                    </td>
                                    <td>
                                      <!-- 번호 -->
                                      <p class="center">${mat.mat_num}</p>
                                    </td>
                                    <td>
                                      <!-- 날짜 -->
                                      <p class="center">${mat.mat_stdate}</p>
                                    </td>
                                    <td>
                                      <!-- 시간 -->
                                      <p class="center">${mat.mat_hour}</p>
                                    </td>
                                    <td>
                                      <!-- 아이디 -->
                                      <p class="center">${mat.m_id}</p>
                                    </td>
                                  </tr>
                                  </c:forEach>
                                  
                              </table>
                              <!-- 버튼영역 -->
                              <p class="center">
                                <input class="btn btn-theme margintop10 i_btn2" type="button" value="신청수락">
                                <input class="btn btn-inverse margintop10 i_btn2" type="button" value="닫기" onclick="window.close();">
                              </p>
                            </div>
                          </div>
                        </div>
                      </form>
                    </div>
                  </div>
                </div>               
                       
            </article>
          </div>
        </div>
      </div>
    </section>

  </div>

  <!-- javascript
    ================================================== -->
  <!-- Placed at the end of the document so the pages load faster -->
  <script src="js/jquery.js"></script>
  <script src="js/jquery.easing.1.3.js"></script>
  <script src="js/bootstrap.js"></script>
  <script src="js/jcarousel/jquery.jcarousel.min.js"></script>
  <script src="js/jquery.fancybox.pack.js"></script>
  <script src="js/jquery.fancybox-media.js"></script>
  <script src="js/google-code-prettify/prettify.js"></script>
  <script src="js/portfolio/jquery.quicksand.js"></script>
  <script src="js/portfolio/setting.js"></script>
  <script src="js/jquery.flexslider.js"></script>
  <script src="js/jquery.nivo.slider.js"></script>
  <script src="js/modernizr.custom.js"></script>
  <script src="js/jquery.ba-cond.min.js"></script>
  <script src="js/jquery.slitslider.js"></script>
  <script src="js/animate.js"></script>

  <!-- Template Custom JavaScript File -->
  <script src="js/custom.js"></script>

</body>

</html>