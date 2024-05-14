<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="com.unimazad.models.Product"%>
<%@page import="java.util.ArrayList"%>
<%
    String contextPath = request.getContextPath();
    ArrayList<Product> products = (ArrayList<Product>) request.getAttribute("products");
%>
<!DOCTYPE html>
<html>
    <head>
        <%@include file="includes/header.jsp" %>
        <title>Home</title>
        <style>
            .badge{
                margin-bottom: 10px;
                text-decoration: none;
            }
        </style>
    </head>
    <body>
        <%@include file="includes/navbar.jsp" %>

        <div class="main_section container">

            <div class="categories mt-2 mb-3">
                <h3 class="mb-3">Categories</h3>
                <a class="badge text-bg-success p-2" href="HomePageController">All Items</a>
                <a class="badge text-bg-primary p-2" href="GetProductsByCategoryController?id=1">Books</a>
                <a class="badge text-bg-primary p-2" href="GetProductsByCategoryController?id=2">Stationery</a>
                <a class="badge text-bg-primary p-2" href="GetProductsByCategoryController?id=3">School Uniforms</a>
                <a class="badge text-bg-primary p-2" href="GetProductsByCategoryController?id=4">Sports Equipment</a>
                <a class="badge text-bg-primary p-2" href="GetProductsByCategoryController?id=5">Art Supplies</a>
                <a class="badge text-bg-primary p-2" href="GetProductsByCategoryController?id=6">Electronics</a>
                <a class="badge text-bg-primary p-2" href="GetProductsByCategoryController?id=7">Musical Instruments</a>
                <a class="badge text-bg-primary p-2" href="GetProductsByCategoryController?id=8">School Bags</a>
                <a class="badge text-bg-primary p-2" href="GetProductsByCategoryController?id=9">Lab Equipment</a>
                <a class="badge text-bg-primary p-2" href="GetProductsByCategoryController?id=10">Furniture</a>
                <a class="badge text-bg-primary p-2" href="GetProductsByCategoryController?id=11">Educational Toys/Games</a>
                <a class="badge text-bg-primary p-2" href="GetProductsByCategoryController?id=12">Fitness Equipment</a>
                <a class="badge text-bg-primary p-2" href="GetProductsByCategoryController?id=13">School Supplies Bundles</a>
                <a class="badge text-bg-primary p-2" href="GetProductsByCategoryController?id=14">Educational Software</a>
                <a class="badge text-bg-primary p-2" href="GetProductsByCategoryController?id=15">Event Tickets</a>
                <a class="badge text-bg-primary p-2" href="GetProductsByCategoryController?id=16">Food and Beverages</a>
                <a class="badge text-bg-primary p-2" href="GetProductsByCategoryController?id=17">Gift Cards</a>
            </div>
            
            

            <% String alreadyBiddedMsg = (String) request.getAttribute("ALREADY_BIDDED"); %>
            <% if (alreadyBiddedMsg != null) {%>

            <div class="alert alert-danger" role="alert">
                <%=alreadyBiddedMsg%>
            </div>
            <%}%>

            <% String bidLowMsg = (String) request.getAttribute("BID_LOW"); %>
            <% if (bidLowMsg != null) {%>

            <div class="alert alert-danger" role="alert">
                <%=bidLowMsg%>
            </div>
            <%}%>

            <% String okMsg = (String) request.getAttribute("OK"); %>
            <% if (okMsg != null) {%>

            <div class="alert alert-success" role="alert">
                <%=okMsg%>
            </div>
            <%}%>


            <div class="row gx-4 gx-lg-5 row-cols-2 row-cols-md-3 row-cols-xl-4 mt-4">
                <div class="col mb-5">

                    <%if (products != null) {%>
                    <%for (Product item : products) {%>
                    <div class="card h-100">
                        <img style="width: 100%; height: 200px; object-fit: cover;" class="card-img-top" src="<%=contextPath%>/uploads/<%=item.getImage()%>" alt="..." />
                        <div class="card-body">
                            <div class="text-center">
                                <h5 class="fw-bolder"><%=item.getName()%></h5>
                                Starting bid -  <span class="badge text-bg-success p-2">$<%=item.getStartPrice()%>0</span>
                            </div>

                        </div>
                        <div class="card-footer pt-0 border-top-0 bg-transparent">
                            <div class="text-center">

                                <span class="countdown">
                                    Time left - <div class="badge text-bg-danger p-2" id="<%=item.getId()%>"></div>
                                </span>

                                <form id="makeBidForm" action="MakeBidController" method="post" class="">
                                    <input type="hidden" name="product_id" value="<%=item.getId()%>" />
                                    <input type="hidden" name="starting_bid" value="<%=item.getStartPrice()%>" />
                                    <input type="number" name="bid_amount" placeholder="Make a bid" required /> 
                                    <input type="submit" name="submit" value="Place a bid" class="mt-2" />
                                </form>

                                <script>
                                    function updateCountdown(dbDate, countDownId) {
                                        var targetDate = new Date(dbDate)
                                        var now = new Date();
                                        var timeDifference = targetDate - now;

                                        if (timeDifference <= 0) {
                                            document.querySelector('#makeBidForm').style.display = 'none';
                                            document.querySelector('.countdown').style.display = 'none';
                                        }

                                        var days = Math.floor(timeDifference / (1000 * 60 * 60 * 24));
                                        var hours = Math.floor((timeDifference % (1000 * 60 * 60 * 24)) / (1000 * 60 * 60));
                                        var minutes = Math.floor((timeDifference % (1000 * 60 * 60)) / (1000 * 60));
                                        var seconds = Math.floor((timeDifference % (1000 * 60)) / 1000);

                                        document.getElementById(countDownId).innerHTML = days + "d " + hours + "h " + minutes + "m " + seconds + "s";

                                        setTimeout(function () {
                                            updateCountdown(dbDate, countDownId);
                                        }, 1000);
                                    }
                                    updateCountdown('<%=item.getEndDate()%>', '<%=item.getId()%>');
                                </script>
                            </div>
                        </div>
                    </div>
                </div>
                <%}%>
                <%}%>
            </div>

        </div>
        <script>


        </script>
    </body>
</html>
