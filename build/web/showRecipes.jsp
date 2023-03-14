
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
        <title>Showing Recipes</title>

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

    <body>
        <jsp:include page="header.jsp"/>
        <div class="title">
            <h1>
                Recipes found:
            </h1>
        </div>
        <div class="row justify-content-center">

            <c:forEach var="t" items="${list}">
                <div class="col-md-4 col-lg-3">
                    <div class="card h-auto" style="width: 20rem">
                        <img class="card-img-top" style="height: 12rem; object-fit: cover" src=${t.getImage()}>
                        <div class="card-body">
                            <h5 class="card-title">${t.getName()}</h5>
                            <p class="card-text" style="  white-space: nowrap;
                               overflow: hidden;
                               text-overflow: ellipsis;">${t.getInstructions()} </p>
                        </div>
                        <ul class="list-group list-group-flush">
                            <li class="list-group-item">ingredients</li>
                            <li class="list-group-item">${t.getServings()} serving/s</li>
                        </ul>
                        <div class="card-body ">
                            <div class="d-flex justify-content-around">
                                <a href="#" class="card-link" ><i class="bi bi-file-plus" style="font-size: 2rem;" ></i></a>
                                <a href="#" class="card-link" ><i class="bi bi-eye" style="font-size: 2rem;" ></i></a>    
                            </div>
                        </div>
                    </div>

                </div>
            </c:forEach>
        </div>

    </body>

</html>