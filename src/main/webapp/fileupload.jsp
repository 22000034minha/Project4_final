<%--
  Created by IntelliJ IDEA.
  User: com
  Date: 2022-11-17
  Time: 오후 7:56
  To change this template use File | Settings | File Templates.
--%>

<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="utf-8" %>
<%@ page import="com.example.util.*, java.io.File" %>
<%@ page import="com.oreilly.servlet.*"%>
<%@ page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>

<html>
<head>
    <title>file upload</title>
</head>
<body>
<%
    String filename = "";
    int size_limit = 15*1024*1024;

    String realpath = request.getServletContext().getRealPath("upload");
    File dir = new File(realpath);
    if (!dir.exists()) dir.mkdirs();

    MultipartRequest multipartRequest = null;
    multipartRequest = new MultipartRequest(request, realpath, size_limit, "utf-8", new DefaultFileRenamePolicy());
    filename = multipartRequest.getFilesystemName("photo");

%>

파일명 : <%=filename%><br/>
<img src="${pageContext.request.contextPath}/upload/<%=filename%>">

</body>
</html>
