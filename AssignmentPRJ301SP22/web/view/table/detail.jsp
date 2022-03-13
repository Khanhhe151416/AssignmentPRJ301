<%-- 
    Document   : detail
    Created on : Oct 28, 2021, 10:21:09 AM
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
        ID:${requestScope.Table.id}<br>
        Name:${requestScope.Table.name}<br>
        Status:${requestScope.Table.status}<br>
        Quantity:${requestScope.Table.quantity.group}
    </body>
</html>
