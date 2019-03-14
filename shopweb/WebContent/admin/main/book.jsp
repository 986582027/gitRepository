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
		<style>
			.ta1{
				width: 780px;
			}

			.tr1{
				height: 35px;
				text-align: center;
			}
			.th1{
				width: 100px;
			}
		</style>
	</head>
	<body>
		<form action="<%=path %>/AdminBookServlet" method="post" id="form1">
			<input type="hidden" id="page" name="page" >
			<input type="hidden"  name="bookname" value="${bookname}">
			<input type="hidden" name="book" value="${books}">
		</form>
	
	
		<form action="<%=path %>/AdminBookServlet" method="post">
	  		<input type="text" name="bookname"/>
	  		<input type="hidden" name="book" value="mohu">
	  		<input type="submit" value="查询"  /><br />
  		</form>
  		<table cellpadding="0" cellspacing="0" border="2px" class="ta1" align="center">
  			<thead>
  				<tr class="tr1">
  					<th class="th1">编号</th>
  					<th class="th1">名称</th>
  					<th class="th1">价格</th>
  					<th class="th1">简介</th>
  					<th class="th1">时间</th>
  					<th class="th1">作者</th>
  					<th class="th1">类型</th>
  					<th class="th1">状态</th>
  					<th class="th1">编辑</th>
  					<th class="th1">上，下架</th>
  					
  				</tr>
  			</thead>
  			<tbody>
  				<c:forEach items="${requestScope.book}" var="b">
	  				<tr class="tr1">
		  				<td>${b.bookId}</td>
		  				<td>${b.bookName}</td>
		  				<td>${b.bookPrice}</td>
		  				<td>${b.bookIntroduce}</td>
		  				<td>${b.bookTime}</td>
		  				<td>${b.bookAuthor}</td>
		  				<td>${b.bookTypeName}</td>
		  				<td>${b.bookState}</td>
		  				<td><a href="<%=path %>/AdminBookServlet?book=updateselet&&bookid=${b.bookId}&&pagenow=${page.pagenow}">编辑</a></td>
		  				<td><c:if test="${b.bookState=='已上架'}"><a href="<%=path %>/AdminBookServlet?book=xiajia&&bookid=${b.bookId}&&pagenow=${page.pagenow}">下架</a></c:if> <c:if test="${b.bookState=='已下架'}"><a href="<%=path %>/AdminBookServlet?book=shangjia&&bookid=${b.bookId}&&pagenow=${page.pagenow}">上架</a></c:if></td>
	  				</tr>
  				</c:forEach>
  			
  			</tbody>
  		</table> 
	  		<button type="button" onclick="page(${page.pre})">上一页</button>&nbsp;&nbsp;第${page.pagenow}页&nbsp;<button type="button" onclick="page(${page.next})">下一页</button>
  			共${page.pages}页
  			<button type="button" onclick="window.location.href='<%=path %>/BookTypeServlet?type=addtypeselect'">添加图书</button>
  		
  	
	</body>
	<script type="text/javascript">
		function page(page){
			$("#page").val(page);
			$("#form1").submit();
		}
		
		
	</script>
</html>
