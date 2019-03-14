<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <% String path=request.getContextPath(); %>
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
 <head>
<script src="js/jquery-2.0.0.js" language="JavaScript" type="text/javascript"></script>
<script src="js/jquery-2.0.0.min.js" language="JavaScript" type="text/javascript"></script>
  <title>帮助</title>
  <style type="text/css">
	body,div,p,img{
	padding:0;
	margin:0;
	border:0;
	}

	a{
	color:black;
	text-decoration:none;
	}
	a:hover{
	color:#ff33ff;
	}
	.iframe1{
	width:980px;
	height:130px;
	}
	.iframe2{
	width:980px;
	height:180px;
	}
	#zhu{
	width:980px;
	margin:0px auto;
	}
	#nn{
	width:980px;
	padding-top:5px;
	font-size:14px;
	}
	#left{
	float:left;
	height:385px;
	width:183px;
	margin-right:10px;
	background-image:url(<%=path%>/imgs/customer.jpg);
	text-align:center;
	padding-top:165px;
	}
	#left p{
	margin:5px;
	}
	#left a{
	text-decoration:none;
	color:black;
	margin:0px auto;
	width:158px;
	line-height:30px;
	height:31px;
	display:block;
	overflow:hidden;
	font-weight:bold;
	}
	#left a:hover{
	height:auto;
	}
	#right{
	float:left;
	height:518px;
	width:783px;
	overflow:hidden;
	padding-top:2px;
	}
	.leftdiv{
	padding-left:10px;
	height:518px;
	width:770px;
	font-size:16px;
	padding-top:30px;
	margin-bottom:20px;
	}
	.leftdiv p{
	margin-top:15px;
	}
	.leftdiv li{
	background-image:url(<%=path%>/imgs/list_icon.gif);
	background-repeat:no-repeat;
	padding-left:15px;
	list-style:none;
	}	
	.f1{
		margin: 0 auto;
	}
	span{
		color: red;
	}
  </style>
 </head>

 <body >

  <div id="zhu" class="">
	<iframe src="head.jsp" name="top" frameborder="0" scrolling="no" class="iframe1"></iframe>
	<div id="nn" class="">
		<div id="left" class="">
		<p><a href="register.jsp"><img src="<%=path%>/imgs/reg.jpg" alt="alt" /><br/>
		点此注册<br />
		认证中心<br />
		</a>
		</p>
		<p><a href="#chuqian"><img src="<%=path%>/imgs/buy.jpg" alt="alt" /><br/>
		咨询<br />
 		投诉<br />
 	 	举报<br />
  		退款<br />
		</a>
		</p>
		<p><a href="#shouqian"><img src="<%=path%>/imgs/sale.jpg" alt="alt" /><br/>
		安全中心<br />
		物流中心<br />
		资金流动<br />
		纠纷处理<br />
		</a>
		</p>
		<p><a  href="#xiugai"><img src="<%=path%>/imgs/person.jpg" alt="alt" /></a></p>
		<p><a href="#xiugaimima"><img src="<%=path%>/imgs/update2.jpg" alt="alt" /></a></p>
		</div>

		<div id="right" class="">
			<div  class="leftdiv">
				<a name="zhuce"></a>
				<h2>知识堂首页 &gt;&gt; 注册＆认证 </h2>
				<p><img src="<%=path%>/imgs/reg_line.jpg" alt="alt" /></p>
				<p>享受贵美网免费网上交易乐趣，并且在超人气的社区尽情交流您的网上购物经验，您需要先注册成为贵美的会员，具体的步骤如下：</p>
				<p><img src="<%=path%>/imgs/reg_step.jpg" alt="alt" /></p>
				<ul>
 				  <li><a href="#">如何激活会员名？</a></li>
				  <li><a href="#">如何注册贵美会员？</a></li>
				  <li><a href="#">注册时密码设置有什么要求？</a></li>
				  <li><a href="#">贵美认证</a></li>
				  <li><a href="#">为什么校验码明明是对的，却提示我输入错误？</a></li>
				</ul>		
			</div>

			<div  class="leftdiv">
				<a name="chuqian"></a>
					<h2>知识堂首页 &gt;&gt;商家帮助 </h2>
				<p><img src="<%=path%>/imgs/reg_line.jpg" alt="alt" /></p>
				<p>享受贵美网免费网上购物乐趣，您需要了解贵美贝的网上安全交易流程和网上购物的4步曲：</p>
				<h4>网上安全交易流程如下：</h4>
				<p><img src="<%=path%>/imgs/buy_sep1.jpg" alt="alt" /></p>
				<h4>客户交易演示4步曲：</h4>
				<p><img src="<%=path%>/imgs/buy_sep2.jpg" alt="alt" /></p>	
			</div>

			<div  class="leftdiv">
				<a name="shouqian"></a>
					<h2>知识堂首页 &gt;&gt; 商家帮助 </h2>
				<p><img src="<%=path%>/imgs/reg_line.jpg" alt="alt" /></p>
				<p>做贵美网的商家，拥有自己的个性小店，您需要了解贵美网上交易要点，请看出售商品的步骤：</p>
				<p><img src="<%=path%>/imgs/sale_step.jpg" alt="alt" /></p>
			</div>

			<div  class="leftdiv">
			<h1>${user.userSex}</h1>
				<a name="xiugai"></a>
						<table width="800px" height="555px" align="center" class="t2">
							<tr height="555px">
								<td  width="800px">
								<c:if test="${user.name==null}"><h1>您未登录，请先登录</h1></c:if>
								<c:if test="${user.username==username}">
									<form  action="<%=path%>/UserServlet" id="form1" onsubmit="return f1()" method="post">
										<input type="hidden" name="bzw" value="update">
										<input type="hidden" name="userid" value="${user.userId}">
										用&nbsp;户&nbsp;姓&nbsp;名:<input type="text" name="name"  value="${user.name}" readonly="readonly"/><br/><br/>
										电子邮箱:<input type="text" name="email" id="email" onblur="e1()" value="${user.userEmail}"/><br/><span id="semail"></span><br/>
										性别：<input type="radio" name="sex" value="男"  <c:if test="${requestScope.user.userSex=='男'}">checked="checked"</c:if> /><img src="<%=path%>/imgs/Male.gif" alt="alt" />男&nbsp;
										<input type="radio" name="sex" value="女"  <c:if test="${requestScope.user.userSex=='女'}">checked="checked"</c:if>/><img src="<%=path%>/imgs/Female.gif" alt="alt" />女<br/><br/>
										电话:<input type="text" name="phone" id="phone" onblur="p1()" value="${user.userPhone}"/> <span id="sphone"></span><br/><br/>
										住址:<input type="text" name="address" id="address" value="${user.userAddress}"/><span id="saddress"></span><br/><br/>
										<input type="submit" value="确认"/>&nbsp;&nbsp;&nbsp;&nbsp;
										<input type="reset" value="重置"/>
									</form>
								</c:if>
									
								</td>
							</tr>
						</table>
						
				
			</div>
			<div  class="leftdiv">
				<a name="xiugaimima"></a>
						<table width="800px" height="555px" align="center" class="t2">
							<tr height="555px">
								<td  width="800px">
								<c:if test="${user.name==null}"><h1>您未登录，请先登录</h1></c:if>
									<c:if test="${user.username==username}">
										<form  action="<%=path%>/UserServlet" onsubmit="return f2()" method="post">
											<input type="hidden" name="bzw" value="updatemima">
											<input type="hidden" name="userid" value="${user.userId}">
											用&nbsp;户&nbsp;姓&nbsp;名:<input type="text" name="name"  value="${user.name}" readonly="readonly"/><br/><br/>
											用&nbsp;户&nbsp;账&nbsp;号:<input type="text" name="name" value="${sessionScope.username}" readonly="readonly"/><br/><br/>
											用户原始密码:<input type="password" name="password" id="password"/><span id="spassword"></span><br/><br/>
											修改后的密码:<input type="password" name="newpassword" id="newpassword" /><span id="snewpassword"></span><br/><br/>
											<input type="submit" value="确认"/>
										</form>
									</c:if>
								</td>
							</tr>
						</table>
			</div>

		</div>
		<br clear="all" />
	</div>
	<iframe src="bottom.jsp" name="top" frameborder="0" scrolling="no" class="iframe2"></iframe>
  </div>
 </body>
 <script type="text/javascript">
 	
 var oldphone = $("#phone").val();
 var oldemail = $("#email").val();
 
 var e,ph,ad,p,np;
	
	//通过ID和消息，展示错误信息
	function showError(id,msg){
		$(id).text(msg);	
	}
 
