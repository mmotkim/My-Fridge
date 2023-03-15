<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">

<head>
    <title>MyFridge Login</title>
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />

    <link href="https://fonts.googleapis.com/css?family=Lato:300,400,700&display=swap" rel="stylesheet" />

    <link rel="canonical" href="https://getbootstrap.com/docs/4.6/examples/carousel/" />
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.3/font/bootstrap-icons.css" />

    <!-- Bootstrap core CSS -->
    <link href="Tests/css/bootstrap.min.css" rel="stylesheet" />


</head>

<body>
    <div style="background-image: linear-gradient(rgba(0, 0, 0, 0.5), rgba(0, 0, 0, 0.5)), url(Tests/rice.jpg); background-repeat: no-repeat; background-size: cover"
        class="container-fluid vh-100 d-flex">

        <div class="container">
            <div class="row ">
                <div class="col">
                    <div class="pt-5">
                        <h3 class="mb-4 text-light">Edit your recipe</h3>
                        <form action="./EditRecipe" method="post" class="form-text">
                            <label class="text-light" for="recipeName">Recipe Name</label>
                            <div class="input-group mt-sm">
                                <input name="name" id="recipeName" value="current Recipe Name" type="text"
                                    class="form-control" placeholder="Name for your recipe" required />
                            </div><br>

                            <label class="text-light" for="recipeName">Recipe Description</label>
                            <div class="input-group mt-md">
                                <textarea name="instruction" id="recipeInstruction" value="current description"
                                    type="text" class="form-control" placeholder="Instructions for your recipe"
                                    required></textarea>
                            </div><br>

                            <label class="text-light" for="recipeName">Ingredients (separated by comma)</label>
                            <div class="input-group mt-md">
                                <textarea name="ingredients" id="recipeIngredients" value="current description"
                                    type="text" class="form-control" placeholder="Ingredients for your recipe"
                                    required></textarea>
                            </div><br>

                            <label class="text-light" for="servings">Servings: </label> <span
                                class="serving text-light">1</span>
                            <div class="input-group mt-md">
                                <input id="servings" type="range" class="custom-range" min="1" max="10" step="1" id="customRange3" value="0">
                            </div><br>
                            
                            <label class="text-light" for="recipeName">Image Link: </label>
                            <div class="input-group mt-md">
                                <textarea name="image" id="recipeIngredients" value="current description"
                                    type="text" class="form-control" placeholder="www.A nice cover.com"
                                    required></textarea>
                            </div><br>

                            <div class="form-group mt-md-3">
                                <button type="submit" class="form-control btn btn-primary submit px-3">Create</button>
                            </div>

                        </form>
                        <div class="social d-flex text-center">
                            <a href="#" class="px-2 py-2 mr-md-1 rounded">Back</a>
                        </div>
                    </div>
                </div>

                <div class="col pt-5">
                    <div class="card" style="width: 30em; height: 36lh">
                        <img class="card-img-top" src="Tests/2b.jpg" alt="cover">
                        <div class="card-body">
                            <h5 class="card-title">Title</h5>
                            <p class="card-text" style="">description asdfaskdjfbn aslkdjfnaskldf jnaskldfjn aslkdjfn
                                askljdfnlaksdjnf aklsjdnf lkasjdnflk </p>
                        </div>
                        <ul class="list-group list-group-flush">
                            <li class="list-group-item">ingredients asdfa sdf asdfasdf asasf dfsdfa sdfas dfasdf asdfas
                                dfasdf asfasdf </li>
                            <li class="list-group-item">Dapibus ac facilisis in</li>
                            <li class="list-group-item">Vestibulum at eros</li>
                        </ul>
                    </div>
                </div>
            </div>
        </div>

    </div>

    <script>
        var elem = document.querySelector('input[type="range"]');

        var rangeValue = function () {
            var newValue = elem.value;
            var target = document.querySelector('.serving');
            target.innerHTML = newValue;
        }

        elem.addEventListener("input", rangeValue);
    </script>

    <script src="js/jquery.min.js"></script>
    <script src="js/popper.js"></script>
    <script src="js/bootstrap.min.js"></script>
    <script src="js/main.js"></script>
</body>

</html>