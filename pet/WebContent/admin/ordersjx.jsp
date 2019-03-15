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

<form  action="ordersjx.jsp"  name="f1" method="post"    >
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
                <td width="95%" class="STYLE1"><span class="STYLE3">你当前的位置</span>  ： 进行中的订单</td>
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
            <td colspan=8 height="36" bgcolor="#FFFFFF" align="left" class="STYLE1">  &nbsp;&nbsp;&nbsp;
<% 
String puname = request.getParameter("uname")==null?"":request.getParameter("uname"); 
String startuname = request.getParameter("startuname")==null?"":request.getParameter("startuname"); 
String enduname = request.getParameter("enduname")==null?"":request.getParameter("enduname"); 
String psavetime = request.getParameter("savetime")==null?"":request.getParameter("savetime"); 
String startsavetime = request.getParameter("startsavetime")==null?"":request.getParameter("startsavetime"); 
String endsavetime = request.getParameter("endsavetime")==null?"":request.getParameter("endsavetime"); 
String pprosinfo = request.getParameter("prosinfo")==null?"":request.getParameter("prosinfo"); 
String startprosinfo = request.getParameter("startprosinfo")==null?"":request.getParameter("startprosinfo"); 
String endprosinfo = request.getParameter("endprosinfo")==null?"":request.getParameter("endprosinfo"); 

   String qrid = request.getParameter("qrid")==null?"":request.getParameter("qrid");
  
  if(!qrid.equals(""))
  {
  for(HashMap m:new CommDAO().select("select * from prosorder where id="+qrid))
  {
     for(String str:m.get("prosinfo").toString().split(","))
     {
     String id = str.split("-")[3];
     String num = str.split("-")[4];
     new CommDAO().commOper("update pros set cjnum=cjnum+"+num+" where id="+id);
      new CommDAO().commOper("update pros set knum=(((knum+0)-"+num+")+'') where id="+id);
     }
  }
   new CommDAO().commOper("update prosorder set status='已确认收货' where id="+qrid);
  }
  
     %>

<%
 HashMap mmm = new HashMap();
 
 CommDAO dao = new CommDAO();
 
  String jsid = request.getParameter("jsid")==null?"":request.getParameter("jsid");
  
  String cfid = request.getParameter("cfid")==null?"":request.getParameter("cfid");
  String jtid = request.getParameter("jtid")==null?"":request.getParameter("jtid");
  
  if(!jsid.equals(""))
  {
  dao.commOper("update prosorder set status='订单已接受并已发货' where id="+jsid);
  }
  
  
   if(!cfid.equals(""))
  {
  dao.commOper("update prosorder set status='退货已接受并已发货' where id="+cfid);
  }
  
   if(!jtid.equals(""))
  {
  dao.commOper("update prosorder set status='拒绝退货' where id="+jtid);
  }
  
  
  String jjid = request.getParameter("jjid")==null?"":request.getParameter("jjid");
  
  if(!jjid.equals(""))
  {
  dao.commOper("update prosorder set status='订单已被拒绝' where id="+jjid);
  }
  
  String tkid = request.getParameter("tkid")==null?"":request.getParameter("tkid");
  
  if(!tkid.equals(""))
  {
  dao.commOper("update prosorder set fkstatus='已退款' where id="+tkid);
  }
  
  
  
 
 %> 
 
&nbsp;&nbsp;  
发送时间 &nbsp;:&nbsp;
 
<input type=text class=''  size=10 name='startsavetime' onclick='WdatePicker();' />
&nbsp;&nbsp;至&nbsp;&nbsp;

<input type=text class=''  size=10 name='endsavetime' onclick='WdatePicker();' />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;

&nbsp;&nbsp;
订单信息 
&nbsp;:&nbsp; 
<input type=text class=''  size=20 name='prosinfo' />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;

<input type=submit class='' value='查询信息' />
 &nbsp;&nbsp;
 </td>
            </tr>
        
        
        
          <tr>
            <td   height="28" background="/petsns/admin/tab/images/bg.png" bgcolor="#FFFFFF" align="center" class="STYLE1">发送人  </td>
<td   height="28" background="/petsns/admin/tab/images/bg.png" bgcolor="#FFFFFF" align="center" class="STYLE1">发送时间  </td>
<td   height="28" background="/petsns/admin/tab/images/bg.png" bgcolor="#FFFFFF" align="center" class="STYLE1">订单信息  </td>
<td   height="28" background="/petsns/admin/tab/images/bg.png" bgcolor="#FFFFFF" align="center" class="STYLE1">金额合计</td>
<td   height="28" background="/petsns/admin/tab/images/bg.png" bgcolor="#FFFFFF" align="center" class="STYLE1">当前状态  </td>
<td   height="28" background="/petsns/admin/tab/images/bg.png" bgcolor="#FFFFFF" align="center" class="STYLE1">付款状态  </td>
<td   height="28" background="/petsns/admin/tab/images/bg.png" bgcolor="#FFFFFF" align="center" class="STYLE1">退货信息  </td>
<td   height="28" background="/petsns/admin/tab/images/bg.png" bgcolor="#FFFFFF" align="center" class="STYLE1">操作  </td>
            </tr>
         
         
         
          <% 
 new CommDAO().delete(request,"prosorder"); 
