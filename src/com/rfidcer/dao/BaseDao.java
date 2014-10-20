package com.rfidcer.dao;

import java.io.IOException;
import java.io.InputStream;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.Properties;
import java.util.concurrent.ExecutionException;
import java.util.concurrent.Future;

import org.apache.tomcat.jdbc.pool.DataSource;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;
import org.springframework.context.support.FileSystemXmlApplicationContext;

public class BaseDao {
	private static String url="";
	private static String user="";
	private static String password="";
	private static ApplicationContext context = new ClassPathXmlApplicationContext("applicationContext.xml");
	private static DataSource ds = (DataSource)context.getBean("dataSource");
	
	public static Connection getConnection(){
		Connection con=null;
		try{
//			Future future = ds.getConnectionAsync();
//			con=(Connection) future.get();
			System.out.println("调用前:"+ds.getNumActive()+":空闲数"+ds.getNumIdle()+":最大链接数"+ds.getMaxActive()+":"+ds.getNumTestsPerEvictionRun());
			con=ds.getConnection();//DriverManager.getConnection(url+"?user="+user+"&password="+password);
			System.out.println(ds.getNumActive()+":空闲数"+ds.getNumIdle()+":最大链接数"+ds.getMaxActive()+":"+ds.getNumTestsPerEvictionRun());

		}catch(Exception e){
			e.printStackTrace();
		}
		
		try {
			String sql = "select 1";
			PreparedStatement psta = con.prepareStatement(sql);
			System.out.println("链接:true");
			psta.close();
			psta=null;
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			System.out.println(e.getMessage());
			context=null;ds=null;con=null;
			context = new ClassPathXmlApplicationContext("applicationContext.xml");
			ds = (DataSource)context.getBean("dataSource");
			try {
//				Future future = ds.getConnectionAsync();
//				con=(Connection) future.get();
				con=ds.getConnection();
			} catch (SQLException e1) {
				// TODO Auto-generated catch block
				e1.printStackTrace();
			} 
		}
		return con;
	}
	
	public static void main(String[] args) {
		getConnection();
	}
	
	
}
