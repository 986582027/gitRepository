<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@page import="dao.CommDAO"%>
<%@page import="util.Info"%>
<%@page import="util.PageManager"%>
 <%
HashMap user = Info.getUser(request);
String uname = user.get("uname").toString();
String utype = user.get("utype").toString();
String userid = user.get("id").toString();
 %>
 <%   

response.setHeader("Pragma","No-cache");    

response.setHeader("Cache-Control","no-cache");    

response.setDateHeader("Expires", -10);   

%>  
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head> 
<title>无标题文档</title>
<style type="text/css">
<!--
body {
	margin-left: 0px;
	margin-top: 0px;
	margin-right: 0px;
	margin-bottom: 0px;
}
.STYLE1 {font-size: 13px}
.STYLE3 {font-size: 12px; font-weight: bold; }
.STYLE4 {
	color: #03515d;
	font-size: 12px;
}
-->
</style>
 
</head>

<body>

<form  action="splbcx.jsp"  name="f1" method="post"    >
<table width="100%" border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td height="30" background="/petsns/admin/tab/images/tab_05.gif"><table width="100%" border="0" cellspacing="0" cellpadding="0">
      <tr>
        <td width="12" height="30"><img src="/petsns/admin/tab/images/tab_03.gif" width="12" height="30" /></td>
        <td><table width="100%" border="0" cellspacing="0" cellpadding="0">
          <tr>
            <td width="46%" valign="middle"><table width="100%" border="0" cellspacing="0" cellpadding="0">
              <tr>
                <td width="5%"><div align="center"><img src="/petsns/admin/tab/images/tb.gif" width="16" height="16" /></div></td>
                <td width="95%" class="STYLE1"><span class="STYLE3">你当前的位置</span>  ： 宠物类别管理</td>
              </tr>
            </table></td>
            <td width="54%"><table border="0" align="right" cellpadding="0" cellspacing="0">
              <tr>
                
              </tr>
            </table></td>
          </tr>
        </table></td>
        <td width="16"><img src="/petsns/admin/tab/images/tab_07.gif" width="16" height="30" /></td>
      </tr>
    </table></td>
  </tr>
  <tr>
    <td><table width="100%" border="0" cellspacing="0" cellpadding="0">
      <tr>
        <td width="8" background="/petsns/admin/tab/images/tab_12.gif">&nbsp;</td>
        <td><table width="100%" border="0" cellpadding="0" cellspacing="1" bgcolor="#C3E5FB" >
         
        
        
          <tr>
            <td width="17%"   height="28" align="center" background="/petsns/admin/tab/images/bg.png" bgcolor="#FFFFFF" class="STYLE1">大类 </td>
            <td width="83%" align="center" background="/petsns/admin/tab/images/bg.png" bgcolor="#FFFFFF" class="STYLE1">小类</td>
          </tr>
         
         
         
          <%
 ArrayList<HashMap> list = PageManager.getPages("",100, "select * from splb where tglparentid='-1' order by id desc ", request ); 
for(HashMap map:list){ 
 String erjlbstr = "" ;
 List<HashMap> erlist = new CommDAO().select("select * from splb where tglparentid='"+map.get("id")+"' order by id desc ") ;
for(HashMap ermap:erlist){ 
erjlbstr+="<a href=\"javascript:update('"+ermap.get("id")+"')\">"+ermap.get("datashowname")+"</a>&nbsp;&nbsp;&nbsp; " ;
}
 %>
<tr>
            <td height="32" align="center" valign="middle" bgcolor="#FFFFFF" class="STYLE1">
<a href="javascript:update('<%=map.get("id")%>')"><%=map.get("datashowname")%></a>
</td>
            <td height="32" align="left" valign="middle" bgcolor="#FFFFFF" class="STYLE1">
            &nbsp;
            
            
<%=erjlbstr %>

          
          
           &nbsp;&nbsp; <a href="javascript:add('<%=map.get("id") %>')">[点击添加]</a></td>
          </tr>
<%}%>
<tr>
            <td height="32" colspan="2" align="left" valign="middle" bgcolor="#FFFFFF" class="STYLE1">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <a href="javascript:add('-1')">[点击添加大类]</a></td>
            </tr>
            
            
        </table></td>
        <td width="8" background="/petsns/admin/tab/images/tab_15.gif" class="STYLE1" >&nbsp;</td>
      </tr>
    </table></td>
  </tr>
  <tr>
    <td height="35" background="/petsns/admin/tab/images/tab_19.gif"><table width="100%" border="0" cellspacing="0" cellpadding="0">
      <tr>
        <td width="12" height="35"><img src="/petsns/admin/tab/images/tab_18.gif" width="12" height="35" /></td>
        <td align="center" valign="middle"  class="STYLE1" >&nbsp;</td>
        <td width="16"><img src="/petsns/admin/tab/images/tab_20.gif" width="16" height="35" /></td>
      </tr>
    </table></td>
  </tr>
</table>


</form>
</body>
</html>
<script language=javascript src='/petsns/js/My97DatePicker/WdatePicker.js'></script>
<script language=javascript src='/petsns/js/popup.js'></script>
<script language=javascript> 
function update(no){ 
pop('splbxg.jsp?erjitype=erjitype&id='+no,'信息修改',590,'100%') 
}
</script> 
<script language=javascript> 
function add(no){ 
pop('splbtj.jsp?tglparentid='+no,'信息添加',590,'100%') 
}
</script> 
<%@page import="util.Info"%> 
<%@page import="java.util.ArrayList"%> 
<%@page import="java.util.HashMap"%> 
<%@page import="util.PageManager"%> 
<%@page import="dao.CommDAO"%> 
<style>a { text-decoration: none }</style> 
