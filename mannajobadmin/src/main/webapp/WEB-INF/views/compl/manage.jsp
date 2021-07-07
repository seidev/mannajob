<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ include file="../includes/header.jsp" %>

    <section id="inner-headline">
      <div class="container">
        <div class="row">
          <div class="span12">
            <ul class="breadcrumb">
              <li><a href="#"><i class="icon-home"></i></a><i class="icon-angle-right"></i></li>
              <li><a href="#">관리자</a><i class="icon-angle-right"></i></li>
              <li class="active">신고 접수 목록</li>
            </ul>
          </div>
        </div>
      </div>
    </section>


    <section id="">
      <div class="container">
        <div class="row">
          <div class="span3">
            <aside class="left-sidebar">
              <div class="widget">
              </div>
              <div class="widget">
                <h5 class="widgetheading height_40">관&nbsp&nbsp리&nbsp&nbsp자</h5>

                <ul class="cat">
                 <li><i class="icon-angle-right"></i><a href="/admin/manage">회원정보 관리</a></li>
                  <li><i class="icon-angle-right"></i><a href="/compl/manage">악성회원 신고관리</a></li>
                  <li><i class="icon-angle-right"></i><a href="/admin/check">현직자 신청 승인관리</a></li>
                </ul>
              </div>
            </aside>
          </div>
          <div class="span8">
            <article>
              <!--  <form id="commentform" action="#" method="post" name="comment-form">  -->

                <div class="row">
                  <div class="post-heading">
                    <p class="line_9"></p>
                    <p class="line_9"></p>
                    <h3 style="color: #f84002;">&nbsp&nbsp&nbsp<strong></strong>신고 접수 목록</h3>
                    <p class="line_9"></p>
                  </div>

                  <div class="span9">
                    <div class="">
                      <h5>▶ 검색조건</h5>
                      <form method="get" action="/compl/manage">
                        <div class="media-body">
                        <p>
                          <span>
                            <select name="searchType">
                              <option value="All">전체</option>
                              <option value="Worker">현직자</option>
                              <option value="Seeker">취준생</option>
                            </select>
                          </span>
                          <span><input type="text" name="keyword" style="width: 200px; min-height: 30px;" placeholder="아이디 입력" /></span>
                          <!-- 버튼영역 -->
                          <span style="vertical-align: top;"><input type="submit" value="조회" class="btn btn-theme"></span> 									
                        </p>
                        </div>
                      </form>
                    </div>
                    <br>
                  </div> 
                  <div class="span9">                   
                    <h5>▶ 신고 접수 목록</h5>
                    <div class="">
                      <table class="table table-bordered">
                        <colgroup>
                          <col style="width: 12%">
                          <col style="width: 12%">
                          <col style="width: auto">
                          <col style="width: 16%">
                          <col style="width: 12%">
                        </colgroup>
                        <tr>
                          <td>
                            <p class="center" >번호</p>    
                          </td>
                          <td>
                            <p class="center" >게시글</p>    
                          </td>
                          <td>
                            <p class="center">사유</p>    
                          </td>
                          <td>
                            <p class="center">신고회원</p>    
                          </td>
                          <td>
                            <p class="center">이용정지</p>    
                          </td>
                        </tr> 
                        <c:forEach items="${compllist}" var="compl">
	                        <tr>
	                          <td>
	                            <!-- 번호 -->
	                            <p class="center">${compl.c_num}</p>
	                          </td>
	                          <td style="width: 400px;">
	                            <!-- 게시글 -->
	                              <p class="center"><a href="/compl/moveboard?board_num=${compl.board_num}" class="btn btn-mini btn-theme">게시글</a></p>
	                               
	                          </td>
	                          <td>
	                            <!-- 사유 -->
	                            <p>${compl.c_why}</p>
	                          </td>
	                          <td>
	                            <!-- 신고회원-->
	                            <p class="center">${compl.m_id}</p>
	                          </td>
	                          <td>
	                            <!-- 이용정지-->
	                            <c:choose>
	                            	<c:when test="${compl.c_state == 'A'}">
	                            		<p class="center">
	                            			<span><a href="/compl/stopdate?m_id=${compl.m_id}&c_num=${compl.c_num}&c_state=B" class="btn btn-mini btn-theme">정지</a></span>
	                            			<span><a href="/compl/statechange?c_num=${compl.c_num}&c_state=C" class="btn btn-mini btn-inverse">취소</a></span>
	                            		</p>	                            	
	                            	</c:when>
	                            	<c:when test="${compl.c_state == 'B'}">
	                            		<p class="center">처리완료</p>
	                            	</c:when>
	                            	<c:when test="${compl.c_state == 'C'}">
	                            		<p class="center">취소</p>
	                            	</c:when>	                            
	                            </c:choose>
	                          </td>
	                        </tr>  
                        </c:forEach>                        
                      </table>
                    </div>
                                        <!-- 페이징 -->
                     <div class = "span8 center">
	                     <c:if test="${mempageMaker.prev}">
							<a href="/compl/manage?searchType=<%=request.getAttribute("searchType") %>&keyword=<%= request.getAttribute("keyword") %>&pageNum=${mempageMaker.startPage - 1}&amount=10">◀</a>
						</c:if>
						<c:forEach var="num" begin="${mempageMaker.startPage}" end="${mempageMaker.endPage}">
							<c:if test="${mempageMaker.cri.pageNum == num}">
				    		${num}	
				    		</c:if>
							<c:if test="${mempageMaker.cri.pageNum != num}">
				    			<a href="/compl/manage?searchType=<%=request.getAttribute("searchType") %>&keyword=<%= request.getAttribute("keyword") %>&pageNum=${num}&amount=10">${num}</a>
				    		</c:if>
				    		
						</c:forEach>
						<c:if test="${mempageMaker.next}">
							<a href="/compl/manage?searchType=<%=request.getAttribute("searchType") %>&keyword=<%= request.getAttribute("keyword") %>&pageNum=${mempageMaker.endPage + 1}&amount=10">▶</a>
						</c:if>
					</div>
                  </div>
                </div>               
       <!--   </form>   -->           
            </article>
          </div>
        </div>
      </div>
    </section>


<%@ include file="../includes/footer.jsp" %>
<script>
	$(document).ready(function(){
		let result = "${result}";
		if(result==1){
			setTimeout(()=>alert("정상 처리 되었습니다."),500);
		}
		
	})
</script>