<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="com.unimazad.models.Product"%>
<%@page import="java.util.ArrayList"%>
<%
    String contextPath = request.getContextPath();
    ArrayList<Product> products = (ArrayList<Product>)request.getAttribute("listings");
%>

<!DOCTYPE html>
<html>
    <head>
        <%@include file="../includes/header.jsp" %>
        <title>Seller Home</title>
    </head>
    <body>
        <%@include file="../includes/navbar.jsp" %>

        <div class="main_section seller_home">
            <div class="container">
                <h2>My listings</h2>
                <hr>
                
                <table class="table table-striped">
                    <thead>
                        <tr>
                            <th>#</th>
                            <th>Product</th>
                            <th>Description</th>
                            <th>Start Price</th>
                            <th>Start Date</th>
                            <th>End Date</th>
                        </tr>
                    </thead>
                    
                    <thead>
                        
                        <% if(products!=null) {%>
                            
                            <% for(Product product:products){ %>
                            
                            <tr>
                                <td><%=product.getId()%></td>
                                <td>
                                    <%=product.getName()%> <br>
                                    <img src="<%=contextPath%>/uploads/<%=product.getImage()%>" width="100px" alt="alt"/>
                                </td>
                                <td><%=product.getDescription()%></td>
                                <td><%=product.getStartPrice()%></td>
                                <td><%=product.getStartDate()%></td>
                                <td><%=product.getEndDate()%></td>
                            </tr>
                        
                        <%}}%>
                    </thead>
                    
                </table>
                

            </div>
        </div>
    </body>
</html>
