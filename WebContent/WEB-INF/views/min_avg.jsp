<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file="../../header.jsp"%>

<!DOCTYPE>
<html>
<head>
<meta charset="UTF-8">
<title></title>

<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
<script src="https://code.highcharts.com/highcharts.js"></script>
<script src="https://code.highcharts.com/modules/exporting.js"></script>
<script src="https://code.highcharts.com/modules/export-data.js"></script>

<script type="text/javascript">

	var itChart;
	var stChart;
	var ihChart;
	var shChart;
	var tChart;
	var hChart;

	$(function(){
		
		var sub = '${sub}';
		
		minAvg();
		
		$('.it').hide();
		$('.st').hide();
		$('.ih').hide();
		$('.sh').hide();
		$('.t').hide();
		$('.h').hide();
		
		if('${sub}' == 'each') {
			$('.it').show();
			$('.st').show();
			$('.ih').show();
			$('.sh').show();
			$('.t').show();
			$('.h').show();
		} else {
			$('.${sub}').show();
		}
		
		setInterval(function(){
			// location.href='dataViewForm.do';
			minAvg();
		}, 60000);
		
		
		
		
		Date.prototype.format = function (f) {

		    if (!this.valueOf()) return " ";



		    var weekKorName = ["일요일", "월요일", "화요일", "수요일", "목요일", "금요일", "토요일"];

		    var weekKorShortName = ["일", "월", "화", "수", "목", "금", "토"];

		    var weekEngName = ["Sunday", "Monday", "Tuesday", "Wednesday", "Thursday", "Friday", "Saturday"];

		    var weekEngShortName = ["Sun", "Mon", "Tue", "Wed", "Thu", "Fri", "Sat"];

		    var d = this;



		    return f.replace(/(yyyy|yy|MM|dd|KS|KL|ES|EL|HH|hh|mm|ss|a\/p)/gi, function ($1) {

		        switch ($1) {

		            case "yyyy": return d.getFullYear(); // 년 (4자리)

		            case "yy": return (d.getFullYear() % 1000).zf(2); // 년 (2자리)

		            case "MM": return (d.getMonth() + 1).zf(2); // 월 (2자리)

		            case "dd": return d.getDate().zf(2); // 일 (2자리)

		            case "KS": return weekKorShortName[d.getDay()]; // 요일 (짧은 한글)

		            case "KL": return weekKorName[d.getDay()]; // 요일 (긴 한글)

		            case "ES": return weekEngShortName[d.getDay()]; // 요일 (짧은 영어)

		            case "EL": return weekEngName[d.getDay()]; // 요일 (긴 영어)

		            case "HH": return d.getHours().zf(2); // 시간 (24시간 기준, 2자리)

		            case "hh": return ((h = d.getHours() % 12) ? h : 12).zf(2); // 시간 (12시간 기준, 2자리)

		            case "mm": return d.getMinutes().zf(2); // 분 (2자리)

		            case "ss": return d.getSeconds().zf(2); // 초 (2자리)

		            case "a/p": return d.getHours() < 12 ? "오전" : "오후"; // 오전/오후 구분

		            default: return $1;

		        }

		    });

		};



		String.prototype.string = function (len) { var s = '', i = 0; while (i++ < len) { s += this; } return s; };

		String.prototype.zf = function (len) { return "0".string(len - this.length) + this; };

		Number.prototype.zf = function (len) { return this.toString().zf(len); };
		
	})
	
	function minAvg() {
		
		
		var times = [];
		var itDatas = [];
		var stDatas = [];
		var ihDatas = [];
		var shDatas = [];
		
		$.ajax({
			
			url:'minAvg.do',
			dataType:'json',
			success:function(result){				
				
				$.each(result, function(i, r){
					
					var tempDate = new Date(r.date);
					
					times.push(tempDate.format('HH:mm'));
					
					itDatas.push(r.it);
					stDatas.push(r.st);
					ihDatas.push(r.ih);
					shDatas.push(r.sh);

				})
				
				
				itChart=Highcharts.chart('containerIt', {
					  chart: {
						    type: 'line'
						  },
						  title: {
						    text: '분당 평균 내부 온도'
						  },
						  subtitle: {
						    text: 'SmartFARM'
						  },
						  xAxis: {
						    categories: times
						  },
						  yAxis: {
						    title: {
						      text: '온도 (°C)'
						    }
						  },
						  plotOptions: {
						    line: {
						      dataLabels: {
						        enabled: true
						      },
						      enableMouseTracking: false,
						      animation: false,
						      color: '#ff0000'
						    }
						  },
						  series: [{
						    name: '내부온도',
						    data: itDatas
						  }]
						});
				
				stChart=Highcharts.chart('containerSt', {
					  chart: {
						    type: 'line'
						  },
						  title: {
						    text: '분당 평균 토양 온도'
						  },
						  subtitle: {
						    text: 'SmartFARM'
						  },
						  xAxis: {
						    categories: times
						  },
						  yAxis: {
						    title: {
						      text: '온도 (°C)'
						    }
						  },
						  plotOptions: {
						    line: {
						      dataLabels: {
						        enabled: true
						      },
						      enableMouseTracking: false,
						      animation: false,
						      color:'#ff33cc'
						    }
						  },
						  
						  series: [{
						    name: '토양온도',
						    data: stDatas
						  }]
						});
				
				stChart=Highcharts.chart('containerIh', {
					  chart: {
						    type: 'line'
						  },
						  title: {
						    text: '분당 평균 내부 습도'
						  },
						  subtitle: {
						    text: 'SmartFARM'
						  },
						  xAxis: {
						    categories: times
						  },
						  yAxis: {
						    title: {
						      text: '습도 (%)'
						    }
						  },
						  plotOptions: {
						    line: {
						      dataLabels: {
						        enabled: true
						      },
						      enableMouseTracking: false,
						      animation: false,
						      color:  '#0000ff'
						    }
						  },
						  series: [{
						    name: '내부습도',
						    data: ihDatas
						  }]
						});
				
				stChart=Highcharts.chart('containerSh', {
					  chart: {
						    type: 'line'
						  },
						  title: {
						    text: '분당 평균 토양 습도'
						  },
						  subtitle: {
						    text: 'SmartFARM'
						  },
						  xAxis: {
						    categories: times
						  },
						  yAxis: {
						    title: {
						      text: '습도 (%)'
						    }
						  },
						  plotOptions: {
						    line: {
						      dataLabels: {
						        enabled: true
						      },
						      enableMouseTracking: false,
						      animation: false,
						      color:  '#0099cc'
						    }
						  },
						  series: [{
						    name: '토양습도',
						    data: shDatas
						  }]
						});
				
				tChart=Highcharts.chart('containerT', {
					  chart: {
						    type: 'line'
						  },
						  title: {
						    text: '분당 평균 온도 비교'
						  },
						  subtitle: {
						    text: 'SmartFARM'
						  },
						  xAxis: {
						    categories: times
						  },
						  yAxis: {
						    title: {
						      text: '온도 (°C)'
						    }
						  },
						  plotOptions: {
						    line: {
						      dataLabels: {
						        enabled: true
						      },
						      enableMouseTracking: false,
						      animation: false,
						    }
						  },
						  colors: ['#ff0000', '#ff33cc'],
						  series: [{
						    name: '내부온도',
						    data: itDatas
						  }, {
							name: '토양온도',
							data: stDatas 
						  }]
						});
				
				hChart=Highcharts.chart('containerH', {
					  chart: {
						    type: 'line'
						  },
						  title: {
						    text: '분당 평균 습도 비교'
						  },
						  subtitle: {
						    text: 'SmartFARM'
						  },
						  xAxis: {
						    categories: times
						  },
						  yAxis: {
						    title: {
						      text: '습도 (%)'
						    }
						  },
						  plotOptions: {
						    line: {
						      dataLabels: {
						        enabled: true
						      },
						      enableMouseTracking: false,
						      animation: false,
						    }
						  },
						  colors: ['#0000ff', '#0099cc'],
						  series: [{
						    name: '내부습도',
						    data: ihDatas
						  }, {
							name: '토양습도',
							data: shDatas 
						  }]
						});
				
				
			},
			error:function(){}
			
			
		})
		
	}
	

</script>

</head>
<body style="background-color: #ffffcc;">

<div class="it" id="containerIt" style="min-width: 310px; height: 400px; margin: 0 auto"></div>
<hr class="it" style="background-color: #fff2cc; height: 10px;">
<div class="st" id="containerSt" style="min-width: 310px; height: 400px; margin: 0 auto"></div>
<hr class="st" style="background-color: #fff2cc; height: 10px;">
<div class="ih" id="containerIh" style="min-width: 310px; height: 400px; margin: 0 auto"></div>
<hr class="ih" style="background-color: #fff2cc; height: 10px;">
<div class="sh" id="containerSh" style="min-width: 310px; height: 400px; margin: 0 auto"></div>
<hr class="sh" style="background-color: #fff2cc; height: 10px;">
<div class="t" id="containerT" style="min-width: 310px; height: 400px; margin: 0 auto"></div>
<hr class="t" style="background-color: #fff2cc; height: 10px;">
<div class="h" id="containerH" style="min-width: 310px; height: 400px; margin: 0 auto"></div>
<hr class="h" style="background-color: #fff2cc; height: 10px;">

</body>
</html>