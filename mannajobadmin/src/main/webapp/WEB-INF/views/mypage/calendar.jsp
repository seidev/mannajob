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
              <li><a href="#">마이페이지</a><i class="icon-angle-right"></i></li>
              <li class="active">일정관리</li>
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
                <h5 class="widgetheading height_40">매&nbsp&nbsp&nbsp&nbsp칭</h5>

                <ul class="cat">
                  <li><i class="icon-angle-right"></i><a href="/match/matlist">매칭내역관리</a></li>
                  <c:set var="now" value="<%=new java.util.Date()%>" />
				  <c:set var="sysYear"><fmt:formatDate value="${now}" pattern="yyyy-MM" /></c:set> 
                  <li><i class="icon-angle-right"></i><a href="/mypage/calendar?yearmonth=${sysYear}">일정관리</a></li>
                  <li><i class="icon-angle-right"></i><a href="/profile/main">회원정보관리</a></li>
                  <li><i class="icon-angle-right"></i><a href="/profile/emplprofile">현직자 프로필관리</a></li>
                  <li><i class="icon-angle-right"></i><a href="/profile/empl">현직자 지원</a></li>
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
                    <h3 style="color: #f84002;">&nbsp&nbsp&nbsp<strong></strong>일정 관리</h3>
                    <p class="line_9"></p>
                  </div>

                  <!-- <div class="row"> -->
                  <div class="span9">
                    <!-- <h5>▶ 일정 관리</h5> -->
                    <table class="table scriptCalendar">
                      <!-- <colgroup>
                        <col style="width: 10%;">
                        <col style="width: auto">
                        <col style="width: 10%;">
                      </colgroup> -->
                      <thead>
                        <tr>
                            <td onClick="prevCalendar();" style="cursor:pointer;">&#60;&#60; 이전달</td>
                            <td colspan="5">
                              <p class="center">
                                <span id="calYear">YYYY</span>년
                                <span id="calMonth">MM</span>월
                              </p>
                            </td>
                            <td onClick="nextCalendar();" style="cursor:pointer;">다음달 &#62;&#62;</td>
                        </tr>
                      </thead>
                    </table>
                    <table class="table table-bordered scriptCalendar">
                      <thead>
                        <tr>
                            <td><p class="center">일</p></td>
                            <td><p class="center">월</p></td>
                            <td><p class="center">화</p></td>
                            <td><p class="center">수</p></td>
                            <td><p class="center">목</p></td>
                            <td><p class="center">금</p></td>
                            <td><p class="center">토</p></td>
                        </tr>
                      </thead>
                      <tbody id="calendarBody"></tbody>                      
                    </table>
                  </div>
                </div>
              <!-- </form> -->
            </article>
          </div>
        </div>
      </div>
    </section>

<%@ include file="../includes/footer.jsp" %>

<script type="text/javascript">
var today = new Date(); // @param 전역 변수, 오늘 날짜 / 내 컴퓨터 로컬을 기준으로 today에 Date 객체를 넣어줌
var date = new Date();  // @param 전역 변수, today의 Date를 세어주는 역할

const map = new Map();
let daysch="";
getdate();

buildCalendar();


function getdate(){
<c:forEach var="i" begin="1" end="31">
	daysch="<p style='margin-top:20px'></p>";
	<c:forEach var = "sch" items="${list1}">
		<c:if test="${i eq fn:substring(sch.mat_stdate,8,10)}">
			daysch += "<p class='center'><a href='/bmatch/view?b_category="+"${sch.b_category}"+"&m_id="+"${sch.m_id}"+"&b_num="+"${sch.b_num}' class='btn btn-inverse i_btn2' >" + "${sch.m_id}"+"&nbsp&nbsp"+"${sch.mat_hour}"+"</a>";
		</c:if>
	</c:forEach>
	<c:forEach var = "sch2" items="${list2}">
	<c:if test="${i eq fn:substring(sch2.mat_stdate,8,10)}">
		daysch += "<p class='center'><a href='/bmatch/view?b_category="+"${sch2.b_category}"+"&m_id="+"${sch2.m_id}"+"&b_num="+"${sch2.b_num}' class='btn btn-inverse i_btn2' >" + "${sch2.m_id}"+"&nbsp&nbsp"+"${sch2.mat_hour}"+"</a>";
	</c:if>
</c:forEach>
	map.set("${i}",daysch);
</c:forEach>
}

