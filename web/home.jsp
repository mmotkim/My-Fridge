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

    <body style="background-color: white">
        

        
        <main role="main">
            <jsp:include page="header.jsp"/>
            <div
                style="background-image: linear-gradient(rgba(0, 0, 0, 0.5), rgba(0, 0, 0, 0.5)), url(Tests/rice.jpg); background-repeat: no-repeat; background-size: cover"
                class="container-fluid vh-100 d-flex align-items-center justify-content-center text-center"
                >
                <div class="text-light vw-50" style="flex-basis: 1200px">
                    <h1 class="p-3 font-weight-bold" style="font-size: 55px">The home for all your recipes.</h1>
                    <h5 class="font-weight-normal font-italic">Show ready-to-make recipes based on your available ingredients:</h5>
                    <form action="HomePage" method="post" class="form-text">
                        <div class="input-group mt-md-4">
                            <input name="homeSearch" type="text" class="form-control py-2 w-50" placeholder="Enter your ingredients, spaced by comma" required />

                            <span class="input-group-append">
                                <button title="Search" class="input-group-text bg-transparent border-0 border" type="submit">
                                    <i class="bi bi-search white" style="color: white"></i>
                                </button>
                            </span>
                        </div>
                    </form>
                </div>
            </div>

            <!-- Marketing messaging and featurettes
        ================================================== -->
            <!-- Wrap the rest of the page in another container to center all the content. -->

            <div class="container marketing">
                <!-- START THE FEATURETTES -->

                <hr class="featurette-divider" />

                <div class="row featurette">
                    <div class="col-md-7">
                        <h2 class="featurette-heading">Never ask <span style="color: var(--primary)">"What should I make for dinner?"</span> again.</h2>
                        <p class="lead">Select what you have in your fridge, we'll do the recommendations</p>
                    </div>
                    <div class="col-md-5">
                        <img src="Tests/smile.jpg" width="500" height="500" class="featurette-image img-fluid mx-auto" alt="Select ingredients" />
                    </div>
                </div>

                <hr class="featurette-divider" />

                <div class="row featurette">
                    <div class="col-md-7 order-md-2">
                        <h2 class="featurette-heading">Feeling creative? <span style="color: var(--primary)">Add your own proudly-made recipes</span></h2>
                        <p class="lead">Easy steps, fluently al dente.</p>
                    </div>
                    <div class="col-md-5 order-md-1">
                        <img src="Tests/smile.jpg" width="500" height="500" class="featurette-image img-fluid mx-auto" alt="Select ingredients" />
                    </div>
                </div>

                <hr class="featurette-divider" />

                <div class="row featurette">
                    <div class="col-md-7">
                        <h2 class="featurette-heading">Your favorite menu. <span style="color: var(--primary)">All in one place.</span></h2>
                        <p class="lead">
                            And yes, this is the last block of representative placeholder content.
                        </p>
                    </div>
                    <div class="col-md-5">
                        <img src="Tests/smile.jpg" width="500" height="500" class="featurette-image img-fluid mx-auto" alt="Select ingredients" />
                    </div>
                </div>

                <hr class="featurette-divider" />

                <!-- /END THE FEATURETTES -->
            </div>
            <!-- /.container -->

            <!-- FOOTER -->
            <footer class="container">
                <p class="float-right"><a href="#">Back to top</a></p>
                <p>Made by Mmotkim &middot; PRJ 301 Solo Project</p>
            </footer>
        </main>

        <script
            src="https://cdn.jsdelivr.net/npm/jquery@3.5.1/dist/jquery.slim.min.js"
            integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj"
            crossorigin="anonymous"
        ></script>
        <script>
            window.jQuery || document.write('<script src="../assets/js/vendor/jquery.slim.min.js"><\/script>');
        </script>
        <script src="../assets/dist/js/bootstrap.bundle.min.js"></script>
    </body>
</html>
