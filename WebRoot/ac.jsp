<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<jsp:directive.page import="java.sql.Connection" />
<jsp:directive.page import="com.rfidcer.dao.BaseDao" />
<jsp:directive.page import="java.sql.PreparedStatement" />
<jsp:directive.page import="java.sql.ResultSet" />
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
	response.setCharacterEncoding("utf-8");
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
	<head>
		<base href="<%=basePath%>">
		<script type="text/javascript" src="site_media/js/jquery.min.js"></script>
		<script type="text/javascript" src="site_media/js/json2.js"></script>
		<link href="site_media/css/css.css" type="text/css" rel="stylesheet" />
		<meta http-equiv="pragma" content="no-cache">
		<meta http-equiv="cache-control" content="no-cache">
		<meta http-equiv="expires" content="0">
		<style type="text/css">
		 * {margin:0;padding:0}
body {background-color: #1F5183;margin-left: 0px;margin-top: 0px;margin-right: 0px;margin-bottom: 0px;}
.p_con{width: 100%;height:840px; background: #3969A9;}
/*background: url(site_media/img/004.jpg);background-repeat: no-repeat;*/
.p_content{width: 100%;height: 840px;background-position: 0px 30px;}
.p_top{width: 100%;height: 65px;position: absolute;top: 110px;left: 150px;} 


.p_left{width: 100%;height: auto;float: left;margin-top: 6%;margin-left: 0%;}
.p_corp_1{float: left;background: url(site_media/img/b001.png);background-repeat:no-repeat;background-position: 50% 50%;width: 18%;height: 63px;text-align: center;color:white;text-decoration: none;padding-top: 30px;font-weight: bold;font-size: 22px;margin-right:70px;}
.p_corp_2{float: left;background: url(site_media/img/b002.png);background-repeat: no-repeat;background-position: 50% 50%;width: 18%;height: 63px;text-align: center;color:white;text-decoration: none;padding-top: 30px;font-weight: bold;font-size: 22px; margin-right:70px;}
.p_star{float: left;background: url(site_media/img/b002.png);background-repeat: no-repeat;background-position: 50% 50%; width: 18%;height: 63px;text-align: center;color:white;text-decoration: none;padding-top: 30px;font-weight: bold;font-size: 22px; margin-right:70px;}

.p_right{width: 680px;height:auto;color: white;position: absolute;top:250px;left:62%;font-size:15px;}
.line003{border-bottom: 1px solid #607495;border-right: 1px solid #607495;color: #539FDF;font-family: "微软雅黑","Arial Unicode MS";font-size: 20px;height: 50px;font-weight: bold;width:110px;}
.line001 {border-right-width: 1px;border-bottom-width: 1px;border-right-style: solid;border-bottom-style: solid;border-right-color: #607495;border-bottom-color: #607495;font-size: 20px;color:#FFF; padding-top:12px;padding-bottom:12px;}
.line002 {font-size: 14px;color: #FFF;border-bottom-width: 1px;border-bottom-style: solid;border-bottom-color: #607495;}
.f20px {font-family: "微软雅黑", "Arial Unicode MS";font-size: 20px;color: #FFF;font-weight: bold;}
.line005 {border-top-width: 1px;border-right-width: 1px;border-top-style: solid;border-right-style: solid;border-top-color: #62A1D6;border-right-color: #62A1D6;border-left-width: 1px;border-left-style: solid;border-left-color: #62A1D6;}
.p_bottom{width: 530px;height: 65px;position: absolute;top:220px;left: 60%;}
</style>
	</head>

	<body>
		<table width="100%" border="0" cellspacing="0" cellpadding="0">
			<tr>
				<td height="87" align="center" background="site_media/img/01.jpg" >
					<img src="site_media/img/002.png" width="401" height="48" />
				</td>
			</tr>
		</table>
		<hr style="height:2px;width:100%;color:white;background:#3969A9;"/>
		<div class="p_con">
			<div class="p_content">
				<div class="p_top" id="p_top">
				<!--javascript:location.href='aa.jsp-->
					<a href="javascript:location.href='aa.jsp'" id="p_corp"class="p_corp_1">自来水公司分布图</a>
					<a href="javascript:getSecond();"id="p_star" class="p_corp_2">上海行政区分布图</a>
					<a href="report.jsp?corpId=" id="toReport" class="p_corp_2">水质报表</a>
					<a href="chartAllArea.jsp?corpAll=1" id="toChart" class="p_corp_2">水质趋势图</a>	
				
				</div>
				
				
				
			</div>
		</div>
		
	</body>
</html>

