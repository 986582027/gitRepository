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
    <td width="250" height="197" valign="top"><table width="100%" border="0" cellpadding="5" cellspacing="0">
      <tr>
        <td valign="top" class="TD01"><table width="100%" border="0" cellpadding="0" cellspacing="0" background="frontfiles/images/in_23.jpg" class="margin_b_8">
          <tr>
            <td width="77%" height="25" valign="top" class="padding_L_10 padding_T_5"><strong class="font_14 font_ffF">公司简介 INFO</strong></td>
            <td width="23%" valign="top" class="padding_T_5">&nbsp;</td>
          </tr>
        </table>
      <table width="100%" border="0" cellpadding="0" cellspacing="0" class="margin_b_8">
            <tr>
              <td width="15" align="left" valign="top"><table border="0" cellspacing="0" cellpadding="0">
                 </table></td>
              <td valign="top"><table width="100%" border="0" cellspacing="0" cellpadding="0">
                <tr>
                  <td height="24" class="TD0111"><P>   
                  
         <%
  		HashMap m1 = new CommDAO().getmap("15","news");
  		 %>
  		<%=Info.ensubStr(m1.get("content"),195) %>
                  
                   </td>
                </tr>
              </table></td>
            </tr>
          </table>
        <table width="100%" border="0" cellspacing="0" cellpadding="0">
            <tr>
              <td bgcolor="#BFB7A4"><table width="100%" border="0" cellpadding="0" cellspacing="3">
                <tr>
              </table></td>
            </tr>
          </table>
        </td>
      </tr>
    </table>
    
    <table><tr><td height="3"></td></tr></table>
    
      <table width="100%" border="0" cellpadding="5" cellspacing="0">
        <tr>
          <td valign="top" class="TD01"><table width="100%" border="0" cellpadding="0" cellspacing="0" background="frontfiles/images/in_23.jpg" class="margin_b_8">
              <tr>
                <td width="77%" height="25" valign="top" class="padding_L_10 padding_T_5"><strong class="font_14 font_ffF">宠物类别 CLASSES</strong></td>
                <td width="23%" valign="top" class="padding_T_5">&nbsp;</td>
              </tr>
            </table>
              <table width="100%" border="0" cellpadding="0" cellspacing="0" class="margin_b_8">
                <tr>
                  <td width="15" align="left" valign="top"><table border="0" cellspacing="0" cellpadding="0">
                  </table></td>
                  <td valign="top"><table width="100%" border="0" cellspacing="0" cellpadding="0">
                      <tr>
                        <td height="24" class="TD0111"> 
                        
                        
                              <%
								 ArrayList<HashMap> list = PageManager.getPages("",100, "select * from splb where tglparentid='-1' order by id desc ", request ); 
								for(HashMap map:list){ %>
								 
								<a href="pros.jsp?key=<%=map.get("datashowname") %>"><strong><font color="#E4665B"><%=map.get("datashowname") %></font></strong></a>
								
								<table><tr><td height="1"></td></tr></table>
								
								 <%
								 List<HashMap> erlist = new CommDAO().select("select * from splb where tglparentid='"+map.get("id")+"' order by id desc ") ;
                                int i = 0;
                                 for(HashMap ermap:erlist){ 
                                 i++;
                               
                                 %>
								
								 <a href="pros.jsp?key=<%=ermap.get("datashowname") %>"><font color="gray"><%=ermap.get("datashowname") %></font></a>
								&nbsp;&nbsp;&nbsp;
								<% 
								 if(i>0&&i%4==0)out.print("<br />");
								} %>
								
								<table><tr><td height="1"></td></tr></table>
								
								<%} %>
                            
                            
                            </td>
                      </tr>
                  </table></td>
                </tr>
              </table>
            <table width="100%" border="0" cellspacing="0" cellpadding="0">
                <tr>
                  <td bgcolor="#BFB7A4"><table width="100%" border="0" cellpadding="0" cellspacing="3">
                      <tr> </tr>
                  </table></td>
                </tr>
            </table></td>
        </tr>
      </table></td>
    <td valign="top"><table width="100%" border="0" cellpadding="5" cellspacing="0">
      <tr>
        <td valign="top" class="TD01"><table width="100%" border="0" cellpadding="0" cellspacing="0" background="frontfiles/images/in_23.jpg" class="margin_b_8">
          <tr>
            <td width="92%" height="25" valign="top" background="frontfiles/images/in_26.jpg" class="padding_L_10 padding_T_5"><strong class="font_14 font_ffF">最新宠物 NEW PRODUCTS</strong></td>
            <td width="23%" align="right" valign="top" class="padding_T_8" style="padding-right:5px;"><a href="pros.jsp" class="link_cf9494_10"><strong>MORE</strong></a></td>
          </tr>
        </table>
       <table width="99%" border="0" cellpadding="0" cellspacing="0" align="center" >
     
 
 
 
 
 
 
                    
                    <%
                    
                    String sql = "select * from pros where status='上架' and((knum+0)>0)   ";
                    
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
                    
                     PageManager pageManager = PageManager.getPage("pros.jsp?1=1&key="+key, 6, request);
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
                                align=center vAlign=center bgColor=#CCC4AF><img src="upfile/<%=mm.get("filename") %>" width="92" height="71" /></TD>
                                <TD width="84%" height="27" 
                                align=left vAlign=center bgColor=#CCC4AF>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<strong><a href="pxiang.jsp?id=<%=mm.get("id") %>" ><font color="#804000"><%=mm.get("proname") %>&nbsp;</font></a></strong>
                               &nbsp;&nbsp;&nbsp; 上架时间 : <%=mm.get("savetime") %>                                </TD>
                        </TR>
                                <TR>
                                  <TD height="27" 
                                align=left vAlign=center bgColor=#CCC4AF>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;价格 : <%=mm.get("price") %> &nbsp; 折扣 : <%=mm.get("discount").equals("")?"不打折":(mm.get("discount")+" 折" )%>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;所属类别 : <%=mm.get("btype") %> - <%=mm.get("stype") %></TD>
                        </TR>
                                <TR>
                                  <TD height="27" 
                                align=left vAlign=center bgColor=#CCC4AF>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <%=Info.subStr(mm.get("bei").toString(),40)  %>  </TD>
                        </TR>
                        </TBODY></TABLE>
                                
                                
                        <table><tr><td ></td></tr></table>
                      
                        </TD>
                   
                      <tr> 
                      
                      
                       <%} %>
                      
                      
                      
                       
 
 
 
 
 
           </tr> 
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

