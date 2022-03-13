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
        Status:<input type="radio" disabled="" name="status" <c:if test="${requestScope.Table.status == true}">
                          checked="checked"
            </c:if> value="Empty"/>Empty
        <input type="radio" name="status" disabled=""
                   <c:if test="${requestScope.Table.status == false}">
                          checked="checked"
            </c:if>value="Not Empty"/>Not Empty
            
        
    </body>
</html>
