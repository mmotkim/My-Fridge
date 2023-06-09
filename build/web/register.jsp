<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">
  <head>
    <title>MyFridge Login</title>
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />

    <link href="https://fonts.googleapis.com/css?family=Lato:300,400,700&display=swap" rel="stylesheet" />

    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" />

    <link rel="stylesheet" href="Tests/css/style.css" />
  </head>

  <body class="img js-fullheight" style="background-image: linear-gradient(rgba(0, 0, 0, 0.5), rgba(0, 0, 0, 0.5)), url(Tests/rice.jpg)">
    <section class="ftco-section">
      <div class="container">
        <div class="row justify-content-center">
          <div class="col-md-12 text-center mb-5">
            <h2 class="heading-section">Never waste time wondering what to make for lunch again.</h2>
          </div>
        </div>
        <div class="row justify-content-center">
          <div class="col-md-6 col-lg-4">
            <div class="login-wrap p-0">
              <h3 class="mb-4 text-center">Register a new account</h3>
              <form action="register" method="post" class="signup-form" oninput='p2.setCustomValidity(p2.value != p1.value ? "Password does not match!" : "")'>
                <div class="form-group">
                  <input type="text" name="name" class="form-control" placeholder="Username" required />
                </div>
                <div class="form-group">
                  <input type="text" name="email" class="form-control" placeholder="Email" required />
                </div>

                <div class="form-group">
                  <input id="password-field" name="pass" type="password" class="form-control" name="p1" placeholder="Password" required />
                </div>

                <div class="form-group">
                  <input id="repassword-field" type="password" class="form-control" name="p2" placeholder="Retype Password" />
                  <span toggle="#repassword-field" class="fa fa-fw fa-eye field-icon toggle-password"></span>
                </div>

                <div class="form-group">
                  <button type="submit" value="Create account" class="form-control btn btn-primary submit px-3">Sign In</button>
                </div>

                <div class="form-group d-md-flex"></div>
              </form>

              <p class="w-100 text-center">&mdash; Already have an account? &mdash;</p>
              <div class="social d-flex text-center">
                <a href="./login.jsp" class="px-2 py-2 mr-md-1 rounded">Login</a>
              </div>
            </div>
          </div>
        </div>
      </div>
    </section>

    <script></script>
    <script src="js/jquery.min.js"></script>
    <script src="js/popper.js"></script>
    <script src="js/bootstrap.min.js"></script>
    <script src="js/main.js"></script>
  </body>
</html>