//邮箱
	$("#email").blur(function(){
		var email = $("#email").val();
		var qemail =/\w+([-+.]\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*$/;
		if(email==""){
			showError("#semail","请输入邮箱");
			e = false;
		}else{
			if(qemail.test(email)){
				showError("#semail","");
				e = true;
			}else{
				showError("#semail","邮箱格式有误");
				e = false;
			}
		}
	});
	//电话
	$("#phone").blur(function(){
		var phone = $("#phone").val();
		var qphone =/^(1[35874])\d{9}$/;
		if(phone==""){
			showError("#sphone","请输入手机号码");
			ph = false;
		}else{
			if(qphone.test(phone)){
				showError("#sphone","");
				ph = true;
			}else{
				showError("#sphone","电话格式有误");
				ph = false;
			}
		}
	});
	//地址
	$("#address").blur(function(){
	var address = $("#address").val();
	var qaddress = /^([\u4E00-\u9FA5]+省)([\u4E00-\u9FA5]+市)([\u4E00-\u9FA5]+区)$/;
	if(address==""){
		showError("#saddress","请输入地址");
		ad = false;
	}else{
		if(qaddress.test(address)){
			showError("#saddress","");
			ad = true;
		}else{
			showError("#saddress","你输入的格式有误(**省**市**区)");
			ad = false;
		}
	}
});
	
	//验证手机号是否存在	
	function p1(){
		var phone = $("#phone").val();
		if(oldphone==phone){
			showError("#sphone","");
			ph = true;
		}else{
			$.ajax({
	 			type : 'post',
	 			url : "<%=path%>/UserServlet?bzw=phone",
	 			data :{"phone":phone},
	 			success : function (data){
	 					if(data==1){
	 						showError("#sphone","手机号已存在");
	 						ph = false;
	 					}
	 			}
	 		});
		}
		
		
	}	
	//验证邮箱是否存在
	function e1(){
		var email = $("#email").val();
		if(oldemail==email){
			showError("#semail","");
			e = true;
		}else{
			$.ajax({
	 			type : 'post',
	 			url : "<%=path%>/UserServlet?bzw=email",
	 			data :{"email":email},
	 			success : function (data){
	 					if(data==1){
	 						showError("#sphone","邮箱已存在");
	 						e = false;
	 					}
	 			}
	 		});
		}
		
		
		
	}
	
	
 //修改信息提交
 function f1(){
	 if(e==true&&ph==true&&ad==true){
		 return true;
	 }else{
		 return false;
	 }
 }
	
	
	
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
	
	
	
	
	//修改后的密码
	$("#newpassword").blur(function(){
		var newpassword = $("#newpassword").val();
		var qpassword =/^[a-zA-Z\d_]{6,}$/;
		if(newpassword==""){
			showError("#snewpassword","请输入密码");
			np = false;
		}else{
			if(qpassword.test(newpassword)){
				showError("#snewpassword","");
				np = true;
			}else{
				showError("#snewpassword","密码格式有误");
				np = false;
			}
		}
	});
 
	function f2(){
		if(p==true&&np==true){
			return true;
		}else{
			return false;
		}
	}
 </script>
</html>
