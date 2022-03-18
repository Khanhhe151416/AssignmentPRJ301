<%-- 
    Document   : adminAccountUpdate
    Created on : Mar 18, 2022, 2:25:22 AM
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
            margin-left: 15px;
        }
        a{
            margin-left: 60px;
        }
        
    </style>
    <body>
         <c:url value="/account/list" var="list"/>
        <div class="Login">
        <form action="update" method="Post">
            
            <h3>Change Password</h3>
            Username<br>
            <input  type="text" name="user" value="${requestScope.Account.username}"  /><br>
            Old-Password<br>
            <input type="text" name="OldPass" value="${param.OldPass}" placeholder="Enter Old Password"/><br>
            New-Password<br>
            <input type="text" name="NewPass" value="${param.NewPass}" placeholder="Enter New Password"/><br>
            Re-Password<br>
            <input type="text" name="RePass" value="${param.RePass}" placeholder="Repeat Password"/><br>
            
            <p style="color: red; font-size:  12px;">${err}</p>
            <p style="color: greenyellow; font-size:  12px;">${success}</p>
            <input type="submit" value="Save"/>
           <a href="${list}">List</a>
            
        </form>
        </div>
    </body>
</html>
