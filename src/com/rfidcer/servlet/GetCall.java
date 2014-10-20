package com.rfidcer.servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class GetCall extends HttpServlet {
	private String name;
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

		response.setContentType("text/html;charset=GBK");
		PrintWriter out = response.getWriter();
		if(request.getParameter("name")==null)
			out.println(request.getSession().getAttribute("call"));
		else
			out.println(request.getSession().getAttribute(request.getParameter("name")));
		out.flush();
		out.close();
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}

}
