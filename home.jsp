<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>EduLearn - Online Learning Platform</title>
    
    <!-- Stylesheets -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Icons">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css">
    
    <style>
        body {
            font-family: 'Poppins', sans-serif;
            color: #333;
        }
        
        .hero-section {
            background: linear-gradient(135deg, #7F5AF0 0%, #2CB67D 100%);
            padding: 80px 0;
            color: white;
        }
        
        .feature-card {
            border-radius: 10px;
            border: none;
            box-shadow: 0 5px 15px rgba(0,0,0,0.08);
            transition: transform 0.3s ease, box-shadow 0.3s ease;
            height: 100%;
        }
        
        .feature-card:hover {
            transform: translateY(-10px);
            box-shadow: 0 15px 30px rgba(0,0,0,0.15);
        }
        
        .category-card {
            border-radius: 10px;
            overflow: hidden;
            box-shadow: 0 5px 15px rgba(0,0,0,0.1);
            transition: transform 0.3s ease;
        }
        
        .category-card:hover {
            transform: translateY(-5px);
        }
        
        .category-overlay {
            background: linear-gradient(to bottom, rgba(0,0,0,0.2) 0%, rgba(0,0,0,0.7) 100%);
        }
        
        .testimonial-card {
            border-radius: 10px;
            border: none;
            box-shadow: 0 5px 15px rgba(0,0,0,0.05);
        }
        
        .instructor-card {
            border-radius: 10px;
            overflow: hidden;
            box-shadow: 0 5px 15px rgba(0,0,0,0.08);
            transition: transform 0.3s ease;
        }
        
        .instructor-card:hover {
            transform: translateY(-5px);
        }
        
        .footer {
            background-color: #232946;
            color: #B8C1EC;
            padding: 50px 0 20px;
        }
        
        .footer a {
            color: #B8C1EC;
            text-decoration: none;
        }
        
        .footer a:hover {
            color: #FFFFFE;
        }
        
        .social-icon {
            display: inline-flex;
            align-items: center;
            justify-content: center;
            width: 40px;
            height: 40px;
            border-radius: 50%;
            background-color: #2A2F4E;
            color: #B8C1EC;
            margin-right: 10px;
            transition: all 0.3s ease;
        }
        
        .social-icon:hover {
            background-color: #7F5AF0;
            color: white;
        }
        
        .stats-box {
            background-color: white;
            border-radius: 10px;
            padding: 30px 20px;
            box-shadow: 0 10px 25px rgba(0,0,0,0.1);
            text-align: center;
        }
        
        .stats-number {
            font-size: 2.5rem;
            font-weight: 700;
            color: #7F5AF0;
        }
        
        .btn-gradient {
            background: linear-gradient(135deg, #7F5AF0 0%, #2CB67D 100%);
            border: none;
            color: white;
            border-radius: 30px;
            padding: 10px 25px;
            font-weight: 600;
            transition: all 0.3s ease;
        }
        
        .btn-gradient:hover {
            transform: translateY(-3px);
            box-shadow: 0 10px 20px rgba(0,0,0,0.15);
            color: white;
        }
    </style>
</head>

<body>
    <div class="container-fluid p-0">
        <!-- header start -->
        <c:import url="header.jsp" />
        <!-- header end -->

        <!-- Hero Section -->
        <section class="hero-section">
            <div class="container">
                <div class="row align-items-center">
                    <div class="col-lg-6">
                        <h1 class="display-4 fw-bold mb-4">Transform Your Future with Online Learning</h1>
                        <p class="lead mb-4">Access over 10,000 courses taught by industry experts and transform your life through education.</p>
                        <div class="d-flex gap-3">
                            <button class="btn btn-light btn-lg px-4">Browse Courses</button>
                            <button class="btn btn-outline-light btn-lg px-4">Join Free</button>
                        </div>
                    </div>
                    <div class="col-lg-6">
                        <img src="static/media/images/elearning.svg" class="img-fluid" alt="EduLearn Platform">
                    </div>
                </div>
            </div>
        </section>

        <!-- Stats Section -->
        <section class="py-5 bg-light">
            <div class="container">
                <div class="row g-4">
                    <div class="col-md-3">
                        <div class="stats-box">
                            <div class="stats-number">10K+</div>
                            <p class="mb-0 text-muted">Online Courses</p>
                        </div>
                    </div>
                    <div class="col-md-3">
                        <div class="stats-box">
                            <div class="stats-number">500+</div>
                            <p class="mb-0 text-muted">Expert Instructors</p>
                        </div>
                    </div>
                    <div class="col-md-3">
                        <div class="stats-box">
                            <div class="stats-number">15M+</div>
                            <p class="mb-0 text-muted">Students Worldwide</p>
                        </div>
                    </div>
                    <div class="col-md-3">
                        <div class="stats-box">
                            <div class="stats-number">4.8</div>
                            <p class="mb-0 text-muted">Average Rating</p>
                        </div>
                    </div>
                </div>
            </div>
        </section>

        <!-- Features Section -->
        <section class="py-5">
            <div class="container">
                <div class="text-center mb-5">
                    <h2 class="fw-bold">Why Choose EduLearn?</h2>
                    <p class="text-muted">Discover the advantages that make our platform unique</p>
                </div>
                <div class="row g-4">
                    <div class="col-md-4">
                        <div class="card feature-card h-100">
                            <div class="card-body text-center p-4">
                                <div class="rounded-circle bg-primary bg-opacity-10 p-3 d-inline-flex mb-3">
                                    <i class="material-icons text-primary">laptop</i>
                                </div>
                                <h4>Learn Anywhere</h4>
                                <p class="text-muted">Access all courses on any device, anytime, anywhere. Learn at your own pace.</p>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-4">
                        <div class="card feature-card h-100">
                            <div class="card-body text-center p-4">
                                <div class="rounded-circle bg-success bg-opacity-10 p-3 d-inline-flex mb-3">
                                    <i class="material-icons text-success">verified_user</i>
                                </div>
                                <h4>Certified Courses</h4>
                                <p class="text-muted">Earn certificates recognized by industry leaders and boost your career.</p>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-4">
                        <div class="card feature-card h-100">
                            <div class="card-body text-center p-4">
                                <div class="rounded-circle bg-info bg-opacity-10 p-3 d-inline-flex mb-3">
                                    <i class="material-icons text-info">support_agent</i>
                                </div>
                                <h4>Expert Support</h4>
                                <p class="text-muted">Get assistance from expert instructors and a supportive community of learners.</p>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </section>

        <!-- Popular Categories -->
        <section class="py-5 bg-light" id="popular-courses">
            <div class="container">
                <div class="d-flex justify-content-between align-items-center mb-4">
                    <h2 class="fw-bold mb-0">Popular Categories</h2>
                    <a href="#" class="btn btn-gradient">View All</a>
                </div>
                <div class="row g-4">
                    <div class="col-md-3">
                        <div class="category-card position-relative">
                            <img src="static/media/images/webDevelopmeny.jpg" class="img-fluid w-100" alt="Web Development">
                            <div class="category-overlay position-absolute top-0 start-0 w-100 h-100 d-flex align-items-end">
                                <div class="p-3 text-white">
                                    <h5 class="mb-1">Web Development</h5>
                                    <p class="mb-0 small">240+ Courses</p>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-3">
                        <div class="category-card position-relative">
                            <img src="static/media/images/Data-Science.jpg" class="img-fluid w-100" alt="Data Science">
                            <div class="category-overlay position-absolute top-0 start-0 w-100 h-100 d-flex align-items-end">
                                <div class="p-3 text-white">
                                    <h5 class="mb-1">Data Science</h5>
                                    <p class="mb-0 small">180+ Courses</p>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-3">
                        <div class="category-card position-relative">
                            <img src="static/media/images/business.jpeg" class="img-fluid w-100" alt="Business">
                            <div class="category-overlay position-absolute top-0 start-0 w-100 h-100 d-flex align-items-end">
                                <div class="p-3 text-white">
                                    <h5 class="mb-1">Business</h5>
                                    <p class="mb-0 small">320+ Courses</p>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-3">
                        <div class="category-card position-relative">
                            <img src="static/media/images/design.png" class="img-fluid w-100" alt="Design">
                            <div class="category-overlay position-absolute top-0 start-0 w-100 h-100 d-flex align-items-end">
                                <div class="p-3 text-white">
                                    <h5 class="mb-1">Design</h5>
                                    <p class="mb-0 small">160+ Courses</p>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </section>

        <!-- Testimonials Section -->
        <section class="py-5">
            <div class="container">
                <div class="text-center mb-5">
                    <h2 class="fw-bold">What Our Students Say</h2>
                    <p class="text-muted">Discover how our platform has transformed thousands of lives</p>
                </div>
                <div class="row g-4">
                    <div class="col-md-4">
                        <div class="testimonial-card card h-100">
                            <div class="card-body p-4">
                                <div class="d-flex mb-3">
                                    <i class="material-icons text-warning">star</i>
                                    <i class="material-icons text-warning">star</i>
                                    <i class="material-icons text-warning">star</i>
                                    <i class="material-icons text-warning">star</i>
                                    <i class="material-icons text-warning">star</i>
                                </div>
                                <p class="card-text">"The courses on EduLearn helped me transition from a non-technical role to a full-stack developer in just 6 months. The instructors are amazing!"</p>
                                <div class="d-flex align-items-center mt-3">
                                    <img src="static/media/images/student1.jpeg" class="rounded-circle" alt="Student">
                                    <div class="ms-3">
                                        <h6 class="mb-0">Sarah Johnson</h6>
                                        <small class="text-muted">Full-Stack Developer</small>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-4">
                        <div class="testimonial-card card h-100">
                            <div class="card-body p-4">
                                <div class="d-flex mb-3">
                                    <i class="material-icons text-warning">star</i>
                                    <i class="material-icons text-warning">star</i>
                                    <i class="material-icons text-warning">star</i>
                                    <i class="material-icons text-warning">star</i>
                                    <i class="material-icons text-warning">star</i>
                                </div>
                                <p class="card-text">"I enrolled in the Data Science track and within weeks secured a better job with a 40% salary increase. The hands-on projects really set this platform apart."</p>
                                <div class="d-flex align-items-center mt-3">
                                    <img src="static/media/images/student1.jpeg" class="rounded-circle" alt="Student">
                                    <div class="ms-3">
                                        <h6 class="mb-0">Michael Chen</h6>
                                        <small class="text-muted">Data Scientist</small>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-4">
                        <div class="testimonial-card card h-100">
                            <div class="card-body p-4">
                                <div class="d-flex mb-3">
                                    <i class="material-icons text-warning">star</i>
                                    <i class="material-icons text-warning">star</i>
                                    <i class="material-icons text-warning">star</i>
                                    <i class="material-icons text-warning">star</i>
                                    <i class="material-icons text-warning">star</i>
                                </div>
                                <p class="card-text">"As a working mom, the flexibility of EduLearn was perfect. I completed my digital marketing certification at my own pace and landed my dream job!"</p>
                                <div class="d-flex align-items-center mt-3">
                                    <img src="static/media/images/student1.jpeg" class="rounded-circle" alt="Student">
                                    <div class="ms-3">
                                        <h6 class="mb-0">Lisa Rodriguez</h6>
                                        <small class="text-muted">Marketing Manager</small>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </section>

        <!-- CTA Section -->
        <section class="py-5 bg-primary text-white">
            <div class="container py-4">
                <div class="row align-items-center">
                    <div class="col-lg-8">
                        <h2 class="fw-bold mb-3">Ready to Start Your Learning Journey?</h2>
                        <p class="lead mb-0">Join millions of students and start learning today. Get started with a free account.</p>
                    </div>
                    <div class="col-lg-4 text-lg-end mt-4 mt-lg-0">
                        <button class="btn btn-light btn-lg px-4">Sign Up for Free</button>
                    </div>
                </div>
            </div>
        </section>

        <!-- Footer -->
        <footer class="footer">
            <div class="container">
                <div class="row g-4">
                    <div class="col-lg-4">
                        <h4 class="text-white mb-4">EduLearn</h4>
                        <p>Empowering individuals through high-quality online education and skill development since 2015.</p>
                        <div class="mt-4">
                            <a href="#" class="social-icon"><i class="fab fa-facebook-f"></i></a>
                            <a href="#" class="social-icon"><i class="fab fa-twitter"></i></a>
                            <a href="#" class="social-icon"><i class="fab fa-instagram"></i></a>
                            <a href="#" class="social-icon"><i class="fab fa-linkedin-in"></i></a>
                            <a href="#" class="social-icon"><i class="fab fa-youtube"></i></a>
                        </div>
                    </div>
                    <div class="col-lg-2 col-md-4">
                        <h5 class="text-white mb-4">Explore</h5>
                        <ul class="list-unstyled">
                            <li class="mb-2"><a href="#">Home</a></li>
                            <li class="mb-2"><a href="#">Courses</a></li>
                            <li class="mb-2"><a href="#">Instructors</a></li>
                            <li class="mb-2"><a href="#">About Us</a></li>
                            <li class="mb-2"><a href="#">Contact</a></li>
                        </ul>
                    </div>
                    <div class="col-lg-2 col-md-4">
                        <h5 class="text-white mb-4">Categories</h5>
                        <ul class="list-unstyled">
                            <li class="mb-2"><a href="#">Development</a></li>
                            <li class="mb-2"><a href="#">Business</a></li>
                            <li class="mb-2"><a href="#">Data Science</a></li>
                            <li class="mb-2"><a href="#">Design</a></li>
                            <li class="mb-2"><a href="#">Marketing</a></li>
                        </ul>
                    </div>
                    <div class="col-lg-4 col-md-4">
                        <h5 class="text-white mb-4">Newsletter</h5>
                        <p>Subscribe to our newsletter for the latest updates on courses and promotions.</p>
                        <form class="mt-4">
                            <div class="input-group mb-3">
                                <input type="email" class="form-control" placeholder="Your email address" aria-label="Email address">
                                <button class="btn btn-primary" type="button">Subscribe</button>
                            </div>
                        </form>
                    </div>
                </div>
                <hr class="mt-5 mb-4" style="border-color: rgba(255,255,255,0.1);">
                <div class="row align-items-center">
                    <div class="col-md-6">
                        <p class="mb-md-0">© 2025 EduLearn. All rights reserved.</p>
                    </div>
                    <div class="col-md-6 text-md-end">
                        <a href="#" class="me-3">Terms of Service</a>
                        <a href="#" class="me-3">Privacy Policy</a>
                        <a href="#">Cookies Policy</a>
                    </div>
                </div>
            </div>
        </footer>
    </div>
    
    <!-- All your existing modal and form code here -->

<!-- Success/Failure Modal Logic Script -->
<c:if test="${param.signup == 'true'}">
    <script>
        document.addEventListener("DOMContentLoaded", function () {
            const messageTitle = document.getElementById("message_title_pass");
            const messageText = document.getElementById("message_text_pass");
            const icon = document.getElementById("message_icon_pass");

            messageTitle.textContent = "Signup Successful";
            messageText.textContent = "Your account has been created successfully!";
            icon.textContent = "check_circle";
            icon.classList.remove("text-danger");
            icon.classList.add("text-success");

            new bootstrap.Modal(document.getElementById("message_box_pass")).show();
        });
    </script>
</c:if>





    <!-- Scripts -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
    <script src="static/js/header.js"></script>
</body>
</html>

