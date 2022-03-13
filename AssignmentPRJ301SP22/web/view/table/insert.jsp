<%-- 
    Document   : insert
    Created on : Oct 28, 2021, 10:17:25 AM
    Author     : doan7
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <form action="insert" method="Post">
        Name:<input type="text" name="name" /><br>
        Status:<input type="radio" name="status" checked="checked" value="Empty"/>Empty
                <input type="radio" name="status" value="Not Empty"/>Not Empty
        <br>
              
        <input type="submit" value="Save"/>
        </form>
    </body>
</html>
