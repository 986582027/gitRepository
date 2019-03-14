<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <% String path=request.getContextPath(); %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<script src="js/jquery-2.0.0.js" language="JavaScript" type="text/javascript"></script>
<script src="js/jquery-2.0.0.min.js" language="JavaScript" type="text/javascript"></script>
  <title>商品</title>
  <style type="text/css">
    p{
	margin:10px 5px;
	}
	a{
	text-decoration:none;
	color:black;
	}
	a:hover{
	color:#cc00ff;
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
	margin: 0 auto;
	}
	#nn{
	font-size:12px;
	width:980px;
	}
	#a1{
	text-align:center;
	padding-top:15px;
	}
	#left{
	width:360px;
	height:500px;
	float:left;
	}
	#right{
	width:500px;
	height:500px;
	float:left;
	}
	img{
	margin:5px;
	border-color:#bebebe;
	}
	#a2{
	padding-left:50px;
	margin:0px;
	}
	.tu{
	border:none;
	}
	.r1{
	width:100px;
	margin-right:10px 10px;
	text-align:right;
	float:left;
	}
	.r2{
	width:100px;
	float:left;
	margin-right:10px 10px;
	}
	.r3{
	padding-left:30px;
	}
	#r4{
	border:1px  solid #ff9966;
	margin-left:40px;
	width:300px;
	height:40px;
	background-image:url(<%=path%>/imgs/onlinepay.gif);
	background-repeat:no-repeat;
	background-position:0px 10px;
	padding-top:10px;
	padding-left:60px;
	}
	.wu{
	border:none;
	}
	body{text-align:center;}
	.tr1{
		height: 50px;
	}
	.td1{
		width: 200px;
		font-size:20px;
	}
	.img1{
		height: 56px;
		width: 45px;
	}
	.img02{
		height: 380px;
		width: 270px;
	}
  </style>
 </head>
 <body onload="load()">
  <div id="zhu" class="">
	<iframe src="head.jsp" name="top" frameborder="0" scrolling="no" class="iframe1"></iframe>
	<div id="nn" class="">
	<input type="hidden" id="session" value="${sessionScope.user.name}">
	<h1 id="a1">${book.bookName}</h1>
	<div id="left" class="">
		<p><a href="#"><img class="img02" src="<%=path%>/imgs/${book.bookImage}.jpg" alt="${book.bookName}" /></a></p>
		<p>
		<img class="img1" src="<%=path%>/imgs/${book.bookImage}.jpg" alt="小图1" />
		<img class="img1" src="<%=path%>/imgs/${book.bookImage}.jpg" alt="小图2" />
		<img class="img1" src="<%=path%>/imgs/${book.bookImage}.jpg" alt="小图3" />
		<img class="img1" src="<%=path%>/imgs/${book.bookImage}.jpg" alt="小图4" />
		<img class="img1" src="<%=path%>/imgs/${book.bookImage}.jpg" alt="小图5" />
		</p>
		
	</div>
	<div id="right" class="">
		<table>
			<tr class="tr1">
				<td class="td1">一口价</td>
				<td class="td1">${book.bookPrice}</td>
			</tr>
			<tr class="tr1">
				<td class="td1">运费</td>
				<td class="td1">免运费</td>
			</tr>
			<tr class="tr1">
				<td class="td1">上架时间</td>
				<td class="td1">${book.bookTime}</td>
			</tr>
			<tr class="tr1">
				<td class="td1">累计售出</td>
				<td class="td1">${book.bookSell}</td>
			</tr>
			<tr class="tr1">
				<td class="td1">商品类型</td>
				<td class="td1">${typename}</td>
			</tr>
			<tr class="tr1">
				<td class="td1">浏览量</td>
				<td class="td1" id="glance">${book.glanceNumber}</td>
			</tr>
			<tr class="tr1">
				<td class="td1">简介</td>
				<td class="td1">${book.bookIntroduce}</td>
			</tr>
			
		</table>
		<a id="hre" onclick="return goumai()" href="<%=path %>/BookServlet?book=gouwuche&&bookid=${book.bookId}&&pagenow=${pagenow}"><img src="<%=path%>/imgs/buynow.gif" alt="alt"></a>
	</div>
	<br clear="all" />
	</div>
	<iframe src="bottom.jsp" name="top" frameborder="0" scrolling="no" class="iframe2"></iframe>
  </div>
 </body>
 <script type="text/javascript">
 	function load(){
 		var glanceNumber = ${book.glanceNumber};
 		var bookid = ${book.bookId};
 		$.ajax({
 			type : 'Post',
 			url : "<%=path%>/BookServlet?book=liulan",
 			data : {"glanceNumber":glanceNumber+1,"bookid":bookid},
 			success : function(data){
 				$("#glance").text(data);
 			}
 		});
 	}
 function goumai(){
	 var s = $("#session").val();
	 if(s!=null&&s!=""){
		return true;
	 }else{
		 if(confirm("您未登录,是否需要登录？")){
			 $("#hre").attr("href","<%=path %>/login.jsp");
			 return true;
		 }else{
			 return false;
		 }
	 }
 }
 	
 </script>
</html>
