<%-- 
    Document   : orderFood
    Created on : Mar 13, 2022, 6:10:04 PM
    Author     : doan7
--%>

<%@page import="model.TypeFood"%>
<%@page import="model.billDetails"%>
<%@page import="java.util.ArrayList"%>
<%@page import="dal.BillDetailsContext"%>
<%@page import="model.food"%>
<%@page import="java.util.List"%>
<%@page import="dal.FoodDBContext"%>
<%@page import="model.FoodBill"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <script src="../js/order.js" type="text/javascript"></script>
    </head>
    <style>
       
        table{
            background-color: white;
        }

        img{
            width: 100px;
            height: 60px;
        }
        .pagger{
            margin-top: 30px;
        }
        .pagger a{
            border: 1px solid aliceblue;
            border-radius: 2px;
            padding: 2px;
            background-color: #7E8184;
            margin-left: 5px;
            margin-right: 5px;
        }
        .pagger span{
            font-weight: bold;
            border: 1px solid aliceblue;
            background-color: blue;
            border-radius: 2px;
            padding: 2px;
        }
        .Left{
            float: left;
        }
        .Right{
            float: right;
        }
    </style>
    <body>
        <h2><c:forEach items="${requestScope.Tables}" var="tbl">
                <c:if test="${tbl.id == requestScope.tid}">
                    Table: ${tbl.name}
                </c:if>
            </c:forEach></h2>
            <c:url value="/home/food" var="home"/>
        <div>
            <div class="Left">
                <form action="food">
                    <input type="text" name="tid" value="${requestScope.tid}" hidden=""/><br>
                    <select name="typeId">
                        <option value="0">All</option>
                        <c:forEach items="${requestScope.TypeFoods}" var="tf">

                            <option <c:if test="${tf.id == Integer.parseInt(requestScope.rawType)}">
                                    selected ="selected"
                                </c:if> value="${tf.id}">${tf.name}</option>                    
                        </c:forEach>
                        <input type="submit" value="Search"/>
                    </select>

                </form>
                <table border="1px">
                    <tr>

                        <td>Name</td>
                        <td>Price</td>
                        <td>Image</td>
                        <td>Type</td>
                        <td></td>
                    </tr>
                    <c:forEach items="${requestScope.Foods}" var="f">
                        <tr>

                            <td>${f.name}</td>
                            <td>${f.price}$</td>
                            <td><img src="${f.image}"></td>
                                <c:forEach items="${requestScope.TypeFoods}" var="tf">
                                    <c:if test="${tf.id == f.type.id}">
                                    <td>${tf.name}</td>
                                </c:if>
                            </c:forEach>
                            <td><input type="button" onclick="addToBill(${f.id},${requestScope.tid}, 1,${f.price})" value="Add"></td>
                        </tr>
                    </c:forEach>
                </table>
                <div class="pagger" id="paggerbottom"></div><br>
                <a href="${home}">Home</a>
            </div>
            <div class="Right">
                <table >
                    <tr>BILL DETAIL</tr>
                   <%
                       List<TypeFood> typeFoods = (List<TypeFood>) request.getAttribute("TypeFoods");
                      FoodDBContext fDB = new FoodDBContext();
                      List<food> foods = fDB.getFoods();
                      int bid =Integer.parseInt(request.getAttribute("billID").toString()) ;
                      BillDetailsContext detailsDB = new BillDetailsContext();
                      ArrayList<billDetails> details = detailsDB.getAllBll(bid);
                      for(food f : foods){
                          for(billDetails bd : details){
                              if(f.getId() == bd.getFoodID()){
                                  %>
                                  <tr>
                                  <td><%=f.getName()%></td>
                                  <td><%=f.getPrice()%>$</td>
                                  <td> SL: 1<td>
                                  
                                  </tr>
                    <%
                              }
                          }
                      }
                      
                   %>
                   
                </table>
            </div>
        
        </div>
        <script>
            generatePaggerOrderFood('paggerbottom',${requestScope.pageIndex},${requestScope.totalPage},${requestScope.tid},${requestScope.rawType}, 2);
        </script>
    </body>
</html>
