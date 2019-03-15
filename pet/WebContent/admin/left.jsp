<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@page import="util.Info"%> 
<style type="text/css">
<!--
body {
	margin-left: 0px;
	margin-top: 0px;
	margin-right: 0px;
	margin-bottom: 0px;
}
.STYLE1 {
	font-size: 12px;
	color: #FFFFFF;
}
.STYLE3 {
	font-size: 12px;
	color: #033d61;
}
-->
</style>
<style type="text/css">
.menu_title SPAN {
	FONT-WEIGHT: bold; LEFT: 3px; COLOR: #ffffff; POSITION: relative; TOP: 2px 
}
.menu_title2 SPAN {
	FONT-WEIGHT: bold; LEFT: 3px; COLOR: #FFCC00; POSITION: relative; TOP: 2px
}

</style>
<style>a { text-decoration: none }</style> 
 
<%
HashMap user = Info.getUser(request);
String uname = user.get("uname").toString();
String utype = user.get("utype").toString();
String userid = user.get("id").toString();
 %>
<table width="165" height="100%" border="0" cellpadding="0" cellspacing="0">
  <tr>
    <td height="28" background="images/main_40.gif"><table width="100%" border="0" cellspacing="0" cellpadding="0">
      <tr>
        <td width="19%">&nbsp;</td>
        <td width="81%" height="20"><span class="STYLE1">管理菜单</span></td>
      </tr>
    </table></td>
  </tr>
  
  
   
  <tr>
    <td valign="top">
    
     
     
    
    
       <%if(utype.equals("管理员")){ %>
         
            
          <%=Info.getCol("A","1","基础数据管理",null,null) %>
          <%=Info.getCol("C","1",null,null,"") %>
          <%=Info.getCol("B","1","宠物管理","proscx.jsp",null) %>
          <%=Info.getCol("B","1","评论管理","pinluncx.jsp",null) %>
          <%=Info.getCol("B","1","留言管理","messagescx.jsp",null) %>
          <%=Info.getCol("B","1","友情链接管理","yqljcx.jsp",null) %>
          <%=Info.getCol("B","1","宠物知识管理","newscx.jsp",null) %>
          <%=Info.getCol("B","1","知识类别管理","ntypescx.jsp",null) %>
          <%=Info.getCol("B","1","网站公告","wzgg.jsp",null) %>
          <%=Info.getCol("B","1","联系我们","lxwm.jsp",null) %>
          <%=Info.getCol("B","1","宠物类别管理","splbcx.jsp",null) %>
          <%=Info.getCol("B","1","广告图片","guanggao.jsp",null) %>
          <%=Info.getCol("B","1","会员信息管理","hysysusercx.jsp",null) %>
          <%=Info.getCol("B","1","系统用户管理","sysusercx.jsp",null) %>
          <%=Info.getCol("D",null,null,null,null) %>
       
       
          <%=Info.getCol("A","3","个人信息维护",null,null) %>
          <%=Info.getCol("C","3",null,null,"") %>
          <%=Info.getCol("B","3","修改个人信息","psysuserxg.jsp",null) %>
          <%=Info.getCol("B","3","修改登录密码","puppass.jsp",null) %>
          <%=Info.getCol("D",null,null,null,null) %>
           
    <%} %>
     
     
     
     
      <%
      if(user.get("utype").equals("会员"))
      {
       %>
       
          <%=Info.getCol("A","2","宠物信息管理",null,null) %>
          <%=Info.getCol("C","2",null,null,"") %>
          <%=Info.getCol("B","2","个人交易信息管理","ptranscx.jsp",null) %> 
          <%=Info.getCol("D",null,null,null,null) %>
          
         <%=Info.getCol("A","3","个人信息维护",null,null) %>
          <%=Info.getCol("C","3",null,null,"") %>
          <%=Info.getCol("B","3","修改个人信息","psysuserxg.jsp",null) %>
          <%=Info.getCol("B","3","修改登录密码","puppass.jsp",null) %>
          <%=Info.getCol("D",null,null,null,null) %>
       
      <%} %>
      
     
     
      
    
    
    </td>
  </tr>
   
  
  
  
  
  
  
  
  
  <tr>
    <td height="18" background="images/main_58.gif"><table width="100%" border="0" cellspacing="0" cellpadding="0">
      <tr>
        <td height="18" valign="bottom"><div align="center" class="STYLE3">版本：2008V1.0</div></td>
      </tr>
    </table></td>
  </tr>
</table>
<script>




function showsubmenu(sid)
{
whichEl = eval("submenu" + sid);
imgmenu = eval("imgmenu" + sid);
if (whichEl.style.display == "none")
{
eval("submenu" + sid + ".style.display=\"\";");
imgmenu.background="images/main_47.gif";
}
else
{
eval("submenu" + sid + ".style.display=\"none\";");
imgmenu.background="images/main_48.gif";
}
}

</script>


<script language="javascript">
        function go(purl)
        {
        parent.document.getElementsByTagName("iframe")[1].src=(purl);
        }
        </script>
