<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>   

<%@ include file="../../header.jsp"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>    
    
<!DOCTYPE>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>


<style type="text/css">

.highcharts-yaxis-grid .highcharts-grid-line {
	display: none;
}

</style>

<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta/css/bootstrap.min.css" integrity="sha384-/Y6pD6FV/Vv2HJnA6t+vslU6fwYXjCFtcEpHbNJ0lyAFsXTsjBbfaDjzALeQsN6M" crossorigin="anonymous">

<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.3/umd/popper.min.js" integrity="sha384-vFJXuSJphROIrBnz7yo7oB41mKfc8JzQZiCq4NCceLEaO4IHwicKwpJf9c9IpFgh" crossorigin="anonymous"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta/js/bootstrap.min.js" integrity="sha384-h0AbiXch4ZDo7tp9hKZ4TsHbi047NrKGLO3SEJAg45jXxnGIfYzk4Si90RDIqNm1" crossorigin="anonymous"></script>

<script src="https://code.highcharts.com/highcharts.js"></script>
<script src="https://code.highcharts.com/highcharts-more.js"></script>

<script src="https://code.highcharts.com/modules/solid-gauge.js"></script>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script type="text/javascript">



var gaugeOptions;

var chartLi;
var chartIt;
var chartIh;
var chartSt;
var chartSh;

var li;
var it;
var ih;
var st;
var sh;

$(function(){
	
	currentDataView();
	
	
	gaugeOptions = {

		    chart: {
		        type: 'solidgauge',
		        alignTicks: false 
		    },

		    title: null,

		    pane: {
		        center: ['50%', '85%'],
		        size: '140%',
		        startAngle: -90,
		        endAngle: 90,
		        background: {
		            backgroundColor: (Highcharts.theme && Highcharts.theme.background2) || '#EEE',
		            innerRadius: '60%',
		            outerRadius: '100%',
		            shape: 'arc'
		        }
		    },

		    tooltip: {
		        enabled: false
		    },

		    // the value axis
    		yAxis: {
       			stops: [
       		       		[0.1, '#DF5353'], // red
       			        [0.625, '#DDDF0D'], // yellow
       			        [0.675, '#55BF3B'], // green
       			        [0.725, '#DDDF0D'], // yellow
       			        [0.9, '#DF5353'] // red
       			],
        		lineWidth: 0,
        		minorTickInterval: null,
        		tickAmount: 2,
        		title: {
            		y: -120,
            		style: {"fontSize": "22px"}
        		},
        		labels: {
            		y: 16
        		}
    		},

		    plotOptions: {
		        solidgauge: {
		            dataLabels: {
		                y: 5,
		                borderWidth: 0,
		                useHTML: true
		            }
		        }
		    }
		};
	
	chartLi=Highcharts.chart('container-li', Highcharts.merge(gaugeOptions, {
		
		yAxis: {
			min: 0,
	        max: 2000,
	        title: {
	            text: '조도',
	            y: -120,
        		style: {"fontSize": "22px"}
	        },
   			stops: [
   		       		[0.1, '#ffffff'], // white
   			        [0.9, '#ffff00'], // yellow
   			],
    		lineWidth: 0,
    		minorTickInterval: null,
    		tickAmount: 2,
    		labels: {
        		y: 16
    		}
		},
	    
	    credits: {
	        enabled: false
	    },

	    series: [{
	        name: '조도',
	        data: [0],
	        dataLabels: {
	            format: '<div style="text-align:center"><span style="font-size:25px;color:' +
	                ((Highcharts.theme && Highcharts.theme.contrastTextColor) || 'black') + '">{y}</span><br/>' +
	                   '<span style="font-size:12px;color:silver">lux</span></div>'
	        },
	        tooltip: {
	            valueSuffix: ' lux'
	        }
	    }]

	}));
		
		chartIt=Highcharts.chart('container-it', Highcharts.merge(gaugeOptions, {
		    yAxis: {
		        min: 0,
		        max: 40,
		        title: {
		            text: '내부온도'
		        }
		    },
		    
		    credits: {
		        enabled: false
		    },

		    series: [{
		        name: '내부온도',
		        data: [0],
		        dataLabels: {
		            format: '<div style="text-align:center"><span style="font-size:25px;color:' +
		                ((Highcharts.theme && Highcharts.theme.contrastTextColor) || 'black') + '">{y}</span><br/>' +
		                   '<span style="font-size:12px;color:silver">°C</span></div>'
		        },
		        tooltip: {
		            valueSuffix: ' °C'
		        }
		    }]

		}));
		
		chartIh=Highcharts.chart('container-ih', Highcharts.merge(gaugeOptions, {
		    yAxis: {
		        min: 30,
		        max: 70,
		        title: {
		            text: '내부습도'
		        }
		    },
		    
		    credits: {
		        enabled: false
		    },

		    series: [{
		        name: '내부습도',
		        data: [0],
		        dataLabels: {
		            format: '<div style="text-align:center"><span style="font-size:25px;color:' +
		                ((Highcharts.theme && Highcharts.theme.contrastTextColor) || 'black') + '">{y}</span><br/>' +
		                   '<span style="font-size:12px;color:silver">%</span></div>'
		        },
		        tooltip: {
		            valueSuffix: ' %'
		        }
		    }]

		}));
		
		chartSt=Highcharts.chart('container-st', Highcharts.merge(gaugeOptions, {
		    yAxis: {
		        min: 0,
		        max: 40,
		        title: {
		            text: '토양온도'
		        }
		    },
		    
		    credits: {
		        enabled: false
		    },

		    series: [{
		        name: '토양온도',
		        data: [0],
		        dataLabels: {
		            format: '<div style="text-align:center"><span style="font-size:25px;color:' +
		                ((Highcharts.theme && Highcharts.theme.contrastTextColor) || 'black') + '">{y}</span><br/>' +
		                   '<span style="font-size:12px;color:silver">°C</span></div>'
		        },
		        tooltip: {
		            valueSuffix: ' °C'
		        }
		    }]

		}));
		
		chartSh=Highcharts.chart('container-sh', Highcharts.merge(gaugeOptions, {
		    yAxis: {
		        min: 30,
		        max: 70,
		        title: {
		            text: '토양습도'
		        }
		    },
		    
		    credits: {
		        enabled: false
		    },

		    series: [{
		        name: '토양습도',
		        data: [0],
		        dataLabels: {
		            format: '<div style="text-align:center"><span style="font-size:25px;color:' +
		                ((Highcharts.theme && Highcharts.theme.contrastTextColor) || 'black') + '">{y}</span><br/>' +
		                   '<span style="font-size:12px;color:silver">%</span></div>'
		        },
		        tooltip: {
		            valueSuffix: ' %'
		        }
		    }]

		}));
	
	setInterval(function(){
		
		currentDataView();
		
		var point;
		
		if (chartLi) {
       		point = chartLi.series[0].points[0];
        	point.update(li);
    	}
    	
    	if (chartIt) {
       		point = chartIt.series[0].points[0];
        	point.update(it);
    	}
    	
    	if (chartIh) {
       		point = chartIh.series[0].points[0];
        	point.update(ih);
    	}
    	
    	if (chartSt) {
       		point = chartSt.series[0].points[0];
        	point.update(st);
    	}
    	
    	if (chartSh) {
       		point = chartSh.series[0].points[0];
        	point.update(sh);
    	}
    	
	}, 1000);
	
})

