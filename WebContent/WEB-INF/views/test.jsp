<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script type="text/javascript">

var li,it,ih,st,sh,pu,hu,he,co;

$(function(){

	setInterval(function(){
		
		li = Math.floor((Math.random() * 2000));
		it = Math.floor((Math.random() * 40));
		ih = Math.floor((Math.random() * 40) + 30);
		st = Math.floor((Math.random() * 40));
		sh = Math.floor((Math.random() * 40) + 30);
		pu = Math.round(Math.random());
		hu = Math.round(Math.random());
		he = Math.round(Math.random());
		co = Math.round(Math.random());
		
		test();
    	
	}, 300);
	
})


function test() {
		
		$.ajax({
			
			url:'dataWrite.do',
			type:'post',
			data:{'li' : li,
				'it' : it,
				'st' : st,
				'ih' : ih,
				'sh' : sh,
				'pu' : pu,
				'hu' : hu,
				'he' : he,
				'co' : co
			},
			dataType:'text',
			success:function(result){
			},
			error:function(ex){
			}
			
		});
		
	}


</script>

</head>
<body>

테스트 중

</body>
</html>