function getdata2(data){
	for(var i=1; i<=31;i++){
		daysch="<p style='margin-top:20px'></p>";
		for(var j=0; j<data.length;j++){
			if(i == data[j].mat_stdate.substring(8,10)){
				daysch += "<p class='center'><a href='/bmatch/view?b_category="+data[j].b_category+"&m_id="+data[j].m_id+"&b_num="+data[j].b_num+"' class='btn btn-inverse i_btn2' >" +data[j].m_id +"&nbsp&nbsp"+data[j].mat_hour+"</a>";
			}
		}
		map.set(String(i),daysch);
		console.log(map.get(String(i)));
	}
}

function dataChange(){
	let year = today.getFullYear();
	let month = today.getMonth()+1;
	let yearmonth= year +"-"+ month;
	console.log(year);
	console.log(month);
	$.ajax({
		url:'/mypage/calendar.json?yearmonth='+yearmonth,
		dataType:"json",
		success:function(data){
			let data1 = data.list1;
			let data2 = data.list2;
			let dataArray = new Array();
			for(var i=0; i<data1.length; i++){
				dataArray.push(data1[i]);
				console.log(data1[i]);
			}
			for(var i=0; i<data2.length; i++){
				dataArray.push(data2[i]);
				console.log(data2[i]);
			}
			
			getdata2(dataArray);
			buildCalendar();
		}
	});
}

// 이전달
function nextCalendar() {
    this.today = new Date(today.getFullYear(), today.getMonth() + 1, today.getDate());
    map.clear();
    dataChange();
    setTimeout(()=>buildCalendar(),2000);
}

// 다음달
function prevCalendar() {
    this.today = new Date(today.getFullYear(), today.getMonth() - 1, today.getDate());
    map.clear();
    dataChange();
    setTimeout(()=>buildCalendar(),2000);
}

function buildCalendar() {
    var doMonth = new Date(today.getFullYear(), today.getMonth(), 1);
    var lastDate = new Date(today.getFullYear(), today.getMonth() + 1, 0);

    var tbCalendar = document.querySelector(".scriptCalendar > tbody");

    document.getElementById("calYear").innerText = today.getFullYear();
    document.getElementById("calMonth").innerText = autoLeftPad((today.getMonth() + 1), 2);

    while(tbCalendar.rows.length > 0) {
        tbCalendar.deleteRow(tbCalendar.rows.length - 1);
    }

    var row = tbCalendar.insertRow();
    
    var dom = 1; // row 증가값

    var daysLength = (Math.ceil((doMonth.getDay() + lastDate.getDate()) / 7) * 7) - doMonth.getDay();

    // 달력 출력
    for(var day = 1 - doMonth.getDay(); daysLength >= day; day++) {
        var column = row.insertCell();
		

        // 평일( 전월일과 익월일의 데이터 제외 )
        if(Math.sign(day) == 1 && lastDate.getDate() >= day) {
	
	
            column.innerHTML = autoLeftPad(day, 2); // 평일
            
            column.innerHTML += map.get(String(day));
            
            if(dom % 7 == 1) { // 일요일
                column.style.color = "#FF4D4D";
            }
            if(dom % 7 == 0) { // 토요일
                column.style.color = "#4D4DFF";
                row = tbCalendar.insertRow();   // 가로 행 한줄 추가
            }
        }
        dom++;
    }
}

// Month 두자릿수 변경
function autoLeftPad(num, digit) {
    if(String(num).length < digit) {
        num = new Array(digit - String(num).length + 1).join("0") + num;
    }
    return num;
}

</script>
