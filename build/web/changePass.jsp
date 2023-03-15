<%-- 
    Document   : home
    Created on : Mar 1, 2023, 4:07:25 PM
    Author     : asus
--%>

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
          <div class="col-md-6 text-center mb-5">
            <h2 class="heading-section">Welcome back.</h2>
          </div>
        </div>
        <div class="row justify-content-center">
          <div class="col-md-6 col-lg-4">
            <div class="login-wrap p-0">
              <h3 class="mb-4 text-center">Have an account?</h3>
              
              <form action="./login" method="post" class="signin-form">
                  
                <div class="form-group">
                  <input id="password-field" name="oldPass" type="password" class="form-control" placeholder="Old Password" required />
                  <span toggle="#password-field" class="fa fa-fw fa-eye field-icon toggle-password"></span>
                </div>  
                <div class="form-group">
                  <input id="password-field" name="newPass" type="password" class="form-control" placeholder="New Password" required />
                  <span toggle="#password-field" class="fa fa-fw fa-eye field-icon toggle-password"></span>
                </div>
                <div class="form-group">
                  <input id="password-field" name="newPass" type="password" class="form-control" placeholder="Confirm New Password" required />
                  <span toggle="#password-field" class="fa fa-fw fa-eye field-icon toggle-password"></span>
                </div>
                  
                <div class="form-group">
                  <button type="submit"  class="form-control btn btn-primary submit px-3">Sign In</button>
                </div>
                  
               
              </form>
              <p class="w-100 text-center">${mess}</p>

              
              
            </div>
          </div>
        </div>
      </div>
    </section>

    <script src="js/jquery.min.js"></script>
    <script src="js/popper.js"></script>
    <script src="js/bootstrap.min.js"></script>
    <script src="js/main.js"></script>
  </body>
</html>
