<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ include file="../includes/header.jsp" %>


 <!-- 블랙바 루트출력 시작 -->
    <section id="inner-headline">
      <div class="container">
        <div class="row">
          <div class="span12">
            <ul class="breadcrumb">
              <li><a href="#"><i class="icon-home"></i></a><i class="icon-angle-right"></i></li>
              <li><a href="#">Search</a><i class="icon-angle-right"></i></li>
              <li class="active">매칭신청 리스트</li>
            </ul>
          </div>
        </div>
      </div>
    </section>
    <!-- 블랙바 루트출력 끝 -->

    <section id="" style="min-height:680px">
      <div class="container">       
        <div class="row">
          
          <div class="span3">
            <aside class="left-sidebar">
              <div class="widget">
              </div>
              <!-- 왼쪽 메뉴 시작 -->
              <div class="widget">
                <h5 class="widgetheading height_40">매&nbsp&nbsp&nbsp&nbsp칭</h5>
                <ul class="cat">
                   <li><i class="icon-angle-right"></i><a href="/bmatch/list?b_category=A">현직자 매칭 리스트</a></li>
                  <li><i class="icon-angle-right"></i><a href="/bmatch/list?b_category=B">쥐업준비생 매칭 리스트</a></li>
                </ul>
              </div>
              <!-- 왼쪽 메뉴 끝-->
            </aside>
          </div>

          <div class="span9">
            <article>
              <p class="line_9"></p>
              <p class="line_9"></p>
              
              <form action="/bmatch/search" method="get">
              <table class="table table-bordered">
                <colgroup>
                  <col style="width:12%"/>
                  <col style="width:20%"/>
                  <col style="width:32%"/>
                  <col style="width:36%"/>
                </colgroup>
                <tr>
                  <td>
                    <p class="center">기 &ensp; 업 &ensp; 명</p>
                  </td>
                  <td colspan="3">
                    <input type="text"  name="b_corp" style="width:300px" placeholder="기업명을 입력해 주세요"> 
                  </td>
                </tr>
              
                <tr>
                  <td>
                    <p class="center">지 &emsp;&emsp; 역</p>
                  </td>
                    <td id = "location1"></td>
                	<td id = "location2"></td>
                	<td id = "location3"></td>
                </tr>
                <tr>
                  <td>
                    <p class="center">분 &emsp;&emsp; 야</p>
                  </td>
                  <td colspan="3">
                    <input type="text" name="b_task" style="width:300px" placeholder="분야를 입력해 주세요"> 
                  </td>
                </tr>
                <tr>
                  <td>
                    <p class="center">구 &emsp;&emsp; 분</p>
                  </td>
                  <td colspan="3">
                    <input type="radio" name="b_category" value="A" checked="checked"  /> 현직자
                    &ensp;
                    <input type="radio" name="b_category" value="B" /> 취업준비생
                  </td>
                </tr>
              </table>
              
                <div class="box aligncenter">
                    <p class="center">
                      <input type="submit" name = "submit" class="btn btn-theme margintop10 i_btn2" value="조회하기">
                    </p>
                </div>
                
              
               </form>
               
               
               
              <div class="row">
                <div class="post-heading">
                  <p class="line_9"></p>
                  
                  <!-- <p class="line_9"></p>
                 
                  
                  
                  
                  
                  <h3 style="color: #f84002;">&nbsp&nbsp&nbsp <strong>매칭 리스트</strong> 검색 결과</h3>
                  <p class="line_9"></p> -->
                </div>
                <!-- best mento  5명 리스트 시작 -->
                <c:if test="${bMatch.b_category eq 'A'}">
                <!-- start best mento 1--> 
                <h4 class="heading left"> &nbsp&nbsp mento</h4> 
				<c:forEach var="empl" items="${empllist}">
                <div class="span2" style="margin-left: 10px;">
                  <!-- <div class="span3"  style="padding-left: 34px;"> -->
                  <div class="box aligncenter">
                    <a href="/profile/showempl?m_id=${empl.m_id}"><img src="../resources/certifi/${empl.fileVO.stored_file_name}" style="width: 120px; height: 120px;" ></a>
                    <div class="text" >
                      <p>${empl.memberVO.m_name}님</p>
                      <p class="txt_small_black line_9">${empl.e_corp}</p>
                      <p class="line_9">${empl.e_task}</p>
                      <p class="line_9">
