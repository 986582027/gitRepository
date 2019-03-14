<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
     <% String path=request.getContextPath(); %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<script src="<%=path %>/js/jquery-2.0.0.js" language="JavaScript" type="text/javascript"></script>
<script src="<%=path %>/js/jquery-2.0.0.min.js" language="JavaScript" type="text/javascript"></script>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title></title>
		<style>
			body{
				}
			span{
				color: red;
			}
		</style>
	</head>
	<body>
		<div class="div1">
			<form onsubmit="return fn()" action="<%=path %>/AdminServlet" method="post">
	  			原&nbsp;密&nbsp;码 ：<input type="password" name="password" id="password"/><span id="spassword"></span><br/>
	  			新&nbsp;密&nbsp;码 ：<input type="password" name="newpassword" id="newpassword" /><span id="snewpassword"></span><br/>
	  			确认密码 ：<input type="password" id="newpasswords" name="newpasswords" /><span id="snewpasswords"></span><br/>
	  			<input type="hidden" name="oldpassword"  id="oldpassword" value="${sessionScope.adminpassword}"/>
	  			<input type="hidden" name="adminid"  value="${sessionScope.admin.adminId}"/>
	  			<input type="hidden" id="s" name="adminid"  value="${i}"/>
	  			<input type="hidden" name="bzw"  value="updatepsd"/>
	  			<input type="submit"  value="提交"/>
	  			<input type="reset"  value="重置"/>
	  		</form>
  		</div>
	</body>
	<script type="text/javascript">
		//表单验证
		var p,p1,p2;
		//通过ID和消息，展示错误信息
		function showError(id,msg){
			$(id).text(msg);	
		}
		//原密码
		$("#password").keyup(function(){
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
		
		//新密码
		$("#newpassword").keyup(function(){
			var newpassword = $("#newpassword").val();
			var qnewpassword =/^[a-zA-Z\d_]{6,}$/;
			if(newpassword==""){
				showError("#snewpassword","请输入密码");
				p1 = false;
			}else{
				if(qnewpassword.test(newpassword)){
					showError("#snewpassword","");
					p1 = true;
				}else{
					showError("#snewpassword","密码格式有误");
					p1 = false;
				}
			}
		});
		//再次确认密码
		$("#newpasswords").keyup(function(){
			var newpasswords = $("#newpasswords").val();
			var newpassword = $("#newpassword").val();
			if(newpasswords==""){
				showError("#snewpasswords","请输入");
				p2 = false;
			}else{
				if(newpassword==newpasswords){
					showError("#snewpasswords","");
					p2 = true;
				}else{
					showError("#snewpasswords","密码不匹配");
					p2 = false;
				}
			}
		});
		
		function fn(){
			if(p==true&&p1==true&&p2==true){
				return true;
			}else{
				return false;
			}
		}
		
		
	</script>
</html>
