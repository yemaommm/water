package com.rfidcer.servlet;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.HashMap;
import java.util.Map;
import java.util.Timer;
import java.util.TimerTask;

import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;

import org.json.JSONObject;

import com.rfidcer.dao.BaseDao;

public class AutoRunLog extends TimerTask implements ServletContextListener{
	
	private String datatext="";
	private Timer t=new Timer(true);
	private static Map<String, String> dataMap=new HashMap<String, String>();

	public void contextDestroyed(ServletContextEvent arg0) {
		// TODO Auto-generated method stub
		System.out.println("over");
	}

	public void contextInitialized(ServletContextEvent arg0) {
		// TODO Auto-generated method stub
		System.out.println("start listener");
		t.schedule(this, 0,600000);
	}

	@Override
	public void run() {
		// TODO Auto-generated method stub
		Connection con = BaseDao.getConnection();
		String sql = "INSERT INTO Data_Log (time,text,id) VALUES('%s','%s','%s')";
		String sqlq="SELECT * from (SELECT IFNULL(b.road_name,'0.00') corp_name,send_time,round(IFNULL(ph,'0.00'),2) ph,round(IFNULL(turbidity,'0.00'),2) turbidity,round(IFNULL(rc,'0.00'),2) rc,round(IFNULL(d_oxygen,'0.00'),2) d_oxygen,round(IFNULL(conductivity,'0.00'),2) conductivity,round(IFNULL(orp,'0.00'),2) orp,b.id,round(IFNULL(temperature,'0.00'),2) C,c.corp_name corp_name2 from now_current as a join device_device as b on b.id=a.id LEFT JOIN device_watercorp c ON c.id=b.corp_id ORDER BY send_time desc) a GROUP BY id";
		try {
			PreparedStatement pstaQ = con.prepareStatement(sqlq);
			ResultSet rs = pstaQ.executeQuery();
			
			while (rs.next()) {
				datatext="{";
				if(rs.getString("send_time")!=null){
					if(Double.valueOf(rs.getString("ph").trim())<6.5
							||Double.valueOf(rs.getString("ph").trim())>8.5){
						datatext+="ph:"+rs.getString("ph").trim();
						
					}
					if(Double.valueOf(rs.getString("rc").trim())<0.3
							||Double.valueOf(rs.getString("rc").trim())>0.5){
						datatext+="rc:"+rs.getString("rc").trim();
					}
					if(Double.valueOf(rs.getString("C").trim())<0
							||Double.valueOf(rs.getString("C").trim())>40){
						datatext+="C:"+rs.getString("C").trim();
					}
					if(Double.valueOf(rs.getString("conductivity").trim())<125
							||Double.valueOf(rs.getString("conductivity").trim())>1250){
						datatext+="conductivity:"+rs.getString("conductivity").trim();
					}
					if(Double.valueOf(rs.getString("d_oxygen").trim())<5||Double.valueOf(rs.getString("d_oxygen").trim())>20){
						datatext+="d_oxygen:"+rs.getString("d_oxygen").trim();
					}
					if(Double.valueOf(rs.getString("turbidity").trim())>0.5){
						datatext+="turbidity:"+rs.getString("turbidity").trim();
					}
					if(Double.valueOf(rs.getString("orp").trim())>500
							||Double.valueOf(rs.getString("orp").trim())<100){
						datatext+="orp:"+rs.getString("orp").trim();
					}
					datatext+="}";
					System.out.println(dataMap.get(rs.getString("id"))!=null);
					
					if(!datatext.equals("{}")){
						if(dataMap.get(rs.getString("id"))==null){
							PreparedStatement psta = con.prepareStatement(String.format(sql, rs.getString("send_time").trim(),datatext,rs.getString("id").trim()));
							psta.execute();
							dataMap.put(rs.getString("id"), "0");
						}
					}else{
						if(dataMap.get(rs.getString("id"))!=null){
							PreparedStatement psta = con.prepareStatement(String.format(sql, rs.getString("send_time").trim(),"{}",rs.getString("id").trim()));
							psta.execute();
							dataMap.remove(rs.getString("id"));
						}
					}
				}
			}
			
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally{
			try {
				con.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		
	}

}
