<%-- 
    Document   : foodList
    Created on : Mar 7, 2022, 9:02:47 PM
    Author     : doan7
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link href="../../css/adminFoodList.css" rel="stylesheet" type="text/css"/>
        <script src="../../js/adminFoodPagger.js" type="text/javascript"></script>
        
    </head>
    <body>
        <c:url value="/home/food" var="home"/>
        <table border="1px">
            <tr>
                <td>ID</td>
                <td>Name</td>
                <td>Price</td>
                <td>Image</td>
                <td>Type</td>
                <td></td>
                <td></td>
            </tr>
            <c:forEach items="${requestScope.foods}" var="f">
                <tr>
                    <td>${f.id}</td>
                    <td>${f.name}</td>
                    <td>${f.price}</td>
                    <td><img src="${f.image}"/></td>
                    <td>${f.type.name}</td>
                    <td><input type="button" onclick="doUpdate(${f.id})" value="Update"></td>
                    <td><input type="button" onclick="doDelete(${f.id})" value="Delete"></td>
                </tr>
                
            </c:forEach>
        </table>
        <div class="pagger" id="paggerbottom"></div>
        <script>
            generatePagger('paggerbottom',${requestScope.pageIndex},${requestScope.totalPage},2);
        </script>
        <br>
        <a href="insert">Insert</a><br>
        <a href="${home}">Home</a>
    </body>
</html>
