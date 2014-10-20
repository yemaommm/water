package com.rfidcer.dao;

import javax.servlet.http.HttpSessionEvent;
import javax.servlet.http.HttpSessionListener;


public class startCon implements HttpSessionListener{
	private long count;
	
	public startCon() {
		// TODO Auto-generated constructor stub
		count=0;
	}

	public void sessionCreated(HttpSessionEvent arg0) {
		// TODO Auto-generated method stub
		count++;
		System.out.println("在线人数："+count);
	}

	public void sessionDestroyed(HttpSessionEvent arg0) {
		// TODO Auto-generated method stub
		count--;
		System.out.println("在线人数："+count);
	}
}
