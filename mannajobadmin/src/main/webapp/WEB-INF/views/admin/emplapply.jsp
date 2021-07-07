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
              <li><a href="#">관리자</a><i class="icon-angle-right"></i></li>
              <li><a href="#">현직자 지원신청 검토</a><i class="icon-angle-right"></i></li>
              <li class="active">현직자 지원서 확인</li>
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
              

                <div class="row">
                  <div class="post-heading">
                    <p class="line_9"></p>
                    <p class="line_9"></p>
                    <h3 style="color: #f84002;">&nbsp&nbsp&nbsp<strong>현직자</strong> 지원서 확인</h3>
                    <p class="line_9"></p>
                  </div>
				
                  <div class="span9">
                    <h5>▶ 기본정보</h5>
                    <div class="span2" >
                        <div class="post-image">
                          <p class="line_9"></p>
                          <!--현직자 이미지 사진 -->
                          <td rowspan="7"><img src="../resources/certifi/${profile}" alt="" width="240px"/>
                        </div>
                    </div>

                    <div class="span6 right">
                      <table class="table table-bordered">  
                        <colgroup>
                          <col style="width: 20%">
                          <col style="width: 30%">
                          <col style="width: 20%">
                          <col style="width: 30%">
                        </colgroup>                    
                        <tr>
                          <td>
                            <p class="center">아 &nbsp&nbsp 이 &nbsp&nbsp 디</p>
                          </td>
                          <td colspan="3">
                            <!-- 아이디 -->
                            ${emplFile.m_id}
                          </td>
                        </tr>
                        <tr> 
                          <td>
                            <p class="center">기 &nbsp&nbsp 업 &nbsp&nbsp 명</p>
                          </td>
                          <td>
                            <!-- 기업명 -->
                            ${emplFile.e_corp}
                          </td>
                          <td>
                            <p class="center">부 &emsp;&ensp; 서</p>
                          </td>
                          <td>
                            <!-- 부서 -->
                            ${emplFile.e_dept}
                          </td>
                        </tr>
                        <tr> 
                          <td>
                            <p class="center">직  &emsp;&ensp;  무</p>
                              
                          <td>
                            <!-- 직무 -->
                            ${emplFile.e_rank}
                          </td>
                          <td>
                            <p class="center">직  &emsp;&ensp;  급</p>
                          </td>
                          
                          <td>
                            <!-- 직급 -->
                            ${emplFile.e_task}
                          </td>
                        </tr>

                        <!-- 주요경력 -->
                        <tr> 
                          <td rowspan="2">
                            <p class="center">주요경력</p>
                          </td>
                          <td colspan="3">
                            <!-- 경력 -->
                            ${emplFile.e_career}
                          </td>
                        </tr>
                  

                       

                      </table>
                    </div>
                
                    <div class="">
                      <table class="table table-bordered">
                        <colgroup>
                          <col style="width: 10%">
                          <col style="width: auto">
                        </colgroup>     
                        <tr>
                          <td>
                            <p class="center">소&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp개</p>
                          </td>
                          <td>
                            <!-- 소개 -->
                            <% pageContext.setAttribute("line", "\n");%>
                            ${fn: replace(emplFile.e_intro,line,"<br/>")}
                          </td>
                        </tr>                        
                      </table>
                    </div>
                  </div> 

                  <div class="span9">                   
                    <h5>▶ 인증</h5>
                    <div class="">
                      <table class="table table-bordered">
                        <colgroup>
                          <col style="width: 10%">
                          <col style="width: 10%">
                          <col style="width: auto">
                          <col style="width: 15%">
                          <col style="width: 15%">
                          <col style="width: 10%">
                        </colgroup>
                        <tr>
                          <td>
                            <p class="center" >번호</p>    
                          </td>
                          <td>
                            <p class="center" >인증여부</p>    
                          </td>
                          <td>
                            <p class="center">인증서류</p>    
                          </td>
                          <td>
                            <p class="center">신청일</p>    
                          </td>
                          <td>
                            <p class="center">인증일</p>    
                          </td>
                          <td>
                            <p class="center">첨부파일</p>    
                          </td>
                        </tr> 
                        <tr>
                          <td>
                            <!-- 번호 -->
                            <p class="center">${emplFile.e_num}</p>
                          </td>
                          <td style="width: 400px;">
                            <!-- 인증상태 -->
                            <p class="center">
                            <c:choose>
                			<c:when test="${emplFile.e_ok eq 'Y'}">
                				승인
                			</c:when>
                			<c:otherwise>미승인</c:otherwise> 
                			</c:choose>           
                            </p>
                          </td>
                          <td>
                            <!-- 인증서류 -->
                            <p>경력증명서</p>
                          </td>
                          <td>
                            <!-- 신청일 -->
                            <p class="center"><fmt:formatDate pattern="yyyy-MM-dd" value="${emplFile.e_applydate}"/> </p>
                          </td>
                          <td>
                            <!-- 인증일 -->
                            <p class="center"><fmt:formatDate pattern="yyyy-MM-dd" value="${emplFile.e_okdate}"/></p>
                          </td>
                          <td>
                            <!-- 다운로드 버튼-->
                            <p class="center"><button onclick="window.open('/admin/certif?e_num=${emplFile.e_num}', '증명서 확인', 'width=600, height=1000, location=no, status=no, scrollbars=yes');"class="btn btn-mini btn-theme" >확 인</button></p>
                          </td>
                        </tr>          
                      </table>
                    </div>
                  </div>

                  <!-- 이용정지 내역 -->
<%--                  
                  <div class="span9">                   
                    <h5>▶ 이용정지</h5>
                    <div class="">
                      <table class="table table-bordered">
                        <colgroup>
                          <col style="width: 10%">
                          <col style="width: auto">
                          <col style="width: 20%">
                          <col style="width: 20%">
                        </colgroup>
                        <thead>
                          <tr>
                            <td>
                              <p class="center" >번호</p>    
                            </td>
                            <td>
                              <p class="center">제목</p>    
                            </td>
                            <td>
                              <p class="center">정지일</p>    
                            </td>
                            <td>
                              <p class="center">해제일</p>    
                            </td>
                          </tr> 
                        </thead>
                        <tbody>
                          <tr>
                            <td>
                              <p class="center">1</p>
                            </td>
                            <td>
                              <p>광고</p>
                            </td>
                            <td>
                              <p class="center">2019-11-01</p>
                            </td>
                            <td>
                              <p class="center">2019-12-01</p>
                            </td>
                          </tr>  
                        </tbody>
                      </table>
                    </div>
                  </div>
                   --%>
                </div>               
                        
            </article>
            
          </div>
        </div>
      </div>
    </section>


<%@ include file="../includes/footer.jsp" %>