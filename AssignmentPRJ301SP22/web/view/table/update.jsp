<%-- 
    Document   : update
    Created on : Oct 28, 2021, 10:19:04 AM
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
       <form action="update" method="Post">
            ID:${requestScope.Table.id}<input type="hidden" name="id" value="${requestScope.Table.id}"/><br>
            Name:<input type="text" name="name" value="${requestScope.Table.name}" /><br>
            Status:<input type="radio" name="status" <c:if test="${requestScope.Table.status == true}">
                          checked="checked"
            </c:if> value="Empty"/>Empty
            <input type="radio" name="status" 
                   <c:if test="${requestScope.Table.status == false}">
                          checked="checked"
            </c:if>value="Not Empty"/>Not Empty
            <br>
           
            <br><input type="submit" value="Save"/>
        </form>
    </body>
</html>
