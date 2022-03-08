<%-- 
    Document   : foodUpdate
    Created on : Mar 8, 2022, 3:59:16 PM
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
    <form action="update" method="post">
        ID:<input type="text" readonly="" name="id" value="${requestScope.food.id}"/><br>
        Name:<input type="text" name="name" value="${requestScope.food.name}"/><br>
        Price:<input type="text" name="price" value="${requestScope.food.price}"/><br>
        Image(URL):<input type="text" name="image" value="${requestScope.food.image}"/><br>
        Type:<select name="type">
            <c:forEach items="${requestScope.tfs}" var="tf">
                
                <option value="${tf.id}"
                        <c:if test="${requestScope.food.type.id eq tf.id}">
                            selected="selected"
                        </c:if>
                        
                        >${tf.name}</option>
                
            </c:forEach>
        </select>
        <br>
        <input type="submit" value="Save"/>
        </form>
        
    </body>
</html>
