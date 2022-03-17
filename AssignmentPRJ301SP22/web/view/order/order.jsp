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
        <script src="../js/orderTable.js" type="text/javascript"></script>
    </head>
   <style>
       body{
            background-image: url("https://xmccomplex.com.vn/wp-content/uploads/2021/12/Background-cho-word-780x470.jpg");
        }
        .foodTable{
            height: 50px;
            
            padding: 10px 40px;
            margin: 20px 100px;
            text-align: center;
            float:left;
            background-color: #20fc03;
            
            a{
                margin-top: 1000px;
            }
            
        }
    </style>
    <body>
        <c:url value="/home/food" var="home"/>
        
        
        <div>
            
            <c:forEach items="${requestScope.Tables}" var="t">                
                <input class="foodTable" type="button" onclick="OrderFood(${t.id})" value="${t.name}"/>
                    
                
            </c:forEach>
        </div>       
        <a href="${home}">Home</a>
    </body>
</html>