<!-- 추가 필요 -->
                        <span style="background-color: orangered; color:bisque; padding:4px; border-radius: 5px;">추천</span>
                        <span style="color:orangered">${empl.countG}</span></span350>
                        <span>&nbsp | &nbsp</span>
                        <span>멘토링</span>
                        <span>${empl.countM}</span> 
                      </p>
                    </div>
                  </div>
                </div>
                </c:forEach>
                </c:if>
                <!-- end best mento 1 -->

              </div>
              <!-- best mento  5명 리스트 끝 -->
                    <div class = "span8 center">
                    <c:if test="${emplpage.prev}">
				    	<a href="/bmatch/search?pageNumP=${emplpage.startPage-1}&amountP=5&b_task=${bMatch.b_task}&b_category=${bMatch.b_category}&b_corp=${bMatch.b_corp}&b_location=${bMatch.b_location}">◀</a>
				    </c:if>
				    <c:forEach var="emplnum" begin="${emplpage.startPage}" end="${emplpage.endPage}">
				    	<c:if test="${emplpage.cri.pageNumP == emplnum}">
				    		${emplnum}
				    	</c:if>
				    	<c:if test="${emplpage.cri.pageNumP != emplnum}">
				    		<a href="/bmatch/search?pageNumP=${emplnum}&amountP=5&b_task=${bMatch.b_task}&b_category=${bMatch.b_category}&b_corp=${bMatch.b_corp}&b_location=${bMatch.b_location}">${emplnum}</a>	
				    	</c:if>
				    </c:forEach>
				    <c:if test="${emplpage.next}">
				    	<a href="/bmatch/search?pageNumP=${emplpage.endPage+1}&amountP=5&b_task=${bMatch.b_task}&b_category=${bMatch.b_category}&b_corp=${bMatch.b_corp}&b_location=${bMatch.b_location}">▶</a>
				    </c:if>
    				</div>
              <!-- divider -->
              <div class="solidline">
              	
              </div>
              <!-- end divider -->

              <!-- Item Project and Filter Name 2--> 
              <div class="row">

                <p class="line_9"></p>
                <p class="line_9"></p>
                <h4 class="heading left"><span>신청글 조회결과</span>
                 
                </h4>

                <div class="solidline" style="margin-left: 30px;">
                  <table class="table table-hover">
                    <colgroup>
                      <col style="width:6%"/>
                      <col style="width:30%"/>
                      <col style="width:14%"/>
                      <col style="width:10%"/>
                      <col style="width:12%"/>
                      <col style="width:14%"/>
                      <col style="width:12%"/>
                    </colgroup>
                    <thead>
                      <tr>
                        <th>  번호 </th>
                        <th> 제 &nbsp;&nbsp;&nbsp; 목</th>
                        <th> 기 &nbsp&nbsp&nbsp 간</th>
                        <th> 가 &nbsp&nbsp 격</th>
                        <th> 분 &nbsp&nbsp 야</th>
                        <th> 기 &nbsp&nbsp 업 &nbsp&nbsp 명</th>
                        <th> 지 &nbsp&nbsp 역</th>
                      </tr>
                    </thead>
                    <tbody>
                    		<c:forEach var="bmatch" items="${list}">
                      <tr>
                        <!-- 번호 -->
                        <td><c:out value="${bmatch.b_num}" /></td>
                        <!-- 제목 -->
                        <td><a href="/bmatch/view?b_num=${bmatch.b_num}&pageNum=${page.cri.pageNum}&b_category=${bmatch.b_category}&m_id=${bmatch.m_id}">${bmatch.b_subject}</a></td>
                        <td> 
                          <!-- 기간 from ~ to  --> 
                            <span><c:out value="${bmatch.b_stdate}" /></span><br>
                            <span> ~ </span>
                            <span><c:out value="${bmatch.b_endate}" /></span>
                        </td>
                        <!-- 가격 -->
                        <td><c:out value="${bmatch.b_price}" /></td>
                        <!-- 직무 -->
                        <td><c:out value="${bmatch.b_task}" /></td>
                        <!-- 기업명 -->
                        <td><c:out value= "${bmatch.b_corp}"/></td>
                        <!-- 지역 -->
                        <td><c:out value= "${bmatch.b_location}"/></td>
                      </tr>
                      </c:forEach>
                    </tbody>
                  </table>
                  <div class = "span8 center">
						<c:if test="${page.prev}">
					    	<a href="/bmatch/search?pageNum=${page.startPage-1}&amount=5&b_task=${bMatch.b_task}&b_category=${bMatch.b_category}&b_corp=${bMatch.b_corp}&b_location=${bMatch.b_location}">◀</a>
					    </c:if>
					    <c:forEach var="num" begin="${page.startPage}" end="${page.endPage}">
					    	<c:if test="${page.cri.pageNum == num}">
					    		${num}	
					    	</c:if>
					    	<c:if test="${page.cri.pageNum != num}">
					    		<a href="/bmatch/search?pageNum=${num}&amount=5&b_task=${bMatch.b_task}&b_category=${bMatch.b_category}&b_corp=${bMatch.b_corp}&b_location=${bMatch.b_location}">${num}</a>	
					    	</c:if>
					    </c:forEach>
					    <c:if test="${page.next}">
					    	<a href="/bmatch/search?pageNum=${page.endPage+1}&amount=5&b_task=${bMatch.b_task}&b_category=${bMatch.b_category}&b_corp=${bMatch.b_corp}&b_location=${bMatch.b_location}">▶</a>
					    </c:if>
					    </div>
                </div>
              </div>
            </article>
          </div>
        </div>
      </div>
    </section>


