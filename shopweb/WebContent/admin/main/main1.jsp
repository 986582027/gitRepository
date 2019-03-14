<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <% String path=request.getContextPath(); %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<script src="<%=path %>/js/jquery-2.0.0.js" language="JavaScript" type="text/javascript"></script>
<script src="<%=path %>/js/jquery-2.0.0.min.js" language="JavaScript" type="text/javascript"></script>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>仿126邮件系统管理后台模板</title>

<style type="text/css">
<!--
*{margin:0;padding:0;border:0;}

ul {
	margin: 0px;
	padding: 0px;
	list-style: none;
}
body {
	margin-top: 0px;
	margin-bottom: 0px;
	background-color: #FFFFFF;
}
#top {
	height: 70px;
	width: 100%;
	background-image: url(<%=path %>/admin/main/image/126_f2_01.gif);
	background-repeat: repeat-x;
	background-position: bottom;
	margin: 0 auto;
}
#top #logo {
	float: left;
	height: 50px;
	width: 168px;
	padding-top: 20px;
	padding-left: 23px;
}
#top #xx {
	float: left;
	height: 70px;
}
#top #xx #hy {
	font-size: 12px;
	height: 30px;
	color: #1D4A03;
	position: relative;
	padding-top: 11px;
}
#top #xx #hy span {
	position: absolute;
	right: 10px;
}
#top   #xx   #hy   .input1 {
	border: 1px solid #769744;
	background-image: url(<%=path %>/admin/main/image/inputbg_01.gif);
	background-repeat: repeat-x;
	font-size: 12px;
	color: #999999;
	height: 18px;
}
#top #xx #hy .input2 {
	position: relative;
	top: 4px;
}
#top #xx #topTags {
	height: 29px;
}
#top #xx #topTags li {
	float: left;
	font-size: 12px;
	font-weight: bold;
	color: #1D4A03;
	height: 23px;
	width: 80px;
	line-height: 24px;
	padding-top: 6px;
	padding-left: 10px;
}
#zhong {
	height: 100%;
	width: 100%;
	margin: 0 auto;
}
#zhong #zb {
	float: left;
	height: 100%;
	width: 191px;
}
#zhong #zb #shb {
	height: 38px;
	width: 192px;
}
#zhong #zb #shb a {
	text-decoration: none;
	color: #000000;
	font-size: 12px;
	font-weight: bold;
}
.aa {
	background-image: url(<%=path %>/admin/main/image/xxbg_aa.gif);
	background-repeat: no-repeat;
	float: left;
	width: 50px;
	height: 28px;
	font-size: 12px;
	color: #000000;
	padding-top: 10px;
	padding-left: 45px;
	font-weight: bold;
	line-height: 20px;
}
.bb {
	background-image: url(<%=path %>/admin/main/image/xxbg_bb.gif);
	background-repeat: no-repeat;
	float: left;
	width: 50px;
	height: 28px;
	font-size: 12px;
	color: #000000;
	padding-top: 10px;
	padding-left: 45px;
	font-weight: bold;
	line-height: 20px;
}
.cc {
	background-image: url(<%=path %>/admin/main/image/xxbg_cc.gif);
	background-repeat: no-repeat;
	float: left;
	width: 51px;
	height: 28px;
	font-size: 12px;
	color: #000000;
	padding-top: 10px;
	padding-left: 45px;
	font-weight: bold;
	line-height: 20px;
}
.dd {
	background-image: url(<%=path %>/admin/main/image/xxbg_dd.gif);
	background-repeat: no-repeat;
	float: left;
	width: 51px;
	height: 28px;
	font-size: 12px;
	color: #000000;
	padding-top: 10px;
	padding-left: 45px;
	font-weight: bold;
	line-height: 20px;
}
#zhong #zb #sys {
	background-image: url(<%=path %>/admin/main/image/sysbg_01.gif);
	background-repeat: repeat-x;
	height: 27px;
	background-position: 0px -1px;
	font-size: 12px;
	font-weight: bold;
	color: #3E6444;
	padding-top: 4px;
	padding-left: 20px;
	line-height: 20px;
	border-right-width: 1px;
	border-right-style: solid;
	border-right-color: #80AB73;
}
#zhong #zb #sys2 {
	background-image: url(<%=path %>/admin/main/image/sysbg_01.gif);
	background-repeat: repeat-x;
	height: 27px;
	font-size: 12px;
	font-weight: bold;
	color: #3E6444;
	padding-top: 4px;
	padding-left: 20px;
	line-height: 20px;
	border-right-width: 1px;
	border-right-style: solid;
	border-right-color: #80AB73;
}
#zhong #zb #leftMenu {
	border-right-width: 1px;
	border-right-style: solid;
	border-right-color: #80AB73;
	clear: both;
}
#zhong #zb #leftMenu ul {
	margin-right: 10px;
	margin-left: 10px;
	/*background-image: url(<%=path %>/admin/main/image/mun_bg.gif);*/
	background-repeat: no-repeat;
	margin-top: 0px;
}
#leftMenuPic{
	position:absolute;
	clear: both;
}
#zhong #zb #leftMenu li {
	font-size: 12px;
	line-height: 31px;
	padding-left: 30px;
}
#zhong #zb #ot {
	font-size: 12px;
	padding: 10px;
	border-right-width: 1px;
	border-right-style: solid;
	border-right-color: #80AB73;
	height: 210px;
}
#zhong #zb #ot {
	font-size: 12px;
	padding: 10px;
	border-right-width: 1px;
	border-right-style: solid;
	border-right-color: #80AB73;
	height: 210px;
}
#zhong  #content{
	width:790px;
	height:100%;
	float:left;
	margin: auto;
	background-image: url(<%=path %>/admin/main/image/f2_10.gif);
	background-repeat: repeat-x;
	background-position: top;
	padding-right: 10px;
	padding-bottom: 10px;
	padding-left: 10px;
}
#zhong #content #sm {
	height: 60px;
	font-size: 14px;
	font-weight: bold;
	color: #124313;
	padding-top: 14px;
	padding-left: 10px;
}
#zhong #content #sm span {
	font-size: 12px;
	font-weight: bold;
	margin-left: 30px;
}
#zhong .content{
	width:700px;
	height:100%;
	display:none;
	padding:5px;
	overflow-y:auto;
	line-height:30px;
	background-color: #FFFFFF;
	margin: 0 auto;
}
#zhong .content1 {
	width:500px;
	height:490px;
	display:block;
	padding:5px;
	overflow-y:auto;
	line-height:30px;
}
#footer{
	width:100%;
	height:26px;
	background-color:#FFFFFF;
	line-height:20px;
	text-align:center;
	margin-top: 0;
	margin-right: auto;
	margin-bottom: 0;
	margin-left: auto;
	background-image: url(<%=path %>/admin/main/images/h2bg.gif);
	background-repeat: repeat-x;
}

