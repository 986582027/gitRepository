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
<style>a { text-decoration: none }</style> 
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

<form  action="pinluncx.jsp"  name="f1" method="post"    >
<table width="100%" border="0" cellspacing="0" cellpadding="0">
<tr><td height="2"></td></tr>
  <tr>
    <td height="30" background="/petsns/admin/tab/images/tab_05.gif"><table width="100%" border="0" cellspacing="0" cellpadding="0">
      <tr>
        <td width="12" height="30"><img src="/petsns/admin/tab/images/tab_03.gif" width="12" height="30" /></td>
        <td><table width="100%" border="0" cellspacing="0" cellpadding="0">
          <tr>
            <td width="46%" valign="middle"><table width="100%" border="0" cellspacing="0" cellpadding="0">
              <tr>
                <td width="5%"><div align="center"><img src="/petsns/admin/tab/images/tb.gif" width="16" height="16" /></div></td>
                <td width="95%" class="STYLE1"><span class="STYLE3">你当前的位置</span>  ： 评论管理</td>
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
            <td colspan=6 height="36" bgcolor="#FFFFFF" align="left" class="STYLE1">  &nbsp;&nbsp;&nbsp;
<% 
String psaver = request.getParameter("saver")==null?"":request.getParameter("saver"); 
String startsaver = request.getParameter("startsaver")==null?"":request.getParameter("startsaver"); 
String endsaver = request.getParameter("endsaver")==null?"":request.getParameter("endsaver"); 
String pinfotitle = request.getParameter("infotitle")==null?"":request.getParameter("infotitle"); 
String startinfotitle = request.getParameter("startinfotitle")==null?"":request.getParameter("startinfotitle"); 
String endinfotitle = request.getParameter("endinfotitle")==null?"":request.getParameter("endinfotitle"); 
String psavetime = request.getParameter("savetime")==null?"":request.getParameter("savetime"); 
String startsavetime = request.getParameter("startsavetime")==null?"":request.getParameter("startsavetime"); 
String endsavetime = request.getParameter("endsavetime")==null?"":request.getParameter("endsavetime"); 
   %>

<%
 HashMap mmm = new HashMap();%> 

&nbsp;&nbsp;
评论人 
&nbsp;:&nbsp; 
<input type=text class=''  size=20 name='saver' />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;

&nbsp;&nbsp;
评论对象 
&nbsp;:&nbsp; 
<input type=text class=''  size=20 name='infotitle' />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;

&nbsp;&nbsp;
评论时间 &nbsp;:&nbsp;
 
<input type=text class=''  size=10 name='startsavetime' onclick='WdatePicker();' />
&nbsp;&nbsp;至&nbsp;&nbsp;

<input type=text class=''  size=10 name='endsavetime' onclick='WdatePicker();' />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;

<input type=submit class='' value='查询信息' />
 &nbsp;&nbsp;
 
&nbsp;&nbsp;</td>
            </tr>
        
        
        
          <tr>
            <td   height="28" background="/petsns/admin/tab/images/bg.png" bgcolor="#FFFFFF" align="center" class="STYLE1">评论人  </td>
<td   height="28" background="/petsns/admin/tab/images/bg.png" bgcolor="#FFFFFF" align="center" class="STYLE1">评论内容  </td>
<td   height="28" background="/petsns/admin/tab/images/bg.png" bgcolor="#FFFFFF" align="center" class="STYLE1">评论对象  </td>
<td   height="28" background="/petsns/admin/tab/images/bg.png" bgcolor="#FFFFFF" align="center" class="STYLE1">评论时间  </td>
<td   height="28" background="/petsns/admin/tab/images/bg.png" bgcolor="#FFFFFF" align="center" class="STYLE1">操作  </td>
            </tr>
         
         
         
          <% 
