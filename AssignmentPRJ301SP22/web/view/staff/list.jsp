<%-- 
    Document   : list
    Created on : Mar 12, 2022, 6:29:32 AM
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
        .pagger{
            margin-top: 30px;
        }
        .pagger a{
    border: 1px solid aliceblue;
    border-radius: 2px;
    padding: 2px;
    background-color: #7E8184;
    margin-left: 5px;
    margin-right: 5px;
}
        .pagger span{
    font-weight: bold;
    border: 1px solid aliceblue;
    background-color: blue;
    border-radius: 2px;
    padding: 2px;
}
    </style>
    <body>
    
        <c:url value="/home/food" var="home"/>
       
        <table border="1px">
            <tr>
                
                <td>ID</td>
                <td>Name</td>
                <td>Salary</td>
                <td></td>
                <td></td>
            </tr>
            <c:forEach items="${requestScope.Staffs}" var="s">
                <tr>
                    <td>${s.id}</td>
                    <td>${s.name}</td>
                    <td>${s.salary}</td>
                    <td><input type="button" onclick="" value="Update"/></td>
                    <td><input type="button" onclick="" value="Delete"/></td>
                   
                </tr>
            </c:forEach>
        </table>
        <div class="pagger" id="paggerbottom"></div><br>
        <a href="${home}">Home</a>
        <script>
            generatePagger('paggerbottom',${requestScope.pageIndex},${requestScope.totalPage},2);
        </script>
    </body>
</html>
