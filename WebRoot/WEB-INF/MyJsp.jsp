<%@ page language="java" import="java.util.*" pageEncoding="ISO-8859-1"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'MyJsp.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->

  </head>
  
  <body>
    <table width='550' border='0' cellspacing='0' cellpadding='1'>
    <tr>
    <td class='line005'>
    <table width='100%' border='0' cellspacing='0' cellpadding='0'><tr> <td height='50' colspan='6' background='../../site_media/img/005.jpg'><table width='100%' border='0' cellpadding='0' cellspacing='0' class='f20px'> <tr><td width='50' align='center'><img src='../../site_media/img/009.png' alt='' width='11' height='11' /></td> <td>"+json['area_info'][0]['area_anme']+"</td> <td width='100' align='center'><img src='../../site_media/img/dy.png' width='78' height='27' /></td></tr> </table></td><td background='../../site_media/img/005.jpg' height='50' colspan='6'></td></tr>
	<tr><td align='center' background='../../site_media/img/006_1.jpg' class='line003'>上海行政区检测点</td><td align='center' background='../../site_media/img/006_1.jpg' class='line003'>浊度(ntu)</td><td align='center' background='../../site_media/img/006_1.jpg' class='line003'>PH值 </td><td align='center' background='../../site_media/img/006_1.jpg' class='line003'>余氯 (mg/L)</td><td align='center' background='../../site_media/img/006_1.jpg' class='line003'>电导率(ms/mv)</td><td  align='center' background='../../site_media/img/006_1.jpg' class='line003'>溶解氧(mq/l)</td><td  align='center' background='../../site_media/img/006_1.jpg' class='line003'>温度</td></tr>
</table></td></tr></table>
  </body>
</html>
