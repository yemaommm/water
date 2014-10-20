<%@page import="com.rfidcer.dao.lineColor"%>
<%@page import="java.awt.Color"%>
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<jsp:directive.page import="java.sql.Connection"/>
<jsp:directive.page import="com.rfidcer.dao.BaseDao"/>
<jsp:directive.page import="java.sql.PreparedStatement"/>
<jsp:directive.page import="java.sql.ResultSet"/>
<jsp:directive.page import="java.util.Map.Entry"/>
<jsp:directive.page import="java.text.SimpleDateFormat"/>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link href="site_media/css/css.css" type="text/css" rel="stylesheet" />
<script type="text/javascript" src="site_media/js/jquery.min.js"></script> 
<script type="text/javascript" src="site_media/js/jscharts.js"></script>
<title>水质检测</title>
<style type="text/css">
body{overflow: hidden;}
.w_content{width:98%;padding-left:10px;}
.r_top{width: 100%;height: 50px;margin: 20px 0 5px 0;}
.r_top input{float: left;margin-left: 65px;width: 160px;height:40px;text-align: center;font-weight: bold;font-size: 18px;}
.r_con{width:100%;height: auto;margin: auto;margin-bottom: 30px;float: left;}
.r_con table{text-align: left;width: 100%;color: black;font-weight: bold;font-size: 20px;}
.r_con table tr th{height: 50px;}
.r_con table tr td{height: 40px;padding-bottom:20px;}
.ri{border-left:2px solid white;}
.r_con table tr td{background-color:expression((this.parentElement.sectionRowIndex%2==0)?'#efffa7':'#fff');}
.back{float: right;margin-right:60%;}
.maspan{color: black;padding-left: 50px;font-size: 18px;font-weight: bold;}
.r_con1{width: 100%;height: auto;}
.r_con1 table{width: 100%;height: auto;}
.r_con1 talbe tr td{width: 100px;height: 30px;border: 1px solid red;}
.r_con2{width: 100%;height: auto;margin-bottom: 20px;margin-top: 50px;}
.r_con2 input{float: left;margin-left: 100px;width: 150px;height: 50px;margin-bottom: 20px;font-size: 18px;}
.r_con1 table tr{color: white;}
.s_name{margin-left:40%;font-size:24px;color:white;font-weight:bold;}
.tab2 div{box-shadow: inset 1px -1px 1px #444, inset -1px 1px 1px #444;height: 55px;line-height: 55px}
.corp td{line-height: 26px}
.corp tr{height: 14px}
</style>
</head>
<body>
	<div class="w_div">
				<span style="position: absolute;top:50px;left:90%;"><font style="font-size:24px;display:block;text-align:right;" color="#FFFF99"><%=new SimpleDateFormat("yyyy-MM-dd").format(new Date()) %></font></span>
		<table width="100%" border="0" cellspacing="0" cellpadding="0">
			<tr>
			<td height="87" align="center" background="site_media/img/01.jpg"><img src="site_media/img/0023.png" width="601" height="48" /></td>
			</tr>
			<tr>
			<td height="2" background="site_media/img/03.jpg"><img src="site_media/img/03.jpg" width="4" height="4" /></td>
			</tr>
		</table>
		<div class="w_content">
		<!-- 
			<div class="r_top">
				<input type='button' id="myBack" class='backs' value='返回' onclick="history.go(-1);"/>
				<center><br><br><span class="s_name"></span><span><font style="font-size:24px;display:block;text-align:right;" color="#FFFF99"><%=new SimpleDateFormat("yyyy-MM-dd").format(new Date()) %></font></span></center>
			</div>
			 -->
			<div style="width: 86%" id="r_con" class="r_con">
			<br><table>
			<tr><td onclick="location.href='chartAllDetail.jsp?data=data1&areaAll=<%=request.getParameter("areaAll") %>&corpAll=<%=request.getParameter("corpAll")%>&name=sName '"><div id="c1"></div></td><td onclick="location.href='chartAllDetail.jsp?data=data2&areaAll=<%=request.getParameter("areaAll") %>&corpAll=<%=request.getParameter("corpAll")%>&name=sName'"><div id="c2"></div></td><td onclick="location.href='chartAllDetail.jsp?data=data3&areaAll=<%=request.getParameter("areaAll") %>&corpAll=<%=request.getParameter("corpAll")%>&name=sName '"><div id="c3"></div></td></tr>
			<tr><td onclick="location.href='chartAllDetail.jsp?data=data4&areaAll=<%=request.getParameter("areaAll") %>&corpAll=<%=request.getParameter("corpAll")%>&name=sName'"><div id="c4"></div></td><td onclick="location.href='chartAllDetail.jsp?data=data5&areaAll=<%=request.getParameter("areaAll") %>&corpAll=<%=request.getParameter("corpAll")%>&name=sName '"><div id="c5"></div></td><td onclick="location.href='chartAllDetail.jsp?data=data6&areaAll=<%=request.getParameter("areaAll") %>&corpAll=<%=request.getParameter("corpAll")%>&name=sName '"><div id="c6"></div></td></tr>
			</table>
			</div>
				<div style="position: absolute;top:25px;left:85%;font-size: 18px;color: white;height: 100%">
					<table class="tab2" style="text-align: center;"><tr style="font-size: 20px;"><td><div onclick="chartChan('0')">图表标记</div></td></tr>
						<tr>
							<td id="tabtr" style="height: 500px;">
								<div style="overflow:auto;font-size: 18px;color: white;height: 100%">
									<table id="corp" class="corp"><tr></tr><tr id="corpColor"></tr></table>
								</div>
							</td>
						</tr>
						<tr><td style="font-size: 20px;" background="/water/site_media/img/button.png" onclick="javascript:location.href='/water/aa.jsp' ">
							<div>首页</div></td></tr>
						<tr><td style="font-size: 20px;" background="/water/site_media/img/button.png" onclick="javascript:location.href='/water/aa.jsp?index=1' ">
							<div>数据总览</div></td></tr>
						<tr><td style="font-size: 20px;" background="/water/site_media/img/button.png" onclick="javascript:location.href='/water/new_report.jsp?corpId=' ">
							<div>报表统计</div></td></tr>
						<tr><td style="font-size: 20px;" background="/water/site_media/img/button.png" onclick="javascript:location.href='/water/aa.jsp?index=2'">
							<div>报警总览</div></td></tr>
					</table>
					
				</div>
		</div>
	</div>
</body>
<script type="text/javascript">
				var tab="";
				<%
				String data1="new Array(";
					String data2="new Array(";
					String data3="new Array(";
					String data4="new Array(";
					String data5="new Array(";
					String data6="new Array(";
					String sName="";
					
					Map map1=new HashMap();
					Map map2=new HashMap();
					Map map3=new HashMap();
					Map map4=new HashMap();
					Map map5=new HashMap();
					Map map6=new HashMap();
				if(request.getParameter("type")==null&&request.getParameter("areaAll")==null&&request.getParameter("corpAll")==null){ 
					request.getRequestDispatcher("aa.jsp").forward(request,response);
				}else if(request.getParameter("type")==null&&request.getParameter("areaAll")!=null&&request.getParameter("corpAll")==null) {
					Connection con=BaseDao.getConnection();
					String sql="select * from hour_area_param where status_hour like '%"+new SimpleDateFormat("yy-MM-dd").format(new Date())+"%'";
					System.out.println(sql);
					PreparedStatement psta=con.prepareStatement(sql);
					ResultSet rs=psta.executeQuery(sql);
					boolean first=true;
					int x=0;
					while(rs.next()){
					sName=rs.getString(1);
						//if(first){
						map1.put(rs.getString(1),map1.get(rs.getString(1))==null?(data1+"["+Integer.valueOf(rs.getString(2).substring(9,11))+","+rs.getDouble(3)+"]"):(map1.get(rs.getString(1)).toString()+",["+Integer.valueOf(rs.getString(2).substring(9,11))+","+rs.getDouble(3)+"]"));
						map2.put(rs.getString(1),map2.get(rs.getString(1))==null?(data2+"["+Integer.valueOf(rs.getString(2).substring(9,11))+","+rs.getDouble(4)+"]"):(map2.get(rs.getString(1)).toString()+",["+Integer.valueOf(rs.getString(2).substring(9,11))+","+rs.getDouble(4)+"]"));
						map3.put(rs.getString(1),map3.get(rs.getString(1))==null?(data3+"["+Integer.valueOf(rs.getString(2).substring(9,11))+","+rs.getDouble(5)+"]"):(map3.get(rs.getString(1)).toString()+",["+Integer.valueOf(rs.getString(2).substring(9,11))+","+rs.getDouble(5)+"]"));
						map4.put(rs.getString(1),map4.get(rs.getString(1))==null?(data4+"["+Integer.valueOf(rs.getString(2).substring(9,11))+","+rs.getDouble(6)+"]"):(map4.get(rs.getString(1)).toString()+",["+Integer.valueOf(rs.getString(2).substring(9,11))+","+rs.getDouble(6)+"]"));
						map5.put(rs.getString(1),map5.get(rs.getString(1))==null?(data5+"["+Integer.valueOf(rs.getString(2).substring(9,11))+","+rs.getDouble(7)+"]"):(map5.get(rs.getString(1)).toString()+",["+Integer.valueOf(rs.getString(2).substring(9,11))+","+rs.getDouble(7)+"]"));
						map6.put(rs.getString(1),map6.get(rs.getString(1))==null?(data6+"["+Integer.valueOf(rs.getString(2).substring(9,11))+","+rs.getDouble(8)+"]"):(map6.get(rs.getString(1)).toString()+",["+Integer.valueOf(rs.getString(2).substring(9,11))+","+rs.getDouble(8)+"]"));
					//	data2+="['"+Integer.valueOf(rs.getString(2).substring(9,11))+"',"+rs.getDouble(4)+"]";
						//data3+="['"+Integer.valueOf(rs.getString(2).substring(9,11))+"',"+rs.getDouble(5)+"]";
						//data4+="['"+Integer.valueOf(rs.getString(2).substring(9,11))+"',"+rs.getDouble(6)+"]";
						//data5+="['"+Integer.valueOf(rs.getString(2).substring(9,11))+"',"+rs.getDouble(7)+"]";
						//data6+="['"+Integer.valueOf(rs.getString(2).substring(9,11))+"',"+rs.getDouble(8)+"]";
						//first=false;
						//}
						/*else{
						data1+=",['"+Integer.valueOf(rs.getString(2).substring(9,11))+"',"+rs.getDouble(3)+"]";
						data2+=",['"+Integer.valueOf(rs.getString(2).substring(9,11))+"',"+rs.getDouble(4)+"]";
						data3+=",['"+Integer.valueOf(rs.getString(2).substring(9,11))+"',"+rs.getDouble(5)+"]";
						data4+=",['"+Integer.valueOf(rs.getString(2).substring(9,11))+"',"+rs.getDouble(6)+"]";
						data5+=",['"+Integer.valueOf(rs.getString(2).substring(9,11))+"',"+rs.getDouble(7)+"]";
						data6+=",['"+Integer.valueOf(rs.getString(2).substring(9,11))+"',"+rs.getDouble(8)+"]";
						}
						map1.put(rs.getString(1)+"1",data1);
						map2.put(rs.getString(1)+"2",data2);
						map3.put(rs.getString(1)+"3",data3);
						map4.put(rs.getString(1)+"4",data4);
						map5.put(rs.getString(1)+"5",data5);
						map6.put(rs.getString(1)+"6",data6);
						
						*/
						x+=1;
					}
					con.close();
					}else{
					Connection con=BaseDao.getConnection();
					String sql="select CONCAT(device_watercorp.corp_name,'<br>',road_name) AS corp_name,ifnull(status_hour,'"+new SimpleDateFormat("yy-MM-dd").format(new Date())+" 00') as status_hour,ph,turbidity,rc,d_oxygen,conductivity,orp,"+
							"C from device_device left JOIN (select * from hour_corp_param where status_hour like '%"+
							new SimpleDateFormat("yy-MM-dd").format(new Date())+"%') a on corp_name=device_device.road_name LEFT JOIN device_watercorp on device_watercorp.id=device_device.corp_id";
					System.out.println("2"+sql);
					//System.out.println(sql);
					PreparedStatement psta=con.prepareStatement(sql);
					ResultSet rs=psta.executeQuery(sql);
					boolean first=true;
					int x=0;
					while(rs.next()){
						map1.put(rs.getString(1),map1.get(rs.getString(1))==null?(data1+"["+Integer.valueOf(rs.getString(2).substring(9,11))+","+rs.getDouble(3)+"]"):(map1.get(rs.getString(1)).toString()+",["+Integer.valueOf(rs.getString(2).substring(9,11))+","+rs.getDouble(3)+"]"));
						//System.out.println(map1.values());
						map2.put(rs.getString(1),map2.get(rs.getString(1))==null?(data2+"["+Integer.valueOf(rs.getString(2).substring(9,11))+","+rs.getDouble(4)+"]"):(map2.get(rs.getString(1)).toString()+",["+Integer.valueOf(rs.getString(2).substring(9,11))+","+rs.getDouble(4)+"]"));
						map3.put(rs.getString(1),map3.get(rs.getString(1))==null?(data3+"["+Integer.valueOf(rs.getString(2).substring(9,11))+","+rs.getDouble(5)+"]"):(map3.get(rs.getString(1)).toString()+",["+Integer.valueOf(rs.getString(2).substring(9,11))+","+rs.getDouble(5)+"]"));
						map4.put(rs.getString(1),map4.get(rs.getString(1))==null?(data4+"["+Integer.valueOf(rs.getString(2).substring(9,11))+","+rs.getDouble(6)+"]"):(map4.get(rs.getString(1)).toString()+",["+Integer.valueOf(rs.getString(2).substring(9,11))+","+rs.getDouble(6)+"]"));
						map5.put(rs.getString(1),map5.get(rs.getString(1))==null?(data5+"["+Integer.valueOf(rs.getString(2).substring(9,11))+","+rs.getDouble(7)+"]"):(map5.get(rs.getString(1)).toString()+",["+Integer.valueOf(rs.getString(2).substring(9,11))+","+rs.getDouble(7)+"]"));
						map6.put(rs.getString(1),map6.get(rs.getString(1))==null?(data6+"["+Integer.valueOf(rs.getString(2).substring(9,11))+","+rs.getDouble(8)+"]"):(map6.get(rs.getString(1)).toString()+",["+Integer.valueOf(rs.getString(2).substring(9,11))+","+rs.getDouble(8)+"]"));
					}
					con.close();
					 data1="new Array(";
					 data2="new Array(";
					 data3="new Array(";
					 data4="new Array(";
					 data5="new Array(";
					 data6="new Array(";
					}
					session.setAttribute("data1",map1);
					session.setAttribute("data2",map2);
					session.setAttribute("data3",map3);
					session.setAttribute("data4",map4);
					session.setAttribute("data5",map5);
					session.setAttribute("data6",map6);
					session.setAttribute("sName",sName);
				%>
	
	
				var sName="<%=sName%>";
				$(".s_name").html('<br>'+sName);
function chartChan(num){
		tab="";
			var myChart = new JSChart('c1', 'line');
			

			
			var myChart2 = new JSChart('c2', 'line');

		

			
			var myChart3 = new JSChart('c3', 'line');

			
			var myChart4 = new JSChart('c4', 'line');

			
			

			
			var myChart5 = new JSChart('c5', 'line');

			
			var myChart6 = new JSChart('c6', 'line');

			myChart.setAxisNameY("");
			myChart.setAxisNameX("时");
			myChart.setTitle("PH");
			myChart.setBackgroundColor("#FFFFFF");
			myChart.setTitleColor("#0000FF");
			myChart.setIntervalEndY(14);
			myChart.setIntervalStartY(0);
			myChart.setIntervalStartX(00);
			myChart.setIntervalEndX(23);
			myChart.setTitleFontSize(18);  
			myChart.setTooltipFontSize(22);
			myChart.setSize(document.documentElement.clientWidth*0.85/3-25,(document.documentElement.clientHeight-157)/2);

			myChart2.setAxisNameY("");
			myChart2.setAxisNameX("时");
			myChart2.setTitle("浊度 (NTU)");
			myChart2.setBackgroundColor("#FFFFFF");
			myChart2.setTitleColor("#0000FF");
			myChart2.setIntervalEndY(20);
			myChart2.setIntervalStartY(0);
			myChart2.setIntervalStartX(00);
			myChart2.setIntervalEndX(23);
			myChart2.setTitleFontSize(18);  
			myChart2.setTooltipFontSize(22);
			myChart2.setSize(document.documentElement.clientWidth*0.85/3-25,(document.documentElement.clientHeight-157)/2);


			myChart3.setAxisNameY("");
			myChart3.setAxisNameX("时");
			myChart3.setTitle("总氯 (mg/L)");
			myChart3.setBackgroundColor("#FFFFFF");
			myChart3.setTitleColor("#0000FF");
			myChart3.setIntervalEndY(5);
			myChart3.setIntervalStartY(0);
			myChart3.setIntervalStartX(00);
			myChart3.setIntervalEndX(23);
			myChart3.setTitleFontSize(18);  
			myChart3.setTooltipFontSize(22);
			myChart3.setSize(document.documentElement.clientWidth*0.85/3-25,(document.documentElement.clientHeight-157)/2);

			myChart4.setAxisNameY("");
			myChart4.setAxisNameX("时");
			myChart4.setTitle("流量 (m3/h)");
			myChart4.setBackgroundColor("#FFFFFF");
			myChart4.setTitleColor("#0000FF");
			myChart4.setIntervalEndY(30);
			myChart4.setIntervalStartY(0);
			myChart4.setIntervalStartX(00);
			myChart4.setIntervalEndX(23);
			myChart4.setTitleFontSize(18);  
			myChart4.setTooltipFontSize(22);
			myChart4.setSize(document.documentElement.clientWidth*0.85/3-25,(document.documentElement.clientHeight-157)/2);

			myChart5.setAxisNameY("");
			myChart5.setAxisNameX("时");
			myChart5.setTitle("电导率 (ms/mV)");
			myChart5.setBackgroundColor("#FFFFFF");
			myChart5.setTitleColor("#0000FF");
			myChart5.setIntervalEndY(2000);
			myChart5.setIntervalStartY(0);
			myChart5.setTitleFontSize(18);  
			myChart5.setIntervalStartX(00);
			myChart5.setIntervalEndX(23);
			myChart5.setTooltipFontSize(22);
			myChart5.setSize(document.documentElement.clientWidth*0.85/3-25,(document.documentElement.clientHeight-157)/2);


			myChart6.setAxisNameY("");
			myChart6.setAxisNameX("时");
			myChart6.setTitle("压力 (kpa)");
			myChart6.setBackgroundColor("#FFFFFF");
			myChart6.setTitleColor("#0000FF");
			myChart6.setIntervalEndY(1000);
			myChart6.setIntervalStartX(00);
			myChart6.setIntervalEndX(23);
			myChart6.setIntervalStartY(0);
			myChart6.setTitleFontSize(18);  
			myChart6.setTooltipFontSize(22);
			myChart6.setSize(document.documentElement.clientWidth*0.85/3-25,(document.documentElement.clientHeight-157)/2);
			
			var lineColor=<%=lineColor.getlineColor(request.getSession().getServletContext().getRealPath("/")+"lineColor.txt")%>
				<%
				Iterator it=map1.entrySet().iterator();
				int x1=0;
				List roadname=new ArrayList();
				while(it.hasNext()){
				x1++;
				Map.Entry entry=(Map.Entry)it.next();
 					%>
 						var arr1=<%=entry.getValue()+")"%>
 						if(arr1.length==1){
 						}else{
 							if(num=='0'||num=='<%=entry.getKey().toString().replace("<br>", "") %>'){
						myChart.setDataArray(arr1,"<%=entry.getKey()%>");//"<%=entry.getKey()%>"
						myChart.setLineColor(lineColor[<%=x1%>],"<%=entry.getKey()%>");
						//$("#corpColor").append("<td style='background:"+lineColor[<%=x1%>]+"'></td>");
 							}
						}
						
						tab=tab+"<tr><td height=50 width=190><%=entry.getKey()%></td>"+"<td width=50><div onclick='dataC(this)' style='height:43px;background:"+lineColor[<%=x1%>]+"'><div style='display: none;'><%=entry.getKey()%></div></div></td></tr><tr><td></td></tr>";
 					<%
					}%>
					$("#corp").html(tab)
					//alert(tab);
					<%
				Iterator it2=map2.entrySet().iterator();
				int x2=0;
				while(it2.hasNext()){
					x2++;
				Map.Entry entry2=(Map.Entry)it2.next();
 					%>
 					var arr2=<%=entry2.getValue()+")"%>
 						if(arr2.length==1){}else{
 							if(num=='0'||num=='<%=entry2.getKey().toString().replace("<br>", "")%>'){
						myChart2.setDataArray(arr2,"<%=entry2.getKey()%>");
						myChart2.setLineColor(lineColor[<%=x2%>],"<%=entry2.getKey()%>");
 							}
						}
 					<%
					}%>
					
					<%
				Iterator it3=map3.entrySet().iterator();
				int x3=0;
				while(it3.hasNext()){
					x3++;
				Map.Entry entry3=(Map.Entry)it3.next();
 					%>
 					var arr3=<%=entry3.getValue()+")"%>
 						if(arr3.length==1){}else{
 							if(num=='0'||num=='<%=entry3.getKey().toString().replace("<br>", "")%>'){
						myChart3.setDataArray(arr3,"<%=entry3.getKey()%>");
						myChart3.setLineColor(lineColor[<%=x3%>],"<%=entry3.getKey()%>");
 							}
						}
 					<%
					}%>
					
					<%
				Iterator it4=map4.entrySet().iterator();
				int x4=0;
				while(it4.hasNext()){
					x4++;
				Map.Entry entry4=(Map.Entry)it4.next();
 					%>
 					var arr4=<%=entry4.getValue()+")"%>
 						if(arr4.length==1){}else{
 							if(num=='0'||num=='<%=entry4.getKey().toString().replace("<br>", "")%>'){
						myChart4.setDataArray(arr4,"<%=entry4.getKey()%>");
						myChart4.setLineColor(lineColor[<%=x4%>],"<%=entry4.getKey()%>");
 							}
						}
 					<%
					}%>
					
					<%
				Iterator it5=map5.entrySet().iterator();
				int x5=0;
				while(it5.hasNext()){
					x5++;
				Map.Entry entry5=(Map.Entry)it5.next();
 					%>
 					var arr5=<%=entry5.getValue()+")"%>
 						if(arr5.length==1){}else{
 							if(num=='0'||num=='<%=entry5.getKey().toString().replace("<br>", "")%>'){
						myChart5.setDataArray(arr5,"<%=entry5.getKey()%>");
						myChart5.setLineColor(lineColor[<%=x5%>],"<%=entry5.getKey()%>");
 							}
						}
 					<%
					}%>
					
					<%
				Iterator it6=map6.entrySet().iterator();
				int x6=0;
				while(it6.hasNext()){
					x6++;
				Map.Entry entry6=(Map.Entry)it6.next();
 					%>
 					var arr6=<%=entry6.getValue()+")"%>
 						if(arr6.length==1){}else{
 							if(num=='0'||num=='<%=entry6.getKey().toString().replace("<br>", "")%>'){
						myChart6.setDataArray(arr6,"<%=entry6.getKey()%>");
						myChart6.setLineColor(lineColor[<%=x6%>],"<%=entry6.getKey()%>");
 							}
						}
 					<%
					}%>


	myChart.draw();
	myChart2.draw();
	myChart3.draw();
	myChart4.draw();
	myChart5.draw();
	myChart6.draw();
								
																							
}
chartChan('0');																							
function getColor(name){
	if(name=="黄浦区"){
		return "#8E8E8E";
	}
	if(name=="卢湾区"){
		return "#EA0000";
	}
	if(name=="崇明县"){
		return "#FF359A";
	}
	if(name=="青浦区"){
		return "#FF00FF";
	}
	if(name=="松江区"){
		return "#921AFF";
	}
	if(name=="金山区"){
		return "#0000C6";
	}
	if(name=="浦东新区"){
		return "#0080FF";
	}
	if(name=="嘉定区"){
		return "#009393";
	}
	if(name=="闵行区"){
		return "#01B468";
	}
	if(name=="奉贤区"){
		return "#00A600";
	}
	if(name=="宝山区"){
		return "#64A600";
	}
	if(name=="杨浦区"){
		return "#737300";
	}
	if(name=="虹口区"){
		return "#C6A300";
	}
	if(name=="闸北区"){
		return "#BB5E00";
	}
	if(name=="普陀区"){
		return "#FF5809";
	}
	if(name=="静安区"){
		return "#804040";
	}
	if(name=="长宁区"){
		return "#AFAF61";
	}
	if(name=="徐汇区"){
		return "#CA8EC2";
	}
	
	if(name=="市北自来水公司"){
		return "#CA8EC2";
	}
	if(name=="市南自来水公司"){
		return "#737300";
	}
	if(name=="闵行自来水公司"){
		return "#C6A300";
	}
	if(name=="浦东威立雅公司"){
		return "#BB5E00";
	}
	if(name=="奉贤自来水公司"){
		return "#FF5809";
	}
	if(name=="松江自来水公司"){
		return "#804040";
	}
	if(name=="金山自来水公司"){
		return "#AFAF61";
	}
}
Wheight=document.documentElement.clientWidth;
$("#tabtr").css('height',510)
function dataC(h){
	//alert($(h).text());
	chartChan($(h).text());
}
				</script>
</html>