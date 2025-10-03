<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

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
    <!-- SignUp Step-3 (SignUp Fail) Modal ---- end -->

    <!-- SignUp Step-3 (SignUp pass) Modal ---- start -->
    <div class="modal fade" id="message_box_pass" tabindex="-1">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="message_title_pass">SignUp</h5>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <div class="modal-body text-center"> <!-- Center content -->
                    <div>
                        <span class="material-icons d-block fs-1 mb-3 text-success" id="message_icon_pass"
                            style="font-size: 60px;"> <!-- Increased font size -->
                            check_circle
                        </span>
                        <p id="message_text_pass" class="fs-5">Your account has been created successfully!</p>
                    </div>
                </div>
                <div class="modal-footer justify-content-center">
                    <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                </div>
            </div>
        </div>
    </div>
    <!-- SignUp Step-3 (SignUp pass) Modal ---- end -->



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

    <!-- Navbar Section - IMPROVED UI -->

    <header class="edu-header shadow-sm">
        <nav class="navbar navbar-expand-lg navbar-custom py-3">
            <div class="container-fluid px-4">
                <!-- Logo Area -->
                <a class="navbar-brand d-flex align-items-center" href="index.do">
                    <div class="logo-circle">
                        <i class="material-icons">school</i>
                    </div>
                    <span class="brand-text ms-3">EduLearn</span>
                </a>

                <!-- Mobile Toggle Button -->
                <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarContent">
                    <i class="material-icons text-white">menu</i>
                </button>

                <!-- Main Menu -->
                <div class="collapse navbar-collapse" id="navbarContent">
                    <ul class="navbar-nav me-auto ms-4">
                        <li class="nav-item mx-2">
                            <a class="nav-link d-flex align-items-center" href="index.do">
                                <i class="material-icons nav-icon">home</i>
                                <span>Home</span>
                            </a>
                        </li>
                        <li class="nav-item mx-2">
                            <a class="nav-link d-flex align-items-center" href="#popular-courses">
                                <i class="material-icons nav-icon">book</i>
                                <span>Courses</span>
                            </a>
                        </li>
                        <li class="nav-item mx-2">
                            <a class="nav-link d-flex align-items-center" href="#">
                                <i class="material-icons nav-icon">forum</i>
                                <span>Community</span>
                            </a>
                        </li>
                        <li class="nav-item mx-2">
                            <a class="nav-link d-flex align-items-center" href="#">
                                <i class="material-icons nav-icon">help</i>
                                <span>Help Center</span>
                            </a>
                        </li>
                    </ul>

                    <!-- Search Area -->
                    <form action="search.do" class="search-form mx-3">
                        <div class="input-group">
                            <input class="form-control search-input" type="search" placeholder="Search for courses...">
                            <button class="btn search-btn" type="submit">
                                <i class="material-icons">search</i>
                            </button>
                        </div>
                    </form>

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
                                        <span class="ms-2 d-none d-md-inline">${sessionScope.user.name}</span>
                                    </c:when>
                                    <c:otherwise>
                                        <i class="material-icons">person</i>
                                        <span class="ms-2 d-none d-md-inline">Account</span>
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
                                            <div>
                                                <h6 class="mb-0">${sessionScope.user.name}</h6>
                                                <small class="text-muted">${sessionScope.user.email}</small>
                                            </div>
                                        </li>
                                        <li>
                                            <hr class="dropdown-divider">
                                        </li>
                                        <li>
                                            <a href="profile.do" class="dropdown-item py-2">
                                                <i class="material-icons">account_circle</i> My Profile
                                            </a>
                                        </li>
                                        <li>
                                            <a href="#" class="dropdown-item py-2">
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

        <!-- Welcome Message Banner -->
        <c:if test="${not empty sessionScope.user}">
            <div class="welcome-banner">
                <div class="container d-flex align-items-center justify-content-center py-3">
                    <i class="material-icons welcome-icon me-3">waving_hand</i>
                    <span class="welcome-text">Welcome back, <strong>${sessionScope.user.name}</strong>! Continue your
                        learning journey.</span>
                </div>
            </div>
        </c:if>
    </header>
    <style>
        /* Main Header Styling */
        .edu-header {
            background-color: #fff;
        }

        .navbar-custom {
            background: linear-gradient(135deg, #4b6cb7 0%, #182848 100%);
            padding: 1rem 0;
        }

        /* Brand/Logo Styling */
        .logo-circle {
            display: flex;
            align-items: center;
            justify-content: center;
            width: 48px;
            height: 48px;
            background-color: white;
            border-radius: 50%;
            color: #4b6cb7;
            box-shadow: 0 2px 5px rgba(0, 0, 0, 0.2);
        }

        .logo-circle .material-icons {
            font-size: 28px;
        }

        .navbar-brand {
            padding: 0;
            margin-right: 2rem;
        }

        .brand-text {
            color: white;
            font-weight: 700;
            font-size: 1.6rem;
            letter-spacing: 0.5px;
        }

        /* Navigation Links */
        .navbar-nav {
            margin-left: 1.5rem;
        }

        .nav-link {
            color: rgba(255, 255, 255, 0.85) !important;
            font-weight: 500;
            padding: 0.7rem 1.2rem;
            border-radius: 6px;
            margin: 0 0.3rem;
            transition: all 0.3s ease;
            display: flex;
            align-items: center;
            font-size: 1.05rem;
        }

        .nav-link:hover,
        .nav-link:focus {
            color: #ffffff !important;
            background-color: rgba(255, 255, 255, 0.1);
            transform: translateY(-2px);
        }

        .nav-icon {
            font-size: 22px;
            margin-right: 10px;
        }

        /* Search Area */
        .search-form {
            width: 350px;
            max-width: 100%;
            margin: 0 1.5rem;
        }

        .search-input {
            border-radius: 25px 0 0 25px;
            border: none;
            padding: 0.6rem 1.2rem;
            font-size: 1rem;
            box-shadow: 0 2px 5px rgba(0, 0, 0, 0.1);
            border: 1px solid rgba(255, 255, 255, 0.2);
            background-color: rgba(255, 255, 255, 0.1);
            color: white;
            height: 46px;
        }

        .search-input::placeholder {
            color: rgba(255, 255, 255, 0.7);
        }

        .search-input:focus {
            background-color: rgba(255, 255, 255, 0.2);
            border-color: rgba(255, 255, 255, 0.3);
            box-shadow: 0 0 0 0.25rem rgba(255, 255, 255, 0.15);
            color: white;
        }

        .search-btn {
            border-radius: 0 25px 25px 0;
            background-color: rgba(255, 255, 255, 0.2);
            border: 1px solid rgba(255, 255, 255, 0.2);
            color: white;
            padding: 0.375rem 1.2rem;
            height: 46px;
        }

        .search-btn:hover {
            background-color: rgba(255, 255, 255, 0.3);
            color: white;
        }

        /* User Menu Area */
        .user-btn {
            background-color: rgba(255, 255, 255, 0.1);
            border: 1px solid rgba(255, 255, 255, 0.2);
            color: white;
            border-radius: 25px;
            padding: 0.6rem 1.3rem;
            transition: all 0.3s ease;
            font-size: 1.05rem;
        }

        .user-btn:hover,
        .user-btn:focus {
            background-color: rgba(255, 255, 255, 0.2);
            color: white;
        }

        .user-avatar {
            width: 38px;
            height: 38px;
            border-radius: 50%;
            overflow: hidden;
            border: 2px solid rgba(255, 255, 255, 0.7);
        }

        .user-avatar img {
            width: 100%;
            height: 100%;
            object-fit: cover;
        }

        .user-avatar-lg {
            width: 80px;
            height: 80px;
            border-radius: 50%;
            overflow: hidden;
            border: 3px solid #4b6cb7;
        }

        .user-avatar-lg img {
            width: 100%;
            height: 100%;
            object-fit: cover;
        }

        .user-dropdown {
            min-width: 280px;
            padding: 0.7rem 0;
            border: none;
            box-shadow: 0 5px 15px rgba(0, 0, 0, 0.1);
            border-radius: 12px;
            margin-top: 12px;
        }

        .user-info {
            padding: 1.2rem;
        }

        .dropdown-item {
            padding: 0.8rem 1.2rem;
            display: flex;
            align-items: center;
            transition: all 0.2s ease;
            font-size: 1.05rem;
        }

        .dropdown-item .material-icons {
            margin-right: 12px;
            font-size: 22px;
        }

        .dropdown-item:hover {
            background-color: rgba(75, 108, 183, 0.1);
        }

        .dropdown-item.text-danger:hover {
            background-color: rgba(220, 53, 69, 0.1);
        }

        /* Welcome Banner */
        .welcome-banner {
            background: linear-gradient(to right, #00b09b, #96c93d);
            color: white;
        }

        .welcome-icon {
            font-size: 28px;
            margin-right: 12px;
            animation: wave 1.5s ease-in-out infinite;
        }

        .welcome-text {
            font-size: 1.1rem;
        }

        @keyframes wave {

            0%,
            100% {
                transform: rotate(0deg);
            }

            25% {
                transform: rotate(20deg);
            }

            75% {
                transform: rotate(-5deg);
            }
        }

        /* Responsive Adjustments */
        @media (max-width: 992px) {
            .search-form {
                width: 100%;
                margin: 1.2rem 0;
            }

            .navbar-nav {
                margin-left: 0;
                margin-bottom: 1.2rem;
            }

            .nav-link {
                padding: 0.8rem 1.2rem;
                margin: 0.3rem 0;
            }

            .user-menu {
                width: 100%;
                display: flex;
                justify-content: center;
                margin-top: 0.8rem;
            }

            .user-btn {
                width: 100%;
                justify-content: center;
            }
        }

        /* Modal Refinements */
        /* Modern Modal Styling */
        .modal-content {
            border-radius: 16px;
            overflow: hidden;
            border: none;
            box-shadow: 0 10px 30px rgba(0, 0, 0, 0.15);
            background-color: #f8fafc;
        }

        /* Modal Header - New Purple/Violet Gradient */
        .modal-header {
            background: linear-gradient(135deg, #6366f1 0%, #4f46e5 100%);
            color: white;
            border-bottom: none;
            padding: 1.5rem 2rem;
            position: relative;
        }

        .modal-header .modal-title {
            font-weight: 600;
            font-size: 1.3rem;
            letter-spacing: 0.5px;
        }

        .modal-header .btn-close {
            background-color: rgba(255, 255, 255, 0.3);
            border-radius: 50%;
            padding: 0.6rem;
            margin: -0.5rem -0.5rem -0.5rem auto;
            opacity: 1;
            transition: all 0.2s ease;
        }

        .modal-header .btn-close:hover {
            background-color: rgba(255, 255, 255, 0.5);
            transform: rotate(90deg);
        }

        /* Modal Body */
        .modal-body {
            padding: 2rem;
            color: #1e293b;
        }

        /* Form Controls */
        .form-label {
            font-weight: 600;
            color: #334155;
            margin-bottom: 0.5rem;
            font-size: 0.95rem;
        }

        .form-control {
            border-radius: 10px;
            padding: 0.8rem 1.2rem;
            border: 1px solid #e2e8f0;
            background-color: #f1f5f9;
            transition: all 0.3s ease;
            color: #1e293b;
            font-size: 1rem;
        }

        .form-control::placeholder {
            color: #94a3b8;
        }

        .form-control:focus {
            border-color: #6366f1;
            background-color: #ffffff;
            box-shadow: 0 0 0 3px rgba(99, 102, 241, 0.15);
        }

        .form-text {
            color: #64748b;
            font-size: 0.85rem;
            margin-top: 0.5rem;
        }

        /* Input Icons (if needed) */
        .input-group-text {
            background-color: #f1f5f9;
            border: 1px solid #e2e8f0;
            border-radius: 10px 0 0 10px;
            color: #64748b;
        }

        /* Modal Footer */
        .modal-footer {
            border-top: none;
            padding: 1rem 2rem 2rem;
            justify-content: space-between;
        }

        /* Buttons */
        .btn {
            border-radius: 10px;
            padding: 0.8rem 1.8rem;
            font-weight: 500;
            transition: all 0.3s ease;
            font-size: 1rem;
        }

        .btn-primary {
            background: linear-gradient(135deg, #6366f1 0%, #4f46e5 100%);
            border: none;
            color: white;
            box-shadow: 0 4px 10px rgba(99, 102, 241, 0.3);
        }

        .btn-primary:hover {
            background: linear-gradient(135deg, #4f46e5 0%, #4338ca 100%);
            transform: translateY(-2px);
            box-shadow: 0 6px 15px rgba(99, 102, 241, 0.4);
        }

        .btn-primary:active {
            transform: translateY(0);
        }

        .btn-outline-secondary {
            border: 1px solid #cbd5e1;
            color: #475569;
            background-color: transparent;
        }

        .btn-outline-secondary:hover {
            background-color: #f1f5f9;
            color: #334155;
            border-color: #94a3b8;
        }

        /* Alternative Accent Color Button */
        .btn-accent {
            background: linear-gradient(135deg, #ec4899 0%, #c026d3 100%);
            border: none;
            color: white;
            box-shadow: 0 4px 10px rgba(236, 72, 153, 0.3);
        }

        .btn-accent:hover {
            background: linear-gradient(135deg, #db2777 0%, #a21caf 100%);
            transform: translateY(-2px);
            box-shadow: 0 6px 15px rgba(236, 72, 153, 0.4);
        }

        /* Checkbox and Radio Styling */
        .form-check-input {
            width: 1.2em;
            height: 1.2em;
            margin-top: 0.15em;
            border: 1px solid #cbd5e1;
        }

        .form-check-input:checked {
            background-color: #6366f1;
            border-color: #6366f1;
        }

        .form-check-label {
            color: #475569;
        }

        /* Animation for Modal */
        .modal.fade .modal-dialog {
            transition: transform 0.3s ease-out;
        }

        .modal.fade .modal-content {
            transform: scale(0.95);
            opacity: 0;
            transition: all 0.3s ease;
        }

        .modal.show .modal-content {
            transform: scale(1);
            opacity: 1;
        }

        /* Success Message Styling */
        .success-icon {
            font-size: 3rem;
            color: #10b981;
            display: block;
            margin: 0 auto 1rem;
        }

        .error-icon {
            font-size: 3rem;
            color: #ef4444;
            display: block;
            margin: 0 auto 1rem;
        }

        /* Link Styling in Modals */
        .modal a {
            color: #6366f1;
            text-decoration: none;
            transition: all 0.2s ease;
        }

        .modal a:hover {
            color: #4f46e5;
            text-decoration: underline;
        }

        /* Feedback Messages */
        .feedback-message {
            padding: 1rem;
            border-radius: 10px;
            margin-bottom: 1.5rem;
            display: flex;
            align-items: center;
        }

        .feedback-message .material-icons {
            margin-right: 1rem;
            font-size: 1.5rem;
        }

        .feedback-message.success {
            background-color: rgba(16, 185, 129, 0.1);
            color: #065f46;
            border-left: 4px solid #10b981;
        }

        .feedback-message.error {
            background-color: rgba(239, 68, 68, 0.1);
            color: #b91c1c;
            border-left: 4px solid #ef4444;
        }

        /* Modal Mobile Responsiveness */
        @media (max-width: 576px) {

            .modal-body,
            .modal-footer,
            .modal-header {
                padding: 1.25rem;
            }

            .btn {
                padding: 0.7rem 1.2rem;
            }
        }
    </style>