<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@page import="util.Info"%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>管理中心</title>
</head>

<%
String url = "";
System.out.println("1");
HashMap user = new HashMap(); 
user = Info.getUser(request);
  
 if(user.get("utype").equals("管理员"))
{
url="aordersjx.jsp";
}

 if(user.get("utype").equals("会员"))
{
url="ordersjx.jsp";
}
 

 %>


<frameset rows="64,*"  frameborder="NO" border="0" framespacing="0">
	<frame src="/petsns/admin/admin_top.jsp" noresize="noresize" frameborder="NO" name="topFrame" scrolling="no" marginwidth="0" marginheight="0" target="main" />
  <frameset cols="200,*"  rows="560,*" id="frame">
	<frame src="/petsns/admin/left.jsp" name="leftFrame" noresize="noresize" marginwidth="0" marginheight="0" frameborder="0" scrolling="no" target="main" />
	<frame src="/petsns/admin/<%=url %>" name="main" marginwidth="0" marginheight="0" frameborder="0" scrolling="auto" target="_self" />
  
<noframes>
  <body></body>
    </noframes>
</html>
