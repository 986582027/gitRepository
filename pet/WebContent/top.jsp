<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@page import="util.Info"%>
<%@page import="dao.CommDAO"%>
<%@page import="util.PageManager"%>

<%
if(request.getParameter("z")!=null)session.invalidate();
 %>
 
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="x-ua-compatible" content="ie=8" />  
<title>宠物养成系统</title> 
<link href="frontfiles/css/layout.css" rel="stylesheet" type="text/css" />
<link href="frontfiles/css/css.css" rel="stylesheet" type="text/css" /> 
<style type="text/css">
 
</style>
 
</head>
 
 
<body style="font:12px Arial, '宋体', Verdana, sans-serif; color:#343434; ">
 <div id="header">
    <div class="sub_nav">
      <a onClick="var strHref=window.location.href;this.style.behavior='url(#default#homepage)';this.setHomePage('http://localhost:9999/petsns');" style="CURSOR: hand"><font color="#e0dcd0">设为首页</font></a>
      <em>|</em>
      <a href="javascript:window.external.AddFavorite('http://localhost:9999/petsns', '宠物养成系统')">加入收藏</a>
      
                  <%
			    if(Info.getUser(request)==null){
			     %>
			     <em>|</em>
			    <a href="regedit.jsp" class="STYLE1">免费注册</a>   
			    <%} %>
                 
      
      
      &nbsp;&nbsp;&nbsp;&nbsp;</div>
      <div class="header_top">
      <div class="header_top_left"></div>
      <div class="header_top_center"></div>
      <div class="header_top_right"></div>
      </div>
    <div class="header_content">
      <div class="logo"><a href="" title="" ><font face="华文行楷" style="font-size: 22px" color="#804000">宠物养成系统</font></a></div>
      <div class="header_content_content" style="text-align: right;">
      
      
      
                 <form action="/petsns/pros.jsp" name="f33" method="post" style="display: inline">
                 
                 <font color="gray"><span style="display: inline">宠物关键字 :
                 <input type="text" name="key" size="18" style="height:15px" />
&nbsp;&nbsp; <font  onclick="f33.submit()" style="cursor: hand"  >查找宠物</font>&nbsp;</span></font><font color="gray"><span style="display: inline">&nbsp;&nbsp;&nbsp;</span></font>&nbsp;&nbsp;&nbsp;
                 
                </form>
                 
                
                <span id="ptime"></span>
                
                
                 <script language="javascript">
                 function getPTime()
                 {
                 var weekArray = new Array("星期日", "星期一", "星期二", "星期三", "星期四", "星期五", "星期六");
                 var week = weekArray[new Date().getDay()]; 
                 document.getElementById("ptime").innerHTML=new Date().toLocaleString()+" &nbsp;"+week;
                 setTimeout(getPTime,1000);
                 }
                 getPTime();
                 
                 </script>
                
                 &nbsp;&nbsp; 
                 
               
              <table><tr><td height="9"></td></tr></table>
   
    <marquee behavior="scroll" direction="left" scrollamount="2" style="width:390px;"  ONMOUSEOUT=this.start();  ONMOUSEOVER=this.stop() >
    <%=new CommDAO().getmap("4","news").get("content") %>
      </marquee>
   &nbsp;&nbsp;&nbsp;
    <font color=gray>
     
    <form action="/petsns/petsns?ac=login" name="f22" method="post" style="display: inline">
     
    
      
    
    
    <%
    if(Info.getUser(request)==null){
     %>
     
       用户名 : 
         <input type="text" name="luname" size="11" onmouseover="this.focus();" />
       &nbsp;&nbsp; 
    密码 : 
    <input type="password" name="lupass" size="11" />
    &nbsp; 
    <input type="button" onclick="this.form.submit()" style="height: 22px" value=" 登 录 " />
    
    <%}else{ %>
    
    欢迎回来 : <%=Info.getUser(request).get("uname") %> ( <%=Info.getUser(request).get("utype") %> )
    
    &nbsp;&nbsp;
    <a href="/petsns/admin/main.jsp" target="_blank">去信息服务中心</a>
    &nbsp;&nbsp;
    
    <a href="index.jsp?z=z">[注销]</a>
    
    <%} %>
&nbsp;&nbsp;&nbsp;&nbsp;
    </form>
    </font>    
      
      
      </div>
    </div>
     <div class="menu">
<ul>
 
<li style=" margin-left:33px;"> <a href="index.jsp">网站首页</a><br />Home</li>

<li style=" margin-left:33px;"><a href="trans.jsp">会员交易</a><br />Trans</li>
 
<li style=" margin-left:33px;"><a href="pros.jsp">宠物浏览</a><br />Products</li>
 
<li style=" margin-left:33px;"><a href="dzzq.jsp">打折专区</a><br />Discount</li>
 
<li style=" margin-left:33px;"><a href="nlist.jsp">宠物知识</a><br />News</li>
 
<li style=" margin-left:33px;"><a href="zxjl.jsp">交流互动</a><br />alternating</li>   
    
<li style=" margin-left:33px;"><a href="lxwm.jsp">联系我们</a><br />Contact us</li> 
 
<li style=" margin-left:33px;"><a href="message.jsp">留言板</a><br />message board</li>
      </ul>
    </div><!--- menu end --->
</div>
<!--- header end --->  






 
<table width="960" border="0" align="center" cellpadding="0" cellspacing="0" class="margin_b_10">
  <tr>
    <td width="960" valign="top">
    <table width="960" border="0" align="left" cellpadding="5" cellspacing="5" bgcolor="#CCC4AF">
      <tr>
        <td bgcolor="#CBC3AE" align="left" >
        
       
       
       
       
       
              
<script type="text/javascript" src="frontfiles/js/ifocus.js"></script> 
<div id="ifocus">
	<div id="ifocus_pic">
		<ul id="ifocus_piclist">
           
           <%
           for(HashMap m:new CommDAO().select("select * from news where infotype='广告' order by id")){
            %>
            <li><a href="#" target="_blank"  ><img src="upfile/<%=m.get("filename") %>" /></a></li>
          <%} %>
		
		</ul>
		<div id="ifocus_opdiv"></div>
		<ul id="ifocus_tx">
            <li class="current"></li>
            <li class="normal"></li>
            <li class="normal"></li>
            <li class="normal"></li>
		</ul>
	</div>
	<ul id="ifocus_btn">
	  <%
	  int i=0;
           for(HashMap m:new CommDAO().select("select * from news where infotype='广告' order by id")){
           String style = "current";
           if(i!=0)style="normal";
            %>
        <li class="<%=style %>"><img src="upfile/<%=m.get("filename") %>" /></li> 
<%i++;} %>
	</ul> 
</div>
       
       
       
       
       
       
       
      </td>
      </tr>
    </table></td>
 </tr>
</table>  



</body>
</html>

