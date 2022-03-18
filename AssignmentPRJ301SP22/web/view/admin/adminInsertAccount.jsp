<%-- 
    Document   : adminInsertAccount
    Created on : Mar 18, 2022, 1:59:18 AM
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
        
        .Login{
            background-color: #949DA5;
            margin-top: 50px;
            margin-left: 350px;
            height: 350px;
            width: 200px;
            border: 3px solid #757F88;
        }
        input{
            margin-left: 10px;
        }
        a{
            margin-left: 60px;
        }
        
        
    </style>
    <body>
    
         <c:url value="/account/list" var="list"/>
        <div class="Login">
            <form action="insert" method="post">
                <h2 style="text-align: center;">Sign Up</h2>
            Username<br>
            <input type="text" name="user" value="${param.user}" placeholder="Enter Username"/>
            <br>
            <br>
            Password<br>
            <input type="password" name="pass" value="${param.pass}" placeholder="Enter Password"/>
            <br>
            <br>
            Repeat Password<br>
            <input type="password" name="repass" value="${param.repass}" placeholder="Repeat Password"/>
            <br>
            <p style="font-size: 13px; color: red;">${err}</p>
            <p style="font-size: 13px; color: #36E523;">${success}</p>
            <br>
            <input type="submit" value="Register"/>
            <a href="${list}">List</a>
            </form>
            
        </div>
    </body>
</html>
