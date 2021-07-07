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
                        <li class="active">현직자 매칭 리스트> <i class="icon-angle-right"></i></li>
                        <li class="active">상세내용 <i class="icon-angle-right"></i></li>
                        <li class="active">수정하기 </li>
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
              <form id="commentform" action="/bmatch/update" method="post" name="comment-form">
             	 <input type="hidden" name="pageNum" value="${cri.pageNum}">
				<input type="hidden" name="b_num" value="${bMatch.b_num}">
				<input type="hidden" name="b_subject" value="${bMatch.b_subject}">
				<input type="hidden" name="b_category" value="${bMatch.b_category}">
                <div class="row">
                  <div class="post-heading">
                    <p class="line_9"></p>
                    <p class="line_9"></p>
                    <h3 style="color: #f84002;">&nbsp&nbsp&nbsp<strong>현직자</strong>&nbsp 매칭 상세내용 수정</h3>
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
                            <p class="center">아 &nbsp 이 &nbsp 디</p>
                          </td>
                          <td>
                            <input type="text" name="m_id"value="${bMatch.m_id}" readonly="readonly"/>
                          </td>
                        </tr>
                        
                        <tr>
                          <td>
                            <p class="center">지&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp역</p>
                          </td>
                          <!-- <td colspan="3">                              -->
                            <td colspan="3">
                              <!-- 지역 -->
                              <select id="location1" name="location1" class="location" style="width: 150px">
                                
				                </select>
				                <select id="location2" name="location2" class="location" style="width: 150px">
				                  
				                </select>
				                <select id="location3" name="location3" class="location" style="width: 150px">
				                                             
				                </select>
                            </td>
                        </tr>
                        <!-- <tr> 
                          <td>
                            <p class="center">관심기업 및 직무</p>
                          </td>
                          <td>
                         
                            <input type="text" style="width:200px" value="삼성SDS  &nbsp &nbsp">
                            &nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp                           
                            <select name="1" class="location" >
                                <option value="1">IT/인터넷</option>
                                <option value="1">경영/사무</option>
                                <option value="1">디자인</option>
                                <option value="1">생산/제조</option>
                            </select>
                          </td>
                        </tr>  -->
                       
                        <tr>
                          <td>
                            <p class="center">기 &nbsp&nbsp&nbsp&nbsp&nbsp&nbsp 간</p>
                          </td>
                          <td>
                            <!-- 모집정보 기간 fromm ~ to  -->
                            <input type="date" name="b_stdate"  value="${bMatch.b_stdate}" />
                            <span>&nbsp 부터 &nbsp</span> 
                            <input type="date" name="b_endate"  value="${bMatch.b_endate}" />
                            <span>&nbsp 까지 &nbsp</span>                           
                           
                          </td>
                        </tr>
                        <tr>
                          <td>
                            <p class="center">시 &nbsp&nbsp&nbsp&nbsp&nbsp&nbsp 간</p>
                          </td>
                          <td> 
                              <!-- 모집정보 시간 -->
                              <input type="text" name="b_period"  value="${bMatch.b_period}" style="width:50px" > 
                              <span>&nbsp&nbsp</span> 
                              <span>시간</span>
                          </td>
                        </tr>
                        <tr>
                          <td>
                            <p class="center">가 &nbsp&nbsp&nbsp&nbsp&nbsp&nbsp 격</p>
                          </td>
                          <td>
                            <!-- 모집정보 가격 -->
                            <input type="text" name="b_price"  value="${bMatch.b_price}" style="width:200px"> 
                            <span>&nbsp&nbsp</span> 
                            <span>원</span>
                            </div>
                          </td>
                        </tr>
                        <tr>
                          <td>
                            <p class="center">내 &nbsp&nbsp&nbsp&nbsp&nbsp&nbsp 용</p>
                          </td>
                          <td>
                              <!-- 모집정보 내용 -->
                              <% pageContext.setAttribute("replaceChar","\n");%>
                              <textarea rows="3" type="text" name="b_contents">${fn:replace(bMatch.b_contents,line,"<br/>")}</textarea>
                          </td>
                        </tr>                        
                      </table>
                      <div class="span9">
                        <div class="box aligncenter">
                          <p class="center">
                          <input class="btn btn-theme margintop10 i_btn2" type="submit" value="수정하기">
                          <input class="btn btn-inverse margintop10 i_btn2" type="button" onclick="location.href='/bmatch/view?pageNum=${cri.pageNum}&b_category=${bMatch.b_category}&b_num=${bMatch.b_num}&m_id=${bMatch.m_id}'"  value="취소하기">
                            
                            
                        </p>
                        </div>
                      </div>   

                  <!-- 줄간격 조정 -->
                  <p class="line_9"></p>               
                  <p class="line_9"></p>               

              </form>
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
                contentStr += "<option name='location1' value='"+Str+"'>"
                +Str+"</option>";
                                
            }
            $("#location1").append(contentStr);
            radio2Add();
        }
    });
    function radio2Add(){
        $("#location1").change(function(){
            var checkedRadio1 = $("#location1").children("option:selected").text();
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
            $('option[name="location2"]').remove();
            $('.location2').remove();
            $('option[name="location3"]').remove();
            $('.location3').remove();
            
            
            var list = data.response.result.featureCollection.features;//[0].properties.ctp_kor_nm;
        
            var listlen = list.length;
            var contentStr = "";
            for(var i=0 ; i<listlen; i++){
                var Str = list[i].properties.sig_kor_nm;
                contentStr += "<option name='location2' value='"+Str+"'>"
                +Str+"</option>";
                console.log(contentStr);
            }
            $("#location2").append(contentStr);
            radio3Add();
            }
        });
    };
    function radio3Add(){
        $("#location2").change(function(){
            var checkedRadio1 = $("#location1").children("option:selected").text();
            var checkedRadio2 = $("#location2").children("option:selected").text();
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
            $('option[name="location3"]').remove();
            $('.location3').remove();
            
            var list = data.response.result.featureCollection.features;//[0].properties.ctp_kor_nm;
        
            var listlen = list.length;
            var contentStr = "";
            for(var i=0 ; i<listlen; i++){
                var Str = list[i].properties.emd_kor_nm;
                contentStr += "<option name='location3' value='"+Str+"'>"
                +Str+"</option>";
                console.log(contentStr);

            }
            $("#location3").append(contentStr);

            }
        });
    };

    
</script>