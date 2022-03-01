<%-- 
    Document   : list
    Created on : Feb 26, 2022, 5:00:38 PM
    Author     : doan7
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <style>
        img{
            width: 100px;
            height: 60px;
        }
    </style>
    <body>
    
        <table border="1px">
            <tr>
                <td>ID</td>
                <td>Name</td>
                <td>Price</td>
                <td>Image</td>
                <td>Type</td>
            </tr>
            <c:forEach items="${requestScope.Foods}" var="f">
                <tr>
                    <td>${f.id}</td>
                    <td>${f.name}</td>
                    <td>${f.price}$</td>
                    <td><img src="${f.image}"></td>
                    <c:forEach items="${requestScope.TypeFoods}" var="tf">
                        <c:if test="${tf.id == f.type.id}">
                            <td>${tf.name}</td>
                        </c:if>
                    </c:forEach>
                </tr>
            </c:forEach>
        </table>
    </body>
</html>
