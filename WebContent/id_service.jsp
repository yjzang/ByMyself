<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
	String cmd = request.getParameter("cmd");
	if("id".equals(cmd)){
		
		cmd = "true";
		
	} else if("zip".equals(cmd)) {
		
		cmd = "123456";
	}
	
	out.print(cmd);



%>