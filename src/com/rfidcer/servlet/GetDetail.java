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

public class GetDetail extends HttpServlet {
	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Connection con=BaseDao.getConnection();
		String content_type   =   "text/html;charset=GBK";   
	    response.setContentType(content_type);
		try{
		String sql=
							"select device_device.id,device_info,device_watercorp.corp_name,device_watersubcorp.sub_corp_name,ph,turbidity,rc,d_oxygen,conductivity,temperature,x_pos,y_pos,device_device.status_id,orp,device_watersubcorp.id as subcorpid from device_device "
							+"left join device_watercorp on (device_watercorp.id=device_device.corp_id) "
							+"left join device_watersubcorp on (device_watersubcorp.id=device_device.sub_corp_id) "
							+"left join hardsocket_water_param on (hardsocket_water_param.device_id=device_device.id and date(hardsocket_water_param.send_time)=CURDATE()) where device_watersubcorp.id='"+request.getParameter("id").toString()+"' order by send_time desc";
							PreparedStatement psta=con.prepareStatement(sql);
							ResultSet rs =psta.executeQuery(sql);
							Map map=new HashMap();
							if(rs.next()){
								map.put("corp",rs.getString("corp_name"));
								map.put("subcorp",rs.getString("sub_corp_name"));
								map.put("ph",rs.getString("ph"));
								map.put("turbidity",rs.getString("turbidity"));
								map.put("rc",rs.getString("rc"));
								map.put("d_oxygen",rs.getString("d_oxygen"));
								map.put("conductivity",rs.getString("conductivity"));
								map.put("temperature",rs.getString("temperature"));
								map.put("deviceid", rs.getString("id"));
								map.put("orp", rs.getString("orp"));
							}
							String string=JSONObject.fromObject(map).toString();
                           PrintWriter write = response.getWriter();
                           write.print(string);
                           write.flush();
                           write.close();
                           con.close();
		}catch(Exception e){
			e.printStackTrace();
		}
	}
}
