<%@page import="com.rfidcer.dao.lineColor"%>
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<jsp:directive.page import="java.sql.Connection"/>
<jsp:directive.page import="com.rfidcer.dao.BaseDao"/>
<jsp:directive.page import="java.sql.PreparedStatement"/>
<jsp:directive.page import="java.sql.ResultSet"/>
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
.w_content{padding: 10px;width:98%;margin:auto;padding-left:20px;}
.r_top{width: 85%;height: 50px;margin: 20px 0 25px 0;}
.r_top input{float: left;margin-left: 5px;width: 160px;height:40px;text-align: center;font-weight: bold;font-size: 18px;}
.r_top select{float: left;margin-left: 50px;width: 90px;height: 30px;text-align: center;font-weight: bold;font-size: 18px;}
.r_con{width:90%;height: auto;margin: auto;margin-bottom: 0px;margin-left:50px;border:1px solid red;}
.r_con table{text-align: center;width: 100%;color: black;font-weight: bold;font-size: 20px;}
.r_con table tr th{height: 50px;}
.r_con table tr td{height: 40px;}
.ri{border-left:2px solid white;}
.r_con table tr td{background-color:expression((this.parentElement.sectionRowIndex%2==0)?'#efffa7':'#fff');}
.backs{float: right;margin-right:8px;}
.maspan{color: black;padding-left: 50px;font-size: 18px;font-weight: bold;}
.r_con1{width: 100%;height: auto;}
.r_con1 table{width: 100%;height: auto;}
.r_con1 talbe tr td{width: 100px;height: 30px;border: 1px solid red;}
.r_con2{width: 100%;height: auto;margin-bottom: 20px;margin-top: 50px;}
.r_con2 input{float: left;margin-left: 100px;width: 150px;height: 50px;margin-bottom: 20px;font-size: 18px;}
.r_con1 table tr{color: white;}
#tab1 {text-align: center;color: white;font-size: 18px;}
.sName{font-size:28px;color:white;text-align:center;margin:20px 0 20px 0;font-weight:bold;}
.tab2 div{box-shadow: inset 1px -1px 1px #444, inset -1px 1px 1px #444;height: 55px;line-height: 55px}
.tab1 td{line-height: 26px;}
.tab1 tr{height: 14px}
</style>
</head>
<body>
<%
				String data1="new Array(";
					String data2="new Array(";
					String data3="new Array(";
					String data4="new Array(";
					String data5="new Array(";
					String data6="new Array(";
					String data7="new Array(";
					Map map1=new HashMap();
					Map map2=new HashMap();
					Map map3=new HashMap();
					Map map4=new HashMap();
					Map map5=new HashMap();
					Map map6=new HashMap();
					Map map7=new HashMap();
				if(request.getParameter("type")==null&&request.getParameter("areaAll")==null&&request.getParameter("corpAll")==null){ 
					request.getRequestDispatcher("aa.jsp").forward(request,response);
				}else if(request.getParameter("type")==null&&request.getParameter("areaAll").equals("1")) {
					Connection con=BaseDao.getConnection();
					String sql="select * from hour_area_param where status_hour like '%"+new SimpleDateFormat("yy-MM-dd").format(new Date())+"%'";
					System.out.println("cAD"+sql);
					PreparedStatement psta=con.prepareStatement(sql);
					ResultSet rs=psta.executeQuery(sql);
					boolean first=true;
					int x=0;
					while(rs.next()){
						//if(first){
						map1.put(rs.getString(1),map1.get(rs.getString(1))==null?(data1+"["+rs.getString(2).substring(9,11)+","+rs.getDouble(3)+"]"):(map1.get(rs.getString(1)).toString()+" ,["+rs.getString(2).substring(9,11)+","+rs.getDouble(3)+"]"));
						map2.put(rs.getString(1),map2.get(rs.getString(1))==null?(data2+"["+rs.getString(2).substring(9,11)+","+rs.getDouble(4)+"]"):(map2.get(rs.getString(1)).toString()+" ,["+rs.getString(2).substring(9,11)+","+rs.getDouble(4)+"]"));
						map3.put(rs.getString(1),map3.get(rs.getString(1))==null?(data3+"["+rs.getString(2).substring(9,11)+","+rs.getDouble(5)+"]"):(map3.get(rs.getString(1)).toString()+" ,["+rs.getString(2).substring(9,11)+","+rs.getDouble(5)+"]"));
						map4.put(rs.getString(1),map4.get(rs.getString(1))==null?(data4+"["+rs.getString(2).substring(9,11)+","+rs.getDouble(6)+"]"):(map4.get(rs.getString(1)).toString()+" ,["+rs.getString(2).substring(9,11)+","+rs.getDouble(6)+"]"));
						map5.put(rs.getString(1),map5.get(rs.getString(1))==null?(data5+"["+rs.getString(2).substring(9,11)+","+rs.getDouble(7)+"]"):(map5.get(rs.getString(1)).toString()+" ,["+rs.getString(2).substring(9,11)+","+rs.getDouble(7)+"]"));
						map6.put(rs.getString(1),map6.get(rs.getString(1))==null?(data6+"["+rs.getString(2).substring(9,11)+","+rs.getDouble(8)+"]"):(map6.get(rs.getString(1)).toString()+" ,["+rs.getString(2).substring(9,11)+","+rs.getDouble(8)+"]"));
						map7.put(rs.getString(1),map7.get(rs.getString(1))==null?(data7+"["+rs.getString(2).substring(9,11)+","+rs.getDouble(9)+"]"):(map7.get(rs.getString(1)).toString()+" ,["+rs.getString(2).substring(9,11)+","+rs.getDouble(9)+"]"));
					//	data2+="["+rs.getString(2).substring(9,11)+","+rs.getDouble(4)+"]";
						//data3+="["+rs.getString(2).substring(9,11)+","+rs.getDouble(5)+"]";
						//data4+="["+rs.getString(2).substring(9,11)+","+rs.getDouble(6)+"]";
						//data5+="["+rs.getString(2).substring(9,11)+","+rs.getDouble(7)+"]";
						//data6+="["+rs.getString(2).substring(9,11)+","+rs.getDouble(8)+"]";
						//first=false;
						//}
						/*else{
						data1+=" ,["+rs.getString(2).substring(9,11)+","+rs.getDouble(3)+"]";
						data2+=" ,["+rs.getString(2).substring(9,11)+","+rs.getDouble(4)+"]";
						data3+=" ,["+rs.getString(2).substring(9,11)+","+rs.getDouble(5)+"]";
						data4+=" ,["+rs.getString(2).substring(9,11)+","+rs.getDouble(6)+"]";
						data5+=" ,["+rs.getString(2).substring(9,11)+","+rs.getDouble(7)+"]";
						data6+=" ,["+rs.getString(2).substring(9,11)+","+rs.getDouble(8)+"]";
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
					String sql="select concat(device_watercorp.corp_name,'<br>',road_name) AS corp_name,ifnull(status_hour,'"+new SimpleDateFormat("yy-MM-dd").format(new Date())+" 00') as status_hour,ph,turbidity,rc,d_oxygen,conductivity,orp,"+
							"C from device_device left JOIN (select * from hour_corp_param where status_hour like '%"+
							new SimpleDateFormat("yy-MM-dd").format(new Date())+"%') a on corp_name=device_device.road_name LEFT JOIN device_watercorp on device_watercorp.id=device_device.corp_id";
					System.out.println(sql);
					PreparedStatement psta=con.prepareStatement(sql);
					ResultSet rs=psta.executeQuery(sql);
					boolean first=true;
					int x=0;
					while(rs.next()){
						map1.put(rs.getString(1),map1.get(rs.getString(1))==null?(data1+"["+rs.getString(2).substring(9,11)+","+rs.getDouble(3)+"]"):(map1.get(rs.getString(1)).toString()+" ,["+rs.getString(2).substring(9,11)+","+rs.getDouble(3)+"]"));
						map2.put(rs.getString(1),map2.get(rs.getString(1))==null?(data2+"["+rs.getString(2).substring(9,11)+","+rs.getDouble(4)+"]"):(map2.get(rs.getString(1)).toString()+" ,["+rs.getString(2).substring(9,11)+","+rs.getDouble(4)+"]"));
						map3.put(rs.getString(1),map3.get(rs.getString(1))==null?(data3+"["+rs.getString(2).substring(9,11)+","+rs.getDouble(5)+"]"):(map3.get(rs.getString(1)).toString()+" ,["+rs.getString(2).substring(9,11)+","+rs.getDouble(5)+"]"));
						map4.put(rs.getString(1),map4.get(rs.getString(1))==null?(data4+"["+rs.getString(2).substring(9,11)+","+rs.getDouble(6)+"]"):(map4.get(rs.getString(1)).toString()+" ,["+rs.getString(2).substring(9,11)+","+rs.getDouble(6)+"]"));
						map5.put(rs.getString(1),map5.get(rs.getString(1))==null?(data5+"["+rs.getString(2).substring(9,11)+","+rs.getDouble(7)+"]"):(map5.get(rs.getString(1)).toString()+" ,["+rs.getString(2).substring(9,11)+","+rs.getDouble(7)+"]"));
						map6.put(rs.getString(1),map6.get(rs.getString(1))==null?(data6+"["+rs.getString(2).substring(9,11)+","+rs.getDouble(8)+"]"):(map6.get(rs.getString(1)).toString()+" ,["+rs.getString(2).substring(9,11)+","+rs.getDouble(8)+"]"));
						map7.put(rs.getString(1),map7.get(rs.getString(1))==null?(data7+"["+rs.getString(2).substring(9,11)+","+rs.getDouble(9)+"]"):(map7.get(rs.getString(1)).toString()+" ,["+rs.getString(2).substring(9,11)+","+rs.getDouble(9)+"]"));
					}
					con.close();
					 data1="new Array(";
					 data2="new Array(";
					 data3="new Array(";
					 data4="new Array(";
					 data5="new Array(";
					 data6="new Array(";
					 data7="new Array(";
					}
					session.setAttribute("data1",map1);
					session.setAttribute("data2",map2);
					session.setAttribute("data3",map3);
					session.setAttribute("data4",map4);
					session.setAttribute("data5",map5);
					session.setAttribute("data6",map6);
					session.setAttribute("data7",map7);
				%>
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
			<div class="r_top">
			<!-- 
				<input type='button' id="myBack" class='backs' value='返回' onclick="location.href='aa.jsp'"/>
			 -->
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				<select style="display:none" id="data" onchange="change();">
				<option value="data1">PH</option>
				<option value="data2">浊度(NTU)</option>
				<option value="data3">总氯(mg/L)</option>
				<option value="data4">流量(m3/h)</option>
				<option value="data5">电导率(ms/mV)</option>
				<option value="data6">压力(kpa)</option>
				<option value="data7">水温</option>
				</select>
				 <center>
				<input type='button' class='backs' value='总体' onclick="javascript:location.href='/water/chartAllArea.jsp?corpAll=1'"/>
				<input type='button' class='backs' value='PH' onclick="javascript:location.href='chartAllDetail.jsp?data=data1&areaAll=<%=request.getParameter("areaAll") %>&corpAll=<%=request.getParameter("corpAll") %>'"/>
				<input type='button' class='backs' value='浊度' onclick="javascript:location.href='chartAllDetail.jsp?data=data2&areaAll=<%=request.getParameter("areaAll") %>&corpAll=<%=request.getParameter("corpAll") %>'"/>
				<input type='button' class='backs' value='总氯' onclick="javascript:location.href='chartAllDetail.jsp?data=data3&areaAll=<%=request.getParameter("areaAll") %>&corpAll=<%=request.getParameter("corpAll") %>'"/>
				<input type='button' class='backs' value='流量' onclick="javascript:location.href='chartAllDetail.jsp?data=data4&areaAll=<%=request.getParameter("areaAll") %>&corpAll=<%=request.getParameter("corpAll") %>'"/>
				<input type='button' class='backs' value='电导率 ' onclick="javascript:location.href='chartAllDetail.jsp?data=data5&areaAll=<%=request.getParameter("areaAll") %>&corpAll=<%=request.getParameter("corpAll") %>'"/>
				<input type='button' class='backs' value='ORP' onclick="javascript:location.href='chartAllDetail.jsp?data=data6&areaAll=<%=request.getParameter("areaAll") %>&corpAll=<%=request.getParameter("corpAll") %>'"/>
				<input type='button' class='backs' value='水温' onclick="javascript:location.href='chartAllDetail.jsp?data=data7&areaAll=<%=request.getParameter("areaAll") %>&corpAll=<%=request.getParameter("corpAll") %>'"/>
				<input type='button' class='backs' value='刷新' onclick="javascript:location.reload();"/>
			</center><center><span class="sName"></span>
			
			</div>
			<br>&nbsp;<div id="r_con" class="r_con">
					
	
			</div>
				<div style="position: absolute;top:25px;left:85%;font-size: 18px;color: white;height: 100%">
					<table class="tab2" style="text-align: center;margin-left: -10px"><tr style="font-size: 20px;"><td><div onclick="chartChan('0')">图表标记</div></td></tr>
						<tr>
							<td id="tabtr" style="height: 500px;">
								<div style="overflow:auto;height: 100%">
									<table id="tab1" class="tab1" ><tr class="ri" id="corp" class="corp"></tr><tr id="corpColor"></tr></table>
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
$("#data").val("<%=request.getParameter("data")%>"); 
$("#r_con").empty();

var name="<%=session.getAttribute("sName")==null?"":session.getAttribute("sName").toString()%>";


$(".sName").html('<br>'+name);

function chartChan(num){
			var select = document.getElementById("data");
			var index = select.selectedIndex;
    		var text = select.options[index].text;
			var myChart = new JSChart('r_con', 'line');
			tab="";
			myChart.setAxisNameY("");
			myChart.setAxisNameX("时");
			myChart.setTitle(text);
			myChart.setTitleFontSize(20);  
			myChart.setBackgroundColor("#FFFFFF");
			myChart.setTitleColor("#0000FF");
			myChart.setIntervalEndY(14);
			myChart.setTooltipFontSize(22);
			myChart.setGraphLabelFontSize(50)
			myChart.setIntervalStartY(0);
			myChart.setIntervalStartX(00);
			myChart.setIntervalEndX(23);
			myChart.setAxisValuesNumberX(24);
			myChart.resize(document.documentElement.clientWidth*0.85-50, document.documentElement.clientHeight-250);
			var lineColor=<%=lineColor.getlineColor(request.getSession().getServletContext().getRealPath("/")+"lineColor.txt")%>;
			<%
				Map map=(Map)session.getAttribute(request.getParameter("data"));
				Iterator it=map.entrySet().iterator();
				int x1=0;
				while(it.hasNext()){
					x1++;
				Map.Entry entry=(Map.Entry)it.next();
 					%>
 					//alert(num=='<%=entry.getKey()%>')
 					if(num=='0'||num=='<%=entry.getKey().toString().replace("<br>", "")%>'){
 						var arr=<%=entry.getValue()+")"%>
 						if(arr.length==1){}else{
						myChart.setDataArray(<%=entry.getValue()+")"%>,"<%=entry.getKey()%>");//<%=entry.getKey()%>
						myChart.setLineColor(lineColor[<%=x1%>],"<%=entry.getKey()%>");
						myChart.setFlagColor(lineColor[<%=x1%>],"<%=entry.getKey()%>");
 					}
						}
				if(index==0){
				
			
				}
if(index==1){
	
			myChart.setIntervalEndY(20);
			myChart.setIntervalStartY(0);
}
if(index==2){
	
			myChart.setIntervalEndY(5);
			myChart.setIntervalStartY(0);
}
if(index==3){
	
			myChart.setIntervalEndY(30);
			myChart.setIntervalStartY(0);
}
if(index==4){
	
			myChart.setIntervalEndY(2000);
			myChart.setIntervalStartY(0);
}
if(index==5){
	
			myChart.setIntervalEndY(1000);
			myChart.setIntervalStartY(0);
}
if(index==6){
	
	myChart.setIntervalEndY(30);
	myChart.setIntervalStartY(0);
}

						myChart.setFlagRadius(4);
						<%
				String str=entry.getValue().toString();
				String strs[]=str.split(" ,");
				for(String st:strs){
				%>
				myChart.setTooltip(<%=(st.substring(st.indexOf("["),st.lastIndexOf("]")))%>,"<%=entry.getKey()%>"]);
				<%
				}
			%>
			
			//alert(lineColor[<%=x1%>]);
			tab=tab+"<tr><td height=50 width=190><%=entry.getKey()%></td>"+"<td width=50><div onclick='dataC(this)' style='height:43px;background:"+lineColor[<%=x1%>]+"'><div style='display: none;'><%=entry.getKey()%></div></div></td></tr><tr><td></td></tr>"
 					<%
					}%>
					$("#tab1").html(tab)
					
			myChart.setShowXValues(true);
			myChart.draw();
			function change(){
			location.href="chartDetail.jsp?data="+$("#data").val();
			}
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