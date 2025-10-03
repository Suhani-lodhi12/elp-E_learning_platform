<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <link rel="stylesheet"
        href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@20..48,100..700,0..1,-50..200&icon_names=close" />
    <!-- SignUp SignIn Success Fail Handling (unchanged) -->
    <input type="hidden" id="user_signup_report" value="${param.signup}">
    <input type="hidden" id="user_signin_report" value="${param.signin_status}">

    <!-- SignUp Step-3 (SignUp/SignIn Fail) Modal ---- start -->
    <div class="modal fade" id="message_box" tabindex="-1">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="message_title">SignUp</h5>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <div class="modal-body">
                    <div>
                        <span class="material-icons d-block fs-3 ms-5 mb-2">cancel</span>
                        <p id="message"></p>
                    </div>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                    <button type="button" class="btn btn-info" data-bs-toggle="modal"
                        data-bs-target="signupbox">Signup</button>
                </div>
            </div>
        </div>
    </div>
    <!-- SignUp Step-2 Modal ---- start -->
    <div class="modal" id="signup_form" tabindex="-1">
        <div class="modal-dialog modal-dialog-centered">
            <div class="modal-content">
                <form action="signup.do" method="post" id="signup_inner_form">
                    <div class="modal-header">
                        <h5 class="modal-title" id="signup_title">SignUp</h5>
                        <button type="button" class="btn-close btn-close-white" data-bs-dismiss="modal"></button>
                    </div>
                    <div class="modal-body p-3">
                        <input type="hidden" name="user_type_id" id="utype" value="2">
                        <div class="mb-3">
                            <label for="name" class="form-label fw-bold">Name</label>
                            <input type="text" name="name" class="form-control" id="name" required>
                        </div>
                        <div class="mb-3">
                            <label for="email" class="form-label fw-bold">Email</label>
                            <input type="email" name="email" class="form-control" id="email" required>
                        </div>
                        <div class="mb-3">
                            <label for="password" class="form-label fw-bold">Password</label>
                            <input type="password" name="password" class="form-control" id="password" required>
                        </div>
                        <div class="mb-3">
                            <label for="phone" class="form-label fw-bold">Phone</label>
                            <input type="number" name="phone" class="form-control" id="phone" required>
                        </div>
                        <div class="mb-3">
                            <label for="country" class="form-label fw-bold">Country</label>
                            <input list="country_list" type="text" class="form-control" id="country" required>
                            <input type="hidden" name="country_id" id="country_id">
                            <datalist id="country_list">
                                <c:forEach var="ct" items="${countries}">
                                    <option value="${ct.country}" id="${ct.countryId}">
                                </c:forEach>
                            </datalist>
                        </div>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-outline-secondary" data-bs-dismiss="modal">Close</button>
                        <button type="submit" class="btn btn-primary">SignUp</button>
                    </div>
                </form>
            </div>
        </div>
    </div>
    <!-- SignUp Step-2 Modal ---- end -->

    <!-- SignIn Step-1 Modal ---- start -->
    <div class="modal fade" id="signin_form" tabindex="-1">
        <div class="modal-dialog">
            <div class="modal-content">
                <form action="signin.do" method="post">
                    <div class="modal-header">
                        <h5 class="modal-title" id="signin_title">SignIn</h5>
                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                    </div>
                    <div class="modal-body">
                        <div class="mb-3">
                            <label for="signin_email">Email</label>
                            <input type="email" autocomplete="off" class="form-control" name="signin_email"
                                id="signin_email" required>
                        </div>
                        <div class="mb-3">
                            <label for="signin_password">Password</label>
                            <input type="password" class="form-control" name="signin_password" id="signin_password"
                                required>
                        </div>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                        <button type="submit" class="btn btn-primary">SignIn</button>
                    </div>
                </form>
            </div>
        </div>
    </div>
    <!-- SignIn Step-1 Modal ---- end -->


    <header>
        <nav class="navbar navbar-expand-lg navbar-light">
            <div class="container">
                <a class="navbar-brand" href="#">Edu<span>Pro</span></a>
                <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav"
                    aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
                    <span class="navbar-toggler-icon"></span>
                </button>
                <div class="collapse navbar-collapse" id="navbarNav">
                    <ul class="navbar-nav mx-auto">
                        <li class="nav-item">
                            <a class="nav-link active" href="index.do">Home</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="#popular-courses">Courses</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="#trainers-row">Trainers</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="#">About</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="#contacts">Contact</a>
                        </li>
                    </ul>
                    <!-- User Menu -->
                    <div class="user-menu ms-3">
                        <div class="dropdown">
                            <button class="btn user-btn dropdown-toggle d-flex align-items-center"
                                data-bs-toggle="dropdown">
                                <c:choose>
                                    <c:when test="${not empty sessionScope.user}">
                                        <div class="user-avatar">
                                            <img src="static/media/images/user.png" alt="${sessionScope.user.name}">
                                        </div>
                                        <span class="ms-2 d-none ">${sessionScope.user.name}</span>
                                    </c:when>
                                    <c:otherwise>
                                        <span class="material-symbols-outlined">person</span>
                                        <span class="ms-2 d-none ">Account</span>
                                    </c:otherwise>
                                </c:choose>
                            </button>
                            <ul class="dropdown-menu dropdown-menu-end user-dropdown">
                                <c:choose>
                                    <c:when test="${not empty sessionScope.user}">
                                        <li class="dropdown-item user-info text-center">
                                            <div class="user-avatar-lg mx-auto mb-3">
                                                <img src="static/media/images/user.png" alt="${sessionScope.user.name}">
                                            </div>
                                            <div class="user-details">
                                                <h6 class="mb-0">${sessionScope.user.name}</h6>
                                                <small class="text-muted">${sessionScope.user.email}</small>
                                            </div>
                                        </li>
                                        
                                        <li>
                                            <hr class="dropdown-divider">
                                        </li>
                                        <li>
                                            <a href="profile.do" class="dropdown-item py-2">
                                                <i class="material-icons">person</i> My Profile
                                            </a>
                                        </li>
                                        <li>
                                            <a href="#" class="dropdown-item py-2" data-bs-toggle="modal" data-bs-target="#myCoursesModal" id="openMyCourses">
                                                <i class="material-icons">menu_book</i> My Courses
                                            </a>
                                        </li>
                                        <li>
                                            <hr class="dropdown-divider">
                                        </li>
                                        <li>
                                            <a href="logout.do" class="dropdown-item py-2 text-danger">
                                                <i class="material-icons">logout</i> Logout
                                            </a>
                                        </li>
                                    </c:when>
                                    <c:otherwise>
                                        <li>
                                            <button class="dropdown-item py-2" data-bs-toggle="modal"
                                                data-bs-target="#signin_form">
                                                <i class="material-icons">login</i> Sign In
                                            </button>
                                        </li>
                                        <li>
                                            <button class="dropdown-item py-2" data-bs-toggle="modal"
                                                data-bs-target="#signup_form">
                                                <i class="material-icons">person_add</i> Sign Up
                                            </button>
                                        </li>
                                    </c:otherwise>
                                </c:choose>
                            </ul>
                        </div>
                    </div>

                </div>
            </div>
        </nav>
    </header>


    <div class="d-flex">
        <a href="#" class="btn btn-login me-3">Login</a>
        <a href="#" class="btn btn-signup">Sign Up</a>
    </div>