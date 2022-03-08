<%-- 
    Document   : insert
    Created on : Mar 8, 2022, 2:31:58 PM
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
    <body>
        <form action="insert" method="post">
        Name:<input type="text" name="name" /><br>
        Price:<input type="text" name="price" /><br>
        Image(URL):<input type="text" name="image"/><br>
        Type:<select name="type">
            <c:forEach items="${requestScope.tfs}" var="tf">
                <option value="${tf.id}">${tf.name}</option>
            </c:forEach>
            
        </select>
        <br>
        <input type="submit" value="Save"/>
        </form>
    </body>
</html>
