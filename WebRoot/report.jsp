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
<script type="text/javascript" src="site_media/js/report.js"></script>  
<title>水质检测</title>
<style type="text/css">
.w_content{border: 1px solid white;padding: 10px;width:98%;padding-left:22px;}
.r_top{width: 100%;height: 50px;margin: 20px 0 20px 0;}
.r_top input{float: left;margin-left: 50px;width: 160px;height: 50px;text-align: center;font-weight: bold;font-size: 18px;}
.r_con{width:100%;height: auto;margin: auto;margin-bottom: 30px;padding:0px;}
.r_con table{border:0;text-align: center;width: 100%;color: black;font-weight: bold;font-size: 20px;cellspacing:0px;cellpadding:0px;color:black;}
.r_con table tr th{height: 50px;border:2px solid white;color:black;}
.r_con table tr td{height: 40px;color:black;border:2px solid white;}

.r_con table tr td{background-color:expression((this.parentElement.sectionRowIndex%2==0)?'#efffa7':'#fff');}
.back{float: right;margin-right:60%;}
.maspan{color: black;padding-left: 50px;font-size: 18px;font-weight: bold;}
.r_con1{width: 100%;height: auto;}
.r_con1 table{width: 100%;height: auto;}
.r_con1 talbe tr td{width: 100px;height: 30px;border: 1px solid red;}
.r_con2{width: 100%;height: auto;margin-bottom: 20px;margin-top: 50px;}
.r_con2 input{float: left;margin-left: 100px;width: 150px;height: 50px;margin-bottom: 20px;font-size: 18px;}
.r_con1 table tr{color: white;}
.bg_rep1{background:#f7e0b2;}
.bg_rep2{background:#cbe9fa;}
.bg_rep3{background:#caedb4;}
.bg_rep{background:#f7dcf1;}
.bg_rep4{background:#faf8bf}

</style>
</head>
<body>

	<div class="w_div">
		<table width="100%" border="0" cellspacing="0" cellpadding="0">
			<tr>
			<td height="87" align="center" background="site_media/img/01.jpg"><img src="site_media/img/0023.png" width="401" height="48" />
			</td>
			</tr>
			<tr>
			<td height="2" background="site_media/img/03.jpg"><img src="site_media/img/03.jpg" width="4" height="4" />
			</td>
			</tr>
		</table>
		<div class="w_content">
			<div class="r_top">
<input type='button' id="myBack" class='backs' value='返回' onclick="history.go(-1);"/>
			</div>
			<div class="r_con">
				<%if(request.getParameter("areaId")==null&&request.getParameter("corpId")==null&&request.getParameter("subcorpId")==null) {
				request.getRequestDispatcher("aa.jsp").forward(request,response);
				%>
				
				<%}else if(request.getParameter("areaId")!=null&&request.getParameter("corpId")==null) {
					String sql="SELECT "
+"	c.*, b.*, a.*, d.area_name "
+"FROM "
+"	current_month_area_param a "
+"left join current_week_area_param b on (a.id=b.id) "
+"left join current_day_area_param c on (b.id=c.id) "
+"right join device_area d on (a.id=d.id) "
+"WHERE  d.id LIKE '%"+request.getParameter("areaId").toString()+"%'";
				System.out.println(sql);%>
				<script type="text/javascript">
				$("#myBack").attr('onclick',"location.href='aa.jsp?second=true'");
				</script>
				<table id="r_re" border="0" cellspacing="0" cellpadding="0">
				<tr>
				<th class="bg_rep" >所属行政区</th>
				<th colspan='6' class="bg_rep1">当日总体水质</th>
				<th colspan='6' class="bg_rep2">本周总体水质</th>
				<th colspan='6' class="bg_rep3">本月总体水质</th>
				</tr>
				<tr>
				<td class="bg_rep"></td>
				<td  class="bg_rep1"  style="color:blue">PH</td><td class="bg_rep1"  style="color:blue">电导</td><td class="bg_rep1"  style="color:blue">流量</td><td class="bg_rep1"  style="color:blue">余氯</td><td class="bg_rep1"  style="color:blue">浊度</td><td class="bg_rep1"  style="color:blue">压力</td>
				<td class="bg_rep2" style="color:blue" >PH</td><td class="bg_rep2" style="color:blue">电导</td><td class="bg_rep2" style="color:blue">流量</td><td class="bg_rep2" style="color:blue">余氯</td><td class="bg_rep2" style="color:blue">浊度</td><td class="bg_rep2" style="color:blue">压力</td>
				<td  class="bg_rep3" style="color:blue">PH</td><td class="bg_rep3" style="color:blue">电导</td><td class="bg_rep3" style="color:blue">流量</td><td class="bg_rep3" style="color:blue">余氯</td><td class="bg_rep3" style="color:blue">浊度</td><td class="bg_rep3" style="color:blue">压力</td>
				</tr>
				<tr>
				<td class="bg_rep"></td>
				<td  class="bg_rep1" style="border-bottom-color:red;color:blue;" >--</td><td class="bg_rep1" style="color:blue;border-bottom-color:red;">(ms/mV)</td><td class="bg_rep1" style="color:blue;border-bottom-color:red;">(m3/h)</td><td class="bg_rep1" style="color:blue;border-bottom-color:red;">(mg/L)</td><td class="bg_rep1" style="color:blue;border-bottom-color:red;">(NTU)</td><td class="bg_rep1" style="color:blue;border-bottom-color:red;">(kpa)</td>
				<td  class="bg_rep2" style="color:blue;border-bottom-color:red;" >--</td><td  class="bg_rep2" style="color:blue;border-bottom-color:red;">(ms/mV)</td><td class="bg_rep2" style="color:blue;border-bottom-color:red;">(m3/h)</td><td class="bg_rep2" style="color:blue;border-bottom-color:red;">(mg/L)</td><td class="bg_rep2" style="color:blue;border-bottom-color:red;">(NTU)</td><td class="bg_rep2" style="color:blue;border-bottom-color:red;">(kpa)</td>
				<td  class="bg_rep3" style="color:blue;border-bottom-color:red;">--</td><td  class="bg_rep3" style="color:blue;border-bottom-color:red;">(ms/mV)</td><td class="bg_rep3" style="color:blue;border-bottom-color:red;">(m3/h)</td><td class="bg_rep3" style="color:blue;border-bottom-color:red;">(mg/L)</td><td class="bg_rep3" style="color:blue;border-bottom-color:red;">(NTU)</td><td class="bg_rep3" style="color:blue;border-bottom-color:red;">(kpa)</td>
				</tr>
				<%Connection con=BaseDao.getConnection();
				PreparedStatement psta=con.prepareStatement(sql);
				ResultSet rs=psta.executeQuery(sql);
				while(rs.next()){
				if(rs.getString("area_name").trim().equalsIgnoreCase("上海市")){
					continue;
				}
				 %>
				 <!-- <%=rs.getString("area_name")%> -->
				 <tr onclick="location.href='chart.jsp?areaId=<%=rs.getString("id") %>';">
				 <td class="bg_rep"><%=rs.getString(25) %></td><td  class="bg_rep1"><%=rs.getFloat(2) %></td><td class="bg_rep1"><%=rs.getFloat(6) %></td><td class="bg_rep1"><%=rs.getFloat(5) %></td><td class="bg_rep1"><%=rs.getFloat(4) %></td><td class="bg_rep1"><%=rs.getFloat(3) %></td><td class="bg_rep1"><%=rs.getFloat(7) %></td>
				<td class="bg_rep2" ><%=rs.getFloat(10) %></td><td class="bg_rep2"><%=rs.getFloat(14) %></td><td class="bg_rep2"><%=rs.getFloat(13) %></td><td class="bg_rep2"><%=rs.getFloat(12) %></td><td class="bg_rep2"><%=rs.getFloat(11) %></td><td class="bg_rep2"><%=rs.getFloat(15) %></td>
				<td class="bg_rep3"><%=rs.getFloat(18) %></td><td class="bg_rep3"><%=rs.getFloat(22) %></td><td class="bg_rep3"><%=rs.getFloat(21) %></td><td class="bg_rep3"><%=rs.getFloat(20) %></td><td class="bg_rep3"><%=rs.getFloat(19) %></td><td class="bg_rep3"><%=rs.getFloat(23) %></td>
				</tr>
				 <%}
				 con.close(); %>
				</table>
				<%}else if(request.getParameter("corpId")!=null){
					String sql=
					"select a.*,b.*,c.*,h.corp_name from current_month_corp_param c "
+"left join current_day_corp_param a on(a.id=c.id) "
+"left join current_week_corp_param b on (b.id=c.id) "
+"left join device_watercorp h on (c.id=h.id) "
+" where c.id like '%"+request.getParameter("corpId")+"%' union "
+" select d.*,e.*,f.*,i.sub_corp_name from current_month_subcorp_param f "
+"left join current_day_subcorp_param d on (f.id=d.id) "
+"left join current_week_subcorp_param e on (d.id=e.id) "
+"left join device_watersubcorp i on (f.id=i.id) "
+" where i.corp_id like '%"+request.getParameter("corpId")+"%'";
					System.out.println(sql);
					if(request.getParameter("sub")==null||request.getParameter("sub").equals("")){
					sql="select d.*,e.*,f.*,i.road_name corp_name from current_month_corp_param f "
+"left join current_day_corp_param d on (f.id=d.id) "
+"left join current_week_corp_param e on (d.id=e.id) "
+"right join device_device i on (e.id=i.id) "
+" where i.id like '%"+request.getParameter("corpId")+"%'";
					System.out.println(sql);
					}
				%>
				<table id="r_re" border="0" cellspacing="0" cellpadding="0">
				<tr>
				<th class="bg_rep">所属公司</th>
				<th colspan='6' class="bg_rep1">当日总体水质</th>
				<th colspan='6' class="bg_rep2">本周总体水质</th>
				<th colspan='6' class="bg_rep3">本月总体水质</th>
				</tr>
				<tr>
				<td class="bg_rep"></td>
				<td class="bg_rep1" style="color:blue">PH</td><td class="bg_rep1" style="color:blue">电导</td><td class="bg_rep1" style="color:blue">溶氧</td><td class="bg_rep1" style="color:blue">余氯</td><td class="bg_rep1" style="color:blue">浊度</td><td class="bg_rep1" style="color:blue">ORP</td>
				<td  class="bg_rep2" style="color:blue">PH</td><td class="bg_rep2" style="color:blue">电导</td><td class="bg_rep2" style="color:blue">溶氧</td><td class="bg_rep2" style="color:blue">余氯</td><td class="bg_rep2" style="color:blue">浊度</td><td class="bg_rep2" style="color:blue">ORP</td>
				<td class="bg_rep3" style="color:blue">PH</td><td class="bg_rep3" style="color:blue">电导</td><td class="bg_rep3" style="color:blue">溶氧</td><td class="bg_rep3" style="color:blue">余氯</td><td class="bg_rep3" style="color:blue">浊度</td><td class="bg_rep3" style="color:blue">ORP</td>
				</tr>
				<tr>
				<td class="bg_rep"></td>
				<td class="bg_rep1" style="color:blue;border-bottom-color:red;">--</td><td class="bg_rep1" style="color:blue;border-bottom-color:red;">(ms/mV)</td><td class="bg_rep1" style="color:blue;border-bottom-color:red;">(mg/L)</td><td class="bg_rep1" style="color:blue;border-bottom-color:red;">(mg/L)</td><td class="bg_rep1" style="color:blue;border-bottom-color:red;">(NTU)</td><td class="bg_rep1" style="color:blue;border-bottom-color:red;">(mV)</td>
				<td  class="bg_rep2" style="color:blue;border-bottom-color:red;">--</td><td class="bg_rep2" style="color:blue;border-bottom-color:red;">(ms/mV)</td><td class="bg_rep2" style="color:blue;border-bottom-color:red;">(mg/L)</td><td class="bg_rep2" style="color:blue;border-bottom-color:red;">(mg/L)</td><td class="bg_rep2" style="color:blue;border-bottom-color:red;">(NTU)</td><td class="bg_rep2" style="color:blue;border-bottom-color:red;">(mV)</td>
				<td  class="bg_rep3" style="color:blue;border-bottom-color:red;">--</td><td class="bg_rep3" style="color:blue;border-bottom-color:red;">(ms/mV)</td><td class="bg_rep3" style="color:blue;border-bottom-color:red;">(mg/L)</td><td class="bg_rep3" style="color:blue;border-bottom-color:red;">(mg/L)</td><td class="bg_rep3" style="color:blue;border-bottom-color:red;">(NTU)</td><td class="bg_rep3" style="color:blue;border-bottom-color:red;">(mV)</td>
				</tr>
				<%Connection con=BaseDao.getConnection();
				PreparedStatement psta=con.prepareStatement(sql);
				ResultSet rs=psta.executeQuery(sql);
				int x=0;
				while(rs.next()){//System.out.println(rs.getString(24)+(x==0?null:request.getParameter("sub")));
				 %>
				 	<tr onclick="location.href='chart.jsp?corpId=<%=rs.getString(24)%>&sub=<%=x==0?null:request.getParameter("sub") %>';">
				 
				<td class="bg_rep" ><%=rs.getString(25) %></td><td  class="bg_rep1"><%=rs.getFloat(2) %></td><td class="bg_rep1"><%=rs.getFloat(6) %></td><td class="bg_rep1"><%=rs.getFloat(5) %></td><td class="bg_rep1"><%=rs.getFloat(4) %></td><td class="bg_rep1"><%=rs.getFloat(3) %></td><td class="bg_rep1"><%=rs.getFloat(7) %></td>
				 
				<td class="bg_rep2"><%=rs.getFloat(10) %></td><td class="bg_rep2"><%=rs.getFloat(14) %></td><td class="bg_rep2"><%=rs.getFloat(13) %></td><td class="bg_rep2"><%=rs.getFloat(12) %></td><td class="bg_rep2"><%=rs.getFloat(11)%></td><td class="bg_rep2"><%=rs.getFloat(15) %></td>
				<td  class="bg_rep3"><%=rs.getFloat(18) %></td><td class="bg_rep3"><%=rs.getFloat(22) %></td><td class="bg_rep3"><%=rs.getFloat(21) %></td><td class="bg_rep3"><%=rs.getFloat(20) %></td><td class="bg_rep3"><%=rs.getFloat(19)%></td><td class="bg_rep3"><%=rs.getFloat(23) %></td>
				</tr>
				 <%x+=1;}
				 con.close(); %>
				</table>
				<%}%>
				
			</div>
		</div>
	</div>
</body>
</html>