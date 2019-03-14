<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <% String path=request.getContextPath(); %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>

<head>
<style type="text/css">
   span{
   		color:red;
   		font-size:15px;
		font-weight:bolder;
   }
</style>
<script src="<%=path %>/js/jquery-2.0.0.js" language="JavaScript" type="text/javascript"></script>
<script src="<%=path %>/js/jquery-2.0.0.min.js" language="JavaScript" type="text/javascript"></script>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<TITLE>管理员登陆</TITLE>
<META http-equiv=Content-Language content=zh-cn>
<META http-equiv=Content-Type content="text/html; charset=gb2312">
<META content="MSHTML 6.00.2800.1611" name=GENERATOR>
<LINK href="<%=path %>/admin/images/css1.css" type=text/css rel=stylesheet><LINK 
href="<%=path %>/admin/images/newhead.css" type=text/css rel=stylesheet></HEAD>
<BODY bgColor=#eef8e0 leftMargin=0 topMargin=0 MARGINWIDTH="0" MARGINHEIGHT="0">

 
 <form onsubmit="return fn()" id="form1" action="<%=path %>/AdminServlet" method="post">
<TABLE cellSpacing=0 cellPadding=0 width=1004 border=0 align="center">
  <TBODY>
  <TR>
    <TD colSpan=6><IMG height=92 alt="" src="<%=path %>/admin/images/crm_1.gif" 
    width=345></TD>
    <TD colSpan=4><IMG height=92 alt="" src="<%=path %>/admin/images/crm_2.gif" 
    width=452></TD>
    <TD><IMG height=92 alt="" src="<%=path %>/admin/images/crm_3.gif" width=207></TD></TR>
  <TR>
    <TD colSpan=6><IMG height=98 alt="" src="<%=path %>/admin/images/crm_4.gif" 
    width=345></TD>
    <TD colSpan=4><IMG height=98 alt="" src="<%=path %>/admin/images/crm_5.gif" 
    width=452></TD>
    <TD><IMG height=98 alt="" src="<%=path %>/admin/images/crm_6.gif" width=207></TD></TR>
  <TR>
    <TD rowSpan=5><IMG height=370 alt="" src="<%=path %>/admin/images/crm_7.gif" 
    width=59></TD>
    <TD colSpan=5><IMG height=80 alt="" src="<%=path %>/admin/images/crm_8.gif" 
    width=286></TD>
    <TD colSpan=4><IMG height=80 alt="" src="<%=path %>/admin/images/crm_9.gif" 
    width=452></TD>
    <TD><IMG height=80 alt="" src="<%=path %>/admin/images/crm_10.gif" width=207></TD></TR>
  <TR>
    <TD><IMG height=110 alt="" src="<%=path %>/admin/images/crm_11.gif" width=127></TD>
    <TD background="<%=path %>/admin/images/crm_12.gif" colSpan=6>
      <TABLE id=table1 cellSpacing=0 cellPadding=0 width="98%" border=0>
        <TBODY>
        <TR>
          <TD>
            <TABLE id=table2 cellSpacing=1 cellPadding=0 width="100%" 
              border=0><TBODY>
             
              <TR>
                <TD align="middle" width=81><FONT color=#ffffff>用户名：</FONT></TD>
                <TD><input type="text" class="regtxt" title=请填写用户名 maxLength=16 size=16 
                  id="username" name="username"></TD>
                  <td width="80px" ><span id="susername"></span></td></TR>
              <TR>
                <TD align="middle" width=81><FONT color=#ffffff>密&nbsp; 
                码：</FONT></TD>
                <TD><input class=regtxt title=请填写密码 type="password" maxLength=16 
                  size=16  name="password" id="password"></TD><td width="80px"><span id="spassword"></span></td></TR>
              <TR>
                <TD >
             	  </TD>
                <TD> <input type="hidden" value="login" 
                  name="bzw"></TD></TR></TBODY></TABLE></TD></TR></TBODY></TABLE></TD>
                 
    <TD colSpan=2 rowSpan=2><input type="image" name="submit" class="b0" src="<%=path %>/admin/images/crm_13.gif" /></TD>
    <TD rowSpan=2><input type="image" name="reset" class="b0" src="<%=path %>/admin/images/crm_14.gif" /></TD></TR>
  <TR>
 			
    <TD rowSpan=3><IMG height=180 alt="" src="<%=path %>/admin/images/crm_15.gif" 
      width=127></TD>
    <TD rowSpan=3><IMG height=180 alt="" src="<%=path %>/admin/images/crm_16.gif" 
    width=24></TD>
    <TD><INPUT title=登录后台 type=image height=48 alt="" width=86 
      src="<%=path %>/admin/images/crm_17.gif" name=image></TD>
    <TD><IMG height=48 alt="" src="<%=path %>/admin/images/crm_18.gif" width=21></TD>
    <TD colSpan=2><A href="http://www.fdkjgz.com/shop/index.asp"><IMG 
      title=返回首页 height=48 alt="" src="<%=path %>/admin/images/crm_19.gif" width=84 
      border=0></A></TD>
    <TD><IMG height=48 alt="" src="<%=path %>/admin/images/crm_20.gif" width=101></TD></TR>
  <TR>
    <TD colSpan=5 rowSpan=2><IMG height=132 alt="" 
      src="<%=path %>/admin/images/crm_21.gif" width=292></TD>
    <TD rowSpan=2><IMG height=132 alt="" src="<%=path %>/admin/images/crm_22.gif" 
      width=170></TD>
    <TD colSpan=2><IMG height=75 alt="" src="<%=path %>/admin/images/crm_23.gif" 
    width=332></TD></TR>
  <TR>
    <TD colSpan=2><IMG height=57 alt="" src="<%=path %>/admin/images/crm_24.gif" 
    width=332></TD></TR>
  <TR>
    <TD><IMG height=1 alt="" src="<%=path %>/admin/images/spacer.gif" width=59></TD>
    <TD><IMG height=1 alt="" src="<%=path %>/admin/images/spacer.gif" width=127></TD>
    <TD><IMG height=1 alt="" src="<%=path %>/admin/images/spacer.gif" width=24></TD>
    <TD><IMG height=1 alt="" src="<%=path %>/admin/images/spacer.gif" width=86></TD>
    <TD><IMG height=1 alt="" src="<%=path %>/admin/images/spacer.gif" width=21></TD>
    <TD><IMG height=1 alt="" src="<%=path %>/admin/images/spacer.gif" width=28></TD>
    <TD><IMG height=1 alt="" src="<%=path %>/admin/images/spacer.gif" width=56></TD>
    <TD><IMG height=1 alt="" src="<%=path %>/admin/images/spacer.gif" width=101></TD>
    <TD><IMG height=1 alt="" src="<%=path %>/admin/images/spacer.gif" width=170></TD>
    <TD><IMG height=1 alt="" src="<%=path %>/admin/images/spacer.gif" width=125></TD>
    <TD><IMG height=1 alt="" src="<%=path %>/admin/images/spacer.gif" 
  width=207></TD></TR></TBODY>
  </TABLE>
</form> 
  </BODY>
  <script type="text/javascript">
	 var u,p;
	//通过ID和消息，展示错误信息
	function showError(id,msg){
		$(id).text(msg);	
	}
	//账号
	$("#username").keyup(function(){
		var username = $("#username").val();
		var qusername =/^[a-zA-Z0-9_-]{4,16}$/;
		if(username==""){
			showError("#susername","请输入账号");
			u = false;
		}else{
			if(qusername.test(username)){
				showError("#susername","");
				u = true;
			}else{
				showError("#susername","账号格式有误");
				u = false;
			}
		}
	});
	//密码
	$("#password").keyup(function(){
		var password = $("#password").val();
		var qpassword =/^[a-zA-Z\d_]{6,}$/;
		if(password==""){
			showError("#spassword","请输入密码");
			p = false;
		}else{
			if(qpassword.test(password)){
				showError("#spassword","");
				p = true;
			}else{
				showError("#spassword","密码格式有误");
				p = false;
			}
		}
	});
	function fn(){
		if(u==true&&p==true){
			return true;
		}else{
			return false;
		}
	}
	
	
 </script>
  </HTML>
