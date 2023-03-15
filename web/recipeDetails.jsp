<!DOCTYPE html>
<html lang="en">

    <head>
        <meta charset="utf-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
        <meta name="description" content="Homepage for MyFridge" />
        <meta name="author" content="Mark Otto, Jacob Thornton, and Bootstrap contributors, modified by Mmotkim" />
        <meta name="generator" content="Hugo 0.101.0" />
        <title>Carousel Template · Bootstrap v4.6</title>

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

    <body style="background-color: white">

        <main role="main">

            <div style="background-image: url(${r.getImage()}); background-repeat: no-repeat; background-size: cover"
                 class="container-fluid position-absolute h-50">
            </div>


            <div style="top: 50vh;" class="container text-dark position-relative">
                <h1>${r.getName()}</h1>
                <h5>${r.getInstructions()}</h5>
                <br>
                <h3>Ingredients</h3>
                <ul class="list-group">
                    <li>
                        ${r.getIngredients()}
                    </li>
                    <c:if test="${!r.getTags().replaceAll("\\s+","").isEmpty()}">
                        <li>
                            Tags: ${r.getTags()}
                        </li>
                    </c:if>

                    <li>
                        Servings: ${r.getServings()}
                    </li>
                </ul>


                <div class="form-group">
                    <a href="./EditRecipe?rid=${t.getRecipeId()}">
                        <button type="button" class="btn btn-primary px-lg-5">Edit this recipe</button>
                    </a>
                </div>

                <div class="form-group">
                    <a href="./AddRecipe">                    
                        <button type="button" class="btn btn-primary px-lg-5">Save this recipe</button>
                    </a>
                </div>

            </div>


        </main>

        <script src="https://cdn.jsdelivr.net/npm/jquery@3.5.1/dist/jquery.slim.min.js"
                integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj"
        crossorigin="anonymous"></script>
        <script>
            window.jQuery || document.write('<script src="../assets/js/vendor/jquery.slim.min.js"><\/script>');
        </script>
        <script src="../assets/dist/js/bootstrap.bundle.min.js"></script>
    </body>

</html>