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
		<meta http-equiv="pragma" content="no-cache">
		<meta http-equiv="cache-control" content="no-cache">
		<meta http-equiv="expires" content="0">
		<!--引用百度地图API-->
		<style type="text/css">
		    html,body{margin:0;padding:0;}
		    .iw_poi_title {color:#CC5522;font-size:14px;font-weight:bold;overflow:hidden;padding-right:13px;white-space:nowrap}
		    .iw_poi_content {font:12px arial,sans-serif;overflow:visible;padding-top:4px;white-space:-moz-pre-wrap;word-wrap:break-word}
		</style>
		<script type="text/javascript" src="http://api.map.baidu.com/api?key=&v=1.1&services=true"></script>
		<style type="text/css">
		 * {margin:0;padding:0}
body {background-color: #1F5183;margin-left: 0px;margin-top: 0px;margin-right: 0px;margin-bottom: 0px;}
.p_con{width: 100%;height:840px; background: #3969A9;}
/*background: url(site_media/img/004.jpg);background-repeat: no-repeat;*/
.p_content{width: 100%;height: 840px;background-position: 0px 30px;}
.p_top{width: 90%;height: 65px;position: absolute;top: 110px;left: 150px;} 


.p_left{width: 100%;height: auto;float: left;margin-top: 6%;margin-left: 0%;}
.p_corp_1{float: left;background: url(site_media/img/b001.png);background-repeat:no-repeat;background-position: 50% 50%;width: 18%;height: 63px;text-align: center;color:white;text-decoration: none;padding-top: 30px;font-weight: bold;font-size: 22px;margin-right:70px;}
.p_corp_2{float: left;background: url(site_media/img/b002.png);background-repeat: no-repeat;background-position: 50% 50%;width: 18%;height: 63px;text-align: center;color:white;text-decoration: none;padding-top: 30px;font-weight: bold;font-size: 22px; margin-right:70px;}
.p_star{float: left;background: url(site_media/img/b002.png);background-repeat: no-repeat;background-position: 50% 50%; width: 18%;height: 63px;text-align: center;color:white;text-decoration: none;padding-top: 30px;font-weight: bold;font-size: 22px; margin-right:70px;}

.p_right{width: 680px;height:auto;color: white;position: absolute;top:0px;left:0%;font-size:15px;}
.line003{border-bottom: 1px solid #607495;border-right: 1px solid #607495;color: #539FDF;font-family: "微软雅黑","Arial Unicode MS";font-size: 20px;height: 50px;font-weight: bold;width:110px;}
.line001 {border-right-width: 1px;border-bottom-width: 1px;border-right-style: solid;border-bottom-style: solid;border-right-color: #607495;border-bottom-color: #607495;font-size: 20px;color:#FFF; padding-top:12px;padding-bottom:12px;}
.line002 {font-size: 14px;color: #FFF;border-bottom-width: 1px;border-bottom-style: solid;border-bottom-color: #607495;}
.f20px {font-family: "微软雅黑", "Arial Unicode MS";font-size: 20px;color: #FFF;font-weight: bold;}
.line005 {border-top-width: 1px;border-right-width: 1px;border-top-style: solid;border-right-style: solid;border-top-color: #62A1D6;border-right-color: #62A1D6;border-left-width: 1px;border-left-style: solid;border-left-color: #62A1D6;}
.p_bottom{width: 530px;height: 65px;position: absolute;top:220px;left: 60%;}
.orc{padding:2px;}
</style>
	</head>

	<body>
		<table width="100%" border="0" cellspacing="0" cellpadding="0">
			<tr>
				<td height="87" align="center" background="site_media/img/01.jpg">
					<img src="site_media/img/0023.png" width="401" height="48" />
				</td>
			</tr>
			<tr>
				<td height="2" background="site_media/img/03.jpg">
					<img src="site_media/img/03.jpg" width="4" height="4" />
				</td>
			</tr>
		</table>
		<div class="p_con">
			<div class="p_content">
				<div class="p_top" id="p_top">
				<!--javascript:location.href='aa.jsp-->
					<a href="javascript:location.href='aa.jsp'" id="p_corp"class="p_corp_1">自来水公司分布图</a>
					<a href="javascript:getSecond();"id="p_star" class="p_corp_2">上海行政区分布图</a>
					<a href="report.jsp?corpId=" id="toReport" class="p_corp_2">水质报表</a>
					<a href="chartAllArea.jsp?corpAll=1" id="toChart" class="p_corp_2">水质趋势图</a>	
				
				</div><div class="p_left">
				<div style="margin-left: 10%;z-index:0;width:80%;height:78%;border:#ccc solid 1px;" id="dituContent"></div>
				</div>
				<div id="myModal" style="width: 680px;height:auto;color: white;position: absolute;top:30%;left:60%;" tabindex="-1" role="dialog" 
   aria-labelledby="myModalLabel" aria-hidden="true">
   <div class="modal-dialog" style="width: 680px">
      <div class="modal-content">
   <div class="modal-body">
				<div class="p_right">
					<table  border='0' cellspacing='0' cellpadding='1' width='100%'>
						<tr>
							<td class='line005'>
								<table width='100%' border='0' cellspacing='0' cellpadding='0'>
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
														水质主要参数总体均值
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
									<tr>
										<td align='center' background='site_media/img/006_1.jpg' style="width:600px;"
											class='line003'>
											所属自来水公司
										</td>
										<td align='center' background='site_media/img/006_1.jpg'
											class='line003'>
											浊度<br/>(NTU)
										</td>
										<td align='center' background='site_media/img/006_1.jpg'
											class='line003'>
											PH值
										</td>
										<td align='center' background='site_media/img/006_1.jpg'
											class='line003'>
											余氯<br/> (mg/L) 
										</td>
										<td align='center' background='site_media/img/006_1.jpg'
											class='line003'>
											电导率<br/>(ms/mV)
										</td>
										<td align='center' background='site_media/img/006_1.jpg'
											class='line003'>
											溶解氧<br/>(mg/L)
										</td>
										<td align='center' background='site_media/img/006_1.jpg'
											class='line003'>
											ORP<br/>(mV)
										</td>
										<td align='center' background='site_media/img/006_1.jpg'
											class='line003'>
											水温<br/>(C)
										</td>
									</tr>
									<%
										Connection con = BaseDao.getConnection();
										String sql = "select corp_name,status_day,ph,turbidity,rc,d_oxygen,conductivity,orp,device_watercorp.id,C from current_corp_param"
+" right join device_watercorp on (device_watercorp.id=current_corp_param.id)";
										PreparedStatement psta = con.prepareStatement(sql);
										ResultSet rs = psta.executeQuery();
										while (rs.next()) {
									%>
									<tr>
										<td align='center' background='site_media/img/007.png'
											class='line001' onclick="location.href='report.jsp?corpId=<%=rs.getString("id") %>&sub=1'">
											<%=rs.getString(1)%>
											
										</td>
										<td align='center' background='site_media/img/007.png'
											class='line001'>
											<!--<%=rs.getDouble(4)%>-->
											<%=rs.getDouble(4) > 0.5 ? "<font color='#f6f457'>"
								+ rs.getDouble(4) + "</font>"
								: "<font color='white'>" + rs.getDouble(4)
										+ "</font>"%>
										</td>
										<td align='center' background='site_media/img/007.png'
											class='line001'>
											<%=rs.getDouble(3) >= 6.5 && rs.getDouble(3) <= 8.5 ? "<font color='white'>"
								+ rs.getDouble(3) + "</font>"
								: "<font color='#f6f457'>" + rs.getDouble(3)
										+ "</font>"%>
										</td>
										<td align='center' background='site_media/img/007.png'
											class='line001'>
											<!--<%=rs.getDouble(5) %>-->
											<%=rs.getDouble(5) > 0.5||rs.getDouble(5)<0.3 ? "<font color='#f6f457'>"
								+ rs.getDouble(5) + "</font>"
								: "<font color='white'>" + rs.getDouble(5)
										+ "</font>"%>
										</td>
										<td align='center' background='site_media/img/007.png'
											class='line001'>
											<!--<%=rs.getDouble(7) %>-->
											<%=rs.getDouble(7) > 1250 || rs.getDouble(7)<125? "<font color='#f6f457'>"
								+ rs.getDouble(7) + "</font>"
								: "<font color='white'>" + rs.getDouble(7)
										+ "</font>"%>
										</td>
										<td align='center' background='site_media/img/007.png'
											class='line001'>
											<!--<%=rs.getDouble(6)%>-->
											<%=rs.getDouble(6)<6? "<font color='#f6f457'>"
								+ rs.getDouble(6) + "</font>"
								: "<font color='white'>" + rs.getDouble(6)
										+ "</font>"%>
										</td>
										<td align='center' background='site_media/img/007.png'
											class='line001'>
											<!--<%=rs.getDouble(8)%>-->
											<%=rs.getDouble(8)<150||rs.getDouble(8)>550? "<font color='#f6f457'>"
								+ rs.getDouble(8) + "</font>"
								: "<font color='white'>" + rs.getDouble(8)
										+ "</font>"%>
										</td>
										<td align='center' background='site_media/img/007.png'
											class='line001'>
											<%= rs.getDouble("C") %>
										</td>
									</tr>
									<%
									}
									con.close();%>
								</table>
							</td>
						</tr>
					</table>
				</div></div></div></div></div>
				<button class="btn btn-primary btn-lg" data-toggle="modal" style="margin-left: 10%" 
   data-target="#myModal">
  查看数据
</button>
			</div>
		</div>
		<script type="text/javascript">
		var stmpdata="";
        getAllDevice();
       
	function getSecond(){
	   $("#p_corp").removeClass('p_corp_1');
        $("#p_corp").addClass('p_corp_2');
     
	   $("#p_star").removeClass('p_corp_2');
        $("#p_star").addClass('p_corp_1');
        
        $("#toReport").attr("href","report.jsp?areaId=31");
        $("#toChart").attr("href","chartAllArea.jsp?areaAll=1");
        getForErea();
	    getMap();
	}
	
	function getForErea(){
				var content="<table width='100%' border='0' cellspacing='0' cellpadding='1'><tr><td class='line005'><table width='100%' border='0' cellspacing='0' cellpadding='0'><tr> <td height='50' colspan='6' background='site_media/img/005.jpg'><table width='100%' border='0' cellpadding='0' cellspacing='0' class='f20px'> <tr><td width='50' align='center'><img src='site_media/img/009.png' alt='' width='11' height='11' /></td> <td>水质主要参数总体均值</td> <td width='100' align='center'></td></tr> </table></td><td background='site_media/img/005.jpg' height='50' colspan='6'></td></tr>";
			content+="<tr><td align='center' background='site_media/img/006_1.jpg' class='line003' style='width:300px;'>所属行政区</td><td align='center' background='site_media/img/006_1.jpg' class='line003'>浊度<br/>(NTU)</td><td align='center' background='site_media/img/006_1.jpg' class='line003'>PH值 </td><td align='center' background='site_media/img/006_1.jpg' class='line003'>余氯<br/> (mg/L)</td><td align='center' background='site_media/img/006_1.jpg' class='line003'>电导率<br/>(ms/mV)</td><td  align='center' background='site_media/img/006_1.jpg' class='line003'>溶解氧<br/>(mg/L)</td><td  align='center' background='site_media/img/006_1.jpg' class='line003'>ORP<br/>(mV)</td><td  align='center' background='site_media/img/006_1.jpg' class='line003'>水温<br/>(C)</td></tr>"; 
  
				$(".p_right").empty();

				<%
			 con=BaseDao.getConnection();
			 sql=
			"select a.area_name,b.* from current_area_param as b right join device_area as a on (a.id=b.id)";
			 psta =con.prepareStatement(sql);
			 rs=psta.executeQuery();
			while(rs.next()){
			if(rs.getString("area_name").trim().equalsIgnoreCase("上海市")){
				continue;
			}
			 //System.out.println(rs.getString(9));%>
					content+="<tr onclick="+'"'+"location.href='report.jsp?areaId=<%=rs.getString(9) %>';"+'"'+"><td align='center' background='site_media/img/007.png' class='line001 orc'><%=rs.getString(1)%></td>"
					+"<td align='center' background='site_media/img/007.png' class='line001 orc'><%=rs.getDouble(4) > 0.5 ? "<font color='#f6f457'>"+ rs.getDouble(4) + "</font>": "<font color='white'>" + rs.getDouble(4)+ "</font>"%></td>"
					+"<td align='center' background='site_media/img/007.png' class='line001 orc'><%=rs.getDouble(3) >= 5 && rs.getDouble(3) <= 9 ? "<font color='white'>"+rs.getDouble(3) + "</font>": "<font color='#f6f457'>" + rs.getDouble(3)+ "</font>"%>"
					+"</td><td align='center' background='site_media/img/007.png' class='line001 orc'><%=rs.getDouble(5) > 0.5||rs.getDouble(5)<0.3 ? "<font color='#f6f457'>"+ rs.getDouble(5) + "</font>": "<font color='white'>" + rs.getDouble(5)+ "</font>"%></td>"
					+"<td align='center' background='site_media/img/007.png' class='line001 orc'><%=rs.getDouble(7) > 1250 || rs.getDouble(7)<125? "<font color='#f6f457'>"+ rs.getDouble(7) + "</font>": "<font color='white'>" + rs.getDouble(7)+ "</font>"%></td>"
					+"<td align='center' background='site_media/img/007.png' class='line001 orc'><%=rs.getDouble(6)<6? "<font color='#f6f457'>"+ rs.getDouble(6) + "</font>": "<font color='white'>" + rs.getDouble(6)+ "</font>"%></td>"
					+"<td align='center' background='site_media/img/007.png' class='line001 orc'><%=rs.getDouble(8)<150||rs.getDouble(8)>550? "<font color='#f6f457'>"+ rs.getDouble(8) + "</font>": "<font color='white'>" + rs.getDouble(8)+ "</font>"%></td>"
					+"<td align='center' background='site_media/img/007.png' class='line001 orc'><%= rs.getDouble("C") %></td></tr>";
				<%}%>	
				
				content+="</table></td></tr></table>";
				$(".p_right").append(content);
	}
	
	function getAllDevice(){
	
				$("#mapicon").empty();
				var st;
				var id;
				var left;
				var top;
				var mapdiv;
				<%
					sql=
					"select device_device.id as id,device_info,device_watercorp.corp_name,device_watersubcorp.sub_corp_name,ph,turbidity,rc,d_oxygen,conductivity,x_pos,y_pos,device_device.status_id,orp,device_watersubcorp.id as subcorpid from device_device "
					+"inner join device_watercorp on (device_watercorp.id=device_device.corp_id) "
					+"inner join device_watersubcorp on (device_watersubcorp.id=device_device.sub_corp_id) "
					+"inner join hardsocket_water_param on (hardsocket_water_param.device_id=device_device.id and hardsocket_water_param.send_time=(select max(send_time) from hardsocket_water_param where device_id=device_device.id)) ";
					psta=con.prepareStatement(sql);
					rs=psta.executeQuery(sql);
					while(rs.next()){
					int x=0;
				%>
				var y = document.getElementById('<%=rs.getString("subcorpid")%>');if(!y) {
					if(<%=!rs.getString("orp").equalsIgnoreCase("FFFF")&&rs.getString("conductivity").equalsIgnoreCase("FFFF")&&rs.getString("d_oxygen").equalsIgnoreCase("FFFF")&&rs.getString("rc").equalsIgnoreCase("FFFF")&&rs.getString("turbidity").equalsIgnoreCase("FFFF")&&rs.getString("ph").equalsIgnoreCase("FFFF")&&rs.getDouble("d_oxygen")>=6&&rs.getDouble("conductivity")>=125&&rs.getDouble("conductivity")<=1250&&rs.getDouble("rc")>=0.3&&rs.getDouble("rc")<=0.5&&rs.getDouble("ph")>=6.5&&rs.getDouble("ph")<=8.5&&rs.getDouble("orp")>=150&&rs.getDouble("orp")<=500&&rs.getDouble("turbidity")<=0.5%>){
						var img="<img src='site_media/img/icongreen.png' id='<%=rs.getString("subcorpid")%>' style='width:40px;height:45px;'/>";
						$("#mapicon").append(img);
						$("#<%=rs.getString("subcorpid")%>").css("top","<%=rs.getString("y_pos")%>px"); 
					 	$("#<%=rs.getString("subcorpid")%>").css("left","<%=rs.getString("x_pos")%>px");
					}else{
						var img="<img src='site_media/img/iconred.png'  id='<%=rs.getString("subcorpid")%>'/>";
						$("#mapicon").append(img);
						$("#<%=rs.getString("subcorpid")%>").css("top","<%=rs.getString("y_pos")%>px"); 
					 	$("#<%=rs.getString("subcorpid")%>").css("left","<%=rs.getString("x_pos")%>px");
					}
					
					 }
				<%x=x+1;}
				con.close();%>
	}
$("#mapicon img").live("mouseout",function(){
	$(".mapdiv").remove();
});


$("#mapicon img").live("mouseover",function(){
	var id=$(this).attr("id");
	var left=$(this).offset().left;
	var top=$(this).offset().top;
	$.ajax({
		url:"/water/getDetail.do?id="+id+"&ts=<%=new Date().getTime()%>",
		type:"GET",
		dataType:"json",
		success:function(data){
		
			var mapdiv=" <div class='mapdiv' style='top:"+(top-85)+"px;left:"+(left+25)+"px;' id='mapdiv'><table border='1' cellpadding='0' cellspacing='0'>"
			+"<tr><td colspan='6'>"+data["corp"]
			//+data["subcorp"]+","+data["deviceid"]+"</td></tr>"
			+data["subcorp"]+"</td></tr>"
			+"<tr class='a'><td>PH</td><td>电导率(ms/mV)</td><td>溶解氧(mg/L)</td><td>余氯(mg/L)</td><td>浊度(NTU)</td><td>ORP<br/>(mV)</td></tr>"
			+"<tr class='b'><td>"+data["ph"]+"</td><td>"+data["conductivity"]+"</td><td>"+data["d_oxygen"]+"</td><td>"+data["rc"]+"</td><td>"+data["turbidity"]+"</td><td>"+data["orp"]+"</td></tr>"
			+"</table></div>";
			alert(mapdiv);
			$("body").append(mapdiv);
			if(data["ph"]<5||data["ph"]>9){
				//$(".a td:eq(0)").attr("style", "border:1px solid red;color:red");
				$(".b td:eq(0)").attr("style", "border:1px solid red;color:red");
			}
			if(data["conductivity"]<125||data["conductivity"]>1250){
				//$(".a td:eq(1)").attr("style", "border:1px solid red;color:red");
				$(".b td:eq(1)").attr("style", "border:1px solid red;color:red");
			}
			if(data["d_oxygen"]<6){
				//$(".a td:eq(2)").attr("style", "border:1px solid red;color:red");
				$(".b td:eq(2)").attr("style", "border:1px solid red;color:red");
			}
			if(data["rc"]<0.3||data["rc"]>0.5){
				//$(".a td:eq(3)").attr("style", "border:1px solid red;color:red");
				$(".b td:eq(3)").attr("style", "border:1px solid red;color:red");
			}
			if(data["turbidity"]>0.5){
				//$(".a td:eq(4)").attr("style", "border:1px solid red;color:red");
				$(".b td:eq(4)").attr("style", "border:1px solid red;color:red");
			}
			if(data["orp"]<150||data["orp"]>500){
				//$(".a td:eq(5)").attr("style", "border:1px solid red;color:red");
				$(".b td:eq(5)").attr("style", "border:1px solid red;color:red");
			}
		
	},error: function(xhr,status,errMsg){   
		alert(errMsg.code+"<br/>"+errMsg.msg+status);   
    }  
	});
});

$("#mapicon img").live("click",function(){
	var id=$(this).attr("id");
	location.href="chartsub.jsp?table=hour_subcorp_param&id="+id;
});
	

	htmlobj=$.ajax({url:"/water/getDetail.do?id="+"4"+"&ts=<%=new Date().getTime()%>",async:false});
	var data = eval("(" + htmlobj.responseText + ")");
	//alert("<div >"+data["corp"]);
	var mapdiv=" <div class='mapdiv' id='mapdiv'><table border='1' cellpadding='0' cellspacing='0'>"
	+"<tr><td colspan='6'>"+data["corp"]
	//+data["subcorp"]+","+data["deviceid"]+"</td></tr>"
	+data["subcorp"]+"</td></tr>"
	+"<tr class='a'><td>PH</td><td>电导率(ms/mV)</td><td width='100'>溶解氧(mg/L)</td><td>余氯(mg/L)</td><td>浊度(NTU)</td><td>ORP<br/>(mV)</td></tr>"
	+"<tr class='b'><td>"+data["ph"]+"</td><td>"+data["conductivity"]+"</td><td>"+data["d_oxygen"]+"</td><td>"+data["rc"]+"</td><td>"+data["turbidity"]+"</td><td>"+data["orp"]+"</td></tr>"
	+"</table></div>";
	stmpdata=mapdiv;

 

	//创建和初始化地图函数：
    function initMap(){
        createMap();//创建地图
        setMapEvent();//设置地图事件
        addMapControl();//向地图添加控件
        addMarker();//向地图中添加marker
    }
    
    //创建地图函数：
    function createMap(){
        var map = new BMap.Map("dituContent");//在百度地图容器中创建一个地图
        var point = new BMap.Point(121.382409,31.181818);//定义一个中心点坐标
        map.centerAndZoom(point,10);//设定地图的中心点和坐标并将地图显示在地图容器中
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
    var markerArr = [{title:"",content:stmpdata,point:"121.382131|31.181802",isOpen:0,icon:{w:23,h:25,l:46,t:21,x:9,lb:12}}
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
				var _marker = marker;
				_marker.addEventListener("mouseover",function(){
				    this.openInfoWindow(_iw);
			    });
				_marker.addEventListener("mouseout",function(){
				    this.closeInfoWindow(_iw);
			    });
			    //_iw.addEventListener("open",function(){
				//    _marker.getLabel().hide();
			    //})
			    //_iw.addEventListener("close",function(){
				//    _marker.getLabel().show();
			    //})
				//label.addEventListener("click",function(){
				//    _marker.openInfoWindow(_iw);
			    //})
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
    
    initMap();//创建和初始化地图
    $('#myModal').modal({
        backdrop:false,
        keyboard:true,
        show:true
    });
</script>
	</body>
</html>

