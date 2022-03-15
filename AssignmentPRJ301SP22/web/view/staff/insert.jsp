<%-- 
    Document   : insert
    Created on : Mar 14, 2022, 10:53:17 PM
    Author     : doan7
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <form action="insert" method="post">
            Name:<input type="text" name="name"/><br>
            DOB:<input type="date" name="dob"/><br>           
            Phone:<input type="text" name="phone" /><br>
            Salary:<input type="text" name="salary"/><br>
            Gender:<input type="radio" name="gender" checked="checked" value="Male"/>Male
            <input type="radio" name="gender"  value="FeMale"/>FeMale<br>
            <input type="submit" value="Save"/>
            
        </form>
    </body>
</html>
