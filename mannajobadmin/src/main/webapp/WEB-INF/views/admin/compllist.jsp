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
              <li class="active">신고 접수 목록</li>
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
                    <h3 style="color: #f84002;">&nbsp&nbsp&nbsp<strong></strong>신고 접수 목록</h3>
                    <p class="line_9"></p>
                  </div>

                  <div class="span9">
                    <div class="">
                      <h5>▶ 검색조건</h5>
                      <form name="serchForm">
                        <div class="media-body">
                        <p>
                          <span>
                            <select name="c_category">
                              <option value="">전체</option>
                              <option value="A">현직자</option>
                              <option value="B">취준생</option>
                            </select>
                          </span>
                          <span><input type="text" name="m_id" style="width: 200px; min-height: 30px;" placeholder="아이디 입력" /></span>
                          <!-- 버튼영역 -->
                          <span style="vertical-align: top;"><a href="#" class="btn btn-theme">조회</a></span>
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
                          <col style="width: 10%">
                          <col style="width: 10%">
                          <col style="width: auto">
                          <col style="width: 10%">
                          <col style="width: 15%">
                          <col style="width: 10%">
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
                            <p class="center">신고서</p>    
                          </td>
                          <td>
                            <p class="center">신고회원</p>    
                          </td>
                          <td>
                            <p class="center">이용정지</p>    
                          </td>
                        </tr> 
                        <tr>
                          <td>
                            <!-- 번호 -->
                            <p class="center">2</p>
                          </td>
                          <td style="width: 400px;">
                            <!-- 게시글 -->
                            <p class="center"><a href="#" class="btn btn-mini btn-theme">게시글</a></p>
                          </td>
                          <td>
                            <!-- 사유 -->
                            <p>상관없는 게시물이나 광고를 등록하는 경우</p>
                          </td>
                          <td>
                            <!-- 신고서 -->
                            <p class="center"><a href="#" class="btn btn-mini btn-theme">신고서</a></p>
                          </td>
                          <td>
                            <!-- 신고회원-->
                            <p class="center">test</p>
                          </td>
                          <td>
                            <!-- 이용정지-->
                            <p class="center"><a href="#" class="btn btn-mini btn-theme">정지</a></p>
                          </td>
                        </tr>  
                        <tr>
                          <td>
                            <p class="center">1</p>
                          </td>
                          <td style="width: 400px;">
                            <p class="center"><a href="#" class="btn btn-mini btn-theme">게시글</a></p>
                          </td>
                          <td>
                            <p>의도적으로 게시물을 도배하는 행위를 하는 경우</p>
                          </td>
                          <td>
                            <p class="center"><a href="#" class="btn btn-mini btn-theme">신고서</a></p>
                          </td>
                          <td>  
                            <p class="center">test</p>
                          </td>
                          <td>  
                            <p class="center"><a href="#" class="btn btn-mini btn-theme">정지</a></p>
                          </td>
                        </tr>                            
                      </table>
                    </div>
                    <!-- 페이징 -->
                    <div class="span8">
                      <p class="center">1 2 3 4 5</p>
                    </div>
                  </div>
                </div>                      
            </article>
          </div>
        </div>
      </div>
    </section>



<%@ include file="../includes/footer.jsp" %>