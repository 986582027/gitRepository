<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <% String path=request.getContextPath(); %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<script src="js/jquery-2.0.0.js" language="JavaScript" type="text/javascript"></script>
<script src="js/jquery-2.0.0.min.js" language="JavaScript" type="text/javascript"></script>
  <title>注册页</title>
  <style type="text/css">
   .high{ 
   color: red; 
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
	font-size:12px;
	margin: 0 auto;
	}
	#nie{
	background-image:url(<%=path%>/imgs/reg_bg.gif);
	background-repeat:no-repeat;
	width:980px;
	}
	.biao1{
	width:160px;
	text-align:right;
	font-size:12px;
	}
	.biao2{
	width:300px;
	}
	.biao3{
	width:400px;
	}
	.biao4{
	text-align:center;
	}
	tr{
	height:40px;
	}
	#quan{
		text-align:center;
	}
	table{
		margin-top:30px;
	}
	span{
		color: red;
		
	}
  </style>
 </head>

 <body>
 <div id="quan">
  <div id="zhu">
	<iframe src="head.jsp" name="top" frameborder="0" scrolling="no" class="iframe1"></iframe>
	<div id="nie">
		<form onsubmit="return fn()" method="post" action="UserServlet" id="form1">
		<input type="hidden" name="bzw" value="register">
		<table>
			<tr>
				<td class="biao1"></td>
				<td class="biao2"></td>
                <td class="biao3">&nbsp;</td>
                
				<td rowspan="11" class="biao3">
				 		  <h4><img src="<%=path%>/imgs/read.gif" alt="alt" />阅读贵美网服务协议 </h4>
        	<textarea name="textarea" cols="35" rows="30" readonly="readonly">欢迎阅读服务条款协议，本协议阐述之条款和条件适用于您使用Gmgw.com网站的各种工具和服务。
  本服务协议双方为贵美与贵美网用户，本服务协议具有合同效力。 
  贵美的权利和义务
    1.贵美有义务在现有技术上维护整个网上交易平台的正常运行，并努力提升和改进技术，使用户网上交易活动的顺利。 
    2.对用户在注册使用贵美网上交易平台中所遇到的与交易或注册有关的问题及反映的情况，贵美应及时作出回复。 
    3.对于在贵美网网上交易平台上的不当行为或其它任何贵美认为应当终止服务的情况，贵美有权随时作出删除相关信息、终止服务提供等处理，而无须征得用户的同意。 
    4.因网上交易平台的特殊性，贵美没有义务对所有用户的注册资料、所有的交易行为以及与交易有关的其他事项进行事先审查。 	
				  </textarea>
				</td>
			</tr>
			<tr>
				<td class="biao1">名字:</td>
				<td class="biao2"><input id="name" name="name" class="required" type="text" size="22"/></td>
                <td class="biao3"><span  id="sname"></span></td>
			</tr>
			<tr>
				<td class="biao1">账号:</td>
				<td class="biao2"><input id="username" name="username" class="required" onblur="zhang()" type="text" size="22"/></td>
                <td class="biao3"><span id="susername"></span></td>
			</tr>
			<tr>
				<td class="biao1">密码:</td>
				<td class="biao2"><input id="password" name="password" class="required" type="password" size="22"/></td>
				<td class="biao3"><span id="spassword"></span></td>
                
			</tr>
			<tr>
				<td class="biao1">再次输入密码:</td>
				<td class="biao2"><input id="password2" name="password2" class="required" type="password" size="22"/> </td>
                <td class="biao3"><span id="spassword2"></span></td>
			</tr>
			<tr>
				<td class="biao1">地址:</td>
				<td class="biao2"><input id="address" name="address" class="required" type="text" size="22"/></td>
				<td class="biao3"><span id="saddress"></span></td>
				
                
			</tr>
			<tr>
				<td class="biao1">电子邮箱：</td>
				<td class="biao2"><input id="email" onblur="e1" name="email" class="required" type="text" size="22"/></td>
               <td class="biao3"><span id="semail"></span></td>
			</tr>
			<tr>
				<td class="biao1">性别：</td>
				<td class="biao2">
			<input name="sex" id="gender" class="b0" type="radio" value="男" checked="checked" />
    	    <img src="<%=path%>/imgs/Male.gif" alt="alt" />男&nbsp; 
    	    <input name="sex" class="b0" type="radio" value="女" />
    	    <img src="<%=path%>/imgs/Female.gif" alt="alt" />女
				</td>
			</tr>
			<tr>
				<td class="biao1">电话：</td>
				<td class="biao2"><input onblur="p1()" id="phone" type="text" class="required" size="22" name="phone"/></td>
			<td class="biao3"><span id="sphone"></span></td>
			</tr>
			<tr>
				<td class="biao4" colspan="2">
				
				<input type="image" name="submit" class="b0" src="<%=path%>/imgs/submit.gif" />
                <a  href="register.jsp"><img src="<%=path%>/imgs/reset.gif" class="hand" alt="重置" border="0px" /></a>
				</td>
			</tr>
		</table>
		</form>
	</div>
	<iframe src="bottom.jsp" name="top" frameborder="0" scrolling="no" class="iframe2"></iframe>
  </div>
  </div>
 </body>
 <script type="text/javascript">
 $("form :input.required").each(function () {
     //通过jquery api：$("HTML字符串") 创建jquery对象
     var $required = $("<strong class='high'>*</strong>");
     //添加到this对象的父级对象下
     $(this).parent().append($required);
 });
 	var na,un,p,p2,e,ph;
 	
	//通过ID和消息，展示错误信息
	function showError(id,msg){
		$(id).text(msg);	
	}
 	
 		//姓名
 		$("#name").blur(function(){
 			var name = $("#name").val();
 			var qname = /^[\u4E00-\u9FA5\uf900-\ufa2d·s]{2,20}$/;
 			if(name==""){
 				showError("#sname","请输入姓名");
 				na = false;
 			}else{
 				if(qname.test(name)){
					showError("#sname","");
 					na = true;
				}else{
					showError("#sname","姓名格式有误");
					na = false;
				}
 			}
 			
 		});
 		//账号
		$("#username").blur(function(){
			var username = $("#username").val();
			var qusername =/^[a-zA-Z0-9_-]{4,16}$/;
			
			if(username==""){
				showError("#susername","请输入账号");
				un = false;
			}else{
				if(qusername.test(username)){
					showError("#susername","");
					un = true;
				}else{
					showError("#susername","账号格式有误");
					un = false;
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
 		//再次确认密码
		$("#password2").blur(function(){
			var password2 = $("#password2").val();
			var password = $("#password").val();
			if(password2==""){
				showError("#spassword2","请输入");
				p2 = false;
			}else{
				if(password==password2){
					showError("#spassword2","");
					p2 = true;
				}else{
					showError("#spassword2","密码不匹配");
					p2 = false;
				}
			}
		});
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
 		//验证账号是否存在
		function zhang(){
			var username = $("#username").val();
			$.ajax({
	 			type : 'post',
	 			url : "<%=path%>/UserServlet?bzw=zhanghao",
	 			data :{"username":username},
	 			success : function (data){
	 					if(data==1){
	 						showError("#susername","账号已存在");
	 						un = false;
	 					}
	 			}
	 		});
			
		}
		//验证手机号是否存在	
		function p1(){
			var phone = $("#phone").val();
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
		//验证邮箱是否存在
		function e1(){
			var email = $("#email").val();
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
		function fn(){
			if(na==true&&un==true&&p2==true&&p==true&&e==true&&ph==true&&ad==true){
				return true;
			}else{
				return false;
			}
			
 		}
 		
 	
 </script>
</html>
