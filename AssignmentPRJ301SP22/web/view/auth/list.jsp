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
        
         <script>
            function doUpdate(username) {

                window.location.href = "update?username=" + username;
            }
            function doDelete(username) {
                var c = confirm("Are you sure ?");
                if (c) {
                    window.location.href = "delete?username=" + username;
                }
            }
        </script>  
    </head>
    <body>
        <c:url value="/admin/account/insert" var="insert"/>
        <c:url value="/admin/account/update" var="update"/>
        <table border="1px">
            <tr>
                <td>Username</td>
                <td>Password</td>
                <td>Display Name</td>
                <td>Role</td>
                
                <td></td>
                <td></td>
            </tr>
            <c:forEach items="${requestScope.Accounts}" var="acc">
                <tr>
                    <td>${acc.user}</td>
                    <td>${acc.pass}</td>
                    <td>${acc.displayName}</td>
                    <td>
                        <c:choose>
                            <c:when test="${acc.role.id == 1}">
                                ADMIN
                            </c:when >
                            <c:when test="${acc.role.id == 2}">
                                Customer
                            </c:when>
                        </c:choose>
                    </td>
                    <td><a href="${update}">Update</a></td>
                    <td><input type="button" onclick="doDelete(`${acc.user}`);" value="Delete"/></td>
                </tr>
            </c:forEach>
        </table>
        <a href="${insert}">Insert</a>
    </body>
</html>
