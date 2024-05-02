<%@page contentType="text/html" pageEncoding="UTF-8"%>
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
                <h2>New listing</h2>
                <hr>

                <form action="LoginController" method="post">

                    <% String msgLogFailed = (String) request.getAttribute("LOG_FAILED"); %>
                    <% if (msgLogFailed != null) {%>
                    <div class="alert alert-danger" role="alert">
                        <%=msgLogFailed%>
                    </div>
                    <%}%>
                    <div class="mb-3">
                        <label>Name</label> <br>
                        <input type="text"  name="name" />
                    </div>
                    <div class="mb-3">
                        <label>Image</label> <br>
                        <input type="file"  name="image" />
                    </div>
                    <div class="mb-3">
                        <label>Description</label> <br>
                        <textarea></textarea>
                    </div>

                    <div class="mb-3">
                        <label>Category</label> <br>
                        <select>
                            <option>Category 1</option>
                            <option>Category 2</option>
                        </select>
                    </div>

                    <div class="mb-3">
                        <label>Start Price</label> <br>
                        <input type="text"  name="start_price" />
                    </div>

                    <div class="mb-3">
                        <label>Start Time</label> <br>
                        <input type="time"  name="start_time" />
                    </div>

                    <div class="mb-3">
                        <label>End Time</label> <br>
                        <input type="time"  name="end_time" />
                    </div>

                    <div class="mb-3">
                        <input type="submit" name="submit" value="Add" />
                    </div>
                </form>

            </div>
        </div>
    </body>
</html>
