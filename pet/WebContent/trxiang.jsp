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
 
 
<body style="font:12px Arial, '宋体', Verdana, sans-serif; color:#343434; ">
<div align="center">
<div id="wrap" align="justify">
  
  
  
  
  
  <jsp:include page="top.jsp"></jsp:include>
  
  
  
  
  
  
  

   <div class="main">
  <div id="main">
 <table width="100%" border="0" cellpadding="5" cellspacing="0">
      <tr>
        <td valign="top" class="TD01"><table width="100%" border="0" cellpadding="0" cellspacing="0" background="frontfiles/images/in_23.jpg" class="margin_b_8">
          <tr>
            <td width="92%" height="25" valign="top" background="frontfiles/images/in_26.jpg" class="padding_L_10 padding_T_5"><strong class="font_14 font_ffF">宠物详情</strong></td>
            <td width="23%" align="right" valign="top" class="padding_T_8"  ><br /></td>
          </tr>
        </table>
<table width="99%" border="0" cellpadding="0" cellspacing="0" align="center" >
     
  
                      <tr>
                      <TD vAlign=top  width="313" >
                      
                      <TABLE id=standard border=0 cellSpacing=1 
                                cellPadding=0 width="99%" bgColor=#BFB7A4>
<TBODY>
                               
                                <TR>
                                 
                                <TD width="16%"   rowspan="3" 
                                align= vAlign=center bgColor=#CCC4AF style="line-height: 25px;padding: 9px" >  
                                
                                
               
               
               
               
               
               
               
               <table width="98%" border="0" align="center" cellpadding="0" cellspacing="0" style="margin:10px;">
              <tr>
                <td align="left" valign="top">


 
<table width="100%" border="0" cellspacing="0" cellpadding="0">

  <tr align="center" valign="top">
    <td width="300%" colspan="3">
      <table width="100%"  border="0" cellpadding="0" cellspacing="0" id="standard_2">
    
        <tr>
          <td width="25%" height="32" align="center"   >
           <%
            String id = request.getParameter("id");
    HashMap m = new CommDAO().getmap(request.getParameter("id"),"ptrans");
     %>
          
         
          <table><tr><td height="10"></td></tr></table>
          
          <font size="3"><strong><%=m.get("title") %></strong></font>
          
          <table><tr><td height="5"></td></tr></table>
          <font color="gray">
           发布时间 : &nbsp;
           <%=m.get("savetime") %> 
          </font>
          
           <table><tr><td height="5"></td></tr></table>
          
          <%
          if(m.get("filename")!=null&&!m.get("filename").equals("")){
           %>
           
           <img src="upfile/<%=m.get("filename") %>" height="190" />
           
           <%} %>
          <table><tr><td height="5"></td></tr></table>
          </td>
          
         
            
          </tr> 
          
          
          
          
          
        
        
        <tr>
          <td height="34" align="left" valign="middle" style="line-height: 27px;">  
           所属类别 : <%=m.get("itype") %>  
           &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
           发布人 :  <%=m.get("uname") %>
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
           电话 :  <%=m.get("tel").equals("")?"":m.get("tel") %>
           &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
           QQ :  <%=m.get("qq")  %>
            
           <%  %>
           
          </td> 
        </tr>
        
          
          
          
          
          <tr>
          <td height="34" align="left" valign="middle" style="line-height: 27px;">  
           <%=m.get("content") %>  
          </td> 
        </tr>
          
      </table></td>
  </tr>
  
  
  
   
</table>
 
</td>
              </tr>
            </table>
               
               
               
               
               
          
                                
                                
                                 </TD>
                      <tr> 
                      
                      
                      
           </tr> 
          </table>         </td>
      </tr>
    </table></td>
  </tr>
</table>
 
 
  
 
 
   <jsp:include page="foot.jsp"></jsp:include>
 
 
 </div></div>
 
 
</body>
</html>