new CommDAO().delete(request,"pinlun"); 
if(request.getParameter("saverid1")!=null){ 
 new CommDAO().commOper("update pinlun set saver ='' where id="+request.getParameter("saverid1"));  
} 
if(request.getParameter("saverid2")!=null){ 
 new CommDAO().commOper("update pinlun set saver ='' where id="+request.getParameter("saverid2"));  
} 
String sql = "select * from pinlun where 1=1 " ;
 if(!psaver.equals("")){ 
 sql+= " and saver like'%"+psaver+"%' " ;
 }  
 if(!startsaver.equals("")){  
 mmm.put("startsaver",startsaver) ;
 sql+= " and saver >'"+startsaver+"' " ;
 }  
 if(!endsaver.equals("")){  
 mmm.put("endsaver",endsaver) ;
 sql+= " and saver <'"+Info.getDay(endsaver,1)+"' " ;
 }  
 if(!pinfotitle.equals("")){ 
 sql+= " and infotitle like'%"+pinfotitle+"%' " ;
 }  
 if(!startinfotitle.equals("")){  
 mmm.put("startinfotitle",startinfotitle) ;
 sql+= " and infotitle >'"+startinfotitle+"' " ;
 }  
 if(!endinfotitle.equals("")){  
 mmm.put("endinfotitle",endinfotitle) ;
 sql+= " and infotitle <'"+Info.getDay(endinfotitle,1)+"' " ;
 }  
 if(!psavetime.equals("")){ 
 sql+= " and savetime like'%"+psavetime+"%' " ;
 }  
 if(!startsavetime.equals("")){  
 mmm.put("startsavetime",startsavetime) ;
 sql+= " and savetime >'"+startsavetime+"' " ;
 }  
 if(!endsavetime.equals("")){  
 mmm.put("endsavetime",endsavetime) ;
 sql+= " and savetime <'"+Info.getDay(endsavetime,1)+"' " ;
 }  
  sql +=" order by id desc ";
String url = "pinluncx.jsp?1=1&saver="+psaver+"&infotitle="+pinfotitle+"&savetime="+psavetime+""; 
ArrayList<HashMap> list = PageManager.getPages(url,5, sql, request ); 
for(HashMap map:list){ %>
<tr>

            <td height="30" valign="middle" bgcolor="#FFFFFF" class="STYLE1" align="center"><%=map.get("saver")%></td>
            <td height="30" valign="middle" bgcolor="#FFFFFF" class="STYLE1" align="center"><%=map.get("content")%></td>
            <td height="30" valign="middle" bgcolor="#FFFFFF" class="STYLE1" align="center"><%=map.get("infotitle")%></td>
            <td height="30" valign="middle" bgcolor="#FFFFFF" class="STYLE1" align="center"><%=map.get("savetime")%></td>
            <td height="30" valign="middle" bgcolor="#FFFFFF" class="STYLE1" align="center">
 
<a onclick="return confirm('确定要删除这条记录吗?')" href="pinluncx.jsp?scid=<%=map.get("id")%>">删除</a>
</td>
</tr>
<%}%>
            
            
        </table></td>
        <td width="8" background="/petsns/admin/tab/images/tab_15.gif" class="STYLE1" >&nbsp;</td>
      </tr>
    </table></td>
  </tr>
  <tr>
    <td height="35" background="/petsns/admin/tab/images/tab_19.gif"><table width="100%" border="0" cellspacing="0" cellpadding="0">
      <tr>
        <td width="12" height="35"><img src="/petsns/admin/tab/images/tab_18.gif" width="12" height="35" /></td>
        <td colspan=6 align="center" valign="middle"  class="STYLE1" >${page.info}</td>
        <td width="16"><img src="/petsns/admin/tab/images/tab_20.gif" width="16" height="35" /></td>
      </tr>
    </table></td>
  </tr>
</table>


</form>
</body>
</html>
<script language=javascript src='/petsns/js/ajax.js'></script>
<% 
mmm.put("saver",psaver); 
mmm.put("infotitle",pinfotitle); 
mmm.put("savetime",psavetime); 
%>
<%=Info.tform(mmm)%> 
<script language=javascript >  
 
</script>  
<%=Info.tform(mmm)%> 
<script language=javascript src='/petsns/js/My97DatePicker/WdatePicker.js'></script>
<script language=javascript src='/petsns/js/popup.js'></script>
<script language=javascript> 
function update(no){ 
pop('pinlunxg.jsp?id='+no,'信息修改',550,'100%') 
}
</script> 
<script language=javascript> 
function add(){ 
pop('pinluntj.jsp','信息添加',550,'100%') 
}
</script> 
<%@page import="util.Info"%> 
<%@page import="java.util.ArrayList"%> 
<%@page import="java.util.HashMap"%> 
<%@page import="util.PageManager"%> 
<%@page import="dao.CommDAO"%> 
