<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
     <% String path=request.getContextPath(); %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<script src="<%=path %>/js/jquery-2.0.0.js" language="JavaScript" type="text/javascript"></script>
<script src="<%=path %>/js/jquery-2.0.0.min.js" language="JavaScript" type="text/javascript"></script>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div>
	<h1>修改图书类型</h1>
	<a href="<%=path %>/BookTypeServlet?type=typelist">返回类型页</a>
		<form action="<%=path %>/BookTypeServlet" method="post">
			请输入你要修改的图书类型名称：<input type="text" name="typename" value="${typename}">
			<input type="hidden" name="typeid" value="${typeid}">
			<input type="hidden" name="type" value="updatetype">
			<input type="hidden" id="s" name="s" value="${update}">
			<input type="hidden" name="pagenow" value="${pagenow}">
			<input type="submit" value="提交">
			<input type="reset" value="清除">
		</form>
	</div>
</body>
<script type="text/javascript">

//表单提交
var ty;
var oldtypename = $("#typename").val();
//通过ID和消息，展示错误信息
function showError(id,msg){
	$(id).text(msg);	
}
	function t1(){
		var typename = $("#typename").val();
		if(oldtypename==typename){
			showError("#stypename","");
			ty=true;
		}else{
			$.ajax({
	 			type : 'post',
	 			url : "<%=path%>/BookTypeServlet?type=typename",
	 			data :{"typename":typename},
	 			success : function (data){
	 					if(data==1){
	 						showError("#stypename","图书类型已存在");
	 						ty = false;
	 					}
	 			}
	 		});
		}
	}
	function form1(){
		if(ty==true){
			return true;
		}else{
			return false;
		}
	}
	

</script>
</html>