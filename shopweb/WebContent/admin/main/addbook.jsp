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
<title>Insert title here</title>
<style type="text/css">
span{
	color: red;
}
</style>
</head>
<body>

	<div>
	<h1>添加图书</h1>
	<a href="<%=path %>/AdminBookServlet?book=booklist">返回图书管理页</a>
		<form onsubmit="return form1()" action="<%=path %>/AdminBookServlet" method="post">
			请输入你要添加的图书名称：<input onblur="tushuname()" type="text" id="bookname" name="bookname"><span id="sbookname"></span><br/>
			请输入你要添加的图书价格：<input id="price" type="text" name="bookprice"><span id="sprice"></span><br/>
			请输入你要添加的图书简介：<input type="text" name="bookintroduce"><br/>
			请输入你要添加的图书作者：<input type="text" id="bookauthor" name="bookauthor"><span id="sbookauthor"></span><br/>
			请选择你要添加的图书类型：<select name="booktype">
								<c:forEach items="${type}" var="t">
									<option value="${t.typeId}">${t.typeName}</option>
								</c:forEach>
							</select><br/>
			<input type="hidden" name="book" value="addbook">
			<input type="hidden" id="s" name="book" value="${addbook}">
			<input type="submit" value="提交">
			<input type="reset" value="清除">
		</form>
	</div>
	
	
</body>
<script type="text/javascript">

	var pr,b,au;
	//通过ID和消息，展示错误信息
	function showError(id,msg){
		$(id).text(msg);	
	}
	//图书名称验证
	$("#bookname").blur(function(){
		var bookname = $("#bookname").val();
		if(bookname==""){
			showError("#sbookname","请输入作者");
			b = false;
		}else{
			showError("#sbookname","");
			b = true;
		}
	});
	//图书名称是否重复
	function tushuname(){
		var bookname = $("#bookname").val();
			$.ajax({
	 			type : 'post',
	 			url : "<%=path%>/AdminBookServlet?book=bookname",
	 			data :{"bookname":bookname},
	 			success : function (data){
	 					if(data==1){
	 						showError("#sbookname","图书已存在");
	 						b = false;
	 					}
	 			}
	 		});
		
	}
	//价格的表单验证
	$("#price").blur(function(){
		var price = $("#price").val();
		var qprice = /(^[1-9]\d*(\.\d{1,2})?$)|(^0(\.\d{1,2})?$)/;
		if(price==""){
			showError("#sprice","请输入价格");
			pr = false;
		}else{
			if(qprice.test(price)){
				showError("#sprice","");
				pr = true;
			}else{
				showError("#sprice","你输入的格式有误(比如100.0)");
				pr = false;
			}
		}
	});
	//作者表单验证
	$("#bookauthor").blur(function(){
		var bookauthor = $("#bookauthor").val();
		if(bookauthor==""){
			showError("#sbookauthor","请输入作者");
			au = false;
		}else{
			showError("#sbookauthor","");
			au = true;
		}
	});
		
	function form1(){
		if(pr==true&&b==true&&au==true){
			return true;
		}else{
			return false;
		}
	}	
	
		
	
</script>
</html>