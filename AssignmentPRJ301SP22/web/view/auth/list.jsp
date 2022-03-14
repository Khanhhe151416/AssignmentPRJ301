<%-- 
    Document   : list
    Created on : Mar 14, 2022, 8:42:14 AM
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
        <table border="1px">
            <tr>
                <td>Username</td>
                <td>Password</td>
                <td>Display Name</td>
                <td></td>
                <td></td>
            </tr>
            <c:forEach items="${requestScope.Accounts}" var="acc">
                <tr>
                    <td>${acc.user}</td>
                    <td>${acc.pass}</td>
                    <td>${acc.displayName}</td>
                    <td><input type="button" onclick="" value="Update"/></td>
                    <td><input type="button" onclick="" value="Delete"/></td>
                </tr>
            </c:forEach>
        </table>
        <a href="insert">Insert</a>
    </body>
</html>
