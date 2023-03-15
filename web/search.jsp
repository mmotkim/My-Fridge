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

        <link rel="stylesheet" href="Tests/fonts/icomoon/style.css" />
        <link rel="stylesheet" href="Tests/css/owl.carousel.min.css" />

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

        <jsp:include page="header.jsp"/>
        <main role="main">
            <div class="bg-pattern vh-100 d-flex pt-5 justify-content-lg-start">
                <div class="container mt-5 pt-5">
                    <div class="text-dark">
                        <h2>Select your already owned ingredients</h2>
                    </div>

                    <form action="Search" method="post">
                        <div class="row">
                            <c:forEach var="t" items="${ingrs}">
                                <div class="col-lg-3">
                                    <label class="control control--checkbox">${t.getIngName()}
                                        <input type="checkbox" name="ingr" value="${t.getIngName()}" />
                                        <div class="control__indicator"></div>
                                    </label>
                                </div> 
                            </c:forEach>
                            <input type="hidden" name="selectedIngrs" id="selectedIngrs" />

                        </div>

                        <div class="form-group">
                            <button type="submit" onclick="doIngrs()" class="control form-control btn btn-primary px-3">Show me the
                                recipes</button>
                        </div>

                    </form>
                </div>
            </div>

            <!-- FOOTER -->
            <footer class="container">
                <p class="float-right"><a href="#">Back to top</a></p>
                <p>Made by Mmotkim &middot; PRJ 301 Solo Project</p>
            </footer>
        </main>

        <script>
            function doIngrs() {
                let arr = [];
                let checkboxes = document.querySelectorAll("input[type='checkbox']:checked");

                checkboxes.forEach((item) => {
                    arr.push(item.value);
                });

                var hiddenSelectedIngrs = document.getElementById("selectedIngrs");

                hiddenSelectedIngrs.value = arr.join(",");

                var form = document.getElementById("ingr");
                form.submit();

            }
        </script>

        <script src="https://cdn.jsdelivr.net/npm/jquery@3.5.1/dist/jquery.slim.min.js"
                integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj"
        crossorigin="anonymous"></script>
        <script>
            window.jQuery || document.write('<script src="../assets/js/vendor/jquery.slim.min.js"><\/script>');
        </script>
        <script src="../assets/dist/js/bootstrap.bundle.min.js"></script>
    </body>

</html>