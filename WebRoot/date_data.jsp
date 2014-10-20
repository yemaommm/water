<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<jsp:directive.page import="java.sql.Connection"/>
<jsp:directive.page import="com.rfidcer.dao.BaseDao"/>
<jsp:directive.page import="java.sql.PreparedStatement"/>
<jsp:directive.page import="java.sql.ResultSet"/>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<div class="r_con">
				<%
				String str="";
				if(request.getParameter("corpId")!=null){
					String sql=
					"select D.road_name,A.*,device_watercorp.corp_name name from "
						+"(select "
						+"round(avg(`A`.`ph`),2) AS `ph`,round(avg(`A`.`turbidity`),2) AS `turbidity`,"
						+"round(avg(`A`.`rc`),2) AS `rc`,round(avg(`A`.`d_oxygen`),2) AS `d_oxygen`,"
						+"round(avg(`A`.`conductivity`),2) AS `conductivity`,round(avg(`A`.`orp`),2) AS `orp`,"
						+"`A`.`device_id` AS `id`,date_format(`A`.`send_time`,'%y-%m-%d') AS `status_day` from (`hardsocket_water_param` `A`) group by `A`.`device_id`,"
						+"date_format(`A`.`send_time`,'%y-%m-%d') having (`status_day` = date_format(curdate(),'"+request.getParameter("time").substring(2)+"'))) A "
						+"right join `device_device` `D` on (`A`.`id` = `D`.`id`) LEFT JOIN device_watercorp on device_watercorp.id=D.corp_id";
					System.out.println(sql);
				%>
				<table id="r_re" border="0" cellspacing="0" cellpadding="0">
				<tr>
				
				<%if(request.getParameter("data").equals("1")) {%>
					<th style="text-align: center;font-family:'黑体';" colspan='7' class="bg_rep1"><%=request.getParameter("time") %>总体水质情况平均值</th>
				<% } %>
				<%if(request.getParameter("data").equals("2")) {%>
					<th style="text-align: center;font-family:'黑体';" colspan='7' class="bg_rep2">本周总体水质平均值</th>
				<% } %>
				<%if(request.getParameter("data").equals("3")) {%>
					<th style="text-align: center;font-family:'黑体';" colspan='7' class="bg_rep3">本月总体水质平均值</th>
				<% } %>
				</tr>
				<tr>
				<td class="bg_rep" style="color:blue">控制点</td>
				<%if(request.getParameter("data").equals("1")) {%>
					<td class="bg_rep1" style="color:blue">&nbsp;&nbsp;&nbsp;PH&nbsp;&nbsp;&nbsp;</td><td class="bg_rep1" style="color:blue">&nbsp;电导&nbsp;</td><td class="bg_rep1" style="color:blue">&nbsp;流量&nbsp;</td><td class="bg_rep1" style="color:blue">&nbsp;总氯&nbsp;</td><td class="bg_rep1" style="color:blue">&nbsp;浊度&nbsp;</td><td class="bg_rep1" style="color:blue">&nbsp;&nbsp;压力&nbsp;&nbsp;</td>
				<% } %>
				<%if(request.getParameter("data").equals("2")) {%>
					<td  class="bg_rep2" style="color:blue">&nbsp;&nbsp;&nbsp;PH&nbsp;&nbsp;&nbsp;</td><td class="bg_rep2" style="color:blue">&nbsp;电导&nbsp;</td><td class="bg_rep2" style="color:blue">&nbsp;流量&nbsp;</td><td class="bg_rep2" style="color:blue">&nbsp;总氯&nbsp;</td><td class="bg_rep2" style="color:blue">&nbsp;浊度&nbsp;</td><td class="bg_rep2" style="color:blue">&nbsp;&nbsp;压力&nbsp;&nbsp;</td>
				<% } %>
				<%if(request.getParameter("data").equals("3")) {%>
					<td class="bg_rep3" style="color:blue">&nbsp;&nbsp;&nbsp;PH&nbsp;&nbsp;&nbsp;</td><td class="bg_rep3" style="color:blue">&nbsp;电导&nbsp;</td><td class="bg_rep3" style="color:blue">&nbsp;流量&nbsp;</td><td class="bg_rep3" style="color:blue">&nbsp;总氯&nbsp;</td><td class="bg_rep3" style="color:blue">&nbsp;浊度&nbsp;</td><td class="bg_rep3" style="color:blue">&nbsp;&nbsp;压力&nbsp;&nbsp;</td>
				<% } %>
				</tr>
				<tr>
				<td id="time" class="bg_rep"></td>
				<%if(request.getParameter("data").equals("1")) {%>
				<td class="bg_rep1" style="font-size:18px;blue;border-bottom-color:red;">&nbsp;&nbsp;&nbsp;&nbsp;--&nbsp;&nbsp;&nbsp;&nbsp;</td><td class="bg_rep1" style="font-size:18px;color:blue;border-bottom-color:red;">(ms/mV)</td><td class="bg_rep1" style="font-size:18px;color:blue;border-bottom-color:red;">(m3/h)</td><td class="bg_rep1" style="font-size:18px;color:blue;border-bottom-color:red;">(mg/L)</td><td class="bg_rep1" style="font-size:18px;color:blue;border-bottom-color:red;">&nbsp;&nbsp;(NTU)&nbsp;&nbsp;</td><td class="bg_rep1" style="font-size:18px;color:blue;border-bottom-color:red;">&nbsp;&nbsp;(kpa)&nbsp;&nbsp;</td>
				<% } %>
				<%if(request.getParameter("data").equals("2")) {%>
					<td  class="bg_rep2" style="color:blue;border-bottom-color:red;">&nbsp;&nbsp;&nbsp;--&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td><td class="bg_rep2" style="color:blue;border-bottom-color:red;">(ms/mV)</td><td class="bg_rep2" style="color:blue;border-bottom-color:red;">(m3/h)</td><td class="bg_rep2" style="color:blue;border-bottom-color:red;">(mg/L)</td><td class="bg_rep2" style="color:blue;border-bottom-color:red;">(NTU)</td><td class="bg_rep2" style="color:blue;border-bottom-color:red;">(kpa)</td>
				<% } %>
				<%if(request.getParameter("data").equals("3")) {%>
					<td  class="bg_rep3" style="color:blue;border-bottom-color:red;">&nbsp;&nbsp;&nbsp;--&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td><td class="bg_rep3" style="color:blue;border-bottom-color:red;">(ms/mV)</td><td class="bg_rep3" style="color:blue;border-bottom-color:red;">(m3/h)</td><td class="bg_rep3" style="color:blue;border-bottom-color:red;">(mg/L)</td><td class="bg_rep3" style="color:blue;border-bottom-color:red;">(NTU)</td><td class="bg_rep3" style="color:blue;border-bottom-color:red;">(kpa)</td>
				<% } %>
				</tr>
				<%Connection con=BaseDao.getConnection();
				PreparedStatement psta=con.prepareStatement(sql);
				ResultSet rs=psta.executeQuery(sql);
				int x=0;
				while(rs.next()){//System.out.println(rs.getString(24)+(x==0?null:request.getParameter("sub")));
				 %>
				 	<tr >
				<%if(request.getParameter("data").equals("1")) {%>
					<td class="bg_rep" ><%=rs.getString("name") %><br><font size="3"><%=rs.getString(1) %></font></td><td style="font-size: 25px" class="bg_rep1"><%=rs.getFloat(2) %></td><td style="font-size: 25px" class="bg_rep1"><%=rs.getFloat(6) %></td><td style="font-size: 25px" class="bg_rep1"><%=rs.getFloat(5) %></td><td style="font-size: 25px" class="bg_rep1"><%=rs.getFloat(4) %></td><td style="font-size: 25px" class="bg_rep1"><%=rs.getFloat(3) %></td><td style="font-size: 25px" class="bg_rep1"><%=rs.getFloat(7) %></td>
				<% } %>
				<%if(request.getParameter("data").equals("2")) {%>
					<td class="bg_rep" ><%=rs.getString("name") %><br><font size="3"><%=rs.getString(25) %></font></td><td class="bg_rep2"><%=rs.getFloat(10) %></td><td class="bg_rep2"><%=rs.getFloat(14) %></td><td class="bg_rep2"><%=rs.getFloat(13) %></td><td class="bg_rep2"><%=rs.getFloat(12) %></td><td class="bg_rep2"><%=rs.getFloat(11)%></td><td class="bg_rep2"><%=rs.getFloat(15) %></td>
				<% } %>
				<%if(request.getParameter("data").equals("3")) {%>
					<td class="bg_rep" ><%=rs.getString("name") %><br><font size="3"><%=rs.getString(25) %></font></td><td  class="bg_rep3"><%=rs.getFloat(18) %></td><td class="bg_rep3"><%=rs.getFloat(22) %></td><td class="bg_rep3"><%=rs.getFloat(21) %></td><td class="bg_rep3"><%=rs.getFloat(20) %></td><td class="bg_rep3"><%=rs.getFloat(19)%></td><td class="bg_rep3"><%=rs.getFloat(23) %></td>
				<% } %>
				</tr>
				 <%x+=1;
				}
				 con.close(); %>
				</table>
				<%}%>
				
			</div>