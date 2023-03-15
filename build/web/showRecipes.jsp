
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
        <div
            style="background-image: linear-gradient(rgba(0, 0, 0, 0.5), rgba(0, 0, 0, 0.5)), url(Tests/rice.jpg); background-repeat: no-repeat; background-size: cover"
            class="container-fluid vh-100"
            >
            <header>

                <div class="nav navbar-expand w-100 nav-fill navbar-dark bg-transparent">

                    <div class="" id="navbarText">
                        <ul class="navbar-nav mr-auto p-2">
                            <li class="nav-item active">
                                <a class="nav-link pr-4" href="./Search">
                                    <h3>Search recipes</h3><span class="sr-only">(current)</span>
                                </a>
                            </li>
                            <c:if test="${sessionScope['account']!=null}">
                                <li class="nav-item">
                                    <a class="nav-link" href="./MyRecipes">
                                        <h3>My recipes</h3>
                                    </a>
                                </li>
                            </c:if>
                            <c:if test="${sessionScope['account']!=null}">
                                <li class="nav-item">
                                    <a class="nav-link" href="AddRecipe">
                                        <h3>Create recipe</h3>
                                    </a>
                                </li>
                            </c:if>

                        </ul>

                    </div>
                </div>
            </header>
            <div class="container marketing">
                <hr class="featurette-divider m-0 " style=" background-color: white"/>
            </div>
            <section class="pt-5">
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
                                    <li class="list-group-item">${t.getIngredients()}</li>
                                    <li class="list-group-item">${t.getServings()} serving/s</li>
                                </ul>
                                <div class="card-body ">
                                    <div class="d-flex justify-content-around">
                                        <a href="#" class="card-link" ><i class="bi bi-file-plus" style="font-size: 2rem;" ></i></a>
                                        <a href="./RecipeDetails?rid=${t.getRecipeId()}" class="card-link" ><i class="bi bi-eye" style="font-size: 2rem;" ></i></a>    
                                        
                                        <c:if test="${u.getRoleId()==1}">
                                        <a href="./DeleteRecipe?rid=${t.getRecipeId()}" class="card-link"><i class="bi bi-trash3" style="font-size: 2rem"></i></a>
                                        </c:if>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </c:forEach>
                </div>
            </section>
        </div>
    </body>

    <style>

        a{
            color:#fbceb5;
            text-decoration:none;
            background-color:transparent
        }
        a:hover{
            color:#D4a084;
            text-decoration:underline
        }
        a:not([href]):not([class]){
            color:inherit;
            text-decoration:none
        }
        a:not([href]):not([class]):hover{
            color:inherit;
            text-decoration:none
        }
    </style>
</html>