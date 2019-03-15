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
<table width="960" border="0" align="center" cellpadding="0" cellspacing="10" bgcolor="#A19887" class="margin_b_10">
  <tr>
    
    <td valign="top"><table width="100%" border="0" cellpadding="5" cellspacing="0">
      <tr>
        <td valign="top" class="TD01"><table width="100%" border="0" cellpadding="0" cellspacing="0" background="frontfiles/images/in_23.jpg" class="margin_b_8">
          <tr>
            <td width="92%" height="25" valign="top" background="frontfiles/images/in_26.jpg" class="padding_L_10 padding_T_5"><strong class="font_14 font_ffF">会员交易 NEW PRODUCTS</strong></td>
            <td width="23%" align="right" valign="top" class="padding_T_8" style="padding-right:5px;"><a href="pros.jsp" class="link_cf9494_10"><strong>MORE</strong></a></td>
          </tr>
        </table>
       <table width="99%" border="0" cellpadding="0" cellspacing="0" align="center" >
     
 
 
 
 
 
 
                    
                    <%
                    
                    String sql = "select * from ptrans where 1=1   ";
                    
                    String[] nustrs = {""};
                        String[] keys = request.getParameterValues("key")==null?nustrs:request.getParameterValues("key");
                    String key = "";
                    for(String str:keys)
                    {
                    if(str==null)str="";
                    if(str.equals(""))continue;
                    key+=str+"-";
                    }
                    
                    if(key.length()>0)key=key.substring(0,key.length()-1);
                    
                    if(key.length()>0)
                    {
                    sql+=" and ( 1=1 ";
                    for(String str:key.split("-"))
                    {
                    sql+=" and (btype like'%"+str+"%' or proname like '%"+str+"%' or stype like '%"+str+"%' ) ";
                    }
                    sql+=" ) ";
                    }
                    
                    
                    sql+="order by id desc";
                    
                     PageManager pageManager = PageManager.getPage("trans.jsp?1=1&key="+key, 5, request);
					  pageManager.doList(sql);
					  PageManager bean = (PageManager) request.getAttribute("page");
					  ArrayList<HashMap> nlist = (ArrayList) bean.getCollection();
                    int j=0;
                    for(HashMap mm:nlist)
                    {
                    j++;
                     %>
                      <tr>
                      <TD vAlign=top  width="313" >
                      
                      <TABLE id=standard border=0 cellSpacing=1 
                                cellPadding=0 width="100%" bgColor=#BFB7A4>
<TBODY>
                               
                                <TR>
                                 
                                <TD width="16%"   rowspan="3" 
                                align=center vAlign=center bgColor=#CCC4AF><img src="upfile/<%=mm.get("filename")%>" width="92" height="71" /></TD>
                                <TD width="84%" height="27" 
                                align=left vAlign=center bgColor=#CCC4AF>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<strong><a href="trxiang.jsp?id=<%=mm.get("id")%>" ><font color="#804000"><%=mm.get("title")%>&nbsp;</font></a></strong>
                               &nbsp;&nbsp;&nbsp; 发布时间 : <%=mm.get("savetime")%>                                </TD>
                        </TR>
                                <TR>
                                  <TD height="27" 
                                align=left vAlign=center bgColor=#CCC4AF>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;电话 : <%=mm.get("tel")%> &nbsp;  所属类别 : <%=mm.get("itype")%> &nbsp;  QQ : <%=mm.get("qq")%> </TD>
                        </TR>
                                <TR>
                                  <TD height="27" 
                                align=left vAlign=center bgColor=#CCC4AF>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <%=Info.subStr(Info.filterStrIgnoreCase(mm.get("content").toString(),"<",">") , 60)%>  </TD>
                        </TR>
                        </TBODY></TABLE>
                                
                                
                        <table><tr><td ></td></tr></table>
                      
                        </TD>
                   
                      <tr> 
                      
                      
                       <%
                                                                    	}
                                                                    %>
                       
 
           </tr> 
           
           
            <tr><td height="39" align="center">${page.info }</td></tr>
          </table>
         </td>
      </tr>
    </table></td>
  </tr>
</table>
 
 
 
 
 
   <jsp:include page="foot.jsp"></jsp:include>
 
 
 
 
 
</div>
 
</body>
</html>

