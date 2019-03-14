<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
     <% String path=request.getContextPath(); %>
     <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
     
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<script src="<%=path %>/js/jquery-2.0.0.js" language="JavaScript" type="text/javascript"></script>
<script src="<%=path %>/js/jquery-2.0.0.min.js" language="JavaScript" type="text/javascript"></script>
  <title>首页</title>
  <style type="text/css">
    div,img,p,ul,dl,li,dd,dt,h5{
	padding:0;
	margin:0;
	}
	body{
	margin:0px auto;
	padding:0;
	font-size:12px;
	text-align:center;
	}
	a{
	text-decoration:none;
	color:black;
	}
	a:hover{
	color:#ff00cc;
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
	margin: 0 auto;
	width:980px;
	}
	#nn{
	margin: 0 auto; 
	width:980px;
	height:640px;
	background-image:url(<%=path%>/imgs/bg.jpg);
	background-repeat:no-repeat;
	background-position:2px 0px;
	}
	#daohang{
	margin-top:36px;
	width:200px;
	height:604px;
	margin-right:10px;
	float:left;
	}
	#zhongjian{
	float:left;
	height:640px;
	width:525px;
	margin-right:10px;
	}
	.righttop{
		padding-top:60px;
	
	}
	#right{
	float:left;
	width:228px;
	height:260px;
	margin-top:60px;
	padding-top:10px;
	}
	#shang{
	width:523px;
	height:190px;
	overflow:hidden;
	padding-top:10px;
	}
	#xia{
	margin-top:29px;
	width:523px;
	height:400px;
	margin-left:2px;
	}
	.biaoti1{
	color:#ff8000;
	height:24px;
	line-height:26px;
	padding-left:10px;
	font-size:15px;
	font-weight:bolder;
	margin-bottom:5px;
	}
	.ul1{
		padding: 0;
		margin: 0;
		list-style-type: none;
		line-height: 5em;
	}
	
	.l1{
		display: block; 
		width: 200px; 
		text-align: center;
		text-decoration: none;
		background-color: #fffff;
	}
	.l1:hover {
		background-color: #F9890C;
	}
	
	.biaoti2{
	color:#ff8000;
	height:20px;
	line-height:20px;
	padding-left:10px;
	font-size:15px;
	font-weight:bolder;
	margin-bottom:5px;
	}
	.dt{
	float:left;
	width:80px;
	height:80px;
	text-align:center;
	padding:2px 0;
	}
	.dd{
	float:left;
	width:130px;
	line-height:60px;
	}
	.img01{
		width: 70px;
		height: 100px;
	}
	.img{
	width:70px;
	height:70px;
	border:1px solid #9ea0a2;
	}
	#xia dl{
	width:172px;
	height:135px;
	float:left;
	}
	#xia dt{
	width:170px;
	height:90px;
	text-align:center;
	padding-top:10px;
	}
	#xia dd{
	padding-top:5px;
	text-align:center;
	}
  </style>
 </head>

 <body>
 <form id="pageform" method="post" action="<%=path %>/BookServlet">
 	<input type="hidden" name="pagenow" id="pageid">
 	<input type="hidden" name="typeid" id="typeid" value="${typeid}">
 	<input type="hidden" name="bookname" id="typeid" value="${bookname}">
 	<input type="hidden" name="book" value="${list}">
 </form>
  <div id="zhu" class="">
	<iframe src="head.jsp" name="top" frameborder="0" scrolling="no" class="iframe1"></iframe>
    </div>
	<div id="nn" class="">
		<div id="daohang" class="">
			 <ul class="ul1">
					 <li class="l1"><a href="<%=path %>/BookServlet?book=list">查看全部</a></li>
			 	<c:forEach items="${requestScope.typeAll}" var="t">
		            <li class="l1"><a href="<%=path %>/BookServlet?book=type&&typeid=${t.typeId}">${t.typeName}</a></li>
	            </c:forEach>
       		 </ul>
			
			
		</div>
		<div id="zhongjian" class="">
			<div id="shang" class="">
				 <img src="<%=path%>/imgs/top1.jpg" alt="9月新品新气象" id="div1" />
				
			</div>
			<div id="xia" class="">
				<c:forEach items="${requestScope.bookAll}" var="b">
					<dl>
						<dt><a href="<%=path %>/BookServlet?book=shangpin&&bookid=${b.bookId}&&pagenow=${page.pagenow}"><img class="img01" src="<%=path%>/imgs/${b.bookImage}.jpg" alt="alt" /></a></dt>
						<dd><a href="">${b.bookName}</a></dd>
						<dd><a href="">${b.bookPrice}</a></dd>
					</dl>
				</c:forEach>
				<br clear="all" />
				<br/><br/><br/>
				
				<button type="button" onclick="page(${page.pre})">上一页</button>&nbsp;&nbsp;第${page.pagenow}页&nbsp;&nbsp;<button type="button" onclick="page(${page.next})">下一页</button>&nbsp;&nbsp;共${page.pages}页
			</div>
		</div>
		<div class="righttop">
			<form onsubmit="return sou()" action="BookServlet" method="post">
				<input type="text" onblur="sousuo()" id="s" name="bookname" placeholder="请输入你要查找的图书名称"><br/><br/>
				<input type="hidden"  name="book"  value="sousuo">
				<input type="submit"  value="搜索"></button>
			</form>
		</div>
		<div id="right" class="">
		<c:forEach items="${bookrandom}" var="br">
			<dl>
				<dt class="dt"><a href="<%=path %>/BookServlet?book=shangpin&&bookid=${br.bookId}&&pagenow=${page.pagenow}"><img src="<%=path%>/imgs/${br.bookImage}.jpg" alt="alt" class="img" /></a></dt>
					<dd><a href="">${br.bookName}</a></dd>
						<dd><a href="">${br.bookPrice}</a></dd>
			</dl>
			<br clear="all" />
		</c:forEach>
			
			
		</div>
        </div>
    <div>
	<iframe src="bottom.jsp" name="top" frameborder="0" scrolling="no" class="iframe2"></iframe>
  </div>
 </body>
 <script type="text/javascript">
 	function page(page){
 		$("#pageid").val(page);
 		$("#pageform").submit();
 	}
 	var a;
 	function sousuo(){
 		var w = $("#s").val();
 		if(w==null&&w==""){
 			a=false
 		}else{
 			a=true;
 		}
 	}
 	function sou(){
 		if(a==true){
 			return true;
 		}else{
 			return false;
 		}
 	}
 	var curIndex = 0; 
 	var timeInterval = 2000; 
 	var arr = new Array(); 
 	arr[0] = "<%=path %>/imgs/top1.jpg"; 
 	arr[1] = "<%=path %>/imgs/top2.jpg"; 
 	arr[2] = "<%=path %>/imgs/top3.jpg"; 
 	arr[3] = "<%=path %>/imgs/top4.jpg"; 
 	setInterval(changeImg,timeInterval); 
 	function changeImg() { 
 	 var obj = document.getElementById("div1"); 
 	 if (curIndex == arr.length-1) { 
 	  curIndex = 0; 
 	 } else { 
 	  curIndex += 1; 
 	 } 
 	 obj.src = arr[curIndex]; 
 	} 
 </script>
</html>