/**/
-->
</style>
</head>

<body onload="fn()">
<div id=top>
 <div id=logo><img src="<%=path %>/admin/main/image/126logo_tsp.gif" width="145" height="30" /></div>
 <div id=xx>
  <div id=hy> 您好,${sessionScope.admin.adminName}<a href="<%=path %>/AdminServlet?bzw=zhuxiao">退出</a>  </div>
  <div id=topTags>
   <ul></ul>
  </div>
 </div>
</div>
<!---->
<div id=zhong>
 <div id=zb>
  <div id=shb>
   <ul>
    <li class="aa" onmouseover="this.className='bb'" onmouseout="this.className='aa'"><a href="#">收信</a></li>
    <li class="cc" onmouseover="this.className='dd'" onmouseout="this.className='cc'"><a href="#">写信</a></li>
   </ul>
  </div>
  <div id=sys><img src="<%=path %>/admin/main/image/icon01.gif" width="11" height="6" /> 主系统设置</div>
  <div id=leftMenu>
  <div id="leftMenuPic"><img src="<%=path %>/admin/main/image/mun_bg.gif" /></div>
   <ul>
    <li><a  name="" href="<%=path %>/AdminServlet?bzw=list" target="guanli">个人资料</a></li>
    <li><a  name="" href="<%=path %>/AdminBookServlet?book=booklist" target="guanli">图书管理</a></li>
    <li><a  name="" href="<%=path %>/BookTypeServlet?type=typelist" target="guanli">类型管理</a></li>
    <li><a  name="" href="<%=path %>/admin/main/changepsd.jsp" target="guanli">修改密码</a></li>
   </ul>
  </div>
  <div id=sys2><img src="<%=path %>/admin/main/image/icon01.gif" width="11" height="6" /> 主系统设置</div>
 </div>
 
 
 
 <div id=content>
 <input type="hidden" id="se" value="${sessionScope.admin.adminName}">
  <div id=sm>${sessionScope.s}&nbsp&nbsp&nbsp${sessionScope.admin.adminName} </div>
  <div id=welcome class=content style="display:block;">
  </div>
  <iframe name="guanli" src="<%=path %>/admin/main/index1.jsp"width="100%" height="800px"></iframe>
 </div>
</div>
</body>
<script type="text/javascript">
	function fn(){
		var se = $("#se").val();
		if(se==""||se==null){
			window.location.href="<%=path %>/admin/admin.jsp";
		}
	}
</script>
</html>