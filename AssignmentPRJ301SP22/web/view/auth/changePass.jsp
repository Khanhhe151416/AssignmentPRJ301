<%-- 
    Document   : changePass
    Created on : Feb 16, 2022, 10:19:50 AM
    Author     : doan7
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <script>
            function login(){
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
            margin-left: 15px;
        }

        
    </style>
    <body>
        <div class="Login">
        <form action="update" method="Post">
            <h3>Change Password</h3>
            Username<br>
            <input  type="text" name="user" value="${param.user}" placeholder="Enter Username" /><br>
            Old-Password<br>
            <input type="text" name="OldPass" value="${param.OldPass}" placeholder="Enter Old Password"/><br>
            New-Password<br>
            <input type="text" name="NewPass" value="${param.NewPass}" placeholder="Enter New Password"/><br>
            Re-Password<br>
            <input type="text" name="RePass" value="${param.RePass}" placeholder="Repeat Password"/><br>
            
            <p style="color: red; font-size:  12px;">${err}</p>
            <p style="color: greenyellow; font-size:  12px;">${success}</p>
            <input type="submit" value="Save"/>
            <input type="button" value="Login" onclick="login()" style="margin-left: 50px;"/>
            
        </form>
        </div>
    </body>
</html>
