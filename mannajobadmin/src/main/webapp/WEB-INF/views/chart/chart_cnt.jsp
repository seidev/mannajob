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
              <li><a href="#">통계</a><i class="icon-angle-right"></i></li>
              <li class="active">매칭 성사 건수 통계</li>
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
                <h5 class="widgetheading height_40">통&nbsp&nbsp&nbsp&nbsp계</h5>

                <ul class="cat">
                  <li><i class="icon-angle-right"></i><a href="/chart/chart_cnt">매칭 성사 건수 통계</a></li>
                  <li><i class="icon-angle-right"></i><a href="/chart/chart_field">분야별 매칭 분석</a></li>
                </ul>
              </div>
            </aside>
          </div>

          <div class="span8">
            <article>
              <form id="commentform" action="#" method="post" name="comment-form">
                <div class="row">
                  <div class="post-heading">
                    <p class="line_9">
                    <p class="line_9">
                    <h3 style="color: #f84002;">&nbsp&nbsp&nbsp<strong></strong>매칭 성사 건수 통계</h3>
                    <p class="line_9">
                  </div>

                  <!-- 매칭 성사 건수 통계 차트 Start -->
                  <div class="span8">
                    <div class="chart-bar">
                      <canvas id="myBarChart"></canvas>
                    </div>
                  </div>
                  <!-- 매칭 성사 건수 통계 차트 End -->

              </form>
            </article>
          </div>
        </div>
      </div>
    </section>


<%@ include file="../includes/footer.jsp" %>

<script>
Chart.defaults.global.defaultFontFamily = 'Nunito', '-apple-system,system-ui,BlinkMacSystemFont,"Segoe UI",Roboto,"Helvetica Neue",Arial,sans-serif';
Chart.defaults.global.defaultFontColor = '#858796';

function number_format(number, decimals, dec_point, thousands_sep) {
  // *     example: number_format(1234.56, 2, ',', ' ');
  // *     return: '1 234,56'
  number = (number + '').replace(',', '').replace(' ', '');
  var n = !isFinite(+number) ? 0 : +number,
    prec = !isFinite(+decimals) ? 0 : Math.abs(decimals),
    sep = (typeof thousands_sep === 'undefined') ? ',' : thousands_sep,
    dec = (typeof dec_point === 'undefined') ? '.' : dec_point,
    s = '',
    toFixedFix = function(n, prec) {
      var k = Math.pow(10, prec);
      return '' + Math.round(n * k) / k;
    };
  // Fix for IE parseFloat(0.55).toFixed(0) = 0;
  s = (prec ? toFixedFix(n, prec) : '' + Math.round(n)).split('.');
  if (s[0].length > 3) {
    s[0] = s[0].replace(/\B(?=(?:\d{3})+(?!\d))/g, sep);
  }
  if ((s[1] || '').length < prec) {
    s[1] = s[1] || '';
    s[1] += new Array(prec - s[1].length + 1).join('0');
  }
  return s.join(dec);
}



////////////////////////////////////////////////////////////////////////////////////////////////////////
// 매칭 성사 건수 통계
var ctx = document.getElementById("myBarChart");
var date = new Date();
console.log(date.getMonth()+"."+date.getDate()-3);
console.log(date.getMonth()+"."+date.getDate()-2);
console.log(date.getMonth()+"."+date.getDate()-1);
console.log(date.getMonth()+"."+date.getDate());
console.log(date.getMonth()+"."+date.getDate()+1);
console.log(date.getMonth()+"."+date.getDate()+2);
var myBarChart = new Chart(ctx, {
  type: 'bar',
  data: {
    labels: ["11.1", "11.2", "11.3", "11.4", "11.5", "11.6", "11.7"],
    datasets: [{
      label: "매칭신청건수",
      backgroundColor: "#636161",
      hoverBackgroundColor: "#009c50",
      borderColor: "#636161",
      data: ["${match1}", "${match2}", "${match3}", "${match4}", "${match5}", "${match6}", "${match7}"]
    },
    {
      label: "매칭성사건수",
      backgroundColor: "#f84002",
      hoverBackgroundColor: "#f7ba53",
      borderColor: "#f84002",
      data: ["${bmatch1}", "${bmatch2}", "${bmatch3}", "${bmatch4}", "${bmatch5}", "${bmatch6}", "${bmatch7}"]
    }],
  },
  options: {
    maintainAspectRatio: false,
    layout: {
      padding: {
        left: 10,
        right: 25,
        top: 25,
        bottom: 0
      }
    },
    scales: {
      xAxes: [{
        time: {
          unit: 'month'
        },
        gridLines: {
          display: false,
          drawBorder: false
        },
        scaleLabel: {
          display: true,
          labelString: '날짜(일주일)',
          // fontColor: 'red'
        },
        ticks: {
          maxTicksLimit: 6
        },
        maxBarThickness: 25,
      }],
      yAxes: [{
        ticks: {
          min: 0,
          max: "${max}",
          maxTicksLimit: 5,
          padding: 10,
          // Include a dollar sign in the ticks
          callback: function(value, index, values) {
            //return '$' + number_format(value);
            return number_format(value) + '건';
          }
        },
        gridLines: {
          color: "rgb(234, 236, 244)",
          zeroLineColor: "rgb(234, 236, 244)",
          drawBorder: false,
          borderDash: [2],
          zeroLineBorderDash: [2]
        },
        scaleLabel: {
          display: true,
          labelString: '건수',
          // fontColor: 'red'
        },
      }],
    },
    legend: {
      display: false
    },
    tooltips: {
      titleMarginBottom: 10,
      titleFontColor: '#6e707e',
      titleFontSize: 14,
      backgroundColor: "rgb(255,255,255)",
      bodyFontColor: "#858796",
      borderColor: '#dddfeb',
      borderWidth: 1,
      xPadding: 15,
      yPadding: 15,
      displayColors: false,
      caretPadding: 10,
      callbacks: {
        label: function(tooltipItem, chart) {
          var datasetLabel = chart.datasets[tooltipItem.datasetIndex].label || '';
          //return datasetLabel + ': $' + number_format(tooltipItem.yLabel);
          return datasetLabel + ': ' + number_format(tooltipItem.yLabel) + '건';
        }
      }
    },
    title: {
      display: true,
      text: '매칭 성사 건수 통계'
    },
  }
});
</script>