<%@page import="java.text.SimpleDateFormat"%>
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
				<td  class="bg_rep1"  style="color:blue">PH</td><td class="bg_rep1"  style="color:blue">电导</td><td class="bg_rep1"  style="color:blue">流量</td><td class="bg_rep1"  style="color:blue">总氯</td><td class="bg_rep1"  style="color:blue">浊度</td><td class="bg_rep1"  style="color:blue">压力</td>
				<td class="bg_rep2" style="color:blue" >PH</td><td class="bg_rep2" style="color:blue">电导</td><td class="bg_rep2" style="color:blue">流量</td><td class="bg_rep2" style="color:blue">总氯</td><td class="bg_rep2" style="color:blue">浊度</td><td class="bg_rep2" style="color:blue">压力</td>
				<td  class="bg_rep3" style="color:blue">PH</td><td class="bg_rep3" style="color:blue">电导</td><td class="bg_rep3" style="color:blue">流量</td><td class="bg_rep3" style="color:blue">总氯</td><td class="bg_rep3" style="color:blue">浊度</td><td class="bg_rep3" style="color:blue">压力</td>
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
					sql="select d.*,e.*,f.*,i.road_name corp_name,device_watercorp.corp_name name from current_month_corp_param f "
+"left join current_day_corp_param d on (f.id=d.id) "
+"left join current_week_corp_param e on (d.id=e.id) "
+"right join device_device i on (e.id=i.id)  LEFT JOIN device_watercorp on device_watercorp.id=i.corp_id"
+" where i.id like '%"+request.getParameter("corpId")+"%'";
					System.out.println(sql);
					}
				%>
				<table id="r_re" border="0" cellspacing="0" cellpadding="0" width='100%' height="100%">
				<tr>
				
				<%if(request.getParameter("data").equals("1")) {%>
					<th style="text-align: center;font-family:'黑体';" colspan='7' class="bg_rep1">当日总体水质平均值
					<div style="position: absolute;top:50px;left:85%;">
					<font size="5px"><%=new SimpleDateFormat("yyyy-MM-dd").format(new Date()) %></font></div></th>
				<% } %>
				<%if(request.getParameter("data").equals("2")) {%>
					<th style="text-align: center;font-family:'黑体';" colspan='7' class="bg_rep2">本周总体水质平均值
					<div style="position: absolute;top:50px;left:85%;">
					<font size="5px"><%=new SimpleDateFormat("yyyy-MM-dd").format(new Date()) %></font></div></th>
				<% } %>
				<%if(request.getParameter("data").equals("3")) {%>
					<th style="text-align: center;font-family:'黑体';" colspan='7' class="bg_rep3">本月总体水质平均值
					<div style="position: absolute;top:50px;left:85%;">
					<font size="5px"><%=new SimpleDateFormat("yyyy-MM-dd").format(new Date()) %></font></div></th>
				<% } %>
				</tr>
				<tr>
				<td class="bg_rep" style="color:blue">控制点</td>
				<%if(request.getParameter("data").equals("1")) {%>
					<td class="bg_rep1" style="color:blue">&nbsp;&nbsp;&nbsp;PH&nbsp;&nbsp;&nbsp;</td><td class="bg_rep1" style="color:blue">电导</td><td class="bg_rep1" style="color:blue">&nbsp;流量&nbsp;</td><td class="bg_rep1" style="color:blue">&nbsp;总氯&nbsp;</td><td class="bg_rep1" style="color:blue">&nbsp;浊度&nbsp;</td><td class="bg_rep1" style="color:blue">&nbsp;&nbsp;压力&nbsp;&nbsp;</td>
				<% } %>
				<%if(request.getParameter("data").equals("2")) {%>
					<td  class="bg_rep2" style="color:blue">&nbsp;&nbsp;&nbsp;PH&nbsp;&nbsp;&nbsp;</td><td class="bg_rep2" style="color:blue">电导</td><td class="bg_rep2" style="color:blue">&nbsp;流量&nbsp;</td><td class="bg_rep2" style="color:blue">&nbsp;总氯&nbsp;</td><td class="bg_rep2" style="color:blue">&nbsp;浊度&nbsp;</td><td class="bg_rep2" style="color:blue">&nbsp;&nbsp;压力&nbsp;&nbsp;</td>
				<% } %>
				<%if(request.getParameter("data").equals("3")) {%>
					<td class="bg_rep3" style="color:blue">&nbsp;&nbsp;&nbsp;PH&nbsp;&nbsp;&nbsp;</td><td class="bg_rep3" style="color:blue">电导</td><td class="bg_rep3" style="color:blue">&nbsp;流量&nbsp;</td><td class="bg_rep3" style="color:blue">&nbsp;总氯&nbsp;</td><td class="bg_rep3" style="color:blue">&nbsp;浊度&nbsp;</td><td class="bg_rep3" style="color:blue">&nbsp;&nbsp;压力&nbsp;&nbsp;</td>
				<% } %>
				</tr>
				<tr>
				<td class="bg_rep"></td>
				<%if(request.getParameter("data").equals("1")) {%>
				<td class="bg_rep1" style="font-size:18px;color:blue;border-bottom-color:red;">--</td><td class="bg_rep1" style="font-size:18px;color:blue;border-bottom-color:red;">(ms/mV)</td><td class="bg_rep1" style="font-size:18px;color:blue;border-bottom-color:red;">(m3/h)</td><td class="bg_rep1" style="font-size:18px;color:blue;border-bottom-color:red;">(mg/L)</td><td class="bg_rep1" style="font-size:18px;color:blue;border-bottom-color:red;">&nbsp;&nbsp;(NTU)&nbsp;&nbsp;</td><td class="bg_rep1" style="font-size:18px;color:blue;border-bottom-color:red;">&nbsp;&nbsp;(kpa)&nbsp;&nbsp;</td>
				<% } %>
				<%if(request.getParameter("data").equals("2")) {%>
					<td  class="bg_rep2" style="font-size:18px;color:blue;border-bottom-color:red;">&nbsp;&nbsp;&nbsp;&nbsp;--&nbsp;&nbsp;&nbsp;&nbsp;</td><td class="bg_rep2" style="font-size:18px;color:blue;border-bottom-color:red;">(ms/mV)</td><td class="bg_rep2" style="font-size:18px;color:blue;border-bottom-color:red;">(m3/h)</td><td class="bg_rep2" style="font-size:18px;color:blue;border-bottom-color:red;">(mg/L)</td><td class="bg_rep2" style="font-size:18px;color:blue;border-bottom-color:red;">&nbsp;&nbsp;(NTU)&nbsp;&nbsp;</td><td class="bg_rep2" style="font-size:18px;color:blue;border-bottom-color:red;">&nbsp;&nbsp;(kpa)&nbsp;&nbsp;</td>
				<% } %>
				<%if(request.getParameter("data").equals("3")) {%>
					<td  class="bg_rep3" style="font-size:18px;color:blue;border-bottom-color:red;">&nbsp;&nbsp;&nbsp;&nbsp;--&nbsp;&nbsp;&nbsp;&nbsp;</td><td class="bg_rep3" style="font-size:18px;color:blue;border-bottom-color:red;">(ms/mV)</td><td class="bg_rep3" style="font-size:18px;color:blue;border-bottom-color:red;">(m3/h)</td><td class="bg_rep3" style="font-size:18px;color:blue;border-bottom-color:red;">(mg/L)</td><td class="bg_rep3" style="font-size:18px;color:blue;border-bottom-color:red;">&nbsp;&nbsp;(NTU)&nbsp;&nbsp;</td><td class="bg_rep3" style="font-size:18px;color:blue;border-bottom-color:red;">&nbsp;&nbsp;(kpa)&nbsp;&nbsp;</td>
				<% } %>
				</tr>
				<%Connection con=BaseDao.getConnection();
				PreparedStatement psta=con.prepareStatement(sql);
				ResultSet rs=psta.executeQuery(sql);
				int x=0;
				String str="";
				while(rs.next()){//System.out.println(rs.getString(24)+(x==0?null:request.getParameter("sub")));
					if(rs.getString(25)!=null)
						str+="<div onclick=location.href='chart.jsp?corpId="+rs.getString(24)+"&sub+"+(x==0?null:request.getParameter("sub"))+"'>"+rs.getString("name").trim()+"</div>;";
				 %>
				 	<tr>
				<%if(request.getParameter("data").equals("1")) {%>
					<td class="bg_rep" ><%=rs.getString("name") %><br><font size="3"><%=rs.getString(25) %></font></td><td  style="font-size: 25px" class="bg_rep1"><%=rs.getFloat(2) %></td><td style="font-size: 25px" class="bg_rep1"><%=rs.getFloat(6) %></td><td style="font-size: 25px" class="bg_rep1"><%=rs.getFloat(5) %></td><td style="font-size: 25px" class="bg_rep1"><%=rs.getFloat(4) %></td><td style="font-size: 25px" class="bg_rep1"><%=rs.getFloat(3) %></td><td style="font-size: 25px" class="bg_rep1"><%=rs.getFloat(7) %></td>
				<% } %>
				<%if(request.getParameter("data").equals("2")) {%>
					<td class="bg_rep" ><%=rs.getString("name") %><br><font size="3"><%=rs.getString(25) %></font></td><td style="font-size: 25px" class="bg_rep2"><%=rs.getFloat(10) %></td><td style="font-size: 25px" class="bg_rep2"><%=rs.getFloat(14) %></td><td style="font-size: 25px" class="bg_rep2"><%=rs.getFloat(13) %></td><td style="font-size: 25px" class="bg_rep2"><%=rs.getFloat(12) %></td><td style="font-size: 25px" class="bg_rep2"><%=rs.getFloat(11)%></td><td style="font-size: 25px" class="bg_rep2"><%=rs.getFloat(15) %></td>
				<% } %>
				<%if(request.getParameter("data").equals("3")) {%>
					<td class="bg_rep" ><%=rs.getString("name") %><br><font size="3"> <%=rs.getString(25) %></font></td><td  style="font-size: 25px" class="bg_rep3"><%=rs.getFloat(18) %></td><td style="font-size: 25px" class="bg_rep3"><%=rs.getFloat(22) %></td><td style="font-size: 25px" class="bg_rep3"><%=rs.getFloat(21) %></td><td style="font-size: 25px" class="bg_rep3"><%=rs.getFloat(20) %></td><td style="font-size: 25px" class="bg_rep3"><%=rs.getFloat(19)%></td><td style="font-size: 25px" class="bg_rep3"><%=rs.getFloat(23) %></td>
				<% } %>
				</tr>
				 <%x+=1;}
				System.out.println(str);
				session.setAttribute("calls", str);
				 con.close(); %>
				</table>
				<%}%>
				
			</div>