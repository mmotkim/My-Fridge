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
        <meta charset="utf-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
        <meta name="description" content="Homepage for MyFridge" />
        <meta name="author" content="Mark Otto, Jacob Thornton, and Bootstrap contributors, modified by Mmotkim" />
        <meta name="generator" content="Hugo 0.101.0" />
        <title>Carousel Template Â· Bootstrap v4.6</title>

        <link rel="canonical" href="https://getbootstrap.com/docs/4.6/examples/carousel/" />
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.3/font/bootstrap-icons.css" />

        <!-- Bootstrap core CSS -->
        <link href="Tests/css/bootstrap.min.css" rel="stylesheet" />

        <style>
            .bd-placeholder-img {
                font-size: 1.125rem;
                text-anchor: middle;
                -webkit-user-select: none;
                -moz-user-select: none;
                -ms-user-select: none;
                user-select: none;
            }

            @media (min-width: 768px) {
                .bd-placeholder-img-lg {
                    font-size: 3.5rem;
                }
            }
        </style>

        <!-- Custom styles for this template -->
        <link href="Tests/home.css" rel="stylesheet" />

    </head>
    <!-- body -->


    <!-- header -->
    <header>
      <nav class="navbar navbar-expand nav-fill w-100 navbar-light" style="border-radius: 0; background-color: rgba(251, 206, 181, 1); border-radius: 20px; margin-top: 10px">
        <a class="navbar-brand" href="#"><h3>My Fridge</h3></a>
        <button
          class="navbar-toggler"
          type="button"
          data-toggle="collapse"
          data-target="#navbarCollapse"
          aria-controls="navbarCollapse"
          aria-expanded="false"
          aria-label="Toggle navigation"
        >
          <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="navbarCollapse">
          <ul class="navbar-nav mr-auto">
            <li class="nav-item active">
              <a class="nav-link" href="HomePage">Home <span class="sr-only">(current)</span></a>
            </li>
            <li class="nav-item">
              <a class="nav-link" href="#">Search by Ingredients</a>
            </li>
          </ul>

          <ul class="navbar-nav ml-auto">
            <c:if test="${sessionScope['account']!=null}">
            <li class="nav-item">
              <a class="nav-link" href="./recipes">Your Recipes</a>
            </li>
            <li class="nav-item">      
            </c:if>
            <c:if test="${sessionScope['account']==null}">
              <a class="nav-link" href="./register">Register</a>
            </li>
            </c:if>
            <c:if test="${sessionScope['account']==null}">
            <li class="nav-item">
              <a class="nav-link mr-md-1 rounded" href="./login">Login</a>
            </li>
            </c:if>
          </ul>
   
          
        </div>
      </nav>
    </header>
</body>

</html>

