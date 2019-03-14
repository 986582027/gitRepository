<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
     <% String path=request.getContextPath(); %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<script src="<%=path %>/js/jquery-2.0.0.js" language="JavaScript" type="text/javascript"></script>
<script src="<%=path %>/js/jquery-2.0.0.min.js" language="JavaScript" type="text/javascript"></script>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title></title>
		<style>
			form{
			}
			span{
				color: red;
			}
		</style>
	</head>
	<body>
		<form onsubmit="fn()" action="<%=path %>/AdminServlet" method="post">
	  		姓名：<input type="text" name="name" value="${admin.adminName}" readonly="readonly" /><br />
	  		账号：<input type="text" name="username" value="${admin.adminAccount}" readonly="readonly" /><br />
	  		性别：<input type="radio" name="sex" value="男" <c:if test="${admin.adminSex=='男'}">checked="checked"</c:if>/>男&nbsp;&nbsp;
	  		<input type="radio" name="sex" value="女" <c:if test="${admin.adminSex=='女'}">checked="checked"</c:if>/>女<br />
	  		电话：<input on onblur="p1()" type="text" id="phone" name="phone" value="${admin.adminPhone}"/><span id="sphone"></span><br />
	  		邮箱：<input type="text" id="email"  name="email" value="${admin.adminEmail}"/><span id="semail"></span><br />
	  		地址：<input onblur="e1()" type="text" id="address" name="address" value="${admin.adminAddress}"/><span id="saddress"></span><br />
	  		<input type="hidden" name="bzw" value="update">
	  		<input type="hidden" name="adminid" value="${admin.adminId}">
	  		<input type="hidden" id="s" name="s" value="${update}">
	  		核对信息<br />
	  		<input type="submit" value="确认修改" />
  		</form>
	</body>
	<script type="text/javascript">
		var oldphone = $("#phone").val();
		var oldemail = $("#email").val();
		var e,ph,ad;
	 	
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
				ph=true;
			}else{
				$.ajax({
		 			type : 'post',
		 			url : "<%=path%>/AdminServlet?bzw=phone",
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
				e = true;
			}else{
				$.ajax({
		 			type : 'post',
		 			url : "<%=path%>/AdminServlet?bzw=email",
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
			function fn(){
				if(ad==true&&e==true&&ph==true){
					return true;
				}else{
					return false;
				}
				
	 		}
		
	</script>
</html>