function currentDataView() {
		
		$.ajax({
			
			url:'currentDataView.do',
			type:'post',
			dataType:'text',
			success:function(result){
				
				var Ca = /\+/g;
				result = decodeURIComponent(result.replace(Ca, " "));
				
				//alert(result);
				result = $.parseJSON(result);
				
				li = result.li;
				it = result.it;
				ih = result.ih;
				st = result.st;
				sh = result.sh;
				
				
				
				$('#currentData').empty();
				
				var temp = result.date + '<br> 조도 : ' + result.li + '<br> 내부온도 : ' + result.it
					+ '<br> 내부습도 : ' + result.ih + '<br> 토양온도 : ' + result.st + '<br> 토양습도'
					+ result.sh + '<br> 펌프 : ';
				
				if(result.pu == 0) {
					temp += '정지 <br> 가습 : ';
				} else {
					temp += '작동 <br> 가습 : ';
				}
				
				if(result.hu == 0) {
					temp += '정지 <br> 발열 : ';
				} else {
					temp += '작동 <br> 발열 : ';
				}
				
				if(result.he == 0) {
					temp += '정지 <br> 냉각 : ';
				} else {
					temp += '작동 <br> 냉각 : ';
				}
				
				if(result.co == 0) {
					temp += '정지';
				} else {
					temp += '작동';
				}
								
				$('#currentData').html(temp);
				
			},
			error:function(ex){
				//alert('error');
			}
			
		});
		
	}





</script>

</head>
<body style="background-color: ##ffffcc;">

<div class="container" align="center">
	<div align="center" id="container-li" style="width: 500px; height: 300px;"></div>
</div>

<hr style="background-color: #fff2cc; height: 10px;">

<div class="container" align="center">
	<div class="row">
    	<div class="col-lg-6">
          <div id="container-it" style="width: 500px; height: 300px;"></div>
        </div>
        <div class="col-lg-6">
          <div id="container-st" style="width: 500px; height: 300px;"></div>
       </div> 
	</div>
</div>

<hr style="background-color: #fff2cc; height: 10px;">

<div class="container" align="center">
	<div class="row">
    	<div class="col-lg-6">
          <div id="container-ih" style="width: 600px; height: 300px;"></div>
        </div>
        <div class="col-lg-6">
          <div id="container-sh" style="width: 600px; height: 300px;"></div>
       </div> 
	</div>
</div>
    
<hr style="background-color: #fff2cc; height: 10px;">

<div id="currentData">
		
</div>
	
</body>
</html>