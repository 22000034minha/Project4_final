<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="com.example.dao.BoardDAO"%>
<%@page import="com.example.util.FileUpload"%>
<%@ page import="com.example.bean.BoardVO" %>
<% request.setCharacterEncoding("utf-8"); %>

<%
	BoardDAO boardDAO = new BoardDAO();
	FileUpload upload = new FileUpload();
	BoardVO u = upload.upload_photo(request);
	int i = boardDAO.updateBoard(u);
	String msg = "데이터 수정 성공 !";
	if (i == 0) msg = "데이터 수정 실패 !";
%>

<script>
	alert('<%=msg%>');
	location.href='posts.jsp';
</script>