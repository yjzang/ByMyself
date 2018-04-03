<%@page import="kr.co.bit.vo.MemberVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<style type="text/css">

	#id_msg{
		color : red;
	}

</style>

<script type="text/javascript">

	function all_check(val) {
		
		var xhr = new XMLHttpRequest();
		if(val=0){
			
			cmd = "id";
			
		}
			
			
		xhr.onreadystatechange = function(){
				
			if(this.readyState==4&&this.status==200){
					
					
				result = this.responseText;
				processId(result);
					
			}	else if(this.readyState==4&&this.status!=200){
				
				out.print("error");
				
		}
		
		data="cmd="+cmd;
		xhr.open("POST",url,true);
		xhr.setRequestHeader("Content-Type", "application/x-www-form-urlencoded");
		xhr.send(data);
		return false;
		}
	}
	
	function processId(result){
		var id_msg = document.getElementById(id_msg);
		if(result=="true"){
		
			id_msg.innerHTML = "사용할 수 있는 아이디 입니다.";	
		}	else {
			
			id_msg.innerHTML = "사용할 수 없는 아이디 입니다.";
		}
		return false;
	 }
	

</script>


<body>

<%
	MemberVO vo = (MemberVO)session.getAttribute("MemberVO");
	
	if(vo==null){
		
		vo= new MemberVO();
		vo.setAddr1("");
		vo.setAddr2("");
		vo.setEmail("");
		vo.setId("");
		vo.setLangs(new String[]{"","","",""});
		vo.setName("");
		vo.setProject("");
		vo.setPw("");
		vo.setTool("");
		vo.setZip1("");
		vo.setZip2("");
	
	}	
	
	/* String addr1 = vo.getAddr1();
	String addr2 = vo.getAddr2();
	String email = vo.getEmail();
	String id = vo.getId();
	String[] langs = vo.getLangs();
	String name = vo.getName();
	String project = vo.getProject();
	String pw = vo.getPw();
	String tool = vo.getTool();
	String zip1 = vo.getZip1();
	String zip2 = vo.getZip2();

 */

%>
	
<form action="process_data.jsp" method="post" enctype="application/x-www-form-urlencoded">
<table>
	<tr>
		<td> 
	아이디:	<input type="text" name="id" id="id" value="<%= vo.getId()%>" >
		</td>
		<td>
			<button onclick="return all_check(0)">아이디 중복 확인</button>
		</td>
	</tr>
	<tr>
		<td>
			<span id="id_msg"></span>
		</td>
	</tr>
	<tr>
		<td> 
	비밀번호:	<input type="text" name="pw" id="pw" >
		</td>
	<td>
	</td>
	</tr>
	<tr>
		<td>
			<span id="pw_msg"></span>
		</td>
	</tr>
	<tr>
		<td>
	이 름 :	<input type="text" name="name" id="name" >
		</td>
	</tr>
	<tr>
		<td>
  우편번호 :	<input type="text" name="zip1" id="zip1" >-
  			<input type="text" name="zip2" id="zip2" >
		</td>
	</tr>
	<tr>
		<td>
	주소 :	<input type="text" name="addr1" id="addr1" >
		</td>
	</tr>
	<tr>
		<td>
	  		<input type="text" name="addr2" id="addr2" >
		</td>
	</tr>
	<tr>
		<td>
	이메일 :	<input type="text" name="email" id="email" >
		</td>
	</tr>
	<tr>
		<td>
	사용언어 :	<input type="checkbox" name="langs" value="0"> 자바
			<input type="checkbox" name="langs" value="1"> 파이썬
			<input type="checkbox" name="langs" value="2"> C#
			<input type="checkbox" name="langs" value="3"> C++
		</td>
	</tr>
	<tr>
		<td>
	사용툴 :	<input type="radio" name="tool" value="0"> 이클립스
			<input type="radio" name="tool" value="0"> Visual Studio
			<input type="radio" name="tool" value="0"> Xcode
			<input type="radio" name="tool" value="0"> notepad
		</td>
	</tr>
	<tr>
		<td>
프로젝트 경험 : <select name="project" id="project">
					<option value="0"> 프로젝트 경험
					<option value="1"> 1~2회
					<option value="2"> 3~4회
					<option value="3"> 5~6회
					<option value="4"> 7회 이상
			</select>	
		</td>
	</tr>
	<tr>
		<td>
			<input type="submit" value="가입" >
		</td>
	</tr>
</table>
</form>
</body>
</html>