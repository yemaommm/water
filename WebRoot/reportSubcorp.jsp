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
.w_content{border: 1px solid white;padding: 10px;}
.r_top{width: 100%;height: 50px;margin: 20px 0 5px 0;}
.r_top input{float: left;margin-left: 50px;width: 90px;height: 30px;text-align: center;font-weight: bold;font-size: 18px;}
.r_con{width:100%;height: auto;margin: auto;margin-bottom: 30px;}
.r_con table{border:0;text-align: center;width: 100%;color: black;font-weight: bold;font-size: 20px;cellspacing:0px;cellpadding:0px;}
.r_con table tr th{height: 50px;border:2px solid white;2px solid white;}
.r_con table tr td{height: 40px;border:2px solid white;2px solid white;}

.r_con table tr td{background-color:expression((this.parentElement.sectionRowIndex%2==0)?'#efffa7':'#fff');}
.back{float: right;margin-right:60%;}
.maspan{color: black;padding-left: 50px;font-size: 18px;font-weight: bold;}
.r_con1{width: 100%;height: auto;}
.r_con1 table{width: 100%;height: auto;}
.r_con1 talbe tr td{width: 100px;height: 30px;border: 1px solid red;}
.r_con2{width: 100%;height: auto;margin-bottom: 20px;margin-top: 50px;}
.r_con2 input{float: left;margin-left: 100px;width: 150px;height: 50px;margin-bottom: 20px;font-size: 18px;}
.r_con1 table tr{color: white;}

</style>
</head>
<body>

	<div class="w_div">
		<table width="100%" border="0" cellspacing="0" cellpadding="0">
			<tr>
			<td height="87" align="center" background="site_media/img/01.jpg"><img src="site_media/img/002.png" width="401" height="48" />
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
				<%
				request.setCharacterEncoding("UTF-8");
					String sql="select * from current_hour_subcorp_param where sub_corp_name =(select sub_corp_name from device_watersubcorp where device_watersubcorp.id='"+request.getParameter("id")+"')";
				%>
				<table id="r_re" border="0" cellspacing="0" cellpadding="0">
				<tr>
				<th></th>
				<th colspan='25' class='ri' id="subname"></th>
				</tr>
				<tr>
				<td></td>
				<td  >0</td><td class='ri'>1</td><td>2</td><td>3</td><td>4</td><td>5</td>
				<td  >6</td><td class='ri'>7</td><td>8</td><td>9</td><td>10</td><td>11</td>
				<td  >12</td><td class='ri'>13</td><td>14</td><td>15</td><td>16</td><td>17</td>
				<td  >18</td><td class='ri'>19</td><td>20</td><td>21</td><td>22</td><td>23</td>
				</tr>
				<%Connection con=BaseDao.getConnection();
				PreparedStatement psta=con.prepareStatement(sql);
				ResultSet rs=psta.executeQuery(sql);
				while(rs.next()){
				 %>
				 <tr>
				 <td  class='ri' onclick="location.href='chartsub.jsp?subcorpname=<%=rs.getString(1) %>';"><%=rs.getString(1) %></td>
				 <td><%=rs.getString(3) %></td>
				 <td><%=rs.getString(4) %></td>
				 <td><%=rs.getString(5) %></td>
				 <td><%=rs.getString(6) %></td>
				 <td><%=rs.getString(7) %></td>
				 <td><%=rs.getString(8) %></td>
				 <td><%=rs.getString(9) %></td>
				 <td><%=rs.getString(10) %></td>
				 <td><%=rs.getString(11) %></td>
				 <td><%=rs.getString(12) %></td>
				 <td><%=rs.getString(13) %></td>
				 <td><%=rs.getString(14) %></td>
				 <td><%=rs.getString(15) %></td>
				 <td><%=rs.getString(16) %></td>
				 <td><%=rs.getString(17) %></td>
				 <td><%=rs.getString(18) %></td>
				 <td><%=rs.getString(19) %></td>
				 <td><%=rs.getString(20) %></td>
				 <td><%=rs.getString(21) %></td>
				 <td><%=rs.getString(22) %></td>
				 <td><%=rs.getString(23) %></td>
				 <td><%=rs.getString(24) %></td>
				 <td><%=rs.getString(25) %></td>
				 <td><%=rs.getString(26) %></td>
				</tr>
				 <%}
				 con.close(); %>
				</table>
				
			</div>
		</div>
	</div>
	<script type="text/javascript">
	</script>
</body>
</html>