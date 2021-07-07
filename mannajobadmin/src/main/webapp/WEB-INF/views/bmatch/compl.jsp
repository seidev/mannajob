<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
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
 

    </header>



    <section id="" style="min-height:680px">
      <div class="container">
        <div class="row">
          <div class="span8">
            <article>
              <form id="commentform" method="post" action="/compl/insert" name="comment-form">

                <div class="row">
                  <div class="post-heading">
                    <p class="line_9"></p>
                    <p class="line_9"></p>
                    <h3 style="color: #f84002;">&nbsp&nbsp&nbsp 악성<strong></strong>회원 신고</h3>
                    <p class="line_9"></p>
                  </div>

                  <div class="span9">
                    <div class="">
                      <h5>▶ 신고대상</h5>
                      <table class="table table-bordered">  
                        <colgroup>
                          <col style="width: 30%">
                          <col style="width: auto">
                        </colgroup>                    
                        <tr>
                          <td>
                            <p class="center">게시글 번호</p>
                          </td>
                          <td>
                            <!-- 게시글 번호 -->
                            <input type="hidden" value="${bmatch.b_num}" name="board_num">${bmatch.b_num}
                          </td>
                        </tr>
                        <tr> 
                          <td>
                            <p class="center">아 &nbsp&nbsp 이 &nbsp&nbsp 디</p>
                          </td>
                          <td>
                            <!-- 기업명 -->
                            <input type="hidden" name="m_id" value="${bmatch.m_id}">${bmatch.m_id}
                            <input type="hidden" name="c_category" value="B">
                            <input type="hidden" name="b_category" value="${bmatch.b_category}">
                          </td>
                        </tr>
                      </table>
                    </div>
                  </div> 

                  <div class="span9">                   
                    <h5>▶ 신고사유</h5>
                    <div class="">
                      <form>
                        <table class="table table-bordered">
                          <tr>
                            <td>
                              <!-- 신고사유 radio button -->
                              <p>
                                <label style="font-weight: normal;">
                                  <input type="radio" name="c_why" value="의도적으로 게시물을 도배하는 행위를 하는 경우" />
                                    <span>&ensp;의도적으로 게시물을 도배하는 행위를 하는 경우</span>
                                </label>
                              </p>
                              <p>
                                <label style="font-weight: normal;">
                                  <input type="radio" name="c_why" value="상관없는 게시물이나 광고를 등록하는 경우">
                                    <span>&ensp;상관없는 게시물이나 광고를 등록하는 경우</span>
                                </label>
                              </p>
                              <p>
                                <label style="font-weight: normal;">
                                  <input type="radio" name="c_why" value="무단으로 매칭을 파기하는 경우">
                                    <span>&ensp;무단으로 매칭을 파기하는 경우</span>
                                </label>
                              </p>
                              <p>
                                <label style="font-weight: normal;">
                                  <input type="radio" name="c_why" id="etc" value="현직자나 취준생 만남에서 과도한 금품이나 요구를 하는 경우">
                                    <span>&ensp;현직자나 취준생 만남에서 과도한 금품이나 요구를 하는 경우</span>
                                </label>
                              </p>
                              <p>
                                <label style="font-weight: normal;">
                                  <input type="radio" name="c_why" value="A" >
                                    <span>&ensp;직접입력</span>
                                    <p><textarea name="c_why" disabled="disabled" ></textarea></p>
                                </label>
                              </p>
                            </td>
                          </tr>  
                        </table>
                        <!-- 버튼영역 -->
                        <p class="center">
                          <input class="btn btn-theme margintop10 i_btn1" type="submit" value="등록">
                        </p>
                      </form>
                    </div>
                  </div>
                </div>               
              </form>             
            </article>
            
          </div>
        </div>
      </div>
    </section>
 
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
    <script type="text/javascript">

    
	  $('input:radio[name="c_why"]').change(function(){
		  var etc =$('input:radio[name="c_why"]:checked').val();
		  if(etc == "A"){
			  $('textarea[name="c_why"]').removeAttr("disabled");
			  
			  $('textarea[name="c_why"]').focus();
		  }else{
			  $('textarea[name="c_why"]').attr("disabled",true);
		  }
	  });
	  
	  
	  
	  
  </script>
  


</body>

</html>
<!-- end footer -->