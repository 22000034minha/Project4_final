<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="com.example.dao.BoardDAO, com.example.bean.BoardVO,java.util.*"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/css/bootstrap.min.css" integrity="sha384-TX8t27EcRE3e/ihU7zmQxVncDAy5uIKz4rEkgIXeMed4M0jlfIDPvg6uqKI2xXr2" crossorigin="anonymous">
	<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
	<title>free board</title>

	<style>
		table {width: 90%;}
	</style>

	<script>
		function delete_ok(id){
			var a = confirm("정말로 삭제하겠습니까?");
			if(a) location.href='deletepost.jsp?id=' + id;
		}
	</script>

</head>



<body>
<div class="d-flex flex-column flex-md-row align-items-center p-3 px-md-4 mb-3 bg-white border-bottom shadow-sm">
	<h1 class="my-0 mr-md-auto font-weight-normal">자유게시판</h1>
	<a class="btn btn-outline-primary" href="addpostform.jsp">Add New Post</a>
</div>

<%
	BoardDAO boardDAO = new BoardDAO();
	List<BoardVO> list = boardDAO.getBoardList();
	request.setAttribute("list",list);
%>
<table id="list" class="table table-striped table-sm">
<tr>
	<th>Id</th>
	<th>Photo</th>
	<th>Title</th>
	<th>Writer</th>
	<th>Category</th>
	<th>Content</th>
	<th>Regdate</th>
	<th>Modify date</th>
	<th>Edit</th>
	<th>Delete</th>
</tr>
<c:forEach items="${list}" var="u">
	<tr>
		<td>${u.getSeq()}</td>
		<td><c:if test="${u.getPhoto() ne ''}"><img src="${pageContext.request.contextPath}/upload/${u.getPhoto()}" class="photo" height="50px"></c:if></td>
		<td>${u.getTitle()}</td>
		<td>${u.getWriter()}</td>
		<td>${u.getCategory()}</td>
		<td>${u.getContent()}</td>
		<td>${u.getRegdate()}</td>
		<td>${u.getModdate()}</td>
		<td><a href="editform.jsp?id=${u.getSeq()}">Edit</a></td>
		<td><a href="javascript:delete_ok('${u.getSeq()}')">Delete</a></td>
	</tr>
</c:forEach>
</table>
<br>
</body>
</html>