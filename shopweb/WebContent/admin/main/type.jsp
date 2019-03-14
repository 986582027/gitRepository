<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
     <% String path=request.getContextPath(); %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<script src="js/jquery-2.0.0.js" language="JavaScript" type="text/javascript"></script>
<script src="js/jquery-2.0.0.min.js" language="JavaScript" type="text/javascript"></script>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title></title>
		<style type="text/css">
			
			.div1{
				text-align: center;
			}
			.th1{
				width: 150px;
			}
			.tr1{
				height: 35px;
				text-align: center;
			}
		</style>
	</head>
	<body>
		<form action="<%=path %>/BookTypeServlet" method="post" id="form1">
			<input type="hidden" name="page" id="page">
			<input type="hidden" name="type" value="typelist">
		</form>
		<table align="center" cellpadding="0" cellspacing="0" border="2px" class="tb1">
  		<thead>
  			<tr class="tr1">
  				<th class="th1">序号</th>
  				<th class="th1">类型</th>
  				<th class="th1">操作</th>
  			</tr>
  		</thead>
  		<tbody>
  			<c:forEach items="${requestScope.type}" var="t">
	  			<tr class="tr1">
	  				<td>${t.typeId}</td>
	  				<td>${t.typeName}</td>
	  				<td>
	  					<a onclick="return confirm('确认删除？')" href="<%=path %>/BookTypeServlet?type=delete&&typeid=${t.typeId}&&pagenow=${page.pagenow}">删除</a>&nbsp&nbsp <a href="<%=path %>/BookTypeServlet?type=updateselet&&typeid=${t.typeId}&&pagenow=${page.pagenow}">修改</a>
	  				</td>
	  			</tr>
  			</c:forEach>
  		</tbody>
  		
  	</table >
  	<div class="div1">
  	
  	<button type="button" onclick="page(${page.pre})">上一页</button>&nbsp;&nbsp;第${page.pagenow}页&nbsp;&nbsp;<button type="button" onclick="page(${page.next})">下一页</button>
  			共${page.pages}页前往<select id="se" name="page">
  				<c:forEach begin="1" end="${page.pages}" var="p">
  					<option <c:if test="${page.pagenow==p}">selected="selected"</c:if>   value="${p}" >${p}</option>
  				</c:forEach>
  			</select><button type="button" onclick="window.location.href='<%=path %>/admin/main/addtype.jsp'">增加</button>
  	</div>
	</body>
	<script type="text/javascript">
		function page(page){
			$("#page").val(page);
			$("#form1").submit();
		}
		$("#se").blur(function (){
			var s = $("#se").val();
			$("#page").val(s);
			$("#form1").submit();
		})
	</script>
</html>
