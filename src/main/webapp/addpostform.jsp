<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

<head>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/css/bootstrap.min.css" integrity="sha384-TX8t27EcRE3e/ihU7zmQxVncDAy5uIKz4rEkgIXeMed4M0jlfIDPvg6uqKI2xXr2" crossorigin="anonymous">
<meta charset="UTF-8">
    <title>Insert title here</title>
    <style>
        div#buttons { margin: 0px 20px; }
    </style>
</head>



<body>
<div class="d-flex flex-column flex-md-row align-items-center p-3 px-md-4 mb-3 bg-white border-bottom shadow-sm">
    <h1 class="my-0 mr-md-auto font-weight-normal">Add New Post</h1>
    <a class="btn btn-outline-primary" href="posts.jsp">View All Records</a>
</div>

<form action="addpost.jsp" method="post" enctype="multipart/form-data">
    <div class="my-3 p-3 bg-white rounded shadow-sm">
        <table>
            <tr><td>Title:</td><td><input type="text" name="title"/></td></tr>
            <tr><td>Writer:</td><td><input type="text" name="writer"/></td></tr>
            <tr><td>Category:</td><td><input type="text" name="category"></td></tr>
            <tr><td>Content:</td><td><textarea cols="50" rows="5" name="content"></textarea></td></tr>
            <tr><td>Photo:</td><td><input type="file" name="photo"></td></tr>
        </table>
    </div>
    <div id="buttons">
        <input type="submit" value="Add Post" class="btn btn-outline-primary"/>
        <input type="button" value="Cancel" onclick="history.back()" class="btn btn-outline-secondary"/>
    </div>
</form>
</body>
</html>