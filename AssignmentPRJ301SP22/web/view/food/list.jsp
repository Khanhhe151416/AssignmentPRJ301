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
        <script src="../js/paggerMenu.js" type="text/javascript"></script>
        
    </head>
    <style>
        body{
            background-image: url("https://i.pinimg.com/550x/ba/1c/a9/ba1ca929ec31cc6b61f132aeefa8c5a4.jpg");
        }
        table{
            background-color: white;
        }
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
.ahome{
    color: white;
}
    </style>
    <body>
        <c:url value="/home/food" var="home"/>
        <form action="list">
            <select name="typeId">
                <option value="0">All</option>
                <c:forEach items="${requestScope.TypeFoods}" var="tf">
                    
                    <option <c:if test="${tf.id == Integer.parseInt(requestScope.rawType)}">
                            selected ="selected"
                    </c:if> value="${tf.id}">${tf.name}</option>                    
                </c:forEach>
                    <input type="submit" value="Search"/>
            </select>
            
        </form>
        <table border="1px">
            <tr>
                
                <td>Name</td>
                <td>Price</td>
                <td>Image</td>
                <td>Type</td>
            </tr>
            <c:forEach items="${requestScope.Foods}" var="f">
                <tr>
                    
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
        <div class="pagger" id="paggerbottom"></div><br>
        <a class="ahome" href="${home}">Home</a>
        <script>
            generatePagger('paggerbottom',${requestScope.pageIndex},${requestScope.totalPage},2);
        </script>
    </body>
</html>
