<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ include file="../includes/header.jsp" %>

  <section id="inner-headline">
      <div class="container">
        <div class="row">
                <div class="span12">
            <ul class="breadcrumb">
              <li><a href="#"><i class="icon-home"></i></a><i class="icon-angle-right"></i></li>
              <li><a href="#">매칭</a><i class="icon-angle-right"></i></li>
              <li class="active">취업준비생 매칭 조회 <i class="icon-angle-right"></i></li>
              <li class="active">상세내용 </li>
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
                <h5 class="widgetheading height_40">매&nbsp&nbsp&nbsp&nbsp칭</h5>

                <ul class="cat">
                   <li><i class="icon-angle-right"></i><a href="/bmatch/list?b_category=A">현직자 매칭 리스트</a></li>
                  <li><i class="icon-angle-right"></i><a href="/bmatch/list?b_category=B">쥐업준비생 매칭 리스트</a></li>
                </ul>
              </div>
            </aside>
          </div>
          <div class="span8">
            <article>
              <!-- <form id="commentform" action="#" method="post" name="comment-form"> -->
                <div class="row">
                  <div class="post-heading">
                    <p class="line_9"></p>
                    <p class="line_9"></p>
                    <h3 style="color: #f84002;">&nbsp&nbsp&nbsp<strong>취업준비생 </strong> 매칭 상세내용</h3>
                    <p class="line_9"></p>
                  </div>

                  <!-- <div class="row"> -->
                  <div class="span9">
                    <h5>▶ 모집정보</h5>
                    <table class="table table-bordered">
                      <colgroup>
                        <col style="width:20%"/>
                        <col style="width:80%"/>
                      </colgroup>
                      <tr>
                        <td  >
                          <p class="center">아&nbsp&nbsp이&nbsp&nbsp디</p>
                        </td>
                        <!-- 모집정보 아이디 -->
                        <td>
                        	<a href="/profile/showmem?m_id=${bMatch.m_id}" onClick="window.open(this.href, '리뷰 수정', 'width=600, height=600'); return false">${bMatch.m_id}</a>
                        </td>
                      </tr>
                      
                      <tr>
                        <td>
                          <p class="center">지&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp역</p>
                        </td>
                        <!-- 모집정보 지역 -->
                        <td>
                            <span><c:out value="${bMatch.b_location}" /></span>
                        </td>
                      </tr>
                      <tr> 
                        <td>
                          <p class="center">관심기업 및 직무</p>
                        </td>
                        <td>
                          <!-- 모집정보 관심기업 -->
                          <span><c:out value="${bMatch.b_corp}" /></span>
                          <span>&nbsp&nbsp</span>
                          <!-- 모집정보 관심직무 -->
                          <span><c:out value="${bMatch.b_task}" /></span>
                        </td>
                      </tr> 
                      
                      <tr>
                        <td>
                          <p class="center">기 &nbsp&nbsp&nbsp&nbsp&nbsp&nbsp 간</p>
                        </td>
                        <td>
                          <!-- 모집정보 기간  fromm ~ to  -->
                          <span><c:out value="${bMatch.b_stdate}" /></span>
                          <span> &nbsp&nbsp</span>
                          <span>부터</span>
                          <span>&nbsp&nbsp</span> 
                          <span><c:out value="${bMatch.b_endate}" /></span>
                          <span>&nbsp&nbsp</span> 
                          <span>까지</span>  
                        </td>
                      </tr>
                      <tr>
                        <td>
                          <p class="center">시 &nbsp&nbsp&nbsp&nbsp&nbsp&nbsp 간</p>
                        </td>
                        <td>
                          <!-- 모집정보 시간 -->
                          <span><c:out value="${bMatch.b_period}" /></span>
                          <span>&nbsp&nbsp 시간</span>
                        </td>
                      </tr>
                      <tr>
                        <td>
                          <p class="center">가 &nbsp&nbsp&nbsp&nbsp&nbsp&nbsp 격</p>
                        </td>
                        <td>
                          <!--  모집정보 가격-->
                            <span><c:out value="${bMatch.b_price}" /></span>
                            <span>&nbsp&nbsp 원</span>
                        </td>
                      </tr>
                      <tr>
                        <td>
                          <p class="center">내 &nbsp&nbsp&nbsp&nbsp&nbsp&nbsp 용</p>
                        </td>
                        <td>
                          <!-- 모집정보 내용 -->
                          <p>
                          <% pageContext.setAttribute("replaceChar","\n");%>
                           ${fn:replace(bMatch.b_contents,line,"<br/>")}
                          </p>
                        </td>
                      </tr>                        
                    </table>
                    <div class="span9">
                      <div class="box aligncenter">
                        <p class="center">
                          <a href="/bmatch/update?b_num=${bMatch.b_num}&pageNum=${cri.pageNum}&b_category=${bMatch.b_category}&m_id=${bMatch.m_id}" class="btn btn-theme margintop10 a_btn4" type="button">수정하기</a>
                          <a href="/bmatch/delete?b_num=${bMatch.b_num}&pageNum=${cri.pageNum}&b_category=${bMatch.b_category}" class="btn btn-inverse margintop10 a_btn4" type="button">삭제하기</a>
                          &nbsp&nbsp&nbsp&nbsp&nbsp&nbsp 
                          <a href="/bmatch/list?pagseNum=${cri.pageNum}&b_category=${bMatch.b_category}" class="btn btn-inverse margintop10 a_btn4" type="button">리스트</a>
                          &nbsp&nbsp&nbsp&nbsp&nbsp&nbsp 
                          <a href="#" class="btn btn-theme margintop10 a_btn4" type="button" onclick="openPopup(); return false;">매칭요청</a>
                          <a href="#" onclick="window.open('/compl/insert?b_num=${bMatch.b_num}&b_category=B&m_id=${bMatch.m_id}','게시글 신고','width=500,height=700'); return false;" class="btn btn-inverse margintop10 a_btn4" type="button">신고</a>  
                        </p>
                      </div>
                    </div> 
                    
                    <!-- 질문 등록 영역 -->
                    <c:if test="${sessionScope.userId != bMatch.m_id && sessionScope.userId != null}">
                     <div class="about-author">
                     	<div id="commentform">
                        <form id="insertCommMainForm" name="insertCommMainForm" method="post" action="/comm/insert">
                          <input type="hidden" name="b_num" value="${bMatch.b_num}">
                          <p>
                            <!-- <span>2020-11-01</span> -->
                            <!-- <span>&nbsp&nbsp &nbsp&nbsp</span> --> 
                            <span><input type="hidden" name="cm_m_id" value="${sessionScope.userId}">${sessionScope.userId}</span> 
                            <span class="align-right">
                              <!-- 공개 여부  -->
                              <label style="font-weight: normal; display: inline;">
                                  <input type="radio" name="cm_secret" value="N" checked />
                                    <span>&ensp;공개</span>
                              </label>
                              <label style="font-weight: normal; display: inline;">
                                  <input type="radio" name="cm_secret" value="Y" />
                                    <span>&ensp;비공개</span>
                              </label>
                              <input type="button" class="btn btn-mini" value="질문등록" onclick="javascript:insertCommMain();" />
                            </span>
                            <!-- 질문 입력 -->
                            <textarea rows="2" cols="90" name="cm_contents" placeholder="질문을 입력하세요"></textarea>
                          </p>
                        </form>
                       </div>
                     </div>
                    </c:if>
                    <div class="comment-area">
                        <div class="media">                        
                          <div class="media-body">
                            <div class="media-content">
                              <!-- <p> -->
                                <!-- 질문 출력 영역 -->
                                <c:forEach items="${commMain}" var="cmain">
                                	<c:if test="${cmain.cm_del == 'N'}">
                                 	<div id="commentform">
                                  	<!-- 질문 출력 -->
                                  	<div id="commMainView${cmain.cm_num}">
	                                  <hr style="height:1px;">
	                                  <!-- 질문 날짜 -->
	                                  <span><fmt:formatDate pattern="yyyy-MM-dd HH:mm:ss" value="${cmain.cm_wdate}" /></span>
	                                  <span>&nbsp&nbsp &nbsp&nbsp</span>
	                                  <!-- 질문 아이디 -->
	                                  <span>${cmain.cm_m_id}</span>
	                                  <span>&nbsp&nbsp &nbsp&nbsp</span>
	                                  <c:if test="${sessionScope.userId == cmain.cm_m_id}">
	                                  	<span><a href="javascript:openCommMainForm(${cmain.cm_num})">수정</a> | <a href="javascript:deleteCommMain(${cmain.cm_num})">삭제</a></span>
	                                  </c:if>
	                                  <!-- 질문 내용 -->
	                                  <c:if test="${cmain.cm_secret == 'N'}">
	                                  	<p>${cmain.cm_contents}</p>
	                                  </c:if>
	                                  <c:if test="${cmain.cm_secret == 'Y'}">
                                  		<c:choose>
                                  			<c:when test="${sessionScope.userId == cmain.cm_m_id || sessionScope.userId == bMatch.m_id}">
                                  				<p>${cmain.cm_contents}</p>
                                  			</c:when>
                                  			<c:otherwise>
                                  				<p>비공개 질문입니다.</p>
                                  			</c:otherwise>
                                  		</c:choose>
	                                  </c:if>
	                                  
	                                </div>
                                 	
		                                
	                                <!-- 질문 수정 -->
                                  	<form id="updateCommMainForm${cmain.cm_num}" name="updateCommMainForm${cmain.cm_num}" method="post" action="/comm/updateSub">
		                                <div id="commMainUpdate${cmain.cm_num}" style="display: none">
		                                  <hr style="height:1px;">
		                                  <span><fmt:formatDate pattern="yyyy-MM-dd HH:mm:ss" value="${cmain.cm_wdate}" /></span>
		                                  <span>&nbsp&nbsp &nbsp&nbsp</span>
		                                  <!-- 질문 아이디 -->
		                                  <span>${cmain.cm_m_id}</span>
		                                  <span>&nbsp&nbsp &nbsp&nbsp</span>
		                                  <span class="align-right">
				                              <!-- 공개 여부 -->
				                              <label style="font-weight: normal; display: inline;">
				                                  <input type="radio" name="cm_secret${cmain.cm_num}" value="N"
				                                  	<c:if test="${cmain.cm_secret == 'N'}"> checked</c:if>/>
				                                    <span>&ensp;공개</span>
				                              </label>
				                              <label style="font-weight: normal; display: inline;">
				                                  <input type="radio" name="cm_secret${cmain.cm_num}" value="Y" 
				                                  	<c:if test="${cmain.cm_secret == 'Y'}"> checked</c:if> />
				                                    <span>&ensp;비공개</span>
				                              </label>
		                                  </span>
		                                  <span><a href="javascript:updateCommMain(${cmain.cm_num})">수정</a> | <a href="javascript:closeCommMainForm(${cmain.cm_num})">취소</a></span>
		                                  <!-- 질문 내용 -->
		                                  <p><textarea rows="2" cols="90" name="cm_contents${cmain.cm_num}">${cmain.cm_contents}</textarea></p>
		                                </div>
                                	</form>
	                                
	                                <!-- 답변 출력 영역 -->
	                                <c:choose>
	                                	<c:when test="${cmain.cms_num != null && cmain.cms_num != 0 && cmain.cms_del == 'N'}">
		                                	<!-- 답변 출력 -->
	                                		<div id="commSubView${cmain.cms_num}">
		                                		<span>&nbsp&nbsp └ </span>
			                                	<!-- 답변 날짜 -->
			                                	<span>${cmain.cms_wdate}</span>
			                                	<span>&nbsp&nbsp &nbsp&nbsp</span>
			                                	<!-- 답변 아이디 -->
			                                	<span>${cmain.b_m_id}</span>
			                                	<span>&nbsp&nbsp &nbsp&nbsp</span>
			                                	<c:if test="${sessionScope.userId == cmain.b_m_id}">
			                                		<span><a href="javascript:openCommSubForm(${cmain.cms_num})">수정</a> | <a href="javascript:deleteCommSub(${cmain.cms_num})">삭제</a></span>
			                                	</c:if>
			                                	<c:if test="${cmain.cm_secret == 'N'}">
			                                		<p>
				                                		&nbsp&nbsp &nbsp&nbsp &nbsp&nbsp
				                                        <!-- 답변 내용 -->
				                                        <span>${cmain.cms_contents}</span>
			                                        </p>
			                                	</c:if>
			                                	<c:if test="${cmain.cm_secret == 'Y'}">
				                                	<c:choose>
			                                  			<c:when test="${sessionScope.userId == cmain.cm_m_id || sessionScope.userId == bMatch.m_id}">
			                                  				<p>
						                                		&nbsp&nbsp &nbsp&nbsp &nbsp&nbsp
						                                        <!-- 답변 내용 -->
						                                        <span>${cmain.cms_contents}</span>
					                                        </p>
			                                  			</c:when>
		                                  				<c:otherwise>
		                                  					<p>
						                                		&nbsp&nbsp &nbsp&nbsp &nbsp&nbsp
						                                        <!-- 답변 내용 -->
						                                        <span>비공개 답변입니다.</span>
					                                        </p>
		                                  				</c:otherwise>
			                                  		</c:choose>
			                                	</c:if>
	                                        </div>
	                                        
	                                        <!-- 답변 수정 -->
	                                        <div id="commSubUpdate${cmain.cms_num}" style="display: none">
	                                        	<span>&nbsp&nbsp └ </span>
			                                	<!-- 답변 날짜 -->
			                                	<span>${cmain.cms_wdate}</span>
			                                	<span>&nbsp&nbsp &nbsp&nbsp</span>
			                                	<!-- 답변 아이디 -->
			                                	<span>${cmain.b_m_id}</span>
			                                	<span>&nbsp&nbsp &nbsp&nbsp</span>
			                                	<span><a href="javascript:updateCommSub(${cmain.cms_num})">수정</a> | <a href="javascript:closeCommSubForm(${cmain.cms_num})">취소</a></span>
			                                	<p>
			                                		&nbsp&nbsp &nbsp&nbsp &nbsp&nbsp
			                                        <!-- 답변 내용 -->
			                                        <textarea rows="2" cols="90" name="cms_contents${cmain.cms_num}" placeholder="답변을 입력하세요">${cmain.cms_contents}</textarea>
		                                        </p>
		                                        
	                                        </div>
	                                	</c:when>
	                                	
	                                	<c:otherwise>
	                                		<!-- 답변 등록 영역 -->
	                                		<div id="commentform">
	                                			<c:if test="${sessionScope.userId == cmain.b_m_id}">
			                                		<form id="insertCommSubForm${cmain.cm_num}" name="insertCommSubForm${cmain.cm_num}" method="post" action="/comm/insertSub">
							                          <p>
							                            <span>&nbsp&nbsp └ </span>
							                            <span>${sessionScope.userId}</span> 
							                            <span class="align-right">
							                              <input type="button" class="btn btn-mini" value="답변등록" onclick="javascript:insertCommSub(${cmain.cm_num});" />
							                            </span>
							                            <!-- 답변 입력 -->
							                            <textarea rows="2" cols="90" name="cms_contents${cmain.cm_num}" placeholder="답변을 입력하세요"></textarea>
							                          </p>
			                                		</form>
		                                		</c:if>
	                                		</div>
	                                	</c:otherwise>
	                                </c:choose>
                                </div>
                               </c:if>
                                </c:forEach>
                            </div>                          
                          </div>
                        </div> 
                    </div>
                          
                  </div>
                </div>
              <!-- </form> -->
            </article>
          </div>
        </div>
      </div>
    </section>
    <script type="text/javascript">
    
    	// 매칭요청 팝업 오픈
    	function openPopup() {
    		window.open("/match/match?b_num=${bMatch.b_num}","매칭요청 팝업","width=800,height=350");
   		}
      
    	// 질문 등록
      	function insertCommMain() {
			//alert("test");
			var param = $("form[name=insertCommMainForm]").serialize();
			$.ajax({
				type : "POST",
				async : true,
				url : "/comm/insert",
				data : param,
				error : function(request, status, error) {
					alert("code : " + request.status + "\n"
							+ "error : " + error);
				},
				success : function(data) {
					alert("질문이 작성되었습니다.");
					location.reload(true);
				}
			});
		}
    	
     	// 답변 등록
      	function insertCommSub(cm_num) {
      		var param = {
  				cm_num : cm_num,
  				cms_contents : $("textarea[name=cms_contents"+cm_num+"]").val()
  			};
			$.ajax({
				type : "POST",
				async : true,
				url : "/comm/insertSub",
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
      	
     	// 질문 수정영역 보이기
      	function openCommMainForm(cm_num) {
			$("#commMainView"+cm_num).hide();
			$("#commMainUpdate"+cm_num).show();
		}
      	
     	// 질문 수정영역 가리기
      	function openCommSubForm(cms_num) {
			$("#commSubView"+cms_num).hide();
			$("#commSubUpdate"+cms_num).show();
		}
      	
     	// 답변 수정영역 보이기
      	function closeCommMainForm(cm_num) {
			$("#commMainView"+cm_num).show();
			$("#commMainUpdate"+cm_num).hide();
		}
      
     	// 답변 수정영역 가리기
		function closeCommSubForm(cms_num) {
			$("#commSubView"+cms_num).show();
			$("#commSubUpdate"+cms_num).hide();
		}
      
		// 질문 수정
		function updateCommMain(cm_num) {
			//alert($("input:radio[name=cm_secret"+cm_num+"]").val());
			//alert($("input:radio[name=cm_secret"+cm_num+"]:checked").val());
			var param = {
				cm_num : cm_num,
				cm_contents : $("textarea[name=cm_contents"+cm_num+"]").val(),
				cm_secret : $("input:radio[name=cm_secret"+cm_num+"]").val()
			};
			$.ajax({
				type : "POST",
				async : true,
				url : "/comm/update",
				data : param,
				error : function(request, status, error) {
					alert("code : " + request.status + "\n"
							+ "error : " + error);
				},
				success : function(data) {
					alert("질문이 수정되었습니다.");
					location.reload(true);
				}
			});
		}
		
		// 답변 수정
    	function updateCommSub(cms_num) {
			var param = {
				cms_num : cms_num,
				cms_contents : $("textarea[name=cms_contents"+cms_num+"]").val()
			};
			$.ajax({
				type : "POST",
				async : true,
				url : "/comm/updateSub",
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

    	// 질문 삭제
		function deleteCommMain(cm_num) {
			if(confirm("질문을 삭제하시겠습니까?")) {
				$.ajax({
					type : "POST",
					async : true,
					url : "/comm/delete",
					data : {cm_num : cm_num},
					error : function(request, status, error) {
						alert("code : " + request.status + "\n"
								+ "error : " + error);
					},
					success : function(data) {
						alert("질문이 삭제되었습니다.");
						location.reload(true);
					}
				});
			}
		}
    
		// 답변 삭제
    	function deleteCommSub(cms_num) {
  	  		if(confirm("답변을 삭제하시겠습니까?")) {
  	  			$.ajax({
  	  				type : "POST",
					async : true,
					url : "/comm/deleteSub",
					data : {cms_num : cms_num},
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
  		}
    </script>


<%@ include file="../includes/footer.jsp" %>