<%-- 
    Document   : Home
    Created on : Feb 10, 2022, 9:15:29 AM
    Author     : doan7
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Home</title>
    
        <link href="../Home.css" rel="stylesheet" type="text/css"/>
    </head>
    <body>
        <c:url value="/account/login" var="login"/>
        <div class="header" >
            <div class="left">
                <img src="http://images.squarespace-cdn.com/content/v1/56fd52eb7da24f1b26011b42/1461637294436-YVPQ107P54NFARBCENQJ/logo+khong+phong+nen.png?format=1500w" alt=""/>
            </div>
            
              <div class ="name_restaurant">
                <h2>칸 도안</h2>
            </div>
            
            <div class="right">
                <a href="${manage}">Admin</a>
                <img src="https://logodix.com/logo/1727561.png">
                <a href="${login}">Login</a>
            </div>
            
        </div>
        
        <div class="mid">
            <div class="banner" style="background-color: black;">
                <div class="items" style="float: left;">
                <a href="">Home</a>
                <a href="">Menu</a>
                <a href="">Promotion</a>
                <a href="">Order</a>
                <a href="">News</a>
                
                </div>
                
                
            </div>

        </div>
            <div class="footer" style="background-color: #757F88; width: 100%; height: 200px;">
                <div class="col1" style="float: left; width: 10%; margin-right:80px ; margin-left: 50px">
                    <p>About us</p> 
                    <p>lslslsllsls</p> 
                    <p>lslslsllsls</p> 
                    <p>lslslsllsls</p> 
                </div>
                <div class="col2" style="float: left; width: 10%;  margin-right:80px ; margin-left: 30px    ">
                    <p>Event</p> 
                    <p>Christmas</p> 
                    <p>Valentine</p> 
                    <p>Halloween</p> 
                </div>
                <div class="col3" style="float: left; width: 10%;  margin-right:80px ; margin-left: 30px   ">
                    <p>Address</p> 
                    <p>Cơsở1:Busan</p> 
                    <p>Cơsở2:Seoul</p> 
                    <p>Cơsở3:Incheon</p> 
                </div>
                <div class="col4" style="float: left; width: 10%;  margin-right:80px ; margin-left: 30px   ">
                    <p>Contact</p> 
                    <p>Email:Khanhdvhe151416@fpt.edu.vn</p> 
                    <p>Phone:0989346734</p> 
                    <p>Facebook:DoanKhanh(pun)</p> 
                </div>
            </div>
           
    </body>
</html>
