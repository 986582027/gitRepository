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
  
  
  
  <% 
HashMap ext = new HashMap(); 
String tglparentid=request.getParameter("tglparentid")==null?"":request.getParameter("tglparentid"); 
ext.put("tglparentid",tglparentid); 
ext.put("utype","会员"); 
new CommDAO().insert(request,response,"sysuser",ext,true,false); 
%>
  
  
  

   <div class="main">
  <div id="main">
 <table width="100%" border="0" cellpadding="5" cellspacing="0">
      <tr>
        <td valign="top" class="TD01"><table width="100%" border="0" cellpadding="0" cellspacing="0" background="frontfiles/images/in_23.jpg" class="margin_b_8">
          <tr>
            <td width="92%" height="25" valign="top" background="frontfiles/images/in_26.jpg" class="padding_L_10 padding_T_5"><strong class="font_14 font_ffF">用户注册</strong></td>
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
                                
                                
               <form  action="regedit.jsp?f=f&tglparentid=<%=tglparentid%>"  method="post" name="f1"  onsubmit="return checkform();">
      <table width="100%"  border="0" cellpadding="0" cellspacing="0" id="standard_2">
    
        <tr>
          <td width="25%" height="32" align="center" valign="middle" class="dd"><span class="left_txt2">用户名：</span></td>
          <td width="75%" align="left" valign="middle" class="dd"><span class="left_txt2"><input type=text  onblur='checkform()' class='' id='uname' name='uname' size=35 /><label id='clabeluname' />&nbsp; </span></td>
          </tr>
<tr>
          <td width="25%" height="32" align="center" valign="middle" class="dd"><span class="left_txt2">密码：</span></td>
          <td width="75%" align="left" valign="middle" class="dd"><span class="left_txt2"><input type=text  onblur='checkform()' class='' id='upass' name='upass' size=35 /><label id='clabelupass' />&nbsp; </span></td>
          </tr>
<tr>
          <td width="25%" height="32" align="center" valign="middle" class="dd"><span class="left_txt2">姓名：</span></td>
          <td width="75%" align="left" valign="middle" class="dd"><span class="left_txt2"><input type=text  onblur='checkform()' class='' id='tname' name='tname' size=35 /><label id='clabeltname' />&nbsp; </span></td>
          </tr>
<tr>
          <td width="25%" height="32" align="center" valign="middle" class="dd"><span class="left_txt2">性别：</span></td>
          <td width="75%" align="left" valign="middle" class="dd"><span class="left_txt2"><span id="sexdanx"><label><input type=radio checked=checked name='sex' id='sex' value='男' />&nbsp;男 </label>&nbsp;
<label><input type=radio  name='sex' id='sex' value='女' />&nbsp;女 </label>&nbsp;
</span>&nbsp; </span></td>
          </tr>
<tr>
          <td width="25%" height="32" align="center" valign="middle" class="dd"><span class="left_txt2">生日：</span></td>
          <td width="75%" align="left" valign="middle" class="dd"><span class="left_txt2"><input type=text  onblur='checkform()'  size='12' class=''   name='birth'  id='birth' onclick='WdatePicker();'  /><label id='clabelbirth' />&nbsp; </span></td>
          </tr>
<tr>
          <td width="25%" height="32" align="center" valign="middle" class="dd"><span class="left_txt2">联系电话：</span></td>
          <td width="75%" align="left" valign="middle" class="dd"><span class="left_txt2"><input type=text  onblur='checkform()' class='' id='tel' name='tel' size=35 /><label id='clabeltel' />&nbsp; </span></td>
          </tr>
<tr>
          <td width="25%" height="32" align="center" valign="middle" class="dd"><span class="left_txt2">联系地址：</span></td>
          <td width="75%" align="left" valign="middle" class="dd"><span class="left_txt2"><textarea  cols='35'  style='margin-top: 1px;margin-bottom: 1px'  class=''  name='addrs'  ></textarea>&nbsp; </span></td>
          </tr>
<tr>
          <td width="25%" height="32" align="center" valign="middle" class="dd"><span class="left_txt2">联系QQ：</span></td>
          <td width="75%" align="left" valign="middle" class="dd"><span class="left_txt2"><input type=text  onblur='checkform()' class='' id='qq' name='qq' size=35 /><label id='clabelqq' />&nbsp; </span></td>
          </tr>
<tr>
          <td width="25%" height="32" align="center"  valign="middle" class="dd"><span class="left_txt2">头像：</span></td>
          <td width="75%" align="left" valign="middle" class="dd"><span class="left_txt2"><%=Info.getImgUpInfo(65)%>&nbsp; </span></td>
          </tr>
          
          
          
           <tr align="center" valign="middle">
    <td height="39" colspan="2" id="page">
		
        
         <input type="submit" value=" 提 交 " name="B1" />         
              
                &nbsp;&nbsp;&nbsp;
        
        
		  <input class="p_input" type="reset" name="s" value=" 重 置 "    />
		 	</td>
  </tr>
          
          

      </table>
          
          </form>
                                
                                
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
<script language=javascript src='/petsns/js/My97DatePicker/WdatePicker.js'></script>
<script language=javascript src='/petsns/js/popup.js'></script>
<script language=javascript src='/petsns/js/ajax.js'></script>
<script language=javascript >  
 
 function checkform(){  
var unameobj = document.getElementById("uname");  
if(unameobj.value==""){  
document.getElementById("clabeluname").innerHTML="&nbsp;&nbsp;<font color=red>请输入用户名</font>";  
return false;  
}else{
document.getElementById("clabeluname").innerHTML="  ";  
}  
  
var unameobj = document.getElementById("uname");  
if(unameobj.value!=""){  
var ajax = new AJAX();
ajax.post("/petsns/factory/checkno.jsp?table=sysuser&col=uname&value="+unameobj.value+"&checktype=insert&ttime=<%=Info.getDateStr()%>") 
var msg = ajax.getValue();
if(msg.indexOf('Y')>-1){
document.getElementById("clabeluname").innerHTML="&nbsp;&nbsp;<font color=red>用户名已存在</font>";  
return false;
}else{document.getElementById("clabeluname").innerHTML="  ";  
}  
}  
var upassobj = document.getElementById("upass");  
if(upassobj.value==""){  
document.getElementById("clabelupass").innerHTML="&nbsp;&nbsp;<font color=red>请输入密码</font>";  
return false;  
}else{
document.getElementById("clabelupass").innerHTML="  ";  
}  
  
var tnameobj = document.getElementById("tname");  
if(tnameobj.value==""){  
document.getElementById("clabeltname").innerHTML="&nbsp;&nbsp;<font color=red>请输入姓名</font>";  
return false;  
}else{
document.getElementById("clabeltname").innerHTML="  ";  
}  
  
var telobj = document.getElementById("tel");  
if(telobj.value!=""){  
if(telobj.value.length>11||telobj.value.length<8||isNaN(telobj.value)){ 
document.getElementById("clabeltel").innerHTML="&nbsp;&nbsp;<font color=red>联系电话必须为8-11位数字</font>";  
return false;
}else{  
document.getElementById("clabeltel").innerHTML="";  
}  
}  
var qqobj = document.getElementById("qq");  
if(qqobj.value!=""){  
if(qqobj.value.length>12||isNaN(qqobj.value)){ 
document.getElementById("clabelqq").innerHTML="&nbsp;&nbsp;<font color=red>联系QQ必须为12位以内数字</font>";  
return false;
}else{  
document.getElementById("clabelqq").innerHTML="";  
}  
}  
return true;   
}   
popheight=390;
</script>  
