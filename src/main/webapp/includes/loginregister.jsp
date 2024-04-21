<div class="container login_register">
    <div class="row">
        <div class="col-sm-6">
            <div class="login_form">
                <h1>Login</h1>
                <hr>
                <p>Welcome back! Sign in to your account</p>
                <form action="LoginController" method="post">

                    <% String msgLogFailed = (String) request.getAttribute("LOG_FAILED"); %>
                    <% if (msgLogFailed != null) {%>
                    <div class="alert alert-danger" role="alert">
                        <%=msgLogFailed%>
                    </div>
                    <%}%>
                    <div class="mb-3">
                        <label>Username or Email address*</label> <br>
                        <input type="email"  name="email" />
                    </div>
                    <div class="mb-3">
                        <label>Password*</label> <br>
                        <input type="password" name="password" />
                    </div>
                    <div class="mb-3">
                        <input type="submit" name="submit" value="Login" />
                    </div>
                </form>
            </div>
        </div>
        <div class="col-sm-6">
            <h1>Register</h1>
            <hr>
            <p>Create new account today to reap the benefits of personalized shopping experience.</p>
            <form action="RegisterController" method="post">

                <% String msg = (String) request.getAttribute("REG_OK"); %>
                <% if (msg != null) {%>
                <div class="alert alert-success" role="alert">
                    <%=msg%>
                </div>
                <%}%>

                <% String msgFailed = (String) request.getAttribute("REG_FAILED"); %>
                <% if (msg != null) {%>
                <div class="alert alert-danger" role="alert">
                    <%=msgFailed%>
                </div>
                <%}%>

                <div class="mb-3">
                    <label>Email address*</label> <br>
                    <input type="email"  name="email" />
                </div>
                <div class="mb-3">
                    <label>Password*</label> <br>
                    <input type="password" name="password" />
                </div>
                <div class="mb-3">
                    <input type="radio" id="customer" name="type" value="bidder">
                    <label for="html">I am a customer</label><br>
                    <input type="radio" id="vendor" name="type" value="auctioner">
                    <label for="css">I am a vendor</label><br>
                </div>
                <div class="mb-3">
                    <p>Your personal data will be used to support your experience throughout this website, to <br> manage access to your account, and for other purposes described in our privacy policy </p>
                </div>
                <div class="mb-3">
                    <input type="submit" name="submit" value="Register" />
                </div>
            </form>
            <div class="sign_up_note">

            </div>
        </div>
    </div>
</div>