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
.w_content{border: 1px solid white;width:99%;padding-left:10px;}
.r_top{width: 100%;height: 50px;margin: 20px 0 5px 0;}
.r_top input{float: left;margin-left: 65px;width: 160px;height:40px;text-align: center;font-weight: bold;font-size: 18px;}
.r_con{width:100%;height: auto;margin: auto;margin-bottom: 30px;}
.r_con table{text-align: center;width: 100%;color: black;font-weight: bold;font-size: 20px;}
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
</style>
</head>
<body>
<%
		if(request.getParameter("sub")!=null&&request.getParameter("sub").equals("1")){
			response.sendRedirect("chartsub.jsp?id="+request.getParameter("corpId"));
		}
		String table="";
		if(request.getParameter("type")==null&&request.getParameter("areaId")!=null&&request.getParameter("corpId")==null){
		table="hour_area_param";
		}else{
		table="hour_corp_param";
		}
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
				<input type='button' id="myBack" class='backs' value='返回' onclick="history.go(-1);"/>
				<div><span class="s_name"></span>
				<span><font style="font-size:24px;display:block;text-align:right;" color="#FFFF99"><%=new SimpleDateFormat("yyyy-MM-dd").format(new Date()) %></font>
				</span></div>
			</div>
			<br><div  id="r_con" class="r_con">
			<table>
			<tr><td onclick="location.href='chartDetail.jsp?data=data1&corpId=<%=request.getParameter("corpId") %>&areaId=<%=request.getParameter("areaId") %>&table=<%=table %>&name=sName'"><div id="c1"></div></td><td onclick="location.href='chartDetail.jsp?data=data2&corpId=<%=request.getParameter("corpId") %>&areaId=<%=request.getParameter("areaId")  %>&table=<%=table %>&name=sName'"><div id="c2"></div></td><td onclick="location.href='chartDetail.jsp?data=data3&corpId=<%=request.getParameter("corpId") %>&areaId=<%=request.getParameter("areaId") %>&table=<%=table %>&name=sName '"><div id="c3"></div></td></tr>
			<tr><td onclick="location.href='chartDetail.jsp?data=data4&corpId=<%=request.getParameter("corpId") %>&areaId=<%=request.getParameter("areaId")  %>&table=<%=table %>&name=sName'"><div id="c4"></div></td><td onclick="location.href='chartDetail.jsp?data=data5&corpId=<%=request.getParameter("corpId") %>&areaId=<%=request.getParameter("areaId") %>&table=<%=table %>&name=sName'"><div id="c5"></div></td><td onclick="location.href='chartDetail.jsp?data=data6&corpId=<%=request.getParameter("corpId") %>&areaId=<%=request.getParameter("areaId")  %>&table=<%=table %>&name=sName'"><div id="c6"></div></td></tr>
			</table>
			</div>
		</div>
	</div>
