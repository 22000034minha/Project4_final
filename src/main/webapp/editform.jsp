<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@page import="com.example.dao.BoardDAO, com.example.bean.BoardVO"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>
<head>
	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/css/bootstrap.min.css" integrity="sha384-TX8t27EcRE3e/ihU7zmQxVncDAy5uIKz4rEkgIXeMed4M0jlfIDPvg6uqKI2xXr2" crossorigin="anonymous">
	<meta charset="UTF-8">
	<title>Edit Form</title>
	<style>
		div#buttons { margin: 0px 20px; }
		@media only screen and (min-width: 600px) {
			div#inputs { display: flex; }
			div#view_photo { margin: 0px 50px; }
		}
	</style>

</head>
<body>

<%
	BoardDAO boardDAO = new BoardDAO();
	String id = request.getParameter("id");
	BoardVO u = boardDAO.getBoard(Integer.parseInt(id));
	request.setAttribute("vo", u);
%>

<div class="d-flex flex-column flex-md-row align-items-center p-3 px-md-4 mb-3 bg-white border-bottom shadow-sm">
	<h1 class="my-0 mr-md-auto font-weight-normal">Edit Form</h1>
	<a class="btn btn-outline-primary" href="posts.jsp">View All Records</a>
</div>

<form action="editpost.jsp" method="post" enctype="multipart/form-data">
	<input type="hidden" name="seq" value="<%=u.getSeq() %>"/>

	<div id="inputs" class="my-3 p-3 bg-white rounded shadow-sm">
		<table>
		<tr><td>Title:</td><td><input type="text" name="title" value="<%= u.getTitle()%>"/></td></tr>
		<tr><td>Writer:</td><td><input type="text" name="writer" value="<%= u.getWriter()%>" /></td></tr>
		<tr><td>Category:</td><td><input type="text" name="category"value="<%= u.getCategory()%>"></td></tr>
		<tr><td>Content:</td><td><textarea cols="50" rows="5" name="content"><%= u.getContent()%></textarea></td></tr>
		</table>
		<div id="view_photo">
			Photo:<br>
			<c:if test="${u.getPhoto() ne ''}">
				<img src="${pageContext.request.contextPath}/upload/<%= u.getPhoto()%>" class="photo" height="200px">
			</c:if>
			<br><input type="file" name="photo"><br>
		</div>
	</div>

	<div id="buttons">
		<input type="submit" value="Edit Post" class="btn btn-outline-primary"/>
		<input type="button" value="Cancel" onclick="history.back()" class="btn btn-outline-secondary"/>
	</div>
</form>
</body>
</html>