<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ include file="./includes/header.jsp" %>


        

    <section id="featured">
      <!-- start slider -->
      <!-- Slider -->
      <div id="nivo-slider">
        <div class="nivo-slider">
          <!-- Slide #1 image -->
          <img src="/resources/img/slides/nivo/bg-1.jpg" alt=""/>
          <!-- Slide #2 image -->
          <img src="/resources/img/slides/nivo/bg-2.jpg" alt=""/>
      </div>
      <!-- end slider -->
    </section>



    <section id="content">
      <div class="container">
        <div class="row">
          <div class="span12">
            <h4 class="heading"> <strong>BEST</strong>&nbsp&nbsp mento</h4>
            <div class="row">
              <!-- Item Project and Filter Name 1 -->
              <c:forEach var="g" items="${good}" varStatus="status">
              <div class="span2" style="padding-left: 30px;">
                <div class="box aligncenter">
                   <a href="/profile/showempl?m_id=${g.m_id}"><img src="/resources/certifi/${g.stored_file_name}" style="width:200px; height:200px"></a>
                   <!-- <a href="#"><img src="img/works/thumbs/image-01.jpg" width="200px"></a> -->
                  <div class="text" >
                    <p><strong>${status.count}. ${g.m_name}</strong></p>
                    <p class="txt_small_black line_9">${g.e_corp}</p>
                    <p class="line_9">${g.e_task}</p>
                    <p class="line_9">추천&nbsp${g.countG}&nbsp|&nbsp멘토링&nbsp${g.countM}</p>
                  </div>
                </div>
              </div>
              </c:forEach>
            </div>
          </div>
        </div>


        <!-- divider -->
        <div class="row">
          <div class="span12">
            <div class="solidline">
            </div>
          </div>
        </div>
        <!-- end divider -->

        <!-- 공지사항, 최근신청글 divider -->
        <div class="container">
          <div class="row">
            <div class="span4">
              <div class="widget">
                <h6 class="widgetheading">공지사항</h6>
                <table>
                <colgroup>
                	<col style="width:60%">
                	<col style="width:40%">
                </colgroup>
                <c:forEach var="notice" items="${notice}">
                  <tr>
                    <td class="td_home_desc"><a href="/notice/view?n_num=${notice.n_num}">${notice.n_subject}</a></td>
                    <td class="td_home_date"><fmt:formatDate value="${notice.n_udate}"/></td>
                  </tr>
                  </c:forEach>
                </table>
              </div>
            </div>
            <div class="span4">
              <div class="widget">
                <h6 class="widgetheading">현직자 멘토 최근 신청글</h6>
                <table>
	                <colgroup>
                		<col style="width:60%">
                		<col style="width:40%">
               		</colgroup>
					<c:forEach var="empl_bmatch" items="${empl_bmatch}">
                  		<tr>
                    		<td class="td_home_desc"><a href="/bmatch/view?b_num=${empl_bmatch.b_num}&b_category=${empl_bmatch.b_category}&m_id=${empl_bmatch.m_id}">${empl_bmatch.b_subject}</a></td>
                    		<td class="td_home_date"><fmt:formatDate value="${empl_bmatch.b_wdate}"/></td>
                  		</tr>
                  </c:forEach>

                </table>
              </div>
            </div>
            <div class="span4">
              <div class="widget">
                <h6 class="widgetheading">취준생 멘토 최근 신청글</h6>
                <table>
	                <colgroup>
                		<col style="width:60%">
                		<col style="width:40%">
                	</colgroup>
					<c:forEach var="mem_bmatch" items="${mem_bmatch}">
                  		<tr>
                    		<td class="td_home_desc"><a href="/bmatch/view?b_num=${mem_bmatch.b_num}&b_category=${mem_bmatch.b_category}">${mem_bmatch.b_subject}</a></td>
                    		<td class="td_home_date"><fmt:formatDate value="${mem_bmatch.b_wdate}"/></td>
                  		</tr>
                  	</c:forEach>
                </table> 
              </div>
            </div>
          </div>
        </div>
     
        <!-- divider -->
        <div class="row">
          <div class="span12">
            <div class="solidline">
            </div>
          </div>
        </div>
        <!-- end divider --> 
      </div>
    </section>
<%@ include file="./includes/footer.jsp" %>



