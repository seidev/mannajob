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
              <li><a href="#">게시판</a><i class="icon-angle-right"></i></li>
              <li class="active">QnA <i class="icon-angle-right"></i></li>
              <li class="active">상세 </li>
            </ul>
          </div>
        </div>
      </div>
    </section>
    <section id="" style="min-height:680px">
      <div class="container">       
        <div class="row">
          <div class="span3">
            <aside class="left-sidebar">
              <div class="widget">
              </div>
              <div class="widget">
                <h5 class="widgetheading height_40">게&nbsp&nbsp시&nbsp&nbsp판</h5>

                <ul class="cat">
                 <li><i class="icon-angle-right"></i><a href="/notice/list">공지사항</a></li>
                  <li><i class="icon-angle-right"></i><a href="/qna/list">QnA</a></li>
                </ul>
              </div>
            </aside>
          </div>
          <div class="span8">
            <article>
                <div class="row">
                  <div class="post-heading">
                    <p class="line_9"></p>
                    <p class="line_9"></p>
                    <h3 style="color: #f84002;">&nbsp&nbsp&nbsp<strong>QnA </strong> 상세</h3>
                    <p class="line_9"></p>
                  </div>

                  <!-- <div class="row"> -->
                  <div class="span9">
                     <table class="table table-bordered">
                      <colgroup>
                        <col style="width: 20%">
                        <col style="width: 30%">
                        <col style="width: 20%">
                        <col style="width: 30%">
                      </colgroup>
                      <tr>
                        <td>
                          <p class="center">제 &emsp; 목</p>
                        </td>
                        <td colspan="3">
                          <!-- 제목 -->
                          <c:out value="${qna.q_subject}" />
                        </td>
                      </tr>
                      <tr> 
                        <td>
                          <p class="center">카테고리</p>
                        </td>
                        <td>
                        	<c:choose>
                       			<c:when test="${qna.q_category == 'A'}">선택</c:when>
								<c:when test="${qna.q_category == 'B'}">매칭</c:when>
                        		<c:when test="${qna.q_category == 'C'}">현직자</c:when>
								<c:when test="${qna.q_category == 'D'}">취준생</c:when>
                            	<c:when test="${qna.q_category == 'E'}">운영</c:when>
								<c:when test="${qna.q_category == 'Q'}">일정</c:when>
								<c:when test="${qna.q_category == 'X'}">기타</c:when>
							</c:choose>
                        </td>
                        <td>
                          <p class="center"></p>
                          
                        </td>
                        <td>
                          <!-- 답변상태 -->
                          <c:choose>
                          
							<c:when test="${reply_chk==1}">
								<p>답변완료</p>
							</c:when>
							<c:otherwise>
								<p>미답변</p>
							</c:otherwise>
						</c:choose>
                        </td>
                      </tr>
                      <tr> 
                        <td>
                          <p class="center">작&nbsp성&nbsp일</p>
                        </td>
                        <td>
                          <!-- 작성일 -->
                          <fmt:formatDate pattern="yyyy-MM-dd HH:mm:ss" value="${qna.q_udate}" />
                        </td>
                        <td>
                          <p class="center">작&nbsp성&nbsp자</p>
                        </td>
                        <td>
                          <!-- 작성자 -->
                          <c:out value="${qna.m_id}" />
                        </td>
                      </tr>
                      <tr>
                        <td colspan="4">                  
                          <c:out value="${qna.q_contents}" escapeXml="false" />
                        </td>
                      </tr>
                    </table>
                    
                    <!-- 버튼영역 -->
                    <div class="box aligncenter">
                      <p class="center">
                        <a href="/qna/update?q_num=${qna.q_num}&pageNum=${cri.pageNum}" class="btn btn-theme margintop10 i_btn4"  >수정하기</a>
                        <a href="/qna/delete?q_num=${qna.q_num}&pageNum=${cri.pageNum}" class="btn btn-inverse margintop10 i_btn4"  >삭제하기</a>
                        <a href="/qna/list?pageNum=${cri.pageNum}" class="btn btn-inverse margintop10 i_btn4" >리스트</a>
                        <!--
                        <a href="#" class="btn btn-theme margintop10 a_btn2" type="button">수정하기</a>
                        <a href="#" class="btn btn-inverse margintop10 a_btn2" type="button">삭제하기</a>
                        <a href="#" class="btn btn-inverse margintop10 a_btn2" type="button">리스트</a>
                        <button class="btn btn-theme margintop10" style="width: 100px; height: 40px;"
                          type="submit">수정하기</button>                         
                        <button class="btn btn-inverse margintop10" style="width: 100px; height: 40px;"
                          type="submit">삭제하기</button>
                        <button class="btn btn-inverse margintop10" style="width: 100px; height: 40px;"
                          type="submit">리스트</button>
                        -->
                      </p>
                    </div>
                    
                    <!-- 답변영역 : 등록 -->
                    <c:if test="${qna.ad_id == null || qna.qs_del == 'Y'}">
                    <div class="about-author" style="width: 95%;">
   						<form name="insertSubForm" method="post" action="/qna/insertSub">
   							<p>	
	   							<input type="hidden" name="pageNum" value="${cri.pageNum}">
	   							<input type="hidden" name="q_num" value="${qna.q_num}">
								<c:set var="now" value="<%=new java.util.Date()%>" />
								<c:set var="sysYear"><fmt:formatDate value="${now}" pattern="yyyy-MM-dd" /></c:set> 
	                        	<span><c:out value="${sysYear}"/></span>&emsp;
              		 	<!--  admin 세션아이디 추가 -->
	                        	<input type="hidden" name="ad_id" value="admin">
	                        	<span class="align-right">
	                          		<input type="button" onclick="javascript:insertQnaSub();" class="btn btn-mini" value="답변등록">
	                          	</span>
	                       	</p>
                        <!-- 답변내용 입력 -->
                        	<p>
                        		<textarea rows="2" cols="200" name="qs_contents" placeholder="답변을 입력하세요" style="width: 95%;"></textarea>
							</p>
						</form>
   					</div>
                    </c:if>  
                    

                    <!-- 답변영역 : 답변보기 -->
	                   <c:if test="${qna.ad_id != null && qna.qs_del == 'N'}">
							<form name="updateSubForm" method="post" action="/qna/updateSub">
								<input type="hidden" name="pageNum" value="${cri.pageNum}">
								<input type="hidden" name="q_num" value="${qna.q_num}">
								<input type="hidden" name="qs_num" value="<c:out value="${qna.qs_num}"/>">
								<div class="comment-area" >
									<div class="media">
										<div class="media-body">
											<div class="media-content">
													<!-- 답변 날짜 -->
													<span><fmt:formatDate pattern="yyyy-MM-dd HH:mm:ss" value="${qna.qs_udate}" /></span>&emsp;
													<!-- 답변 아이디 -->
													<span><input type="hidden" name="ad_id" value="<c:out value="${qna.ad_id}" />"></span>&emsp;
													<!-- 답변 수정/삭제 -->
													<c:if test="${sessionScope.userId == qna.m_id}">
														<span><a href="#"onclick="javascript:openQnaSubForm();">수정</a> | <a href="#" onclick="javascript:deleteQnaSub();">삭제</a></span>
													</c:if>
												<!-- 답변 내용 -->
												<div id="cmt_view">
													<p>
													<c:out value="${qna.qs_contents}" escapeXml="false" />
													</p>												
												</div>
	
												<div id="cmt_update" style="display: none">
													<p>
													<textarea rows="10" name="qs_contents" style="width: 95%;"><c:out value="${qna.qs_contents}" /></textarea>
													<input type="button" value="cancel"	onclick="javascript:closeQnaSubForm();">
													<input type="submit" value="submit"	onclick="javascript:updateQnaSub();">
													</p>
												</div>
											</div>
										</div>
									</div>
								</div>
							</form>
						</c:if>
                  </div>
                </div>
                
            </article>
          </div>
        </div>
      </div>
    </section>
    
    <script>
					function insertQnaSub() {
						//alert("test");
						var param = $("form[name=insertSubForm]").serialize();
						$.ajax({
							type : "POST",
							async : true,
							url : "/qna/insertSub",
							data : param,
							error : function(request, status, error) {
								alert("code : " + request.status + "\n"
										+ "error : " + error);
							},
							success : function(data) {
								alert("답변이 작성되었습니다.");
								location.reload(true);
							}
						});
					}
					function openQnaSubForm() {
						$("#cmt_view").hide();
						$("#cmt_update").show();
						$("textarea[name=qs_contents]").text(
								$("textarea[name=qs_contents]").text().replace(
										/(<br>)/gi, "\n"));
					}
					function closeQnaSubForm() {
						$("#cmt_view").show();
						$("#cmt_update").hide();
					}
					function updateQnaSub() {
						var param = $("form[name=updateSubForm]").serialize();
						$.ajax({
							type : "POST",
							async : true,
							url : "/qna/updateSub",
							data : param,
							error : function(request, status, error) {
								alert("code : " + request.status + "\n"
										+ "error : " + error);
							},
							success : function(data) {
								alert("답변이 수정되었습니다.");
								location.reload(true);
							}
						});
					}
					function deleteQnaSub() {
						var param = $("form[name=updateSubForm]").serialize();
						$.ajax({
							type : "POST",
							async : true,
							url : "/qna/deleteSub",
							data : param,
							error : function(request, status, error) {
								alert("code : " + request.status + "\n"
										+ "error : " + error);
							},
							success : function(data) {
								alert("답변이 삭제되었습니다.");
								location.reload(true);
							}
						});
					}
				</script>
    
    <%@ include file="../includes/footer.jsp" %>