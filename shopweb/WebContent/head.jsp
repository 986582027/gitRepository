<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <% String path=request.getContextPath(); %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<script src="js/jquery-2.0.0.js" language="JavaScript" type="text/javascript"></script>
<script src="js/jquery-2.0.0.min.js" language="JavaScript" type="text/javascript"></script>
  <title>头部</title>
  <style type="text/css">
	body{
	padding:0;
	margin:0 auto;
	}
	#di{
	background:url(<%=path%>/imgs/h_bg.jpg);
	background-position:-20px 0px;
	width:980px;
	height:130px;
	margin: 0 auto;
	}
	#hh{
	width:450px;
	float:right;
	height:28px;
	margin-top:5px;
	}
	#gg{
	height:28px;
	width:678px;
	margin-top:82px;
	margin-left:4px;
	}
	a{
	text-decoration:none;
	color:black;
	}
	.nav{
	height:28px;
	width:81px;
	float:left;
	padding:0px;
	margin-right:3px;
	text-align:center;
	}
	.zi{
	height:28px;
	float:left;
	text-align:center;
	width:55px;
	}
	#tu1{
	height:28px;
	width:28px;
	background:url(<%=path%>/imgs/icon.gif);
	background-position:;
	float:left;
	}
	#tu2{
	height:28px;
	width:28px;
	background:url(<%=path%>/imgs/icon.gif);
	background-position:-40px 0px;
	float:left;
	}
	#tu3{
	height:28px;
	width:28px;
	background:url(<%=path%>/imgs/icon.gif);
	background-position:-85px 0px;
	float:left;
	}
	#tu4{
	height:28px;
	width:28px;
	background:url(<%=path%>/imgs/icon.gif);
	background-position:-128px 0px;
	float:left;
	}
	.input{
	height:28px;
	width:50px;
	float:left;
	background:url(<%=path%>/imgs/icon.gif);
	background-position:0px -25px;
	text-align:center;
	}
	.aa{
	font:12px bolder;
	line-height:28px;
	}
	.mm{
	font-size:15px;
	font-weight:bolder;
	line-height:32px;
	}
	#bb{
	height:28px;
	width:200px;
	position:absolute;
	top:60px;
	left:500px;
	font-size:12px;
	}
  </style>
 </head>

 <body onload="fn()">
  <div id="di" class="">
	<div id="hh" class="">
		<p id="tu1"></p>
		<p class="zi"><a id="hre" onclick="return gouwuche()" href="<%=path %>/BookServlet?book=shopcarAll&&pagenow=1" target="_top" class="aa">购 物 车</a></p>
		<p id="tu2"></p>
		<p class="zi"><a href="<%=path%>/UserServlet?bzw=selectupdate&&username=${sessionScope.username}" target="_top" class="aa" >帮助中心</a></p>
		<p id="tu3"></p>
		<p class="input"><a href="<%=path%>/admin/admin.jsp" target="_top" class="aa">后台管理</a></p>
		<p id="tu4"></p>
		<p class="zi"><a href="<%=path%>/BookServlet" target="_top" class="aa">返回首页</a></p>
		<p id="denglu" class="input"><a href="login.jsp" target="_top" class="aa">登录</a></p>
		<p id="zhuce" class="input"><a href="register.jsp" target="_top" class="aa">注册</a></p>
		<br clear="all" />
	</div>
	<br clear="all" />
	
  </div>
  <div id="bb">
  <h4>欢迎  <span id="session">${sessionScope.user.name}</span> 来到贵美商城！</h4>
  </div>
 </body>
 <script type="text/javascript">
 function gouwuche(){
	 var s = $("#session").text();
	 if(s!=null&&s!=""){
		return true;
	 }else{
		 if(confirm("您未登录,是否需要登录？")){
			 $("#hre").attr("href","<%=path %>/login.jsp");
			 return true;
		 }else{
			 return false;
		 }
	 }
 
 }
 
 function fn(){
	 var s = $("#session").text();
	 	if(s!=null&&s!=""){
	 		$("#denglu").empty();
	 		$("#zhuce").html("<a href='<%=path%>/UserServlet?bzw=zhuxiao' onclick='return fn1()'  target='_top' class='aa'>注销</a>");
	 	}else{
	 		$("#denglu").html("<a href='login.jsp' target='_top' class='aa'>登录</a>");
	 		$("#zhuce").html("<a href='register.jsp' target='_top' class='aa'>注册</a>");
	 	}
	 	
 }
 function fn1(){
	 if(confirm("您是否注销")){
		 return true;
	 }else{
		 return false;
	 }
 }
 
 </script>
</html>
