package com.rfidcer.dao;

import java.io.BufferedReader;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.InputStreamReader;
import java.util.ArrayList;
import java.util.List;

import net.sf.json.JSONArray;

import org.aspectj.apache.bcel.util.ClassPath;

public class lineColor {
	
	
	
	public static String getlineColor(String path) {
		// TODO Auto-generated constructor stub
		JSONArray jsonArray=new JSONArray();
		File f=new File(path);
		
//		System.out.println(Class.class.getClass().getResource("/").getPath().toString());
		try {
			BufferedReader fis=new BufferedReader(new InputStreamReader(new FileInputStream(f)));
			String color="";
			while((color= fis.readLine())!=null){
				jsonArray.add(color);
			}
		} catch (FileNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		System.out.println(jsonArray.toString());
		return jsonArray.toString();
	}
}
