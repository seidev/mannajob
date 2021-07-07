<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html lang="ko">

<head>
  <meta charset="utf-8">
  <title>Mannajob</title>
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
  <!-- Fav and touch icons -->
  <link rel="apple-touch-icon-precomposed" sizes="144x144" href="/resources/ico/apple-touch-icon-144-precomposed.png" />
  <link rel="apple-touch-icon-precomposed" sizes="114x114" href="/resources/ico/apple-touch-icon-114-precomposed.png" />
  <link rel="apple-touch-icon-precomposed" sizes="72x72" href="/resources/ico/apple-touch-icon-72-precomposed.png" />
  <link rel="apple-touch-icon-precomposed" href="/resources/ico/apple-touch-icon-57-precomposed.png" />
  <link rel="shortcut icon" href="/resources/ico/MJfavi.png" />
  <link rel="shortcut icon" href="ico/MVfavi.png" />

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
    
   	function popclose(form) {
		form.target = opener.name;
		form.submit();
		
		if(opener != null) {
			opener.insert = null;
			self.close();
		}
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
                    <h3 style="color: #f84002;"><strong></strong>매칭 승인</h3>
                    <p class="line_9"></p>
                  </div>
                  
                  <!-- 매칭 요청 -->
                  <div class="span9">                   
                    <h5>▶ 매칭 요청현황</h5>
                    <div class="">
                      <form class="form-horizontal span12" action="/match/matchok" target="matlist" method="post">
                      <input type="hidden" name="b_num" value="${b_num}">
                        <div class="control-group center">            
                          <div class="">
                              <table class="table table-bordered">
                                  <colgroup>
                                  	<col style="width: 13%">
                                    <col style="width: 17%">
                                    <col style="width: 30%">
                                    <col style="width: 20%">
                                    <col style="width: 20%">
                                  </colgroup>
                                  <thead>
                                  	<td><p class="center">선택</p></td>
                                  	<td><p class="center">매칭번호</p></td>
                                  	<td><p class="center">희망일자</p></td>
                                  	<td><p class="center">희망시작시간</p></td>
                                  	<td><p class="center">신청ID</p></td>
                                  </thead>
                                  <c:forEach var="list" items="${matchlist}">
                                  <tr>
                                    <td>
                                    	<p class="center"><input type="radio" name="mat_num" value="${list.mat_num}"></p>
                                    </td>
                                    <td>
                                    <p class="center">${list.mat_num}</p>
                                    </td>
                                    <td>
                                      <!-- 일자 -->
                                      <p class="center"><input type="hidden" name="mat_stdate" value="${list.mat_stdate}">${list.mat_stdate}</p>
                                    </td>
                                    <td>
                                      <p class="center"><input type="hidden" name="mat_hour" value="${list.mat_hour}">${list.mat_hour}</p>
                                    </td>
                                    <td>
                                      <!-- 시작시간 -->
                                      <p class="center"><input type="hidden" name="m_id" value="${list.m_id}">${list.m_id}</p>
                                    </td>
                                  </tr>
                                  </select>
                                  </c:forEach>
                                  <tr>
                              </table>
                              <!-- 버튼영역 -->
                              <p class="center">
                                <input class="btn btn-theme margintop10 i_btn4" type="submit" value="매칭요청" onclick="window.close();">
                                <input class="btn btn-inverse margintop10 i_btn4" type="button" value="닫기" onclick="window.close();">
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
  <script src="/resources/js/jquery.js"></script>
  <script src="/resources/js/jquery.easing.1.3.js"></script>
  <script src="/resources/js/bootstrap.js"></script>
  <script src="/resources/js/jcarousel/jquery.jcarousel.min.js"></script>
  <script src="/resources/js/jquery.fancybox.pack.js"></script>
  <script src="/resources/js/jquery.fancybox-media.js"></script>
  <script src="/resources/js/google-code-prettify/prettify.js"></script>
  <script src="/resources/js/portfolio/jquery.quicksand.js"></script>
  <script src="/resources/js/portfolio/setting.js"></script>
  <script src="/resources/js/jquery.flexslider.js"></script>
  <script src="/resources/js/jquery.nivo.slider.js"></script>
  <script src="/resources/js/modernizr.custom.js"></script>
  <script src="/resources/js/jquery.ba-cond.min.js"></script>
  <script src="/resources/js/jquery.slitslider.js"></script>
  <script src="/resources/js/animate.js"></script>

  <!-- Template Custom JavaScript File -->
  <script src="/resources/js/custom.js"></script>

</body>

</html>