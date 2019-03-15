<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@page import="util.Info"%>
<%@page import="dao.CommDAO"%>
<%@page import="util.PageManager"%>



<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>宠物养成系统</title>
 

<link href="/petsns/frontfiles/css/css.css" rel="stylesheet" type="text/css" />
<style type="text/css">
<!--
#dbgdtp {float:left;  margin:0px; width:960px;}
#demo {overflow:hidden; width: 720px; }
#demo1 {float: left; }
#demo2 {float: left; }
#indemo {float: left; width: 1500%; }
-->
</style>
</head>

<body>
 
 
 
 <td width="233" valign="top"><table width="233" border="0" align="right" cellpadding="0" cellspacing="0">
          <tr>
            <td><table width="233" border="0" cellspacing="0" cellpadding="0">
              <tr>
                <td height="44" background="/petsns/frontfiles/images/gg.jpg"><table width="200" border="0" align="center" cellpadding="0" cellspacing="0">
                    <tr>
                      <td>&nbsp;</td>
                      <td align="right"><a href="ggl.jsp.html"><img src="/petsns/frontfiles/images/m2.jpg" width="50" height="11" border="0" /></a></td>
                    </tr>
                </table></td>
              </tr>
              <tr>
                <td align="center" background="/petsns/frontfiles/images/gg1.jpg"><table width="210" border="0" cellpadding="0" cellspacing="0">
                    <tr>
                      <td align="center" valign="top" >



<table width="100%"  border="0" cellspacing="0" cellpadding="0" id="standard_2">
	
        <tr>    
          <td   align="left" valign="middle"  class="dd">
          
            
             <div  style="margin: 3px" >
                    <%
  		HashMap m4 = new CommDAO().getmap("4","news");
  		 %>
  		<%=Info.ensubStr(m4.get("content").toString(),150) %>
 </div>
            
            
                        </td>
    
          
        </tr>
     
    
</table>
</td>
                    </tr>
                </table></td>
              </tr>
              <tr>
                <td><img src="/petsns/frontfiles/images/gg2.jpg" width="233" height="12" /></td>
              </tr>
            </table></td>
          </tr>
          <tr>
            <td height="8"></td>
          </tr>
          <tr>
            <td><table width="233" border="0" cellspacing="0" cellpadding="0">
                <tr>
                  <td height="44" background="/petsns/frontfiles/images/ll.jpg"><table width="200" border="0" align="center" cellpadding="0" cellspacing="0">
                      <tr>
                        <td>&nbsp;</td>
                        <td align="right"><a href="lxwm.jsp.html"><img src="/petsns/frontfiles/images/m2.jpg" width="50" height="11" border="0" /></a></td>
                      </tr>
                  </table></td>
                </tr>
                <tr>
                  <td height="130" align="left" background="/petsns/frontfiles/images/gg1.jpg"> 
                    
          <div  style="margin: 8px" >
                    <%
  		HashMap m3 = new CommDAO().getmap("3","news");
  		 %>
  		<%=Info.ensubStr(m3.get("content").toString(),115) %>
 </div>
        


               </td>
                </tr>
                <tr>
                  <td><img src="/petsns/frontfiles/images/gg2.jpg" width="233" height="12" /></td>
                </tr>
              </table></td>
          </tr>
          <tr>
            <td height="8"></td>
          </tr>
          <tr>
            <td><table width="233" border="0" cellspacing="0" cellpadding="0">
              <tr>
                <td height="45" background="/petsns/frontfiles/images/link.jpg"><table width="200" border="0" align="center" cellpadding="0" cellspacing="0">
                  <tr>
                    <td>&nbsp;</td>
                    <td align="right"><a href="link.jsp.html"><img src="/petsns/frontfiles/images/m2.jpg" width="50" height="11" border="0" /></a></td>
                  </tr>
                </table></td>
              </tr>
              <tr>
                <td background="/petsns/frontfiles/images/gg1.jpg"><div style="margin:1px;">
                  <table width="210" border="0" align="center" cellpadding="0" cellspacing="0">
                    <tr>
                      <td align="left" height="200" valign="top" >




<table width="100%" border="0" cellpadding="0" cellspacing="0" align="center">
     
           
 <%
               for(HashMap lm:new CommDAO().select("select * from yqlj order by id")){
                %>
         <tr>
           <td height="27">
· <a title="" href="<%=lm.get("ljurl") %>" target="_blank" ><%=lm.get("ljname") %> - <%=lm.get("ljurl") %></a>            </td>
           </tr>
        <%} %>
     
           
                      
		   
		      
    
    
</table>
</td>
                    </tr>
                  </table>
                </div></td>
              </tr>
              <tr>
                <td><img src="/petsns/frontfiles/images/gg2.jpg" width="233" height="12" /></td>
              </tr>
            </table></td>
          </tr>
        </table></td>
 
 

</body>
</html>
