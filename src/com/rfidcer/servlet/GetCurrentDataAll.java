package com.rfidcer.servlet;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.rfidcer.dao.BaseDao;


public class GetCurrentDataAll extends HttpServlet {
	private boolean b=false;
	private String sw="";
	/**
	 * The doGet method of the servlet. <br>
	 *
	 * This method is called when a form has its tag value method equals to get.
	 * 
	 * @param request the request send by the client to the server
	 * @param response the response send by the server to the client
	 * @throws ServletException if an error occurred
	 * @throws IOException if an error occurred
	 */
	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		HttpSession session = request.getSession();
		StringBuffer call=new StringBuffer();
		StringBuffer returnDataString=new StringBuffer();
		Connection con=BaseDao.getConnection();
		String sql = "SELECT * from (SELECT IFNULL(b.road_name,'0.00') corp_name,send_time,round(IFNULL(ph,'0.00'),2) ph,round(IFNULL(turbidity,'0.00'),2) turbidity,round(IFNULL(rc,'0.00'),2) rc,round(IFNULL(d_oxygen,'0.00'),2) d_oxygen,round(IFNULL(conductivity,'0.00'),2) conductivity,round(IFNULL(orp,'0.00'),2) orp,round(IFNULL(b.corp_id,'0.00'),2) id,round(IFNULL(temperature,'0.00'),2) C,c.corp_name corp_name2 from now_current as a join device_device as b on b.id=a.id LEFT JOIN device_watercorp c ON c.id=b.corp_id ORDER BY send_time desc) a GROUP BY id";
		
