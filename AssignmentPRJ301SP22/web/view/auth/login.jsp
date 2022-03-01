<%-- 
    Document   : login
    Created on : Feb 12, 2022, 5:57:57 PM
    Author     : doan7
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>

    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Login</title>
    </head>
    <style>
        form,h2{
            text-align: center;

        }
        .heading{
            margin-top: 100px;       
            border: solid #333333;
            background-color: #949DA5;
            margin-left: 350px;
            margin-right: 350px;
            padding-bottom: 80px;

        }
        body{
            background-image: url("http://bepnuonghanquoc.com/upload/images/thi%E1%BA%BFt%20k%E1%BA%BF%20nh%C3%A0%20h%C3%A0ng%20n%C6%B0%E1%BB%9Bng%20kh%C3%B4ng%20kh%C3%B3i.jpg");
        }
        
        a{
            text-decoration: none;
            margin-left: 30px;
        }
        .Cancel{
            margin-left: 90px;
        }


    </style>

    <body>
        <c:url value="/account/insert" var="insert"/>
        <c:url value="/home/food" var="home"/>

        <div class="login">
            <div class="heading">
                <h2>Sign in</h2>
                <form action="login" method="Post">

                    <div class="input-group input-group-lg">
                        <span class="input-group-addon"><i class="fa fa-user"></i></span>
                        <input type="text" class="form-control" name="user" value="${param.user}" placeholder="Username">
                    </div>
                    <br>
                    <div class="input-group input-group-lg">
                        <span class="input-group-addon"><i class="fa fa-lock"></i></span>
                        <input type="password" class="form-control" name="pass" value="${param.pass}" placeholder="Password">
                    </div>
                    <br>
                    <input type="submit" value="Login" class="float">
                    <p style="color: red">${err}</p>
                </form>
                    <a href="${insert}">Register</a>
                    <a class="Cancel" href="${home}">Cancel</a>
                    <br>
                    <br><a href="update">Change Password</a>
                
            </div>
        </div>
    </body>

</html>