<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="com.unimazad.models.Bid"%>
<%@page import="java.util.ArrayList"%>
<%
    String contextPath = request.getContextPath();
    ArrayList<Bid> bids = (ArrayList<Bid>) request.getAttribute("myBids");
%>
<!DOCTYPE html>
<html>
    <head>
        <%@include file="../includes/header.jsp" %>
        <title>Home</title>
        <style>
            .badge{
                margin-bottom: 10px;
                text-decoration: none;
            }
        </style>
    </head>
    <body>
        <%@include file="../includes/navbar.jsp" %>

        <div class="main_section container">

            <h3 class="mb-3 mt-3">My bids</h3>

            <table class="table table-striped">
                <thead>
                    <tr>
                        <th>#</th>
                        <th>Product</th>
                        <th>Bid amount</th>
                        <th>Bid time</th>
                        <th>Status</th>
                    </tr>
                </thead>
                <tbody>
                    <% if (bids != null) {%>

                    <% for (Bid bid : bids) {%>

                    <tr>
                        <td><%=bid.getBidId()%></td>
                        <td>

                            <%=bid.getProductName()%> <br>
                            <img src="<%=contextPath%>/uploads/<%=bid.getProductImage()%>" width="100px" alt="alt"/>

                        </td>
                        <td><%=bid.getBidAmount()%></td>
                        <td><%=bid.getBidTime()%></td>
                        <td> - </td>
                    </tr>


                    <%}
                    }%>
                </tbody>
            </table>


        </div>
        <script>


        </script>
    </body>
</html>