</body>
<script type="text/javascript">
				<%
				String data1="new Array(";
					String data2="new Array(";
					String data3="new Array(";
					String data4="new Array(";
					String data5="new Array(";
					String data6="new Array(";
					String sName="";
					
					
				if(request.getParameter("type")==null&&request.getParameter("areaId")==null&&request.getParameter("corpId")==null){ 
					request.getRequestDispatcher("aa.jsp").forward(request,response);
					System.out.println("0");
				}else if(request.getParameter("type")==null&&request.getParameter("areaId")!=null&&request.getParameter("corpId")==null) {
					Connection con=BaseDao.getConnection();
					String sql="select * from hour_area_param "
						+"where status_hour like '%"+new SimpleDateFormat("yy-MM-dd").format(new Date())+"%' and  area_name =(select AREA_name from device_area where device_area.area_name=hour_area_param.AREA_name and device_area.id ='"+request.getParameter("areaId")+"')";
						//+"where SUBSTR(status_hour , 7 , 2)= SUBSTR(CURDATE() , 9 , 2) and  area_name =(select AREA_name from device_area where device_area.area_name=hour_area_param.AREA_name and device_area.id ='"+request.getParameter("areaId")+"')";
					System.out.println("1:"+sql);
					PreparedStatement psta=con.prepareStatement(sql);
					ResultSet rs=psta.executeQuery(sql);
					
					boolean first=true;
					int x=0;
					while(rs.next()){
					sName=rs.getString(1);
						if(first){
						data1+="['"+Integer.valueOf(rs.getString(2).substring(9))+"',"+rs.getDouble(3)+"]";
						data2+="['"+Integer.valueOf(rs.getString(2).substring(9))+"',"+rs.getDouble(4)+"]";
						data3+="['"+Integer.valueOf(rs.getString(2).substring(9))+"',"+rs.getDouble(5)+"]";
						data4+="['"+Integer.valueOf(rs.getString(2).substring(9))+"',"+rs.getDouble(6)+"]";
						data5+="['"+Integer.valueOf(rs.getString(2).substring(9))+"',"+rs.getDouble(7)+"]";
						data6+="['"+Integer.valueOf(rs.getString(2).substring(9))+"',"+rs.getDouble(8)+"]";
						first=false;
						}else{
						data1+=",['"+Integer.valueOf(rs.getString(2).substring(9))+"',"+rs.getDouble(3)+"]";
						data2+=",['"+Integer.valueOf(rs.getString(2).substring(9))+"',"+rs.getDouble(4)+"]";
						data3+=",['"+Integer.valueOf(rs.getString(2).substring(9))+"',"+rs.getDouble(5)+"]";
						data4+=",['"+Integer.valueOf(rs.getString(2).substring(9))+"',"+rs.getDouble(6)+"]";
						data5+=",['"+Integer.valueOf(rs.getString(2).substring(9))+"',"+rs.getDouble(7)+"]";
						data6+=",['"+Integer.valueOf(rs.getString(2).substring(9))+"',"+rs.getDouble(8)+"]";
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
					}else{
					Connection con=BaseDao.getConnection();
					String sql="select hour_corp_param.*,road_name_id.corp_name cn from hour_corp_param LEFT JOIN road_name_id on road_name_id.road_name =hour_corp_param.corp_name where status_hour like '%"+new SimpleDateFormat("yy-MM-dd").format(new Date())+"%' and road_name_id.id ='"+request.getParameter("corpId")+"'";
						//+"where SUBSTR(status_hour , 7 , 2)= SUBSTR(CURDATE() , 9 , 2) and corp_name =(select corp_name from device_watercorp where device_watercorp.corp_name=hour_corp_param.corp_name and device_watercorp.id ='"+request.getParameter("corpId")+"')";
					System.out.println("2:"+sql);
					
					PreparedStatement psta=con.prepareStatement(sql);
					ResultSet rs=psta.executeQuery(sql);
					
					boolean first=true;
					int x=0;
					while(rs.next()){
						//System.out.println(rs.getString(2).substring(9)+","+rs.getDouble(3));
						sName=rs.getString("cn");
						if(first){
						data1+="['"+Integer.valueOf(rs.getString(2).substring(9))+"',"+rs.getDouble(3)+"]";
						data2+="['"+Integer.valueOf(rs.getString(2).substring(9))+"',"+rs.getDouble(4)+"]";
						data3+="['"+Integer.valueOf(rs.getString(2).substring(9))+"',"+rs.getDouble(5)+"]";
						data4+="['"+Integer.valueOf(rs.getString(2).substring(9))+"',"+rs.getDouble(6)+"]";
						data5+="['"+Integer.valueOf(rs.getString(2).substring(9))+"',"+rs.getDouble(7)+"]";
						data6+="['"+Integer.valueOf(rs.getString(2).substring(9))+"',"+rs.getDouble(8)+"]";
						first=false;
						}else{
						data1+=",['"+Integer.valueOf(rs.getString(2).substring(9))+"',"+rs.getDouble(3)+"]";
						data2+=",['"+Integer.valueOf(rs.getString(2).substring(9))+"',"+rs.getDouble(4)+"]";
						data3+=",['"+Integer.valueOf(rs.getString(2).substring(9))+"',"+rs.getDouble(5)+"]";
						data4+=",['"+Integer.valueOf(rs.getString(2).substring(9))+"',"+rs.getDouble(6)+"]";
						data5+=",['"+Integer.valueOf(rs.getString(2).substring(9))+"',"+rs.getDouble(7)+"]";
						data6+=",['"+Integer.valueOf(rs.getString(2).substring(9))+"',"+rs.getDouble(8)+"]";
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
					}
					session.setAttribute("data1",data1);
					session.setAttribute("data2",data2);
					session.setAttribute("data3",data3);
					session.setAttribute("data4",data4);
					session.setAttribute("data5",data5);
					session.setAttribute("data6",data6);
					session.setAttribute("sName",sName);
				%>
				
				var sName="<%=sName%>";
				$(".s_name").html(sName);
				
			var data1=<%=data1%>
			var data2=<%=data2%>
			var data3=<%=data3%>
			var data4=<%=data4%>
			var data5=<%=data5%>
			var data6=<%=data6%>
			var myChart = new JSChart('c1', 'line');

			myChart.setDataArray(data1);
			myChart.setAxisNameY("");
			myChart.setAxisNameX("时");
			myChart.setTitle("PH");
			myChart.setBackgroundColor("#FFFFFF");
			myChart.setTitleColor("#0000FF");
			myChart.setLineColor("#9900FF","first line");
			myChart.setIntervalEndY(14);
			myChart.setIntervalStartY(0);
			myChart.setTitleFontSize(18);  
			myChart.setSize(document.documentElement.clientWidth/3-25,(document.documentElement.clientHeight-285)/2);
			myChart.setIntervalStartX(00);
			myChart.setIntervalEndX(24);
			myChart.setShowXValues(true);
			myChart.draw();
			
			var myChart2 = new JSChart('c2', 'line');

			myChart2.setDataArray(data2);
			myChart2.setAxisNameY("");
			myChart2.setAxisNameX("时");
			myChart2.setTitle("浊度 (NTU)");
			myChart2.setBackgroundColor("#FFFFFF");
			myChart2.setTitleColor("#0000FF");
			myChart2.setIntervalEndY(20);
			myChart2.setIntervalStartX(00);
			myChart2.setIntervalEndX(24);
			myChart2.setIntervalStartY(0);
			myChart2.setTitleFontSize(18);  
			myChart2.setSize(document.documentElement.clientWidth/3-25,(document.documentElement.clientHeight-285)/2);
			myChart2.setShowXValues(true);
			myChart2.draw();
			
			var myChart3 = new JSChart('c3', 'line');

			myChart3.setDataArray(data3);
			myChart3.setAxisNameY("");
			myChart3.setAxisNameX("时");
			myChart3.setTitle("总氯 (mg/L)");
			myChart3.setBackgroundColor("#FFFFFF");
			myChart3.setLineColor("#8b008b","first line");
			myChart3.setTitleColor("#0000FF");
			myChart3.setIntervalEndY(5);
			myChart3.setIntervalStartY(0);
			myChart3.setTitleFontSize(18);  
			myChart3.setSize(document.documentElement.clientWidth/3-25,(document.documentElement.clientHeight-285)/2);
			myChart3.setIntervalStartX(00);
			myChart3.setIntervalEndX(24);
			myChart3.setShowXValues(true);
			myChart3.draw();
			
			var myChart4 = new JSChart('c4', 'line');

			myChart4.setDataArray(data4);
			myChart4.setAxisNameY("");
			myChart4.setAxisNameX("时");
			myChart4.setTitle("流量 (m3/h)");
			myChart4.setBackgroundColor("#FFFFFF");
			myChart4.setLineColor("#3366FF","first line");
			myChart4.setTitleColor("#0000FF");
			myChart4.setIntervalEndY(30);
			myChart4.setIntervalStartY(0);
			myChart4.setTitleFontSize(18);  
			myChart4.setSize(document.documentElement.clientWidth/3-25,(document.documentElement.clientHeight-285)/2);
			myChart4.setIntervalStartX(00);
			myChart4.setIntervalEndX(24);
			myChart4.setShowXValues(true);
			myChart4.draw();
			
			var myChart5 = new JSChart('c5', 'line');

			myChart5.setDataArray(data5);
			myChart5.setAxisNameY("");
			myChart5.setAxisNameX("时");
			myChart5.setTitle("电导率 (ms/mV) ");
			myChart5.setBackgroundColor("#FFFFFF");
			myChart5.setLineColor("#66CCFF","first line");
			myChart5.setTitleColor("#0000FF");
			myChart5.setIntervalEndY(2000);
			myChart5.setIntervalStartY(0);
			myChart5.setTitleFontSize(18);  
			myChart5.setSize(document.documentElement.clientWidth/3-25,(document.documentElement.clientHeight-285)/2);
			myChart5.setIntervalStartX(00);
			myChart5.setIntervalEndX(24);
			myChart5.setShowXValues(true);
			myChart5.draw();
			
			var myChart6 = new JSChart('c6', 'line');

			myChart6.setDataArray(data6);
			myChart6.setAxisNameY("");
			myChart6.setAxisNameX("时");
			myChart6.setTitle("压力 (kpa) ");
			myChart6.setBackgroundColor("#FFFFFF");
			myChart6.setLineColor("#ffa500","first line");
			myChart6.setTitleColor("#0000FF");
			myChart6.setIntervalEndY(1000);
			myChart6.setIntervalStartY(0);
			myChart6.setTitleFontSize(18);  
			myChart6.setSize(document.documentElement.clientWidth/3-25,(document.documentElement.clientHeight-285)/2);
			myChart6.setIntervalStartX(00);
			myChart6.setIntervalEndX(24);
			myChart6.setShowXValues(true);
			myChart6.draw();
				</script>
</html>