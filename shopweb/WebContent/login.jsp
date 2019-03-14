<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
  <% String path=request.getContextPath(); %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<script src="js/jquery-2.0.0.js" language="JavaScript" type="text/javascript"></script>
<script src="js/jquery-2.0.0.min.js" language="JavaScript" type="text/javascript"></script>
  <title> 登录页 </title>
  <style type="text/css">
	img{
	border:0px;
	}
	body{
	padding:0;
	margin:0;
	}
	#zhu{
	padding:0;
	width:980px;
	margin:0 auto;
	
	}
	.iframe1{
	width:980px;
	height:130px;
	}
	.iframe2{
	width:980px;
	height:180px;
	}
	#nn{
	background-image:url(<%=path%>/imgs/login_bg.gif);
	background-repeat:no-repeat;
	width:980px;
	margin:0 auto;
	}
	#bb{
	width:580px;
	float:left;
	margin:0;
	padding-top:40px;
	padding-bottom:50px;
	}
	#cc{
	width:396px;
	border-left:1px solid blue;
	float:left;
	margin:0;
	padding-top:40px
	}
	#t01{
	padding-left:60px;
	}
	.t02{
	padding-left:200px;
	font-size:12px;
	}
	#t03{
	padding-left:270px;
	}
	.t04{
	font-size:12px;
	padding-left:130px;
	}
	a{
	text-decoration:none;
	color:black;
	}
	a:hover{
	color:#cc00ff;
	}
	span{
	color:red;
	font-size:15px;
	font-weight:bolder;
	}
	#r01{
	padding-left:30px;
	}
	#r02{
	padding-top:30px;
	height:30px;
	padding-left:60px;
	font-size:12px;
	background-image:url(<%=path%>/imgs/icon.gif);
	background-repeat:no-repeat;
	background-position:20px -130px;
	}
	#r03{
	padding-left:60px;
	font-size:12px;
	background-image:url(<%=path%>/imgs/icon.gif);
	background-repeat:no-repeat;
	background-position:20px -170px;
	}
	#r04{
	padding-left:60px;
	font-size:12px;
	background-image:url(<%=path%>/imgs/icon.gif);
	background-repeat:no-repeat;
	background-position:20px -210px;
	}
	#r05{
	height:30px;
	padding-left:60px;
	font-size:12px;
	background-image:url(<%=path%>/imgs/icon.gif);
	background-repeat:no-repeat;
	background-position:20px -250px;
	}
	#r06{
	padding-left:50px;
	}
	#r07{
	margin-left:20px;
	border:1px solid #ff6633;
	width:300px;
	height:80px;
	padding-left:10px;
	padding-top:10px;
	}
	#r08{
	height:30px;
	font-size:12px;
	background-image:url(<%=path%>/imgs/icon.gif);
	background-repeat:no-repeat;
	background-position:10px -290px;
	padding-left:50px;
	}
	#r09{
	height:30px;
	font-size:12px;
	background-image:url(<%=path%>/imgs/icon.gif);
	background-repeat:no-repeat;
	background-position:10px -330px;
	padding-left:50px;
	}
	body{margin:0px auto;}
  </style>
 </head>

 <body>
  <div id="zhu">
	<iframe src="<%=path%>/head.jsp" name="top" frameborder="0" scrolling="no" class="iframe1"></iframe>
	<div id="nn">
		<div id="bb">
				<p id="t01"><img src="<%=path%>/imgs/logintitle.gif" alt="会员登录" /></p>
				
				<form  onsubmit="return fn()" id="form1" action="<%=path%>/UserServlet" method="post">
					<p class="t02">会员名：<input type="text" name="username" id="username" /><span id="susername"></span></p>
					<p class="t02">密&nbsp;&nbsp;码：<input type="password" id="password" name="password" size="21"/><span id="spassword"></span></p>
					<input type="hidden" name="bzw" value="login" >
					
				<p id="t03"><input type="image" name="submit" class="b0" src="<%=path%>/imgs/login.gif" /></p>
				
			</form>
			<p class="t04"><a href="#">什么是安全登录?</a></p>
			<p class="t04">香港會員（繁體中文用戶）由此<a href="#">登入.</a></p>
			<p class="t04"><a href="#">密码安全贴士</a>。</p>
			<p class="t04">防止病毒或者木马窃取您的账户信息，<a href="#">在线检查</a>您的电脑是否安全。</p>		 
			
		</div>
		<div id="cc" class="">
			<p id="r01"><img src="<%=path%>/imgs/register.gif" alt="注册会员" /></p>
			<p id="r02"><span>便宜有好货！</span>超过7000万件商品任您选。</p>
			<p id="r03"><span>买卖更安全！</span>交易超安全。</p>
			<p id="r04"><span>免费开网店！</span>轻松赚钱交友。</p>
			<p id="r05"><span>超人气社区！</span>彩活动每一天</p>
			<p id="r06"><a href="register.jsp"><img src="<%=path%>/imgs/registernow.gif" alt="现在就注册" /></a></p>
			<div id="r07">
			 <p id="r08">您已经是会员？<a href="login.jsp">由此登入</a></p>
			 <p id="r09">繁体中文用户由此<a href="register.jsp">注册</a></p>
			</div>
		</div>
		<br clear="all" />
	</div>
	<iframe src="<%=path%>/bottom.jsp" name="foot" frameborder="0" scrolling="no" class="iframe2"></iframe>
  </div>
 </body>
 <script type="text/javascript">
	 var u,p;
	//通过ID和消息，展示错误信息
	function showError(id,msg){
		$(id).text(msg);	
	}
	//账号
	$("#username").blur(function(){
		var username = $("#username").val();
		var qusername =/^[a-zA-Z0-9_-]{4,16}$/;
		if(username==""){
			showError("#susername","请输入账号");
			u = false;
		}else{
			if(qusername.test(username)){
				showError("#susername","");
				u = true;
			}else{
				showError("#susername","账号格式有误");
				u = false;
			}
		}
	});
	//密码
	$("#password").blur(function(){
		var password = $("#password").val();
		var qpassword =/^[a-zA-Z\d_]{6,}$/;
		if(password==""){
			showError("#spassword","请输入密码");
			p = false;
		}else{
			if(qpassword.test(password)){
				showError("#spassword","");
				p = true;
			}else{
				showError("#spassword","密码格式有误");
				p = false;
			}
		}
	});
	function fn(){
		
		if(u==true&&p==true){
			return true;
		}else{
			return false;
		}
	}
	
	
 </script>
</html>
