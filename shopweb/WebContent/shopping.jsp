<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
     <% String path=request.getContextPath(); %> 
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<script src="js/jquery-2.0.0.js" language="JavaScript" type="text/javascript"></script>
<script src="js/jquery-2.0.0.min.js" language="JavaScript" type="text/javascript"></script>
  <title>购物车</title>
  <style type="text/css">
  
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
	padding:0;
	margin:0 auto;
	}
	#nn{
	width:980px;
	margin:0px;
	padding-top:20px;
	}
	a{
	text-decoration:none;
	color:black;
	}
	a:hover{
	color:#cc33ff;
	}
	.a1{
	padding-left:50px;
	}
	.a2{
	height:34px;
	background-image:url(<%=path%>/imgs/buytitle_bg.gif);
	padding-left:50px;
	line-height:34px;
	background-repeat:no-repeat;
	margin-bottom:15px;
	}
	h5{
	height:25px;
	padding:0;
	margin:0;
	}
	.b1{
	width:400px;
	float:left;
	margin-left:10px;
	}
	.b2{
	width:100px;
	float:left;
	}
	.b3{
	width:100px;
	float:left;
	}
	.b4{
	width:60px;
	float:left;
	}
	.b5{
	width:170px;
	float:left;
	}
	.b6{
	width:70px;
	float:left;
	}
	p{
	height:25px;
	}
	#b7{
	margin-left:10px;
	width:480px;
	float:left;
	}
	#b8{
	width:150px;
	float:left;
	}
	#b9{
	width:180px;
	float:left;
	}
	.c1{
	padding-left:100px;
	margin:3px;
	}
	.red{
	color:red;
	font-weight:bolder;
	}
	.c2{
	padding-left:200px;
	}
	body{text-align:center;}
	.img01{
		width: 100px;
		height: 100px;
	}
	.tr1{
		height: 150px;
	}
	.t1{
		width: 200px;
	}
	
  </style>
 </head>

 <body>
	<div id="zhu" class="">
	<iframe src="head.jsp" name="top" frameborder="0" scrolling="no" class="iframe1"></iframe>
	<div id="nn" class="">
	<h4><img src="<%=path%>/imgs/mycart.gif" alt="alt" /> <a href="#" class="a1">全场运费包邮</a></h4>
	<h5 class="a2">确认商品价格与交易条件</h5>
	<table>
		<thead>
			<tr class="tr1">
				<th class="t1"></th>
				<th class="t1">商品名</th>
				<th class="t1">原价</th>
				<th class="t1">数量</th>
				<th class="t1">删除</th>
			</tr>
		</thead>
		<tbody>
		<c:forEach items="${requestScope.list}" var="b">
			<tr>
				<td><img class="img01" src="<%=path%>/imgs/${b.bookImage}.jpg" /></td>
				<td>${b.bookName}</td>
				<td id="price">${b.bookPrice}</td>
				<td><input id="${b.bookId}" type="text" value=${b.bookNum}  onblur="jiage123(${b.bookId},${b.bookNum})" /></td>
				<td><a href="<%=path %>/BookServlet?book=shanchu&&userid=${b.userid}&&bookid=${b.bookId}&&p1=${pagenow}" onclick="return confirm('确认删除？')">删除</a></td>
			</tr>
			</c:forEach>
		</tbody>
	</table>
	
	<p id="b7"><a href="<%=path%>/BookServlet?&&pagenow=${pagenow}">继续挑选商品</a></p>
	<p id="b8" class="prince1">总价:￥${princes}</p>
	<br clear="all" />
	<p class="a2">补充您的邮件地址和联系人基本信息</p>
	<form method="post" onsubmit="return tijiao()"  action="<%=path%>/BookServlet">
		<p class="c1">收件人：<input type="text" readonly="readonly" size="20" name="dizhi" readonly="true" value="${user.name}"/></p>
		<p class="c1">地&nbsp;&nbsp;址：<input readonly="readonly" type="text" size="20" name="dizhi" readonly="true" value="${user.userAddress}"/></p>
		<p class="c1">电&nbsp;&nbsp;话：<input  readonly="readonly" type="text" name="code"  size="20" id="tel" readonly="true" value="${user.userPhone}"/>
		</p>
		<input type="hidden" name="book" value="shopsubmit">
		<input type="hidden" name="pagenow" value="${pagenow}">
		<input type="hidden" id="s" name="s" value="${submit}">
		<p class="c2"><input type="image" src="<%=path%>/imgs/submit.gif" /></p>
		
	</form>
	</div>
	<iframe src="bottom.jsp" name="top" frameborder="0" scrolling="no" class="iframe2"></iframe>
  </div>
  
 	
 </body>
 <script type="text/javascript">
 	function jiage123(b,c){
 		var n = $("#"+b+"").val();
 		$.ajax({
 			type : 'post',
 			url : "<%=path%>/BookServlet?book=num",
 			data :{"num2":n,"bookid":b},
 			success : function (data){
 					if(n>c){
						var prince = ${princes}+(n-c)*data;
					}else{
						var prince = ${princes}-(c-n)*data;
					}
 					$(".prince1").text("总价:￥"+prince);
 			}
 		});
 	}
 	function tijiao(){
 		if(confirm("你是否提交购物车？")){
 			return true;
 		}else{
 			return false;
 		}
 	}
 	
 </script>
</html>
