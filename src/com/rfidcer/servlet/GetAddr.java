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

import org.json.JSONException;
import org.json.JSONObject;

import com.rfidcer.dao.BaseDao;
import com.rfidcer.dao.WebUtil;

public class GetAddr extends HttpServlet {
	
	final String ADDR="http://api.map.baidu.com/geocoder/v2/?ak=ADae8b0d29718f90f48348ed7399e6af&output=json&address=%s&city=%s";

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
		String returnString="";
		String corp_name="";
		Connection con = BaseDao.getConnection();
		String sql = "select b.corp_name,a.* from device_device a LEFT JOIN device_watercorp b on a.corp_id=b.id";
		PreparedStatement psta = null ;
		ResultSet rs = null;
		try {
			psta = con.prepareStatement(sql);
			rs = psta.executeQuery();
			while(rs.next()){
				if(returnString!=""){
					returnString+=";";
				}
				String stemp=String.format(ADDR, rs.getString("road_name").trim(),"…œ∫£ –");
				String addrNum=WebUtil.getDataFromUrl(stemp);
				JSONObject object=new JSONObject(addrNum);
				JSONObject json= object.getJSONObject("result").getJSONObject("location");
				String lng=json.getString("lng");
				String lat=json.getString("lat");
//				System.out.println(rs.getString("road_name")+":"+ lng+":"+lat);
				returnString+=rs.getString("corp_name")+":"+ lng+":"+lat;
				corp_name+=rs.getString("road_name").trim()+";";
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			returnString+="none";
		} catch (JSONException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			returnString+="none";
		}finally{
			try {
				con.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		
		
		session.setAttribute("corp_name", corp_name);
		response.setContentType("text/html;charset=GBK");
		PrintWriter out = response.getWriter();
		out.println(returnString);
		out.flush();
		out.close();
	}

}
