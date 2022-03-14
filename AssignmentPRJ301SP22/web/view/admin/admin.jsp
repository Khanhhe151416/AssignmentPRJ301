<%-- 
    Document   : admin
    Created on : Mar 7, 2022, 8:39:42 PM
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
        <c:url value="/admin/food/list" var="listFood"/>
        <c:url value="/table/list" var="listTable"/>
        <c:url value="/staff/list" var="listStaff"/>
        <c:url value="/account/list" var="listAccount"/>
        <a href="${listFood}">Food Management</a><br>
        <a href="${listStaff}"> Staff Management</a><br>
        <a href="${listTable}">Table Management</a><br>
        <a href="${listAccount}">Account Management</a>
        
    </body>
</html>
