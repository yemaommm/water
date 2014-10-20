package com.rfidcer.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.HashMap;
import java.util.Iterator;
import java.util.Map;
import java.util.Map.Entry;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.sf.json.JSONObject;

import com.rfidcer.dao.BaseDao;

public class ToReport extends HttpServlet {
	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Connection con=BaseDao.getConnection();
		String content_type   =   "text/html;charset=GBK";   
	    response.setContentType(content_type);
		try{
		String sql="select corp_id from device_device where id='"+request.getParameter("id")+"'";
							PreparedStatement psta=con.prepareStatement(sql);
							ResultSet rs =psta.executeQuery(sql);
							Map map=new HashMap();
							if(rs.next()){
								map.put("corpId",rs.getString("corp_id"));
							}
							response.sendRedirect("report.jsp?corpId="+map.get("corpId"));
							con.close();
		}catch(Exception e){
			e.printStackTrace();
		}
	}
}
