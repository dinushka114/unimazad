<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="com.unimazad.models.Product"%>
<% Product product = (Product)request.getAttribute("product"); %>
<!DOCTYPE html>
<html>
    <head>
        <%@include file="../includes/header.jsp" %>
        <title>Seller Home | Update Listing</title>
    </head>
    <body>
        <%@include file="../includes/navbar.jsp" %>

        <div class="main_section seller_home">
            <div class="container">
                <h2>Update listing</h2>
                <hr>

                <form action="UpdateListing" method="post" enctype="multipart/form-data">

                    <% String msgLogFailed = (String) request.getAttribute("LOG_FAILED"); %>
                    <% if (msgLogFailed != null) {%>
                    <div class="alert alert-danger" role="alert">
                        <%=msgLogFailed%>
                    </div>
                    <%}%>
                    <div class="mb-3">
                        <label>Name</label> <br>
                        <input type="hidden" name="id" value="<%=product.getId()%>" />
                        <input type="text"  name="name" value="<%=product.getName()%>" />
                    </div>
                    <div class="mb-3">
                        <label>Image</label> <br>
                        <input type="file"  name="image" />
                    </div>
                    <div class="mb-3">
                        <label>Description</label> <br>
                        <textarea name="description"><%=product.getDescription()%></textarea>
                    </div>

                    <div class="mb-3">
                        <label>Category</label> <br>
                        <select name="category">
                            <option value="1">Books</option>
                            <option value="2">Stationery</option>
                            <option value="3">School Uniforms</option>
                            <option value="4">Sports Equipment</option>
                            <option value="5">Art Supplies</option>
                            <option value="6">Electronics</option>
                            <option value="7">Musical Instruments</option>
                            <option value="8">School Bags</option>
                            <option value="9">Lab Equipment</option>
                            <option value="10">Furniture</option>
                            <option value="11">Educational Toys/Games</option>
                            <option value="12">Fitness Equipment</option>
                            <option value="13">School Supplies Bundles</option>
                            <option value="14">Educational Software</option>
                            <option value="15">Event Tickets</option>
                            <option value="16">Food and Beverages</option>
                            <option value="17">Gift Cards</option>
                        </select>
                    </div>

                    <div class="mb-3">
                        <label>Start Price</label> <br>
                        <input type="text" disabled  name="start_price" value="<%=product.getStartPrice()%>" />
                    </div>

                    <div class="mb-3">
                        <label>Start Time</label> <br>
                        <input type="datetime-local" disabled name="start_time" value="<%=product.getStartDate()%>" />
                    </div>

                    <div class="mb-3">
                        <label>End Time</label> <br>
                        <input type="datetime-local"  name="end_time" value="<%=product.getEndDate()%>"  />
                    </div>

                    <div class="mb-3">
                        <input type="submit" name="submit" value="Update" />
                    </div>
                </form>

            </div>
        </div>
    </body>
</html>