String sql = "select * from prosorder where 1=1   and status!='已确认收货' and status!='订单已被拒绝'  " ;
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
 if(!pprosinfo.equals("")){ 
 sql+= " and prosinfo like'%"+pprosinfo+"%' " ;
 }  
 if(!startprosinfo.equals("")){  
 mmm.put("startprosinfo",startprosinfo) ;
 sql+= " and prosinfo >'"+startprosinfo+"' " ;
 }  
 if(!endprosinfo.equals("")){  
 mmm.put("endprosinfo",endprosinfo) ;
 sql+= " and prosinfo <'"+Info.getDay(endprosinfo,1)+"' " ;
 }  
  sql +="  and (1!=1 " ; 
  sql +="  or  uname like'%"+Info.getUser(request).get("uname")+"%') " ;
  sql +=" order by id desc ";
String url = "ordersjx.jsp?1=1&savetime="+psavetime+"&prosinfo="+pprosinfo+"";  
ArrayList<HashMap> list = PageManager.getPages(url,5, sql, request ); 
for(HashMap map:list){ 

  String proinfo = "";
  int total=0;
  for(String str:map.get("prosinfo").toString().split(","))
  {
  proinfo+=str.split("-")[0]+"&nbsp;&nbsp;单价 "+str.split("-")[1]+"&nbsp;&nbsp;"+(str.split("-")[2].equals("")?"不打折":str.split("-")[2]+"折&nbsp;&nbsp;")+"&nbsp;数量 "+str.split("-")[4]+"&nbsp;&nbsp;"+"<br />";
  String price = str.split("-")[1].indexOf(".")>-1?str.split("-")[1].substring(0,str.split("-")[1].indexOf(".")):str.split("-")[1];
  int ft = 0;
  ft=Integer.parseInt(price)*Integer.parseInt(str.split("-")[4]);
  if(!str.split("-")[2].equals(""))
  {
  ft = (Integer.parseInt(str.split("-")[2])*ft)/10;
  }
   total+=ft;
  }

%>
<tr>

            <td height="30" valign="middle" bgcolor="#FFFFFF" class="STYLE1" align="center"><%=map.get("uname")%></td>
            <td height="30" valign="middle" bgcolor="#FFFFFF" class="STYLE1" align="center"><%=map.get("savetime")%></td>
            <td height="30" valign="middle" bgcolor="#FFFFFF" class="STYLE1" style="line-height: 21px" align="center"><%=proinfo%></td>
            <td height="30" valign="middle" bgcolor="#FFFFFF" class="STYLE1" align="center"><%=total%></td>
            <td height="30" valign="middle" bgcolor="#FFFFFF" class="STYLE1" align="center"><%=map.get("status")%></td>
            <td height="30" valign="middle" bgcolor="#FFFFFF" class="STYLE1" align="center"><%=map.get("fkstatus")%></td>
            <td height="30" valign="middle" bgcolor="#FFFFFF" class="STYLE1" align="center"><%=map.get("tinfo")%></td>
            <td height="30" valign="middle" bgcolor="#FFFFFF" class="STYLE1" align="center">
            
            
 <%
 if(map.get("fkstatus").equals("未付款")){
  %>                         
<a href="javascript:update('<%=map.get("id")%>','<%=total %>')">订单付款</a>
 <%} %>
 &nbsp; 
  <%
 if(map.get("status").equals("待受理")){
  %>  
<a onclick="return confirm('确定要取消这条订单吗?')"  href="ordersjx.jsp?scid=<%=map.get("id")%>">取消订单</a>
<%} %>


 
          
           <%if( map.get("fkstatus").equals("已退款")){ %> 
          
          
           <a href="javascript:fk('<%=map.get("id") %>')">订单付款</a> 
          <%}else{ %>
          &nbsp;
          <%} %>
          
          
          
          <%if(map.get("status").equals("订单已接受并已发货")){ %> 
          
          
            <a href="javascript:th('<%=map.get("id")%>')">申请退换货</a>&nbsp;&nbsp;
          
          <%}else{ %>
          &nbsp;
          <%} %>
          
          
          
          <%if(map.get("status").equals("退货已接受并已发货")||map.get("status").equals("订单已接受并已发货")||map.get("fkstatus").equals("已退款")){ %> 
          
          
          <a href="ordersjx.jsp?qrid=<%=map.get("id")%>">确认收货</a>
          
          <%}else{ %>
          &nbsp;
          <%} %>
          

          
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
        <td colspan=8 align="center" valign="middle"  class="STYLE1" >${page.info}</td>
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
mmm.put("uname",puname); 
mmm.put("savetime",psavetime); 
mmm.put("prosinfo",pprosinfo); 
%>
<%=Info.tform(mmm)%> 
<script language=javascript >  
 
</script>  
<%=Info.tform(mmm)%> 
<script language=javascript src='/petsns/js/My97DatePicker/WdatePicker.js'></script>
<script language=javascript src='/petsns/js/popup.js'></script>
<script language=javascript > 
function update(no,total){ 
pop('fk.jsp?id='+no+"&total="+total,'信息修改',550,'100%') 
}

 function th(no)
 {
 pop('th.jsp?id='+no,'退换货',500,78);
 }

</script> 
<%@page import="util.Info"%> 
<%@page import="java.util.ArrayList"%> 
<%@page import="java.util.HashMap"%> 
<%@page import="util.PageManager"%> 
<%@page import="dao.CommDAO"%> 
