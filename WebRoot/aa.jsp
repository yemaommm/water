<%@page import="java.text.SimpleDateFormat"%>
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8" autoFlush="false" buffer="256kb"%>
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
		<link href="http://libs.baidu.com/bootstrap/3.0.3/css/bootstrap.min.css" rel="stylesheet">
		<script type="text/javascript" src="site_media/js/jquery.min.js"></script>
   		<script src="http://libs.baidu.com/bootstrap/3.0.3/js/bootstrap.min.js"></script>
		<script type="text/javascript" src="site_media/js/json2.js"></script>
		<link href="site_media/css/css.css" type="text/css" rel="stylesheet" />
		<link href="site_media/css/themes/base/jquery.ui.all.css" rel="stylesheet" media="screen">
		<link href="http://libs.baidu.com/bootstrap/3.0.3/css/bootstrap.min.css" rel="stylesheet">

<script type="text/javascript" src="site_media/js/ui/jquery.ui.core.js" charset="UTF-8"></script>
<script type="text/javascript" src="site_media/js/ui/jquery.ui.widget.js" charset="UTF-8"></script>
<script type="text/javascript" src="site_media/js/ui/jquery.ui.position.js" charset="UTF-8"></script>
<script type="text/javascript" src="site_media/js/ui/jquery.ui.tooltip.js" charset="UTF-8"></script>
		<meta http-equiv="pragma" content="no-cache">
		<meta http-equiv="cache-control" content="no-cache">
		<meta http-equiv="expires" content="0">
		<!--引用百度地图API-->
		<style type="text/css">
		    html,body{margin:0;padding:0;font-family: "Helvetica Neue",Helvetica,Arial,sans-serif;}
		    .iw_poi_title {color:#CC5522;font-size:14px;font-weight:bold;overflow:hidden;padding-right:13px;white-space:nowrap}
		    .iw_poi_content {font:12px arial,sans-serif;overflow:visible;padding-top:4px;white-space:-moz-pre-wrap;word-wrap:break-word}
		</style>
		<script type="text/javascript" src="http://api.map.baidu.com/api?key=&v=2.0&services=true&ak=ADae8b0d29718f90f48348ed7399e6af"></script>
		<style type="text/css">
		 * {margin:0;padding:0}
body {background-color: #1F5183;margin-left: 0px;margin-top: 0px;margin-right: 0px;margin-bottom: 0px; overflow:hidden;}
.p_con{width: 100%;height:900px; background: #3969A9;}
/*background: url(site_media/img/004.jpg);background-repeat: no-repeat;*/
.p_content{width: 100%;height: 840px;background-position: 0px 30px;}
.p_top{width: 90%;height: 65px;position: absolute;top: 110px;left: 150px;} 


.p_left{width: 100%;height: auto;float: left;margin-top: 6%;margin-left: 0%;}
.p_corp_1{float: left;background: url(site_media/img/b001.png);background-repeat:no-repeat;background-position: 50% 50%;width: 18%;height: 63px;text-align: center;color:white;text-decoration: none;padding-top: 30px;font-weight: bold;font-size: 22px;margin-right:70px;}
.p_corp_2{float: left;background: url(site_media/img/b002.png);background-repeat: no-repeat;background-position: 50% 50%;width: 18%;height: 63px;text-align: center;color:white;text-decoration: none;padding-top: 30px;font-weight: bold;font-size: 22px; margin-right:70px;}
.p_star{float: left;background: url(site_media/img/b002.png);background-repeat: no-repeat;background-position: 50% 50%; width: 18%;height: 63px;text-align: center;color:white;text-decoration: none;padding-top: 30px;font-weight: bold;font-size: 22px; margin-right:70px;}

.p_right{width: 880px;height:auto;color: white;position: absolute;top:0px;left:0%;font-size:15px;}
.line003{border-bottom: 1px solid #607495;border-right: 1px solid #607495;color: #539FDF;font-family: "微软雅黑","Arial Unicode MS";font-size: 20px;height: 50px;font-weight: bold;width:110px;}
.line001 {border-right-width: 1px;border-bottom-width: 1px;border-right-style: solid;border-bottom-style: solid;border-right-color: #607495;border-bottom-color: #607495;font-size: 22px;color:#FFF; padding-top:12px;padding-bottom:12px;}
.line002 {font-size: 14px;color: #FFF;border-bottom-width: 1px;border-bottom-style: solid; }
.f20px {font-family: "微软雅黑", "Arial Unicode MS";font-size: 20px;color: #FFF;font-weight: bold;}
.line005 { border-top-width: 1px;border-right-width: 1px;border-top-style: solid;border-right-style: solid;border-top-color: #62A1D6;border-right-color: #62A1D6;border-left-width: 1px;border-left-style: solid;border-left-color: #62A1D6;}
.p_bottom{width: 530px;height: 65px;position: absolute;top:220px;left: 60%;}
.orc{padding:2px;}
.iw_poi_title{font-size: 20px;}
.callcss{color: #ffffff;}
</style>
	</head>

	<body style="margin: auto;width: 100%;">
	<span style="position: absolute;top:50px;left:90%;"><font style="font-size:24px;display:block;text-align:right;" color="#FFFF99"><%=new SimpleDateFormat("yyyy-MM-dd").format(new Date()) %></font></span>
		<table width="100%" border="0" cellspacing="0" cellpadding="0">
			<tr>
				<td height="87" align="center" background="site_media/img/01.jpg">
					<img src="site_media/img/0023.png" width="601" height="48" />
				</td>
			</tr>
			<tr>
				<td height="2" background="site_media/img/03.jpg">
					<img src="site_media/img/03.jpg" width="4" height="4" />
				</td>
			</tr>
		</table>
		<div class="p_con">
			
				
				<div class="container-fluid" >
    <div class="row">
      <div class="col-md-2" style="box-shadow: 
         inset 1px -1px 1px #444, inset -1px 1px 1px #444;">
         <div id="divLT" class="row" style="text-align:center;line-height:40px;height:20px;
               box-shadow: inset 1px -1px 1px #444, inset -1px 1px 1px #444;">
             <div><font  style="font-size:20px" color='white'>实时数据</font></div>
         </div>
		 <div class="row">
            <div id="divL" class="col-md-12" line-height:40px;height:800px;
               box-shadow: inset 1px -1px 1px #444, inset -1px 1px 1px #444;">
               <font  style="font-size:20px" color='white'><marquee onmouseover=this.stop() onmouseout=this.start() style="margin-left: 10px" scrollamount="5" height="100%" direction="up"><div id="runText"></div></marquee></font>
            </div>
         </div>
         <div class="row" >
             <div id="divLD1" style="text-align:center;line-height:60px;height:20px;background-image:url('/water/site_media/img/button.png');
               box-shadow: inset 1px -1px 1px #444, inset -1px 1px 1px #444;">
               <div id="sjzl"><div onclick="showdata()"><font  style="font-size:20px" color='white'>数据总览</font></div></div>
               </div>
         </div>
         <div class="row">
             <div id="divLD2" style="text-align:center;line-height:60px;height:20px;background-image:url('/water/site_media/img/button.png');
               box-shadow: inset 1px -1px 1px #444, inset -1px 1px 1px #444;">
               <div onclick="javascript:location.href='/water/new_report.jsp?corpId=' "><font  style="font-size:20px" color='white'>报表统计</font></div>
               </div>
         </div>
      </div>

      <div class="col-md-8" style="box-shadow: 
         inset 1px -1px 1px #444, inset -1px 1px 1px #444;">
         <div class="row"">
            <div style="overflow:auto;height:100%; border:#ccc solid 1px;" id="dituContent"></div>
         </div>
   </div>
	
    <div class="col-md-2" style="box-shadow: 
         inset 1px -1px 1px #444, inset -1px 1px 1px #444;">
         <div id="divRT" class="row" style="height:20px;text-align:center;line-height:40px;
               box-shadow: inset 1px -1px 1px #444, inset -1px 1px 1px #444;">
             <div><font  style="font-size:20px" color='white'>当前超限</font></div>
         </div>
		 <div class="row">
            <div id="divR" class="col-md-12" style="height:700px;
               box-shadow: inset 1px -1px 1px #444, inset -1px 1px 1px #444;">
               <font  style="font-size:20px" color='yellow'><div style="overflow:auto;height: 100%" id="Call"></div></font>
            </div>
         </div>
         <div class="row" >
             <div background="/water/site_media/img/button.png" id="divRD1" style="height:20px;text-align:center;line-height:60px;background-image:url('/water/site_media/img/button.png');
               box-shadow: inset 1px -1px 1px #444, inset -1px 1px 1px #444;">
               <div id="bgzl"><div onclick="TE()"><font style="font-size:20px" color='white'>报警总览</font></div></div>
               </div>
         </div>
         <div class="row">
             <div background="/water/site_media/img/button.png" id="divRD2" style="height:20px;text-align:center;line-height:60px;background-image:url('/water/site_media/img/button.png');
               box-shadow: inset 1px -1px 1px #444, inset -1px 1px 1px #444;">
               <div onclick="javascript:location.href='/water/chartAllArea.jsp?corpAll=1'"><font  style="font-size:20px" color='white'>趋势数据</font></div>
               </div>
         </div>
      </div>
</div>
   </div>
			</div>
		<!-- <div id="myModal" style="width: 680px;height:auto;color: white;position: absolute;top:20%;left:40%;" tabindex="-1" role="dialog" 
   aria-labelledby="myModalLabel" aria-hidden="true">
   <div class="modal-dialog" style="width: 680px">
      <div class="modal-content">
   <div class="modal-body"> -->
				<div style="display: none" id="now" class="p_right">
							<div class='line005'>
								<table width='100%' height="100%" border='0' cellspacing='0' cellpadding='0'>
									<tr>
										<td height='50' colspan='6'
											background='site_media/img/005.jpg'>
											<table width='100%' border='0' cellpadding='0'
												cellspacing='0' class='f20px'>
												<tr>
													<td width='50' align='center'>
														<img src='site_media/img/009.png' alt='' width='11'
															height='11' />
													</td>
													<td>
														实时数据总览
													</td>
													<td width='100' align="right"> 
														<button type="button" class="close" 
											               data-dismiss="modal" aria-hidden="true">
											                  &times;
											            </button>
													</td>
												</tr>
											</table>
										</td>
										<td background='site_media/img/005.jpg' height='50'
											colspan='6'></td>
									</tr>
									<tr style="height: 80px">
										<td align='center' background='site_media/img/006_1.jpg' style="width:200px;"
											class='line003'>
											控制点
										</td>
										<td
										    onclick="location.href='chartAllDetail.jsp?data=data2&areaAll=null&corpAll=1'" align='center' background='site_media/img/006_1.jpg'
											class='line003'>
											浊度(NTU)
										</td>
										<td onclick="location.href='chartAllDetail.jsp?data=data1&areaAll=null&corpAll=1'" align='center' background='site_media/img/006_1.jpg'
											class='line003'>
											PH值
										</td>
										<td onclick="location.href='chartAllDetail.jsp?data=data3&areaAll=null&corpAll=1'" align='center' background='site_media/img/006_1.jpg'
											class='line003'>
											总氯 (mg/L) 
										</td>
										<td onclick="location.href='chartAllDetail.jsp?data=data5&areaAll=null&corpAll=1'" align='center' background='site_media/img/006_1.jpg'
											class='line003'>
											电导率(ms/mV)
										</td>
										<td onclick="location.href='chartAllDetail.jsp?data=data4&areaAll=null&corpAll=1'" align='center' background='site_media/img/006_1.jpg'
											class='line003'>
											流量(m3/h)
										</td>
										<td onclick="location.href='chartAllDetail.jsp?data=data6&areaAll=null&corpAll=1'" align='center' background='site_media/img/006_1.jpg'
											class='line003'>
											压力(kpa)
										</td>
										<td onclick="location.href='chartAllDetail.jsp?data=data7&areaAll=null&corpAll=1'" align='center' background='site_media/img/006_1.jpg'
											class='line003'>
											水温(C)
										</td>
									</tr>
									<%
										Connection con = BaseDao.getConnection();
										String sql = "SELECT * from (SELECT b.road_name corp_name,send_time,round(IFNULL(ph,'0.00'),2) ph,round(IFNULL(turbidity,'0.00'),2) turbidity,round(IFNULL(rc,'0.00'),2) rc,round(IFNULL(d_oxygen,'0.00'),2) d_oxygen,round(IFNULL(conductivity,'0.00'),2) conductivity,round(IFNULL(orp,'0.00'),2) orp,b.id id,round(IFNULL(temperature,'0.00'),2) C,c.corp_name corp_name2 from now_current as a join device_device as b on b.id=a.id LEFT JOIN device_watercorp c ON c.id=b.corp_id ORDER BY send_time desc) a GROUP BY id";
//"select corp_name,status_day,ph,turbidity,rc,d_oxygen,conductivity,orp,device_watercorp.id,C from current_corp_param"
//+" right join device_watercorp on (device_watercorp.id=current_corp_param.id)";
										System.out.println(sql);
										PreparedStatement psta = con.prepareStatement(sql);
										ResultSet rs = psta.executeQuery();
										while (rs.next()) {
									%>
									<tr>
										<td align='center' background='site_media/img/007.png'
											class='line001' onclick="location.href='chart.jsp?corpId=<%=rs.getString("id") %>&sub=null'">
											<div data-toggle="tooltip" data-placement="top" title="<%=rs.getString(2)%>">
											<%=rs.getString("corp_name2")%></div>
											
										</td>
										<td onclick="location.href='chartDetail.jsp?data=data2&corpId=<%=rs.getString("id") %>&areaId=null&table=hour_corp_param&name=sName'" align='center' background='site_media/img/007.png'
											class='line001'>
											<!--<%=rs.getDouble("turbidity")%>-->
											<%=rs.getDouble("turbidity") > 0.5 ? "<font color='#f6f457'>"
								+ rs.getDouble(4) + "</font>"
								: "<font color='white'>" + rs.getDouble("turbidity")
										+ "</font>"%>
										</td>
										<td onclick="location.href='chartDetail.jsp?data=data1&corpId=<%=rs.getString("id") %>&areaId=null&table=hour_corp_param&name=sName'" align='center' background='site_media/img/007.png'
											class='line001'>
											<%=rs.getDouble("ph") >= 6.5 && rs.getDouble("ph") <= 8.5 ? "<font color='white'>"
								+ rs.getDouble("ph") + "</font>"
								: "<font color='#f6f457'>" + rs.getDouble("ph")
										+ "</font>"%>
										</td>
										<td onclick="location.href='chartDetail.jsp?data=data3&corpId=<%=rs.getString("id") %>&areaId=null&table=hour_corp_param&name=sName'" align='center' background='site_media/img/007.png'
											class='line001'>
											<!--<%=rs.getDouble("rc") %>-->
											<%=rs.getDouble("rc") > 0.5||rs.getDouble("rc")<0.3 ? "<font color='#f6f457'>"
								+ rs.getDouble("rc") + "</font>"
								: "<font color='white'>" + rs.getDouble("rc")
										+ "</font>"%>
										</td>
										<td onclick="location.href='chartDetail.jsp?data=data5&corpId=<%=rs.getString("id") %>&areaId=null&table=hour_corp_param&name=sName'" align='center' background='site_media/img/007.png'
											class='line001'>
											<!--<%=rs.getDouble("conductivity") %>-->
											<%=rs.getDouble("conductivity") > 1250 || rs.getDouble("conductivity")<125? "<font color='#f6f457'>"
								+ rs.getDouble("conductivity") + "</font>"
								: "<font color='white'>" + rs.getDouble("conductivity")
										+ "</font>"%>
										</td>
										<td onclick="location.href='chartDetail.jsp?data=data4&corpId=<%=rs.getString("id") %>&areaId=null&table=hour_corp_param&name=sName'" align='center' background='site_media/img/007.png'
											class='line001'>
											<!--<%=rs.getDouble("d_oxygen")%>-->
											<%=rs.getDouble("d_oxygen")<5||rs.getDouble("d_oxygen")>20? "<font color='#f6f457'>"
								+ rs.getDouble("d_oxygen") + "</font>"
								: "<font color='white'>" + rs.getDouble("d_oxygen")
										+ "</font>"%>
										</td>
										<td onclick="location.href='chartDetail.jsp?data=data6&corpId=<%=rs.getString("id") %>&areaId=null&table=hour_corp_param&name=sName'" align='center' background='site_media/img/007.png'
											class='line001'>
											<!--<%=rs.getDouble("orp")%>-->
											<%=rs.getDouble("orp")<100||rs.getDouble("orp")>500? "<font color='#f6f457'>"
								+ rs.getDouble("orp") + "</font>"
								: "<font color='white'>" + rs.getDouble("orp")
										+ "</font>"%>
										</td>
										<td onclick="location.href='chartDetail.jsp?data=data7&corpId=<%=rs.getString("id") %>&areaId=null&table=hour_corp_param&name=sName'" align='center' background='site_media/img/007.png'
											class='line001'>
											<%= rs.getDouble("C") %>
										</td>
									</tr>
									<%
									}
									con.close();%>
								</table>
							</div>
				</div><!-- </div></div></div></div> -->
				
				
		<div style="display: none" id="TE" class="p_right">
							<div class='line005'>
								<table width='100%' height='100%' border='0' cellspacing='0' cellpadding='0'>
									<tr>
										<td height='50' colspan='6'
											background='site_media/img/005.jpg'>
											<table width='100%' border='0' cellpadding='0'
												cellspacing='0' class='f20px'>
												<tr>
													<td width='50' align='center'>
														<img src='site_media/img/009.png' alt='' width='11'
															height='11' />
													</td>
													<td>
														当前实时状态
													</td>
													<td width='100' align="right"> 
													</td>
												</tr>
											</table>
										</td>
										<td background='site_media/img/005.jpg' height='50'
											colspan='6'></td>
									</tr>
									<tr style="height: 80px">
										<td align='center' background='site_media/img/006_1.jpg' style="width:200px;"
											class='line003'>
											控制点
										</td>
										<td onclick="location.href='chartAllDetail.jsp?data=data2&areaAll=null&corpAll=1'" align='center' background='site_media/img/006_1.jpg'
											class='line003'>
											浊度(NTU)
										</td>
										<td onclick="location.href='chartAllDetail.jsp?data=data1&areaAll=null&corpAll=1'" align='center' background='site_media/img/006_1.jpg'
											class='line003'>
											PH值
										</td>
										<td onclick="location.href='chartAllDetail.jsp?data=data3&areaAll=null&corpAll=1'" align='center' background='site_media/img/006_1.jpg'
											class='line003'>
											总氯 (mg/L) 
										</td>
										<td onclick="location.href='chartAllDetail.jsp?data=data5&areaAll=null&corpAll=1'" align='center' background='site_media/img/006_1.jpg'
											class='line003'>
											电导率(ms/mV)
										</td>
										<td onclick="location.href='chartAllDetail.jsp?data=data4&areaAll=null&corpAll=1'" align='center' background='site_media/img/006_1.jpg'
											class='line003'>
											流量(m3/h)
										</td>
										<td onclick="location.href='chartAllDetail.jsp?data=data6&areaAll=null&corpAll=1'" align='center' background='site_media/img/006_1.jpg'
											class='line003'>
											压力(kpa)
										</td>
										<td onclick="location.href='chartAllDetail.jsp?data=data7&areaAll=null&corpAll=1'" align='center' background='site_media/img/006_1.jpg'
											class='line003'>
											水温(C)
										</td>
									</tr>
									<%
										con = BaseDao.getConnection();
										sql = "SELECT * from (SELECT IFNULL(b.road_name,'0.00') corp_name,send_time,round(IFNULL(ph,'0.00'),2) ph,round(IFNULL(turbidity,'0.00'),2) turbidity,round(IFNULL(rc,'0.00'),2) rc,round(IFNULL(d_oxygen,'0.00'),2) d_oxygen,round(IFNULL(conductivity,'0.00'),2) conductivity,round(IFNULL(orp,'0.00'),2) orp,b.id id,round(IFNULL(temperature,'0.00'),2) C,c.corp_name corp_name2 from now_current as a join device_device as b on b.id=a.id LEFT JOIN device_watercorp c ON c.id=b.corp_id ORDER BY send_time desc) a GROUP BY id";
												//"select corp_name,status_day,ph,turbidity,rc,d_oxygen,conductivity,orp,device_watercorp.id,C from current_corp_param"
//+" right join device_watercorp on (device_watercorp.id=current_corp_param.id)";
										psta = con.prepareStatement(sql);
										rs = psta.executeQuery();
										while (rs.next()) {
											String E="E.png";
											String T="T.png";
											String C="超标";
											String Z="正常";
											if(rs.getDouble("turbidity")==0&&rs.getDouble("ph")==0&&rs.getDouble("rc")==0
													&&rs.getDouble("conductivity")==0&&rs.getDouble("d_oxygen")==0
													&&rs.getDouble("orp")==0&&rs.getDouble("C")==0){
												E="R.png";T="R.png";
												C="尚未开通";Z="尚未开通";
											}
									%>
									<tr>
										<td align='center' background='site_media/img/007.png' 
											class='line001' onclick="location.href='chart.jsp?corpId=<%=rs.getString("id") %>&sub=null'">
											<div title="<%=rs.getString(2)%> ">
											<%=rs.getString("corp_name2")%></div>
											
										</td>
										<td onclick="location.href='chartDetail.jsp?data=data2&corpId=<%=rs.getString("id") %>&areaId=null&table=hour_corp_param&name=sName'" align='center' background='site_media/img/<%=rs.getDouble(4) > 0.5 ? E: T%>'
											class='line001'>
											<!--<%=rs.getDouble("turbidity")%>-->
											<%=rs.getDouble("turbidity") > 0.5 ? 
													"<div title='正常值：<0.5\n当前值："+rs.getDouble("turbidity")+"'>"+C+"</div>": ""+Z+""%>
										</td>
										<td onclick="location.href='chartDetail.jsp?data=data1&corpId=<%=rs.getString("id") %>&areaId=null&table=hour_corp_param&name=sName'" align='center' background='site_media/img/<%=rs.getDouble(3) >= 6.5 && rs.getDouble(3) <= 8.5 ? T: E%>'
											class='line001'>
											<%=rs.getDouble("ph") >= 6.5 && rs.getDouble("ph") <= 8.5 ? Z:
												"<div title='正常值：6.5-8.5\n当前值："+rs.getDouble("ph")+"'>"+C+"</div>"%>
										</td>
										<td onclick="location.href='chartDetail.jsp?data=data3&corpId=<%=rs.getString("id") %>&areaId=null&table=hour_corp_param&name=sName'" align='center' background='site_media/img/<%=rs.getDouble(5) > 0.5||rs.getDouble(5)<0.3 ?E: T%>'
											class='line001'>
											<!--<%=rs.getDouble("rc") %>-->
											<%=rs.getDouble("rc") > 0.5||rs.getDouble("rc")<0.3 ?
													"<div title='正常值：0.3-0.5\n当前值："+rs.getDouble("rc")+"'>"+C+"</div>": ""+Z+""%>
										</td>
										<td onclick="location.href='chartDetail.jsp?data=data5&corpId=<%=rs.getString("id") %>&areaId=null&table=hour_corp_param&name=sName'" align='center' background='site_media/img/<%=rs.getDouble(7) > 1250 || rs.getDouble(7)<125? E: T%>'
											class='line001'>
											<!--<%=rs.getDouble("conductivity") %>-->
											<%=rs.getDouble("conductivity") > 1250 || rs.getDouble("conductivity")<125? 
													"<div title='正常值：125-1250\n当前值："+rs.getDouble("conductivity")+"'>"+C+"</div>": Z%>
										</td>
										<td onclick="location.href='chartDetail.jsp?data=data4&corpId=<%=rs.getString("id") %>&areaId=null&table=hour_corp_param&name=sName'" align='center' background='site_media/img/<%=rs.getDouble("d_oxygen")<5||rs.getDouble("d_oxygen")>20? E: T%>'
											class='line001'>
											<!--<%=rs.getDouble("d_oxygen")%>-->
											<%=rs.getDouble("d_oxygen")<5||rs.getDouble("d_oxygen")>20? 
													"<div title='正常值：5-20\n当前值："+rs.getDouble("d_oxygen")+"'>"+C+"</div>": Z%>
										</td>
										<td onclick="location.href='chartDetail.jsp?data=data6&corpId=<%=rs.getString("id") %>&areaId=null&table=hour_corp_param&name=sName'" align='center' background='site_media/img/<%=rs.getDouble(8)<100||rs.getDouble(8)>500?E: T%>'
											class='line001'>
											<!--<%=rs.getDouble("orp")%>-->
											<%=rs.getDouble("orp")<100||rs.getDouble("orp")>500?
													"<div title='正常值：100-500\n当前值："+rs.getDouble("orp")+"'>"+C+"</div>": Z%>
										</td>
										<td onclick="location.href='chartDetail.jsp?data=data7&corpId=<%=rs.getString("id") %>&areaId=null&table=hour_corp_param&name=sName'" align='center' background='site_media/img/<%=rs.getDouble("C")>=40||rs.getDouble("C")<0?E: T %>'
											class='line001'>
											<%=rs.getDouble("C")>=40||rs.getDouble("C")<0?
													"<div title='正常值：0-40\n当前值："+rs.getDouble("C")+"'>"+C+"</div>": Z %>
										</td>
									</tr>
									<%
									}
									con.close();%>
								</table>
							</div>
				</div></div>
	</body>
	<script type="text/javascript">
	if (window.innerHeight)
		Wheight = window.innerHeight; 
	else if ((document.body) && (document.body.clientHeight))
		Wheight = document.body.clientHeight;
//Wheight=document.body.clientHeight;
var h=parseInt(Wheight)*0.4;
$('#dituContent').css('height',parseInt(Wheight)*0.85);
//$('#dituContent').css('width',parseInt(document.body.clientWidth)*0.70);
$('#divL').css('height',parseInt(Wheight)*0.66);
$('#divLT').css('height',parseInt(Wheight)*0.05);
$('#divLD1').css('height',parseInt(Wheight)*0.07);
$('#divLD2').css('height',parseInt(Wheight)*0.07);
$('#divR').css('height',parseInt(Wheight)*0.66);
$('#divRT').css('height',parseInt(Wheight)*0.05);
$('#divRD1').css('height',parseInt(Wheight)*0.07);
$('#divRD2').css('height',parseInt(Wheight)*0.07);
</script>
<script type="text/javascript">
$(function() {
	$( document ).tooltip({
		track: true,
		content: function() {
			var element = $( this );
			if ( element.is( "[data-geo]" ) ) {
				var text = element.text();
				return "<img class='map' alt='" + text +
					"' src='http://www.baidu.com/img/baidu_jgylogo3.gif'>";
			}
			if ( element.is( "[title]" ) ) {
				return element.attr( "title" );
			}
			if ( element.is( "img" ) ) {
				return element.attr( "alt" );
			}
		}
	});
});
	var startbool=true;
    //创建和初始化地图函数：
    function initMap(){
        createMap();//创建地图
        setMapEvent();//设置地图事件
        addMapControl();//向地图添加控件
        addMarker();//向地图中添加marker
    }
    
    //创建地图函数：
    function createMap(){
        map = new BMap.Map("dituContent");//在百度地图容器中创建一个地图
        var point = new BMap.Point(121.400093,31.266314);//定义一个中心点坐标
        map.centerAndZoom(point,14);//设定地图的中心点和坐标并将地图显示在地图容器中
        window.map = map;//将map变量存储在全局
    }
    
    //地图事件设置函数：
    function setMapEvent(){
        map.enableDragging();//启用地图拖拽事件，默认启用(可不写)
        map.enableScrollWheelZoom();//启用地图滚轮放大缩小
        map.enableDoubleClickZoom();//启用鼠标双击放大，默认启用(可不写)
        map.enableKeyboard();//启用键盘上下左右键移动地图
    }
    
    //地图控件添加函数：
    function addMapControl(){
        //向地图中添加缩放控件
	var ctrl_nav = new BMap.NavigationControl({anchor:BMAP_ANCHOR_TOP_LEFT,type:BMAP_NAVIGATION_CONTROL_LARGE});
	map.addControl(ctrl_nav);
        //向地图中添加缩略图控件
	var ctrl_ove = new BMap.OverviewMapControl({anchor:BMAP_ANCHOR_BOTTOM_RIGHT,isOpen:1});
	map.addControl(ctrl_ove);
        //向地图中添加比例尺控件
	var ctrl_sca = new BMap.ScaleControl({anchor:BMAP_ANCHOR_BOTTOM_LEFT});
	map.addControl(ctrl_sca);
    }
    
    //标注点数组
    markerArr = [{title:"我的标记123",content:"我的2",point:"121.382131|31.181802",isOpen:0,icon:{w:23,h:25,l:46,t:21,x:9,lb:12}}
		 ];
    //创建marker
    function addMarker(){
        for(var i=0;i<markerArr.length;i++){
            var json = markerArr[i];
            var p0 = json.point.split("|")[0];
            var p1 = json.point.split("|")[1];
            var point = new BMap.Point(p0,p1);
			var iconImg = createIcon(json.icon);
            var marker = new BMap.Marker(point,{icon:iconImg});
			var iw = createInfoWindow(i);
			var label = new BMap.Label(json.title,{"offset":new BMap.Size(json.icon.lb-json.icon.x+10,-20)});
			marker.setLabel(label);
            map.addOverlay(marker);
            label.setStyle({
                        borderColor:"#808080",
                        color:"#333",
                        cursor:"pointer"
            });
			
			(function(){
				var index = i;
				var _iw = createInfoWindow(i);
				_iw.setWidth(350);
				var _marker = marker;
				_marker.addEventListener("mouseover",function(){
				    this.openInfoWindow(_iw);
			    });
			    _iw.addEventListener("open",function(){
				    _marker.getLabel().hide();
			    })
			    _iw.addEventListener("close",function(){
				    _marker.getLabel().show();
			    })
				label.addEventListener("mouseover",function(){
				    _marker.openInfoWindow(_iw);
			    })
				if(!!json.isOpen){
					label.hide();
					_marker.openInfoWindow(_iw);
				}
			})()
        }
    }
    //创建InfoWindow
    function createInfoWindow(i){
        var json = markerArr[i];
        var iw = new BMap.InfoWindow("<b class='iw_poi_title' title='" + json.title + "'>" + json.title + "</b><div class='iw_poi_content'>"+json.content+"</div>");
        return iw;
    }
    //创建一个Icon
    function createIcon(json){
        var icon = new BMap.Icon("http://app.baidu.com/map/images/us_mk_icon.png", new BMap.Size(json.w,json.h),{imageOffset: new BMap.Size(-json.l,-json.t),infoWindowOffset:new BMap.Size(json.lb+5,1),offset:new BMap.Size(json.x,json.h)})
        return icon;
    }
    //initMap();//创建和初始化地图
    /**
    $('#myModal').modal({
        backdrop:false,
        keyboard:true,
        show:true,
    });**/
    baiduQ="";
    bgzl="<div onclick='TE()'><font  style='font-size:20px' color='white'>报警总览</font></div>";
    sjzl="<div onclick='showdata()'><font  style='font-size:20px' color='white'>数据总览</font></div>";
    sy="<div onclick='fh()'><font  style='font-size:20px' color='white'>首页</font></div>";
    
    $('#myModal').modal('hide');
    function showdata(){
    	$('#dituContent').html( $('#now').html());
        $(function () { $("[data-toggle='tooltip']").tooltip(); });
        $("#sjzl").html(sy);
        $("#bgzl").html(bgzl);
    }
    function TE(){
    	$('#dituContent').html( $('#TE').html());
        $(function () { $("[data-toggle='tooltip']").tooltip(); });
        $("#sjzl").html(sjzl);
        $("#bgzl").html(sy);
        
    }
    function fh(){
    	initMap();
    	var bdary = new BMap.Boundary();
		bdary.get("普陀区", function(rs){       //获取行政区域
			//map.clearOverlays();        //清除地图覆盖物       
			var count = rs.boundaries.length; //行政区域的点有多少个
			for(var i = 0; i < count; i++){
				var ply = new BMap.Polygon(rs.boundaries[i], {strokeWeight: 2, strokeColor: "blue",fillColor:"blue",fillOpacity: 0.1}); //建立多边形覆盖物
				map.addOverlay(ply);  //添加覆盖物
				//map.setViewport(ply.getPath());    //调整视野         
			}                
		});
    	if(startbool){
    		c();
    		startbool=false;
    	}
		map.clearOverlays();
		addMarker();
    	$("#sjzl").html(sjzl);
        $("#bgzl").html(bgzl);
    }
    
    runText=$.ajax({url:"/water/GetCurrentDataAll",async:false});
    call=$.ajax({url:"/water/GetCall",data:{name:"call"},async:false});

    $("#runText").html(runText.responseText);
    $("#Call").html(call.responseText );
    
    function c(){
        addrNum=$.ajax({url:"/water/GetAddr",async:false,}); 
        addrString=addrNum.responseText;
        //alert(addrString)
		map.clearOverlays();
		markerArr=[];
		for(var i=0;i<addrString.split(";").length;i++){
			var stmpAdd=addrString.split(";")[i];
			var p=stmpAdd.split(":")[1]+"|"+stmpAdd.split(":")[2]
			var addname=stmpAdd.split(":")[0];
			//alert(p);
			var x={title:addname,content:"",point:p.toString(),isOpen:0,icon:{w:23,h:25,l:0,t:21,x:9,lb:12}};
			//alert(x.point)
			markerArr.push(x);
		}
		dataTextNow=$("#runText").html();
		add_name=$.ajax({url:"/water/GetCall",data:{name:"corp_name"},async:false});
		add_names=add_name.responseText.split(';');
		//alert(dataTextNow)
		for(var i=0;i<dataTextNow.split("<br><br>").length-1;i++){
			var stmpText=dataTextNow.split("<br><br>")[i];
			for(var j=0;j<markerArr.length;j++){
				if(markerArr[j].title==stmpText.split("<br>")[0]){
					var st="<table style='width:100%;'>";
					var count=0;
					for(var ij=1;ij<stmpText.split("<br>").length;ij++){
						if(count%2!=0)
							st+="<td width='50%'><font color='blue'>"+stmpText.split("<br>")[ij].split("：")[0]+"：</font>"+stmpText.split("<br>")[ij].split("：")[1]+"</td></tr>";
						else
							st+="<tr><td width='50%'><font color='blue'>"+stmpText.split("<br>")[ij].split("：")[0]+"：</font>"+stmpText.split("<br>")[ij].split("：")[1]+"</td>";
						count++;
					}
					if(count%2!=0)
						st+="</tr></table>";
					else
						st+="</table>";
					if(st.indexOf("errot")!=-1)
						markerArr[j].icon={w:23,h:25,l:46,t:21,x:9,lb:12}
					else if(st.indexOf("尚未开通")!=-1)
						markerArr[j].icon={w:23,h:25,l:69,t:21,x:9,lb:12}
					markerArr[j].content="<br>"+st;
				} 
			}
			//alert(stmpText.split("<br>"));
		}
		
		//alert($("#runText").html())
	}
    //initMap();//创建和初始化地图
    <%
    if(request.getParameter("index")!=null&&request.getParameter("index").equals("1")){%>
	    
    	showdata()
	    
	<%}else if(request.getParameter("index")!=null&&request.getParameter("index").equals("2")){ %>
		TE()
	<%} else{%>
		fh();
	<%}%>
	
    
</script>
</html>

