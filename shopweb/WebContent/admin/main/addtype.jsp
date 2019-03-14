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
<style type="text/css">
span{
	color: red;
}
</style>
</head>
<body>
	<div>
	<h1>添加图书类型</h1>
	<a href="<%=path %>/BookTypeServlet?type=typelist">返回类型页</a>
		<form onsubmit="form1()" action="<%=path %>/BookTypeServlet" method="post">
			请输入你要添加的图书类型名称：<input type="text" id="typename" onblur="t1()" name="typename"><span id="stypename"></span><br/>
			<input type="hidden" name="type" value="addtype">
			<input type="hidden" id="s" name="type" value="${add}">
			<input type="submit" value="提交">
			<input type="reset" value="清除">
		</form>
	</div>
</body>
<script type="text/javascript">

//表单提交
var ty;

//通过ID和消息，展示错误信息
function showError(id,msg){
	$(id).text(msg);	
}
	function t1(){
		var typename = $("#typename").val();
		if(typename==null||typename==""){
			showError("#stypename","请输入类型名称");
			ty=false;
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