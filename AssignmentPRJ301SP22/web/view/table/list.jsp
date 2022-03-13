<%-- 
    Document   : list
    Created on : Oct 28, 2021, 10:06:42 AM
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
            function doUpdate(id) {
                window.location.href = "update?tid="+id;
            }
            
            function doDelete(id) {
                var c = confirm("Are you sure ?");
                if (c) {
                    window.location.href = "delete?tid="+id;
                    }
            }

        </script>
    </head>
    <body>
        <table border="1px">
            <tr>
                <td>Name</td>
                <td>Status</td>
                <td></td>
                <td></td>
                <td></td>
            </tr>
            <c:forEach items="${requestScope.Tables}" var="t">
                <tr>
                    <td>${t.name}</td>
                    <td>
                        <c:choose>
                            <c:when test="${t.status == true}">
                                Empty
                            </c:when>
                            <c:otherwise>
                                Not Empty
                            </c:otherwise>
                        </c:choose></td>
                    <td><a href="detail?id=${t.id}">Detail</a></td>
                    <td><input type="button" onclick="doUpdate(${t.id})" value="Update"/></td>
                    <td><input type="button" onclick="doDelete(${t.id})" value="Delete"/></td> 
                </tr>
            </c:forEach>
        </table>
        <a href="insert">Insert</a>
    </body>
</html>
