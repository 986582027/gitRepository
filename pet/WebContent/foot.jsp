<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@page import="util.Info"%>
<%@page import="dao.CommDAO"%>
<%@page import="util.PageManager"%>


 
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="x-ua-compatible" content="ie=8" />  
<title>宠物养成系统</title> 
<link href="frontfiles/css/layout.css" rel="stylesheet" type="text/css" />
<link href="frontfiles/css/css.css" rel="stylesheet" type="text/css" /> 
<style type="text/css">
<!--
A:hover {COLOR: #000;}
A {COLOR: #4e4235; TEXT-DECORATION: none}
.div_xixi { MARGIN: 0px auto; WIDTH: 723px; font-size:14px; POSITION: relative; HEIGHT: 330px; float:left}
.div_jimg {	MARGIN: 0px; WIDTH: 723px; HEIGHT: 228px;}
.div_jimg #a_jimg {DISPLAY: block; WIDTH: 723px; HEIGHT: 228px;}
.div_jimg #bigimg { width:540px; height:228px; float:left;}
.div_jimg .ul_jimg {PADDING-RIGHT: 0px; DISPLAY: block; PADDING-LEFT: 0px; RIGHT: 0px; PADDING-BOTTOM: 0px; MARGIN: 0px; WIDTH: 225px; PADDING-TOP: 0px; LIST-STYLE-TYPE: none; POSITION: absolute; TOP: 0px; HEIGHT: 228px;}
.div_jimg .ul_jimg LI {DISPLAY: inline; FLOAT: right; OVERFLOW: hidden; WIDTH: 185px; CURSOR: pointer; WORD-BREAK: break-all; TEXT-INDENT: 30px; WHITE-SPACE: nowrap;height:38px; line-height:38px; BACKGROUND: url(frontfiles/images/bg_j04.jpg) repeat-y right top; TEXT-OVERFLOW: ellipsis}
.div_jimg .ul_jimg A {POSITION: relative}
.div_jimg .ul_jimg .on { WIDTH: 200px; COLOR: #e9d8a4; TEXT-INDENT: 43px; POSITION: static;
background-image:url(frontfiles/images/bg_j05.png)!important;background-image:url(www.1917go.com);
FILTER: progid:DXImageTransform.Microsoft.AlphaImageLoader(src='frontfiles/images/bg_j05.png');}
.div_jimg .ul_jimg .on A {FONT-WEIGHT: bold; COLOR: #e9d8a4; text-decoration:none;}
-->
</style>
 
</head>
 
 
<body style="font:12px Arial, '宋体', Verdana, sans-serif; color:#343434;  ">
 
 
 
 
 
<table width="960" border="0" align="center" cellpadding="0" cellspacing="10" bgcolor="#A19887" class="margin_b_8">
  <tr>
    <td valign="top" bgcolor="#BFB7A3"><table width="940" border="0" cellspacing="8" cellpadding="0">
      <tr>
       <td width="83" rowspan="2" >友情链接</td>
       <td width="853" align="center">
       
       <%
       for(HashMap m:new CommDAO().select("select * from yqlj order by id desc")){
        %>
       <a href="<%=m.get("ljurl") %>" target="_blank" title="Google"><%=m.get("ljname") %></a> 
     &nbsp;  &nbsp;&nbsp;|&nbsp;&nbsp; &nbsp; 
        <%} %>
        
        </td>
  </tr>

</table>
  </tr>
</table> 
  <%="</div>" %> 
  <div class="header_top">
   <div class="header_top_left header_bottom_left"></div>
   <div class="header_top_center"></div>
   <div class="header_top_right header_bottom_right"></div>
  </div>
  <%="</div>" %>  <%="</div>" %>
<div id="footer">Copyrights &copy; 11 - 12  本商城无版权，想怎么玩就怎么玩，欢迎免费下载. 
<br />版权没有 @ 2014 宠物养成系统   深圳市某某区某某路13-2号  商城专线：13888888888 (王先生）
&nbsp;&nbsp;&nbsp;&nbsp;网站目前访问量：111111&nbsp;&nbsp;&nbsp;&nbsp;<br />
技术支持： 宠物养成系统项目组</div>
 
 
 
 
</body>
</html>

