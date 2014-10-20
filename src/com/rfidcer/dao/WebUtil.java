package com.rfidcer.dao;

import java.util.ArrayList;
import java.util.List;

import org.apache.http.HttpEntity;
import org.apache.http.HttpResponse;
import org.apache.http.NameValuePair;
import org.apache.http.client.HttpClient;
import org.apache.http.client.entity.UrlEncodedFormEntity;
import org.apache.http.client.methods.HttpPost;
import org.apache.http.impl.client.DefaultHttpClient;
import org.apache.http.message.BasicNameValuePair;
import org.apache.http.util.EntityUtils;

/**
 * 
 * @author zhenghong
 * @version 1.0
 * @created 2014-3-2 
 */
public class WebUtil {
	public static final String COMMON_URL = "http://www.wetouching.com:8000/hardsocket/";//http://www.wetouching.com:8000/hardsocket/
//	public static final String COMMON_URL = "http://192.168.20.52:8000/hardsocket/";
	public static String getDataFromUrl(String... params){

		// TODO Auto-generated method stub

		String httpurl = params[0].toString();
		String str = null;  
		// HttpPost���Ӷ���
		try {
			HttpPost httpRequest = new HttpPost(httpurl);
			// ���ò���
			List<NameValuePair> param = new ArrayList<NameValuePair>();
			//param.add(new BasicNameValuePair("info", params[1].toString()));
			// �����ַ���,�Լ����뷽ʽ
			HttpEntity httpEntity = new UrlEncodedFormEntity(param, "utf-8");
			// ����HttpRequest
			httpRequest.setEntity(httpEntity);
			// ȡ��Ĭ�ϵ�HttpClient
			HttpClient httpClient = new DefaultHttpClient();    
			// ȡ��HttpResponse
			HttpResponse httpResponse = httpClient.execute(httpRequest);
			
			str = EntityUtils.toString(httpResponse.getEntity());
			// HttpStatus.SC_OK��ʾ���ӳɹ�
		} catch (Exception ex) {
			ex.printStackTrace();
		}
//		if(str==null||str.equals("None")){
//			str="{}";
//		}
		return str;
	}
}
