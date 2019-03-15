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
            <td width="92%" height="25" valign="top" background="frontfiles/images/in_26.jpg" class="padding_L_10 padding_T_5"><strong class="font_14 font_ffF">在线交流</strong></td>
            <td width="23%" align="right" valign="top" class="padding_T_8"  ><br /></td>
          </tr>
        </table>
<table width="99%" border="0" cellpadding="0" cellspacing="0" align="center" >
     
  
                      <tr>
                      <TD vAlign=top  width=" " >
                      
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
    
    
  
      <%      
        CommDAO dao = new CommDAO();
        dao.delete(request,"taolun");
        HashMap umap = Info.getUser(request);
        if(request.getParameter("f")!=null)
        {
        dao.commOper("insert into taolun values(null,'"+request.getParameter("message")+"','"+umap.get("uname")+"','"+Info.getDateStr()+"','-1')");
        }
        %>
    
      <% 
        
        String url = "zxjl.jsp?1=1"; 
	ArrayList<HashMap> list = PageManager.getPages(url,8, "select * from taolun where pid='-1' order by id desc", request ); 
	for(HashMap m:list){ 
         %>  
        <tr>
          <td width="" height="32" align="left" valign="middle" class="dd">
          
          <a href="txiang.jsp?id=<%=m.get("id") %>"><%=m.get("saver")+" : "+m.get("message")+"&nbsp;&nbsp;("+m.get("savetime")+")" %></a>
          
          
             <%
        if(Info.getUser(request)!=null){
        if(!Info.getUser(request).get("utype").equals("会员")){
         %>
       &nbsp;&nbsp;&nbsp;
        <a href="zxjl.jsp?scid=<%=m.get("id") %>"> 删除</a> 
        <%}} %>    
           
          
          </td>
         
          </tr>
 <%} %>

      </table></td>
  </tr>
  <tr align="center" valign="middle">
    <td height="39" colspan="3" id="page">
		
		 ${page.info } 
		
        
           
		 	</td>
  </tr>
  
  
  
  
           <TR>
               <TD height=98 colspan="2" 
               align=center vAlign=center class=xh><label>
               
               <form action="zxjl.jsp?f=f" method="post" name="f1">
                 <textarea name="message" id="message" cols="45" rows="3"></textarea>
                 
                 <br /><br />
                 
                 <input type="submit"  value="发表帖子" />
                 
                 </form>
                 
               </label></TD>
               </TR>
          
  
  
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

