<%@page import="kr.co.bit.vo.MemberVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>

<%

	MemberVO vo = new MemberVO();

	String id = request.getParameter("id");
	String pw = request.getParameter("pw");
	String name = request.getParameter("name");
	String zip1 = request.getParameter("zip1");
	String zip2 = request.getParameter("zip2");
	String addr1 = request.getParameter("addr1");
	String addr2 = request.getParameter("addr2");
	String email = request.getParameter("email");
	String[] langs = request.getParameterValues("langs");
	String tool = request.getParameter("tool");
	String project = request.getParameter("project");
	String[] temp = new String[]{"","","",""};
	
	for(String index : langs){
		
		int n = Integer.parseInt(index);
		temp[n] = index ; 
	}
	
	vo.setAddr1(addr1);
	vo.setAddr2(addr2);
	vo.setEmail(email);
	vo.setId(id);
	vo.setLangs(temp);
	vo.setName(name);
	vo.setProject(project);
	vo.setPw(pw);
	vo.setTool(tool);
	vo.setZip1(zip1);
	vo.setZip2(zip2);
	
	session.setAttribute("MemberVO", vo);
	response.sendRedirect("member_regist.jsp");

%>
</body>
</html>