<%@ include file="../includes/footer.jsp" %>
<script>
    $.ajax({
        dataType:"json",
        contentType:"application/json; charset=utf-8",
        url : "http://api.vworld.kr/req/data?service=data&request=GetFeature&data=LT_C_ADSIDO_INFO&key=4F3E73A8-25CD-3128-BB91-176F140ACBB4&domain=http:192.168.0.225/bmatch/list&attrFilter=ctp_kor_nm:like:''&geometry=false&columns=3&size=1000",
        data : {},
        dataType:"jsonp",
        success: function(data){
            var list = data.response.result.featureCollection.features;//[0].properties.ctp_kor_nm;
            var listlen = list.length;
            var contentStr = "";
            for(var i=0 ; i<listlen; i++){
                var Str = list[i].properties.ctp_kor_nm;//.substring(0,2);
                contentStr += "<label class='label1'><input type='radio' class='location1' name='location1' value='"+Str+"'>"
                +Str+"</label>";
                if(i%2==1){
                    contentStr +="<br>";
                }
                
            }
            $("#location1").append(contentStr);
            radio2Add();
        }
    });
    function radio2Add(){
        $("input[name='location1']").change(function(){
            var checkedRadio1 = $("input[name='location1']:checked").val();
            $("input[name='location1']").closest("label").css('background','#303030');
            $("input[name='location1']:checked").closest("label").css('background','#f84002')
            ajax2add(checkedRadio1);
        });
    };
    function ajax2add(searchtxt){
        $.ajax({
        dataType:"json",
        contentType:"application/json; charset=utf-8",
        url : "http://api.vworld.kr/req/data?service=data&request=GetFeature&data=LT_C_ADSIGG_INFO&key=4F3E73A8-25CD-3128-BB91-176F140ACBB4&domain=http:192.168.0.225/bmatch/list&attrFilter=full_nm:like:"+searchtxt+"&geometry=false&columns=3&size=1000",
        data : {},
        dataType:"jsonp",
        success: function(data){
            $('input[name="location2"]').remove();
            $('#location2 > label').remove();
            $('.location2').remove();
            $('input[name="location3"]').remove();
            $('.location3').remove();
            $('#location3 > label').remove();
            $('#location2 > br').remove();
            $('#location3 > br').remove();
            var list = data.response.result.featureCollection.features;//[0].properties.ctp_kor_nm;
        
            var listlen = list.length;
            var contentStr = "";
            for(var i=0 ; i<listlen; i++){
                var Str = list[i].properties.sig_kor_nm;
                contentStr += "<label class='label2'><input type='radio' class='location2' name='location2' value='"+Str+"'>"
                +Str+"</label>";
                console.log(contentStr);
                if(i%4==3){
                    contentStr +="<br>";
                }
            }
            $("#location2").append(contentStr);
            radio3Add();
            }
        });
    };
    function radio3Add(){
        $("input[name='location2']").change(function(){
            var checkedRadio1 = $("input[name='location1']:checked").val();
            var checkedRadio2 = $("input[name='location2']:checked").val();
            $("input[name='location2']").closest("label").css('background','#303030');
            $("input[name='location2']:checked").closest("label").css('background','#f84002')
            // alert(checkedRadio1);
            ajax3add(checkedRadio1+" "+checkedRadio2);
        });
    };
    function ajax3add(searchtxt2){
        $.ajax({
        dataType:"json",
        contentType:"application/json; charset=utf-8",
        url : "http://api.vworld.kr/req/data?service=data&request=GetFeature&data=LT_C_ADEMD_INFO&key=4F3E73A8-25CD-3128-BB91-176F140ACBB4&domain=http:192.168.0.225/bmatch/list&attrFilter=full_nm:like:"+searchtxt2+"&geometry=false&columns=3&size=1000",
        data : {},
        dataType:"jsonp",
        success: function(data){
            $('input[name="location3"]').remove();
            $('.location3').remove();
            $('#location3 > label').remove();
            $('#location3 > br').remove();
            var list = data.response.result.featureCollection.features;//[0].properties.ctp_kor_nm;
        
            var listlen = list.length;
            var contentStr = "";
            for(var i=0 ; i<listlen; i++){
                var Str = list[i].properties.emd_kor_nm;
                contentStr += "<label  class='label3'><input type='radio' class='location3' name='location3' value='"+Str+"'>"
                +Str+"</label>";
                console.log(contentStr);
                if(i%5==4){
                    contentStr +="<br>";
                }
            }
            $("#location3").append(contentStr);
            radio4Add();
            }
        });
    };
    function radio4Add(){
        $("input[name='location3']").change(function(){
            $("input[name='location3']").closest("label").css('background','#303030');
            $("input[name='location3']:checked").closest("label").css('background','#f84002')
        });
    };

    
    
</script>

