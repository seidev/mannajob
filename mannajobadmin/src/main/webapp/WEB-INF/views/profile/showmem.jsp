<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<!DOCTYPE html>
<html lang="ko">

<head>
  <meta charset="utf-8">
  <title>mannajob</title>
  <meta name="viewport" content="width=device-width, initial-scale=1.0" />
  <meta name="description" content="" />
  <meta name="author" content="" />

  <!-- css -->
  <link href="https://fonts.googleapis.com/css?family=Noto+Serif:400,400italic,700|Open+Sans:300,400,600,700"
    rel="stylesheet">
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
  <div id="wrapper">
    <!-- start header -->
    <section id="">
      <div class="container">
        <div class="row">
          
          <div class="span8">
            <article>
              

                <div class="row">
                  <div class="post-heading">
                    <p class="line_9"></p>
                    <p class="line_9"></p>
                    <h3 style="color: #f84002;">&nbsp&nbsp&nbsp ??????????????? <strong>?????????</strong>????????????</h3>
                    <p class="line_9"></p>
                  </div>
                    <div class="span9 right">
                      <table class="table table-bordered">  
                        <colgroup>
                          <col sytle width="20%"/>
                          <col sytle width="30%"/>
                          <col sytle width="20%"/>
                          <col sytle width="30%"/>
                        </colgroup>                    
                        <tr>
                          <td>
                            <p class="center">??? &nbsp&nbsp ??? &nbsp&nbsp ???</p>
                          </td>
                          <td colspan="3">
                            <!-- ????????? -->
                            ${m_id}
                          </td>
                        </tr>
                      </table>
                    </div>

                  <div class="span10">                   
                    <h5>??? ??????</h5>
                     <form method="post" name="insertform" action="/bmatch/sendEmail" action="/review/insertok">
                     <input type="hidden" name="m_id" value="${m_id}">
                    <h5 class="right" style="margin-top: -50px;"><input class="btn btn-theme right" type="submit" value="?????? ??????"></h5>
                    </form>
                    <div class="span9">
                      <table class="table table-bordered">
                        <colgroup>
                          <col sytle width="8%"/>
                          <col sytle width="auto%"/>
                          <col sytle width="12%"/>
                          <col sytle width="12%"/>
                          <col sytle width="8%"/>
                          <col sytle width="8%"/>
                        </colgroup>
                        <tr>
                          <td>
                            <p class="center" >??????</p>    
                          </td>
                          <td>
                            <p class="center" >??? ???</p>    
                          </td>
                          <td>
                            <p class="center">?????????</p>    
                          </td>
                          <td>
                            <p class="center">?????????</p>    
                          </td>
                          <td>
                            <p class="center">??????</p>    
                          </td>
                          <td>
                            <p class="center">??????</p>    
                          </td>
                        </tr> 
               			<c:forEach var="r" items="${MReview}">
                        <tr>
                          <td>
                            <!-- ???????????? r_good ????????? ??????(g,b) -->
                            <p class="center"><c:if test="${r.r_good eq 'B'}">???</c:if>??????</p>
                          </td>
                          <td style="width: 400px;">
                            <!-- ????????????  r_contents -->
                            
							<% pageContext.setAttribute("line", "\n");%>
							${fn: replace(r.r_contents, line,"<br/>")}
                            
                          </td>
                          <td>
                            <!-- ????????? -->
                            <p class="center">${r.r_w_m_id}</p>
                          </td>
                          <td>
                            <!-- ????????? r_wdate-->
                            <p class="center"><fmt:formatDate pattern="yyyy-MM-dd" value="${r.r_wdate}"/></p>
                          </td>
                          <td>
                            <!-- ???????????? (?????? ???????????? ????????? ?????? ?????????) -->
                            <p class="center">
                            <c:if test="${r.r_w_m_id eq userId}">
                    		<a class="btn btn-mini btn-theme" href="/review/updatem?r_num=${r.r_num}&r_contents=${r.r_contents}" onClick="window.open(this.href, '?????? ??????', 'width=400, height=300'); return false">??????</a>
               				</c:if>
                            </p>
                          </td>
                          <td>
                            <!-- ???????????? (?????? ???????????? ????????? ?????? ?????????)-->
                           <p class="center">
                           <c:if test="${r.r_w_m_id eq userId}">
                    		<a class="btn btn-mini btn-inverse" href="/review/deletem?r_num=${r.r_num}">??????</a>
                    		</c:if>
                           </p>
                          </td>
                        </tr>
               			</c:forEach>  
                      </table>
                    </div>
                  </div>
                </div>               
              
              <p class="span8"></p>
              <h5 class="center" style="margin-top: -50px;"><input class="btn btn-inverse i_btn4" type="button" value="??????" onClick="window.close()"></h5>
              
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
<!-- end footer -->