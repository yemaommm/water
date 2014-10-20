<%@page import="java.text.SimpleDateFormat"%>
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<jsp:directive.page import="java.sql.Connection"/>
<jsp:directive.page import="com.rfidcer.dao.BaseDao"/>
<jsp:directive.page import="java.sql.PreparedStatement"/>
<jsp:directive.page import="java.sql.ResultSet"/>
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
.w_content{border: 1px solid white;padding-left: 30px;width:98%;}
.r_top{width: 100%;height: 50px;margin: 10px 0 5px 0;}
.r_top input{float: left;margin-left: 35px;width: 160px;height:40px;text-align: center;font-weight: bold;font-size: 18px;}
.r_top select{float: left;margin-left: 50px;width: 90px;height: 30px;text-align: center;font-weight: bold;font-size: 18px;}
.r_con{width:99%;height: auto;margin: auto;margin-bottom: 30px;}
.r_con table{text-align: center;width: 100%;color: black;font-weight: bold;font-size: 20px;}
.r_con table tr th{height: 50px;}
.r_con table tr td{height: 40px;}
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
.sName{font-size:28px;color:white;text-align:center;margin:20px 0 20px 0;font-weight:bold;}
</style>
</head>
<%
				String data1="new Array(";
					String data2="new Array(";
					String data3="new Array(";
					String data4="new Array(";
					String data5="new Array(";
					String data6="new Array(";
					String data7="new Array(";
					String sName="";
				if(true){
				Connection con=BaseDao.getConnection();
				String table=request.getParameter("table");
				String sql="";
					if(table.equals("hour_subcorp_param")){
							 sql="select * from "+request.getParameter("table")+" where status_hour like '%"+new SimpleDateFormat("yy-MM-dd").format(new Date())+"%' and subcorp_name =(select sub_corp_name from device_watersubcorp where device_watersubcorp.id='"+request.getParameter("corpId")+"')";
							 //sql="select * from "+request.getParameter("table")+" where SUBSTR(status_hour , 1 , 8)= SUBSTR(CURDATE() , 3 , 10) and subcorp_name =(select sub_corp_name from device_watersubcorp where device_watersubcorp.id='"+request.getParameter("corpId")+"')";
					}
					System.out.println("1:"+sql);
					if(table.equals("hour_corp_param")){
							 sql="select hour_corp_param.*,road_name_id.corp_name cn from "+request.getParameter("table")+" LEFT JOIN road_name_id on road_name_id.road_name =hour_corp_param.corp_name where status_hour like '%"+new SimpleDateFormat("yy-MM-dd").format(new Date())+"%' and road_name_id.id ='"+request.getParameter("corpId")+"'";
							 //sql="select * from "+request.getParameter("table")+" where SUBSTR(status_hour , 1 , 8)= SUBSTR(CURDATE() , 3 , 10) and corp_name =(select corp_name from device_watercorp where device_watercorp.id='"+request.getParameter("corpId")+"')";
					}
					System.out.println("2:"+sql);
					if(table.equals("hour_area_param")){
							 sql="select * from "+request.getParameter("table")+" where status_hour like '%"+new SimpleDateFormat("yy-MM-dd").format(new Date())+"%' and area_name =(select area_name from device_area where device_area.id='"+request.getParameter("areaId")+"')";
							 //sql="select * from "+request.getParameter("table")+" where SUBSTR(status_hour , 1 , 8)= SUBSTR(CURDATE() , 3 , 10) and area_name =(select area_name from device_area where device_area.id='"+request.getParameter("areaId")+"')";
					}
					System.out.println("3:"+sql);
					PreparedStatement psta=con.prepareStatement(sql);
					ResultSet rs=psta.executeQuery(sql);
					
					boolean first=true;
					int x=0;
					while(rs.next()){
					sName=rs.getString(1);
						if(first){
						data1+="["+rs.getString("status_hour").substring(9,11)+","+rs.getDouble(3)+"]";
						data2+="["+rs.getString("status_hour").substring(9,11)+","+rs.getDouble(4)+"]";
						data3+="["+rs.getString("status_hour").substring(9,11)+","+rs.getDouble(5)+"]";
						data4+="["+rs.getString("status_hour").substring(9,11)+","+rs.getDouble(6)+"]";
						data5+="["+rs.getString("status_hour").substring(9,11)+","+rs.getDouble(7)+"]";
						data6+="["+rs.getString("status_hour").substring(9,11)+","+rs.getDouble(8)+"]";
						data7+="["+rs.getString("status_hour").substring(9,11)+","+rs.getDouble(9)+"]";
						first=false;
						}else{
						data1+=" ,["+rs.getString("status_hour").substring(9,11)+","+rs.getDouble(3)+"]";
						data2+=" ,["+rs.getString("status_hour").substring(9,11)+","+rs.getDouble(4)+"]";
						data3+=" ,["+rs.getString("status_hour").substring(9,11)+","+rs.getDouble(5)+"]";
						data4+=" ,["+rs.getString("status_hour").substring(9,11)+","+rs.getDouble(6)+"]";
						data5+=" ,["+rs.getString("status_hour").substring(9,11)+","+rs.getDouble(7)+"]";
						data6+=" ,["+rs.getString("status_hour").substring(9,11)+","+rs.getDouble(8)+"]";
						data7+=" ,["+rs.getString("status_hour").substring(9,11)+","+rs.getDouble(9)+"]";
						}
						x+=1;
					}
					con.close();
					data1+=");"; 
					data2+=");"; 
					data3+=");"; 
					data4+=");"; 
					data5+=");"; 
					data6+=");"; 
					data7+=");"; 
					
					session.setAttribute("data1",data1);
					session.setAttribute("data2",data2);
					session.setAttribute("data3",data3);
					session.setAttribute("data4",data4);
					session.setAttribute("data5",data5);
					session.setAttribute("data6",data6);
					session.setAttribute("data7",data7);
				}
				%>
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
			<div class="r_top">
				<input type='button' id="myBack" class='backs' value='返回' onclick="location.href='aa.jsp'"/>
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<select style="display:none" id="data" onchange="change();">
				<option value="data1">PH</option>
				<option value="data2">浊度(NTU)</option>
				<option value="data3">总氯(mg/L)</option>
				<option value="data4">流量(m3/h)</option>
				<option value="data5">电导率(ms/mV)</option>
				<option value="data6">压力(kpa)</option>
				<option value="data7">水温</option>
				</select>
					 
				<input type='button' class='backs' value='PH' onclick="javascript:location.href='chartDetail.jsp?data=data1&corpId=<%=request.getParameter("corpId") %>&issub=<%=request.getParameter("issub") %>&areaId=<%=request.getParameter("areaId")  %>&table=<%=request.getParameter("table") %>&name=sName'"/>
				<input type='button' class='backs' value='浊度' onclick="javascript:location.href='chartDetail.jsp?data=data2&corpId=<%=request.getParameter("corpId") %>&issub=<%=request.getParameter("issub") %>&areaId=<%=request.getParameter("areaId")  %>&table=<%=request.getParameter("table") %>&name=sName'"/>
				<input type='button' class='backs' value='总氯' onclick="javascript:location.href='chartDetail.jsp?data=data3&corpId=<%=request.getParameter("corpId") %>&issub=<%=request.getParameter("issub") %>&areaId=<%=request.getParameter("areaId")  %>&table=<%=request.getParameter("table") %>&name=sName'"/>
				<input type='button' class='backs' value='流量' onclick="javascript:location.href='chartDetail.jsp?data=data4&corpId=<%=request.getParameter("corpId") %>&issub=<%=request.getParameter("issub") %>&areaId=<%=request.getParameter("areaId")  %>&table=<%=request.getParameter("table") %>&name=sName'"/>
				<input type='button' class='backs' value='电导率' onclick="javascript:location.href='chartDetail.jsp?data=data5&corpId=<%=request.getParameter("corpId") %>&issub=<%=request.getParameter("issub") %>&areaId=<%=request.getParameter("areaId")  %>&table=<%=request.getParameter("table") %>&name=sName'"/>
				<input type='button' class='backs' value='压力' onclick="javascript:location.href='chartDetail.jsp?data=data6&corpId=<%=request.getParameter("corpId") %>&issub=<%=request.getParameter("issub") %>&areaId=<%=request.getParameter("areaId")  %>&table=<%=request.getParameter("table") %>&name=sName'"/>
				<input type='button' class='backs' value='水温' onclick="javascript:location.href='chartDetail.jsp?data=data7&corpId=<%=request.getParameter("corpId") %>&issub=<%=request.getParameter("issub") %>&areaId=<%=request.getParameter("areaId")  %>&table=<%=request.getParameter("table") %>&name=sName'"/>
				<input type='button' class='backs' value='刷新' onclick="javascript:location.reload();"/>
				
			</div>
			<center><span class="sName">2</span>
				<span><font style="font-size:24px;display:block;text-align:right;" color="#FFFF99"><%=new SimpleDateFormat("yyyy-MM-dd").format(new Date()) %>&nbsp;&nbsp;&nbsp;</font></span>
				</center>
			<div  id="r_con" class="r_con">
			
			</div>
		</div>
	</div>
