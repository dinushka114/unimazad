<%@ page import="com.unimazad.models.User"%>

<div>
    <nav class="navbar top_bar">
        <div  class="container ">
            <a class="navbar-brand">Jordan, Amman</a>
            <a>+96373820323 support@unimazad.com</a>
        </div>
    </nav>

    <nav class="navbar navbar-expand-lg bg-body-tertiary">
        <div class="container middle_navbar">

            <ul>
                <li><a class="active" href="HomePageController">Home</a></li>
                <li><a href="#news">News</a></li>
                <li><a href="#contact">Contact</a></li>
                <li><a href="#about">About</a></li>
            </ul>

            <div>
                UNIMAZAD
            </div>

            <div class="buttons">
                <ul>
                    <% User auctioner = (User) session.getAttribute("auctioner"); %>
                    <% User bidder = (User) session.getAttribute("bidder"); %>

                    <% if (auctioner != null) {%>
                    <li><a class="log_reg_btn" >Hello! <%=auctioner.getEmail()%> </a></li>
                    <li><a href="NavigationController?to=SellerHome" class="add_listing_btn" href="#home">Add Listing</a></li>
                    <li><a href="GetMyListings" class="add_listing_btn" href="#home">My Listings</a></li>
                    <li><a href="LogoutController" class="log_out_btn" >Logout </a></li>
                        <%} else if (bidder != null) {%>
                    <li><a class="log_reg_btn" >Hello! <%=bidder.getEmail()%> </a></li>
                    <li><a href="LogoutController" class="log_out_btn" >Logout</a></li>
                        <%} else {%>
                    <li><a class="log_reg_btn" href="loginreg.jsp">Login/Register</a></li>
                        <%}%>



                </ul>
            </div>

        </div>
    </nav>

</div>