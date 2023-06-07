<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-9ndCyUaIbzAi2FUVXJi0CjmCapSmO7SnpJef0486qhLnuZ2cdeRhO02iuK6FUUVM" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js" integrity="sha384-geWF76RCwLtnZ8qwWowPQNguL3RmwHVBC9FhGdlKrxdiJJigb/j/68SIy3Te4Bkz" crossorigin="anonymous"></script>

<section class="vh-100" style="background-color: #508bfc;">
    <div class="container py-5 h-100">
        <div class="row d-flex justify-content-center align-items-center h-100">
            <div class="col-12 col-md-8 col-lg-6 col-xl-5">
                <div class="card shadow-2-strong" style="border-radius: 1rem;">
                    <div class="card-body p-5 text-center">


                        <h3 class="mb-5">Sign in</h3>
                        <form method="post" action="/afterLogin">

                        <div class="form-outline mb-4">
                            <label for="typeEmailX-2"></label><input type="text" id="typeEmailX-2" class="form-control form-control-lg" name="name" placeholder="Name" />

                        </div>

                        <div class="form-outline mb-4">
                            <label for="typePasswordX-2"></label><input type="password" id="typePasswordX-2" class="form-control form-control-lg" name="password" placeholder="Password" />
                        </div>

                        <!-- Checkbox -->
                        <div class="form-check d-flex justify-content-start mb-4">
                            <input class="form-check-input" type="checkbox" value="" id="form1Example3" />
                            <label class="form-check-label" for="form1Example3"> Remember password </label>
                        </div>

                        <button class="btn btn-primary btn-lg btn-block" type="submit">Login</button>

                        <hr class="my-4">
                        </form>


                    </div>
                    <h2>${error}</h2>
                </div>
            </div>
        </div>
    </div>
</section>