</body>
<script type="text/javascript">
$("#data").val("<%=request.getParameter("data")%>"); 
$("#r_con").empty();
var name="<%=session.getAttribute("sName")==null?"":session.getAttribute("sName").toString()%>";


$(".sName").html('<br>'+name);
var select = document.getElementById("data");
var index = select.selectedIndex;

    		var text = select.options[index].text;
			var myChart = new JSChart('r_con', 'line');
			var datas=<%=session.getAttribute(request.getParameter("data")).toString()%>
			//alert(datas);
			<% System.out.println(session.getAttribute(request.getParameter("data")).toString()); %>
				myChart.setDataArray(datas);
			
			myChart.setAxisNameY("");
			myChart.setAxisNameX("(时)");
			myChart.setTitle(text);
			myChart.setBackgroundColor("#FFFFFF");
			myChart.setLineColor("#9900FF","first line");
			myChart.setAxisValuesColor('#454545');
			myChart.setTitleColor("#0000FF");
			myChart.setTitleFontSize(20); 
			myChart.setIntervalStartX(00);
			myChart.setIntervalEndX(23);
			myChart.setTooltipFontSize(22);
			myChart.setAxisValuesNumberX(24);
	
			myChart.resize(document.documentElement.clientWidth-60, document.documentElement.clientHeight-300);
			if(index==0){
				
			myChart.setIntervalEndY(14);
			myChart.setIntervalStartY(0);
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
			
			
			myChart.setShowXValues(true);
			//setShowYValues(true);
			myChart.setFlagColor('#9D16FC');
			myChart.setFlagRadius(4);
					<%
				String str=session.getAttribute(request.getParameter("data")).toString();
				
				if(str==null||str.trim().equals("new Array();")){
				out.println("alert('没有可以显示的数据');history.back();</script>");
				return;
				}
				String strs[]=str.split(" ,");
				
				for(String st:strs){
				%>
				myChart.setTooltip(<%=(st.substring(st.indexOf("["),st.lastIndexOf("]")+1))%>);
				<%
				}
			%>
			
			
			myChart.draw();
			
			function change(){
			location.href="chartDetail.jsp?data="+$("#data").val()+"&corpId=<%=request.getParameter("corpId") %>&issub=&corpId=<%=request.getParameter("issub") %>";
			}

</script>
</html>