		PreparedStatement psta;
		ResultSet rs = null;
		try {
			psta = con.prepareStatement(sql);
			rs = psta.executeQuery();
			while (rs.next()) {
//				System.out.print(1);
				if(!(rs.getDouble("turbidity")==0&&rs.getDouble("ph")==0&&rs.getDouble("rc")==0
						&&rs.getDouble("conductivity")==0&&rs.getDouble("d_oxygen")==0
						&&rs.getDouble("orp")==0&&rs.getDouble("C")==0)){
					if(Double.valueOf(rs.getString("ph").trim())<6.5
							||Double.valueOf(rs.getString("ph").trim())>8.5){
						if(!b){
							call.append("<br><font class='callcss'>");
							call.append(rs.getString("corp_name2").trim()+"</font>");
						}
						b=true;
						call.append("<br>");
						call.append("PH值：&nbsp;&nbsp;&nbsp;&nbsp;");
						call.append(rs.getString("ph").trim()+"");
						
					}
					if(Double.valueOf(rs.getString("rc").trim())<0.3
							||Double.valueOf(rs.getString("rc").trim())>0.5){
						if(!b){
							call.append("<br><font class='callcss'>");
							call.append(rs.getString("corp_name2").trim()+"</font>");
						}
						b=true;
						call.append("<br>");
						call.append("总氯：&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;");
						call.append(rs.getString("rc").trim()+"&nbsp;&nbsp;(mg/L)");
					}
					if(Double.valueOf(rs.getString("C").trim())<0
							||Double.valueOf(rs.getString("C").trim())>40){
						if(!b){
							call.append("<br><font class='callcss'>");
							call.append(rs.getString("corp_name2").trim()+"</font>");
						}
						b=true;
						call.append("<br>");
						call.append("温度：&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;");
						call.append(rs.getString("C").trim()+"&nbsp;&nbsp;(C)");
					}
					if(Double.valueOf(rs.getString("conductivity").trim())<125
							||Double.valueOf(rs.getString("conductivity").trim())>1250){
						if(!b){
							call.append("<br><font class='callcss'>");
							call.append(rs.getString("corp_name2").trim()+"</font>");
						}
						b=true;
						call.append("<br>");
						call.append("电导率：&nbsp;&nbsp;");
						call.append(rs.getString("conductivity").trim()+"&nbsp;&nbsp;(ms/mV)");
					}
					if(Double.valueOf(rs.getString("d_oxygen").trim())<5||Double.valueOf(rs.getString("d_oxygen").trim())>20){
						if(!b){
							call.append("<br><font class='callcss'>");
							call.append(rs.getString("corp_name2").trim()+"</font>");
						}
						b=true;
						call.append("<br>");
						call.append("流量：&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;");
						call.append(rs.getString("d_oxygen").trim()+"&nbsp;&nbsp;(m3/h)");
					}
					if(Double.valueOf(rs.getString("turbidity").trim())>0.5){
						if(!b){
							call.append("<br><font class='callcss'>");
							call.append(rs.getString("corp_name2").trim()+"</font>");
						}
						b=true;
						call.append("<br>");
						call.append("浊度：&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;");
						call.append(rs.getString("turbidity").trim()+"&nbsp;&nbsp;(NTU)");
					}
					if(Double.valueOf(rs.getString("orp").trim())>500
							||Double.valueOf(rs.getString("orp").trim())<100){
						if(!b){
							call.append("<br><font class='callcss'>");
							call.append(rs.getString("corp_name2").trim()+"</font>");
						}
						b=true;
						call.append("<br>");
						call.append("压力：&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;");
						call.append(rs.getString("orp").trim()+"&nbsp;&nbsp;(kpa)");
					}
				
				
					returnDataString.append(rs.getString("corp_name2").trim());
					returnDataString.append("<br>");
					returnDataString.append("PH值：&nbsp;&nbsp;&nbsp;&nbsp;");
					if(Double.valueOf(rs.getString("ph").trim())>6.5
							&&Double.valueOf(rs.getString("ph").trim())<8.5){
						returnDataString.append(rs.getString("ph").trim()+"");
					}else{
						returnDataString.append("<font style='color: orange ;' st='errot'>"+rs.getString("ph").trim()+"</font>");
					}
					returnDataString.append("<br>");
						returnDataString.append("电导率：&nbsp;&nbsp;");
					if(Double.valueOf(rs.getString("conductivity").trim())>125
							&&Double.valueOf(rs.getString("conductivity").trim())<1250){
						returnDataString.append(rs.getString("conductivity").trim()+"&nbsp;&nbsp;(s/V)");
					}else{
						returnDataString.append("<font style='color: orange ;' st='errot'>"+rs.getString("conductivity").trim()+"&nbsp;&nbsp;</font>(ms/mV)");
					}
					returnDataString.append("<br>");
					returnDataString.append("浊度：&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;");
					if(Double.valueOf(rs.getString("turbidity").trim())<0.5){
						returnDataString.append(rs.getString("turbidity").trim()+"&nbsp;&nbsp;(NTU)");
					}else{
						returnDataString.append("<font style='color: orange ;' st='errot'>"+rs.getString("turbidity").trim()+"&nbsp;&nbsp;</font>(NTU)");
					}
					returnDataString.append("<br>");
					returnDataString.append("总氯：&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;");
					if(Double.valueOf(rs.getString("rc").trim())<0.5
							&&Double.valueOf(rs.getString("rc").trim())>0.3){
						returnDataString.append(rs.getString("rc").trim()+"&nbsp;&nbsp;(mg/L)");
					}else{
						returnDataString.append("<font style='color: orange ;' st='errot'>"+rs.getString("rc").trim()+"&nbsp;&nbsp;</font>(mg/L)");
					}
					returnDataString.append("<br>");
					returnDataString.append("流量：&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;");
					if(Double.valueOf(rs.getString("d_oxygen").trim())<=20
							&&Double.valueOf(rs.getString("d_oxygen").trim())>5){
						returnDataString.append(rs.getString("d_oxygen").trim()+"&nbsp;&nbsp;(m3/h)");
					}else{
						returnDataString.append("<font style='color: orange ;' st='errot'>"+rs.getString("d_oxygen").trim()+"&nbsp;&nbsp;</font>(m3/h)");
					}
					returnDataString.append("<br>");
					returnDataString.append("压力：&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;");
					if(Double.valueOf(rs.getString("orp").trim())<500
							&&Double.valueOf(rs.getString("orp").trim())>100){
						returnDataString.append(rs.getString("orp").trim()+"&nbsp;&nbsp;(kpa)");
					}else{
						returnDataString.append("<font style='color: orange ;' st='errot'>"+rs.getString("orp").trim()+"&nbsp;&nbsp;</font>(kpa)");
					}
					returnDataString.append("<br>");
					returnDataString.append("温度：&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;");
					if(Double.valueOf(rs.getString("C").trim())<40
							&&Double.valueOf(rs.getString("C").trim())>0){
						returnDataString.append(rs.getString("C").trim()+"&nbsp;&nbsp;(C)");
					}else{
						returnDataString.append("<font style='color: orange ;' st='errot'>"+rs.getString("C").trim()+"&nbsp;&nbsp;</font>(C)");
					}
					returnDataString.append("<br>");
					returnDataString.append("<br>");
					
					call.append("<br>");
					b=false;

				}else{
					sw="尚未开通";
					returnDataString.append(rs.getString("corp_name2").trim());
					returnDataString.append("<br>");
					returnDataString.append("PH值：&nbsp;&nbsp;&nbsp;&nbsp;");
					returnDataString.append("<font style='color: orange ;'>"+sw+"</font>");
					returnDataString.append("<br>");
					returnDataString.append("电导率：&nbsp;&nbsp;");
					returnDataString.append("<font style='color: orange ;'>"+sw+"</font>");
					returnDataString.append("<br>");
					returnDataString.append("浊度：&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;");
					returnDataString.append("<font style='color: orange ;'>"+sw+"</font>");
					returnDataString.append("<br>");
					returnDataString.append("总氯：&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;");
					returnDataString.append("<font style='color: orange ;'>"+sw+"</font>");
					returnDataString.append("<br>");
					returnDataString.append("流量：&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;");
					returnDataString.append("<font style='color: orange ;'>"+sw+"</font>");
					returnDataString.append("<br>");
					returnDataString.append("压力：&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;");
					returnDataString.append("<font style='color: orange ;'>"+sw+"</font>");
					returnDataString.append("<br>");
					returnDataString.append("温度：&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;");
					returnDataString.append("<font style='color: orange ;'>"+sw+"</font>");
					returnDataString.append("<br>");
					returnDataString.append("<br>");
				}
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally{
			try {
				rs.close();
				con.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			
		}
		
		session.setAttribute("call", call.toString());
		
		response.setContentType("text/html;charset=GBK");
		PrintWriter out = response.getWriter();
		out.println(returnDataString.toString());
//		out.println(call.toString());
		out.flush();
		out.close();
	}

}
