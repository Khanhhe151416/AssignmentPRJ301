<%-- 
    Document   : order
    Created on : Mar 13, 2022, 5:42:52 PM
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
        .foodTable{
            height: 50px;
            
            padding: 10px 40px;
            margin: 20px 100px;
            text-align: center;
            float:left;
            background-color: #20fc03;
            
            
        }
    </style>
    <body>
        <c:url value="../view/Home.jsp" var="home"/>
        
        
        <div>
            
            <c:forEach items="${requestScope.Tables}" var="t">
               
                    
                <input class="foodTable" type="button" onclick="" value="${t.name}"/>
                    
                
            </c:forEach>
        </div>       
        <a href="${home}">Home</a>
    </body>
</html>
