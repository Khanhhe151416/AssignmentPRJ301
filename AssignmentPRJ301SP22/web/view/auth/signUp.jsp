<%-- 
    Document   : signup
    Created on : Feb 13, 2022, 10:47:10 AM
    Author     : doan7
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Sign Up</title>
        <script>
            function ForwardLogin(){
                window.location.href = "login";
            }
            
        </script>
    </head>
    <style>
         body{
            background-image: url("http://bepnuonghanquoc.com/upload/images/thi%E1%BA%BFt%20k%E1%BA%BF%20nh%C3%A0%20h%C3%A0ng%20n%C6%B0%E1%BB%9Bng%20kh%C3%B4ng%20kh%C3%B3i.jpg");
        }
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
        
        
    </style>
    <body>
        <c:url value="/account/login" var="login"/>
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
            <p style="font-size: 10px; color: red;">${err}</p>
            <p style="font-size: 15px; color: #36E523;">${success}</p>
            <br>
            <input type="submit" value="Register"/>
            <input type="button" value="Login" onclick="ForwardLogin()" style="margin-left: 40px;"/>
            </form>
            
        </div>
    </body>
</html>
