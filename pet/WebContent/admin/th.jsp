<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@page import="dao.CommDAO"%>
<%@page import="util.Info"%>
 
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
  <head>
    <meta http-equiv="content-type" content="text/html; charset=UTF-8" />
	<link href="/petsns/frontfiles/images/skin.css" rel="stylesheet" type="text/css" />
<style type="text/css">
<!--
body {
	margin-left: 0px;
	margin-top: 0px;
	margin-right: 0px;
	margin-bottom: 0px;
	font-family: "宋体";
	font-size: 12px;
	color: #333333;
	background-color: ;
}
.STYLE1 {
	color: #333333;
	font-size: x-large;
	font-family: Arial, Helvetica, sans-serif;
}
-->
</style>
		<script type="text/javascript" src="/petsns/js/My97DatePicker/WdatePicker.js"></script>
  </head>
  <%
  String id = request.getParameter("id");
HashMap ext = new HashMap(); 
ext.put("status","已申请退换货");
new CommDAO().update(request,response,"prosorder",ext,true,true);
   %>
  <body>
  <form name="f1" method="post" action="th.jsp?f=f&id=<%=id%>"  >
  	<!-- cellspacing 是单元格之间的距离、cesspadding 是单元格中内容与边框的距离 -->
  	<table width="99.5%" width="100%" border="0" align="center" cellpadding="0" cellspacing="1"   class="mytab2" bgcolor="#DAEEF7">
        <tr align="center"  style="display: none">
          <td colspan="3"  background="/petsns/admin/commfiles/images/bg.gif"
				bgcolor="#FFFFFF" class="STYLE3"> <br><br><br><br><br></td>
        </tr>
        <tr align="center">
          <td width="25%" align="center" height="28" bgcolor="#FFFFFF">退换货说明</td>
    <td width="75%" align="left" height="28" bgcolor="#FFFFFF"><span class="style1">
            <textarea name="tinfo" id="tinfo" style="margin: 3px"  type="text" rows="2" cols="45" ></textarea>
          </span> </td>
        </tr>
       
        

        <tr align="center">
          <td height="29" colspan="2"  align="center" bgcolor="#FFFFFF">
            <label>
              <input type="submit" name="button" id="button" value="提交申请">
            </label> &nbsp;&nbsp;
            <input  type="reset" name="button2" id="button2" value="重新填写">                   </td>
        </tr>
      </table>
  </form> 
</body>
</html>
<script type="text/javascript" src="/petsns/admin/commfiles/js/ajax.js"></script>
 