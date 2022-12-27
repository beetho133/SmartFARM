<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>

<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta/css/bootstrap.min.css" integrity="sha384-/Y6pD6FV/Vv2HJnA6t+vslU6fwYXjCFtcEpHbNJ0lyAFsXTsjBbfaDjzALeQsN6M" crossorigin="anonymous">

<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.3/umd/popper.min.js" integrity="sha384-vFJXuSJphROIrBnz7yo7oB41mKfc8JzQZiCq4NCceLEaO4IHwicKwpJf9c9IpFgh" crossorigin="anonymous"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta/js/bootstrap.min.js" integrity="sha384-h0AbiXch4ZDo7tp9hKZ4TsHbi047NrKGLO3SEJAg45jXxnGIfYzk4Si90RDIqNm1" crossorigin="anonymous"></script>


</head>
<body>

	<nav class="navbar navbar-expand-lg navbar-light"
		style="background: #fff2cc;">
		<a class="navbar-brand" href="${pageContext.request.contextPath}">
			<img src="img/main.png" width="100" height="50">
		</a>
		<button class="navbar-toggler" type="button" data-toggle="collapse"
			data-target="#navbarNavDropdown" aria-controls="navbarNavDropdown"
			aria-expanded="false" aria-label="Toggle navigation">
			<span class="navbar-toggler-icon"></span>
		</button>
		<div class="collapse navbar-collapse" id="navbarNavDropdown">
			<ul class="navbar-nav">
				<li class="nav-item"><a class="nav-link" href="dataViewForm.do">현재
						상태</a></li>
				<li class="nav-item dropdown">
					<a class="nav-link dropdown-toggle" href="#"
						id="navbarDropdownMenuLink" data-toggle="dropdown"
						aria-haspopup="true" aria-expanded="false"> 실시간 그래프 
					</a>
					<div class="dropdown-menu" aria-labelledby="navbarDropdownMenuLink">
						<a	class="dropdown-item" href="realtimeDataForm.do?sub=each">전체정보</a>  
						<a class="dropdown-item" href="realtimeDataForm.do?sub=it">내부온도</a> 
						<a	class="dropdown-item" href="realtimeDataForm.do?sub=ih">내부습도</a> 
						<a class="dropdown-item" href="realtimeDataForm.do?sub=st">토양온도</a>
						<a class="dropdown-item" href="realtimeDataForm.do?sub=sh">토양습도</a>
						<a	class="dropdown-item" href="realtimeDataForm.do?sub=t">온도비교</a> 
						<a	class="dropdown-item" href="realtimeDataForm.do?sub=h">습도비교</a>
					</div>
				</li>
				
				<li class="nav-item dropdown"><a
					class="nav-link dropdown-toggle" href="#"
					id="navbarDropdownMenuLink" data-toggle="dropdown"
					aria-haspopup="true" aria-expanded="false"> 분당 평균 그래프 </a>
					<div class="dropdown-menu" aria-labelledby="navbarDropdownMenuLink">
						<a	class="dropdown-item" href="minAvgForm.do?sub=each">전체정보</a>  
						<a class="dropdown-item" href="minAvgForm.do?sub=it">내부온도</a> 
						<a	class="dropdown-item" href="minAvgForm.do?sub=ih">내부습도</a> 
						<a class="dropdown-item" href="minAvgForm.do?sub=st">토양온도</a>
						<a class="dropdown-item" href="minAvgForm.do?sub=sh">토양습도</a>
						<a	class="dropdown-item" href="minAvgForm.do?sub=t">온도비교</a> 
						<a	class="dropdown-item" href="minAvgForm.do?sub=h">습도비교</a>
					</div>
				</li>			
			</ul>

		</div>
	</nav>

</body>
</html>