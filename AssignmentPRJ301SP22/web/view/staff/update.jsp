<%-- 
    Document   : update
    Created on : Mar 15, 2022, 6:50:52 PM
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
            ID:<input readonly="" type="text" name="id" value="${requestScope.staff.id}"/><br>
            Name:<input type="text" name="name" value="${requestScope.staff.name}"/><br>
            DOB:<input type="date" name="dob" value="${requestScope.staff.DOB}"/><br>           
            Phone:<input type="text" name="phone" value="${requestScope.staff.phone}"/><br>
            Salary:<input type="text" name="salary" value="${requestScope.staff.salary}"/><br>
            Gender:<input type="radio" name="gender" <c:if test="${requestScope.staff.gender}">
                          checked="checked"
            </c:if> value="Male"/>Male
            <input type="radio" name="gender" <c:if test="${!requestScope.staff.gender}">
                          checked="checked"
            </c:if> value="FeMale"/>FeMale<br>
            <input type="submit" value="Save"/>
            
        </form>
    </body>
</html>
