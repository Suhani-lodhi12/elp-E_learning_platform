<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

    <!DOCTYPE html>
    <html lang="en">

    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>EduPro - Professional Learning Platform</title>
        
        <!-- Bootstrap CSS -->
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
        <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">

        <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600;700&display=swap"
            rel="stylesheet">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
        <style>
            :root {
                --primary: #3b5fe2;
                --primary-light: #edf0ff;
                --secondary: #37517e;
                --accent: #47b2e4;
                --dark: #212529;
                --light: #f8f9fa;
                --gray: #6c757d;
                --success: #28a745;
                --warning: #ffc107;
                --border-radius: 8px;
                --box-shadow: 0 10px 30px rgba(0, 0, 0, 0.08);
                --transition: all 0.3s ease;
            }

            * {
                margin: 0;
                padding: 0;
                box-sizing: border-box;
                font-family: 'Poppins', sans-serif;
            }

            body {
                background-color: #fbfbfd;
                color: #333;
                line-height: 1.7;
            }

            .container {
                max-width: 1320px;
                margin: 0 auto;
                padding: 0 20px;
            }

            /* Header */
            header {
                background-color: #fff;
                box-shadow: 0 2px 15px rgba(0, 0, 0, 0.1);
                position: fixed;
                width: 100%;
                top: 0;
                z-index: 1000;
            }

            .navbar {
                padding: 15px 0;
            }

            .navbar-brand {
                font-weight: 700;
                font-size: 1.8rem;
                color: var(--primary);
            }

            .navbar-brand span {
                color: var(--secondary);
            }

            .navbar-nav .nav-link {
                color: var(--secondary);
                font-weight: 500;
                padding: 8px 16px;
                margin: 0 5px;
                transition: var(--transition);
            }

            .navbar-nav .nav-link:hover,
            .navbar-nav .nav-link.active {
                color: var(--primary);
            }

            .navbar .btn {
                padding: 8px 22px;
                border-radius: 50px;
                font-weight: 500;
                transition: var(--transition);
            }

            .btn-login {
                background-color: transparent;
                border: 1px solid var(--primary);
                color: var(--primary);
            }

            .btn-signup {
                background-color: var(--primary);
                border: 1px solid var(--primary);
                color: white;
            }

            .btn-login:hover,
            .btn-signup:hover {
                transform: translateY(-3px);
                box-shadow: 0 5px 15px rgba(59, 95, 226, 0.2);
            }

            /* Hero Section */
            .hero {
                background: linear-gradient(rgba(55, 81, 126, 0.8), rgba(55, 81, 126, 0.8)), url('/api/placeholder/1600/800') center/cover;
                padding: 180px 0 100px;
                text-align: center;
                color: white;
                margin-bottom: 80px;
                position: relative;
            }

            .hero::before {
                content: '';
                position: absolute;
                bottom: 0;
                left: 0;
                right: 0;
                height: 80px;
                background: #fbfbfd;
                clip-path: polygon(0 100%, 100% 100%, 100% 0);
            }

            .hero h1 {
                font-size: 3.5rem;
                font-weight: 700;
                margin-bottom: 30px;
                animation: fadeIn 1s ease;
            }

            .hero p {
                font-size: 1.2rem;
                max-width: 700px;
                margin: 0 auto 40px;
                animation: fadeIn 1.2s ease;
            }

            .hero-btn {
                display: inline-block;
                background-color: var(--primary);
                color: white;
                padding: 15px 35px;
                border-radius: 50px;
                text-decoration: none;
                font-weight: 600;
                transition: var(--transition);
                animation: fadeIn 1.4s ease;
                border: none;
            }

            .hero-btn:hover {
                background-color: #2c4fd1;
                transform: translateY(-5px);
                box-shadow: 0 10px 25px rgba(59, 95, 226, 0.3);
                color: white;
            }

            .hero-stats {
                display: flex;
                justify-content: center;
                margin-top: 50px;
                animation: fadeIn 1.6s ease;
            }

            .stat-item {
                margin: 0 30px;
                text-align: center;
            }

            .stat-number {
                font-size: 2.5rem;
                font-weight: 700;
                color: var(--primary);
                background: #fff;
                width: 100px;
                height: 100px;
                display: flex;
                align-items: center;
                justify-content: center;
                border-radius: 50%;
                margin: 0 auto 15px;
                box-shadow: var(--box-shadow);
            }

            .stat-text {
                font-size: 1rem;
                color: #fff;
                font-weight: 500;
            }

            /* Features Section */
            .section-title {
                text-align: center;
                margin-bottom: 60px;
                position: relative;
            }

            .section-title h2 {
                font-size: 2.5rem;
                font-weight: 700;
                color: var(--secondary);
                margin-bottom: 15px;
            }

            .section-title p {
                color: var(--gray);
                max-width: 700px;
                margin: 0 auto;
            }

            .section-title::after {
                content: '';
                position: absolute;
                width: 80px;
                height: 4px;
                background: var(--primary);
                bottom: -20px;
                left: 50%;
                transform: translateX(-50%);
                border-radius: 2px;
            }

            .features {
                padding: 80px 0;
            }

            .feature-card {
                background: white;
                border-radius: var(--border-radius);
                padding: 40px 30px;
                box-shadow: var(--box-shadow);
                transition: var(--transition);
                text-align: center;
                margin-bottom: 30px;
                height: 100%;
            }

            .feature-card:hover {
                transform: translateY(-15px);
            }

            .feature-icon {
                width: 80px;
                height: 80px;
                background-color: var(--primary-light);
                border-radius: 50%;
                display: flex;
                align-items: center;
                justify-content: center;
                margin: 0 auto 25px;
            }

            .feature-icon i {
                font-size: 35px;
                color: var(--primary);
            }

            .feature-card h3 {
                color: var(--secondary);
                font-weight: 600;
                margin-bottom: 20px;
                font-size: 1.5rem;
            }

            .feature-card p {
                color: var(--gray);
                font-size: 1rem;
            }

            /* Popular Courses */
            .popular-courses {
                padding: 80px 0;
                background-color: #f8f9fa;
            }

            .course-card {
                background: white;
                border-radius: var(--border-radius);
                overflow: hidden;
                box-shadow: var(--box-shadow);
                transition: var(--transition);
                margin-bottom: 30px;
                height: 100%;
            }

            .course-card:hover {
                transform: translateY(-10px);
            }

            .course-img {
                height: 220px;
                position: relative;
                overflow: hidden;
            }

            .course-img img {
                width: 100%;
                height: 100%;
                object-fit: cover;
                transition: var(--transition);
            }

            .course-card:hover .course-img img {
                transform: scale(1.1);
            }

            .course-badge {
                position: absolute;
                top: 20px;
                right: 20px;
                background-color: var(--primary);
                color: white;
                padding: 5px 15px;
                border-radius: 30px;
                font-size: 0.8rem;
                font-weight: 500;
            }

            .course-content {
                padding: 25px;
            }

            .course-category {
                color: var(--accent);
                font-size: 0.9rem;
                font-weight: 500;
                margin-bottom: 10px;
                display: block;
            }

            .course-content h3 {
                margin-bottom: 15px;
                color: var(--secondary);
                font-size: 1.3rem;
                font-weight: 600;
            }

            .course-content p {
                color: var(--gray);
                margin-bottom: 20px;
                font-size: 0.95rem;
            }

            .course-meta {
                display: flex;
                justify-content: space-between;
                align-items: center;
                padding-top: 15px;
                border-top: 1px solid #eee;
            }

            .course-rating {
                display: flex;
                align-items: center;
            }

            .course-rating i {
                color: var(--warning);
                margin-right: 5px;
            }

            .course-price {
                font-weight: 700;
                color: var(--primary);
                font-size: 1.2rem;
            }

            /* Testimonials */
            .testimonials {
                padding: 80px 0;
            }

            .testimonial {
                background: white;
                border-radius: var(--border-radius);
                padding: 30px;
                box-shadow: var(--box-shadow);
                margin-bottom: 30px;
                position: relative;
                height: 100%;
            }

            .testimonial::before {
                content: '\201C';
                font-size: 80px;
                color: var(--primary-light);
                position: absolute;
                top: 20px;
                left: 25px;
                font-family: serif;
                line-height: 1;
                z-index: 0;
            }

            .testimonial-content {
                position: relative;
                z-index: 1;
            }

            .testimonial p {
                font-style: italic;
                margin-bottom: 25px;
                color: var(--gray);
                font-size: 1rem;
            }

            .testimonial-author {
                display: flex;
                align-items: center;
            }

            .author-image {
                width: 60px;
                height: 60px;
                border-radius: 50%;
                overflow: hidden;
                margin-right: 15px;
                border: 3px solid var(--primary-light);
            }

            .author-image img {
                width: 100%;
                height: 100%;
                object-fit: cover;
            }

            .author-info h4 {
                margin-bottom: 5px;
                color: var(--secondary);
                font-weight: 600;
                font-size: 1.1rem;
            }

            .author-info p {
                color: var(--gray);
                margin-bottom: 0;
                font-style: normal;
                font-size: 0.9rem;
            }

            /* CTA Section */
            .call-to-action {
                background: linear-gradient(135deg, var(--primary), var(--secondary));
                border-radius: var(--border-radius);
                padding: 80px 30px;
                text-align: center;
                color: white;
                margin: 80px 0;
                position: relative;
                overflow: hidden;
            }

            .call-to-action::before {
                content: '';
                position: absolute;
                width: 300px;
                height: 300px;
                border-radius: 50%;
                background: rgba(255, 255, 255, 0.1);
                top: -100px;
                right: -100px;
            }

            .call-to-action::after {
                content: '';
                position: absolute;
                width: 200px;
                height: 200px;
                border-radius: 50%;
                background: rgba(255, 255, 255, 0.1);
                bottom: -50px;
                left: -50px;
            }

            .call-to-action h2 {
                font-size: 2.5rem;
                font-weight: 700;
                margin-bottom: 20px;
                position: relative;
                z-index: 1;
            }

            .call-to-action p {
                max-width: 700px;
                margin: 0 auto 30px;
                position: relative;
                z-index: 1;
                font-size: 1.1rem;
            }

            .cta-btn {
                display: inline-block;
                background-color: white;
                color: var(--primary);
                padding: 15px 35px;
                border-radius: 50px;
                text-decoration: none;
                font-weight: 600;
                transition: var(--transition);
                position: relative;
                z-index: 1;
            }

            .cta-btn:hover {
                background-color: var(--light);
                transform: translateY(-5px);
                box-shadow: 0 10px 25px rgba(255, 255, 255, 0.3);
                color: var(--primary);
            }

            /* Trainers Section */
            .trainers {
                padding: 80px 0;
                background-color: #f8f9fa;
            }

            .trainer-card {
                background: white;
                border-radius: var(--border-radius);
                overflow: hidden;
                box-shadow: var(--box-shadow);
                margin-bottom: 30px;
                height: 100%;
            }

            .trainer-img {
                height: 250px;
                position: relative;
                overflow: hidden;
            }

            .trainer-img img {
                width: 100%;
                height: 100%;
                object-fit: cover;
                transition: var(--transition);
            }

            .trainer-social {
                position: absolute;
                top: 20px;
                right: -50px;
                transition: var(--transition);
            }

            .trainer-social a {
                display: block;
                width: 40px;
                height: 40px;
                background: white;
                color: var(--primary);
                border-radius: 50%;
                display: flex;
                align-items: center;
                justify-content: center;
                margin-bottom: 10px;
                transition: var(--transition);
            }

            .trainer-social a:hover {
                background: var(--primary);
                color: white;
            }

            .trainer-card:hover .trainer-social {
                right: 20px;
            }

            .trainer-card:hover .trainer-img img {
                transform: scale(1.1);
            }

            .trainer-info {
                padding: 25px;
                text-align: center;
            }

            .trainer-info h4 {
                margin-bottom: 5px;
                color: var(--secondary);
                font-weight: 600;
            }

            .trainer-info span {
                color: var(--accent);
                font-size: 0.9rem;
            }

            .trainer-info p {
                color: var(--gray);
                margin: 15px 0 0;
                font-size: 0.95rem;
            }

            /* Newsletter */
            .newsletter {
                padding: 80px 0;
                background-color: var(--primary-light);
            }

            .newsletter-content {
                max-width: 800px;
                margin: 0 auto;
                text-align: center;
            }

            .newsletter h2 {
                color: var(--secondary);
                font-weight: 700;
                margin-bottom: 20px;
            }

            .newsletter p {
                color: var(--gray);
                margin-bottom: 30px;
            }

            .newsletter-form {
                display: flex;
                max-width: 500px;
                margin: 0 auto;
            }

            .newsletter-form input {
                flex: 1;
                padding: 15px 20px;
                border: none;
                border-radius: 50px 0 0 50px;
                font-size: 1rem;
                outline: none;
            }

            .newsletter-form button {
                background-color: var(--primary);
                color: white;
                border: none;
                padding: 0 30px;
                border-radius: 0 50px 50px 0;
                font-weight: 600;
                cursor: pointer;
                transition: var(--transition);
            }

            .newsletter-form button:hover {
                background-color: var(--secondary);
            }

            /* cart button */

            .cart-button {
                position: fixed;
                bottom: 20px;
                right: 20px;
                width: 60px;
                height: 60px;
                border-radius: 50%;
                background-color: #0d6efd;
                color: white;
                display: flex;
                justify-content: center;
                align-items: center;
                box-shadow: 0 4px 10px rgba(0, 0, 0, 0.3);
                cursor: pointer;
                z-index: 1000;
                transition: all 0.3s ease;
            }

            .cart-button:hover {
                background-color: #0b5ed7;
                transform: translateY(-3px);
            }

            .cart-count {
                position: absolute;
                top: 0;
                right: 0;
                background-color: #dc3545;
                color: white;
                border-radius: 50%;
                width: 24px;
                height: 24px;
                display: flex;
                justify-content: center;
                align-items: center;
                font-size: 12px;
                font-weight: bold;
            }

            /* Cart Container */
            .cart-container {
                position: fixed;
                bottom: -100%;
                left: 0;
                width: 100%;
                background-color: white;
                border-top: 1px solid #dee2e6;
                box-shadow: 0 -4px 10px rgba(0, 0, 0, 0.1);
                z-index: 999;
                transition: bottom 0.4s ease;
                border-top-left-radius: 15px;
                border-top-right-radius: 15px;
                padding: 20px;
                max-height: 80vh;
                overflow-y: auto;
            }

            .cart-container.open {
                bottom: 0;
            }

            .cart-header {
                display: flex;
                justify-content: space-between;
                align-items: center;
                margin-bottom: 15px;
                padding-bottom: 10px;
                border-bottom: 1px solid #dee2e6;
            }

            .cart-close {
                cursor: pointer;
                font-size: 1.5rem;
            }

            /* .course-card {
                border: 1px solid #dee2e6;
                border-radius: 8px;
                overflow: hidden;
                margin-bottom: 15px;
                background-color: white;
                transition: transform 0.3s ease;
            }

            .course-card:hover {
                transform: translateY(-3px);
                box-shadow: 0 5px 15px rgba(0, 0, 0, 0.1);
            }

            .course-image {
                height: 140px;
                background-size: cover;
                background-position: center;
            } */

            .empty-cart {
                text-align: center;
                padding: 40px 0;
            }

            .checkout-bar {
                background-color: #f8f9fa;
                padding: 15px;
                border-radius: 8px;
                margin-top: 15px;
            }

            @media (min-width: 768px) {
                .cart-container {
                    max-width: 500px;
                    left: auto;
                    right: 20px;
                    border-radius: 15px;
                }
            }

            /* Footer */
            footer {
                background-color: var(--secondary);
                color: white;
                padding: 80px 0 20px;
            }

            .footer-top {
                margin-bottom: 50px;
            }

            .footer-logo {
                font-size: 2rem;
                font-weight: 700;
                color: white;
                margin-bottom: 20px;
                display: block;
            }

            .footer-logo span {
                color: var(--accent);
            }

            .footer-about p {
                color: rgba(255, 255, 255, 0.7);
                margin-bottom: 25px;
            }

            .footer-social {
                display: flex;
                gap: 15px;
            }

            .footer-social a {
                display: flex;
                align-items: center;
                justify-content: center;
                width: 40px;
                height: 40px;
                background: rgba(255, 255, 255, 0.1);
                color: white;
                border-radius: 50%;
                transition: var(--transition);
            }

            .footer-social a:hover {
                background: var(--primary);
                transform: translateY(-5px);
            }

            .footer-title {
                font-size: 1.2rem;
                font-weight: 600;
                margin-bottom: 25px;
                color: white;
            }

            .footer-links {
                list-style: none;
                padding: 0;
            }

            .footer-links li {
                margin-bottom: 12px;
            }

            .footer-links a {
                color: rgba(255, 255, 255, 0.7);
                text-decoration: none;
                transition: var(--transition);
                display: inline-flex;
                align-items: center;
            }

            .footer-links a i {
                margin-right: 10px;
                font-size: 0.8rem;
            }

            .footer-links a:hover {
                color: var(--accent);
                transform: translateX(5px);
            }

            .footer-contact li {
                margin-bottom: 15px;
                color: rgba(255, 255, 255, 0.7);
                display: flex;
                align-items: flex-start;
            }

            .footer-contact i {
                margin-right: 15px;
                color: var(--accent);
            }

            .footer-bottom {
                border-top: 1px solid rgba(255, 255, 255, 0.1);
                padding-top: 30px;
                text-align: center;
            }

            .footer-bottom p {
                color: rgba(255, 255, 255, 0.7);
                font-size: 0.9rem;
            }

            /* Be a Trainer Offcanvas */
            .offcanvas-header {
                background: var(--primary);
                color: white;
            }

            .btn-close {
                filter: brightness(0) invert(1);
            }

            .trainer-form .form-control {
                padding: 12px;
                border-radius: var(--border-radius);
                border: 1px solid #e1e1e1;
            }

            .trainer-form .form-control:focus {
                box-shadow: none;
                border-color: var(--primary);
            }

            .trainer-form .btn-submit {
                background-color: var(--primary);
                color: white;
                border: none;
                padding: 12px 30px;
                border-radius: 50px;
                font-weight: 600;
                transition: var(--transition);
                width: 100%;
            }

            .trainer-form .btn-submit:hover {
                background-color: var(--secondary);
            }

            /* Responsive */
            @media (max-width: 991px) {
                .hero {
                    padding: 150px 0 80px;
                }

                .hero h1 {
                    font-size: 2.8rem;
                }

                .stat-item {
                    margin: 0 15px;
                }

                .stat-number {
                    width: 80px;
                    height: 80px;
                    font-size: 2rem;
                }

                .footer-col {
                    margin-bottom: 40px;
                }
            }

            @media (max-width: 767px) {
                .hero {
                    padding: 130px 0 60px;
                }

                .hero h1 {
                    font-size: 2.2rem;
                }

                .hero p {
                    font-size: 1rem;
                }

                .hero-stats {
                    flex-wrap: wrap;
                }

                .stat-item {
                    width: 50%;
                    margin: 0 0 30px;
                }

                .section-title h2 {
                    font-size: 2rem;
                }

                .call-to-action h2 {
                    font-size: 2rem;
                }

                .newsletter-form {
                    flex-direction: column;
                }

                .newsletter-form input {
                    border-radius: 50px;
                    margin-bottom: 15px;
                }

                .newsletter-form button {
                    border-radius: 50px;
                    padding: 15px;
                }
            }

            @media (max-width: 575px) {
                .navbar-brand {
                    font-size: 1.5rem;
                }

                .hero h1 {
                    font-size: 1.8rem;
                }

                .hero-btn {
                    padding: 12px 25px;
                    font-size: 0.9rem;
                }

                .stat-item {
                    width: 100%;
                }

                .section-title h2 {
                    font-size: 1.8rem;
                }

                .call-to-action {
                    padding: 50px 20px;
                }

                .call-to-action h2 {
                    font-size: 1.8rem;
                }
            }

            /* Animations */
            @keyframes fadeIn {
                from {
                    opacity: 0;
                    transform: translateY(20px);
                }

                to {
                    opacity: 1;
                    transform: translateY(0);
                }
            }
        </style>
        <style>
            
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

            .wishlist-icon button {
                background: white;
                border: none;
                font-size: 22px;
                color: red;
            }

            .wishlist-icon button:hover {
                color: darkred;
            }
        </style>

        <style>
            /* QR Payment Modal Styles */
.qr-container {
    background-color: #ffffff;
    border-radius: 8px;
    display: flex;
    justify-content: center;
    align-items: center;
    padding: 15px;
    box-shadow: 0 2px 10px rgba(0, 0, 0, 0.1);
}

.payment-details {
    background-color: #f8f9fa;
    border-radius: 8px;
    padding: 15px;
}

.step-container {
    display: flex;
    justify-content: space-between;
    margin-bottom: 25px;
}

.step {
    flex: 1;
    text-align: center;
    padding: 10px;
    background-color: #f0f0f0;
    border-radius: 4px;
    margin: 0 5px;
    font-size: 14px;
    transition: all 0.3s ease;
}

.step.active {
    background-color: #0d6efd;
    color: white;
    box-shadow: 0 2px 5px rgba(0,0,0,0.2);
}

.upload-container {
    border: 2px dashed #ced4da;
    border-radius: 8px;
    transition: all 0.3s ease;
}

.upload-container:hover {
    border-color: #0d6efd;
}

.upload-label {
    cursor: pointer;
    display: flex;
    flex-direction: column;
    align-items: center;
    justify-content: center;
    height: 180px;
    background-color: #f8f9fa;
    border-radius: 6px;
    transition: all 0.3s ease;
}

.upload-label:hover {
    background-color: #e9ecef;
}

.upload-label i {
    font-size: 48px;
    color: #6c757d;
    margin-bottom: 15px;
}

#previewContainer {
    max-width: 100%;
    overflow: hidden;
    border-radius: 6px;
    margin-top: 15px;
    transition: all 0.3s ease;
}

#screenshotPreview {
    max-width: 100%;
    border-radius: 4px;
    box-shadow: 0 2px 5px rgba(0,0,0,0.1);
}

#confirmationSection i.fas.fa-check-circle {
    color: #28a745;
    animation: pulse 1.5s infinite;
}

@keyframes pulse {
    0% {
        transform: scale(1);
        opacity: 1;
    }
    50% {
        transform: scale(1.05);
        opacity: 0.8;
    }
    100% {
        transform: scale(1);
        opacity: 1;
    }
}

/* Button styles */
.btn-primary {
    transition: all 0.3s ease;
}

.btn-primary:disabled {
    opacity: 0.6;
    cursor: not-allowed;
}

/* Animation for section transitions */
.payment-section {
    transition: all 0.4s ease-in-out;
}

/* Toast notification for error messages */
.toast-container {
    position: fixed;
    top: 20px;
    right: 20px;
    z-index: 1060;
}

.toast {
    background-color: rgba(255, 255, 255, 0.95);
    border-left: 4px solid #dc3545;
}

/* CSS for the screenshot upload section */
.screenshot-upload-container {
    border: 2px dashed #ccc;
    border-radius: 8px;
    padding: 20px;
    text-align: center;
    cursor: pointer;
    transition: all 0.3s ease;
}

.screenshot-upload-container:hover {
    border-color: #007bff;
    background-color: rgba(0, 123, 255, 0.05);
}

.screenshot-icon-container {
    margin-bottom: 15px;
}

.screenshot-icon-circle {
    width: 70px;
    height: 70px;
    background-color: #007bff;
    border-radius: 50%;
    display: flex;
    align-items: center;
    justify-content: center;
    margin-bottom: 10px;
}

#screenshotPreview {
    max-height: 200px;
    margin-top: 15px;
}
        </style>
    </head>

    <body>
        <!-- Header -->
        <c:import url="learnerHeader.jsp" />
        <form action="user_courses.do" method="post" id="user_course">
            <input type="hidden" id="course_id" name="courseId">
        </form>
        <!-- Hero Section -->
        <section class="hero">
            <div class="container">
                <h1>Transform Your Career With Expert-Led Courses</h1>
                <p>Join our community of over 100,000 learners who have mastered in-demand skills and advanced their
                    careers
                    through our interactive learning platform.</p>
                <a href="#" class="hero-btn">Explore Courses</a>
                <button type="button" data-bs-toggle="offcanvas" data-bs-target="#about_trainer"
                    class="hero-btn ms-3">Become an Instructor</button>

                <div class="hero-stats">
                    <div class="stat-item">
                        <div class="stat-number">500+</div>
                        <div class="stat-text">Courses</div>
                    </div>
                    <div class="stat-item">
                        <div class="stat-number">250+</div>
                        <div class="stat-text">Instructors</div>
                    </div>
                    <div class="stat-item">
                        <div class="stat-number">100K+</div>
                        <div class="stat-text">Students</div>
                    </div>
                </div>
            </div>
        </section>

        <!-- Features Section -->
        <section class="features">
            <div class="container">
                <div class="section-title">
                    <h2>Why Choose EduPro</h2>
                    <p>We provide a comprehensive learning experience with features designed to help you succeed.</p>
                </div>

                <div class="row">
                    <div class="col-md-4">
                        <div class="feature-card">
                            <div class="feature-icon">
                                <i class="fas fa-clock"></i>
                            </div>
                            <h3>Self-Paced Learning</h3>
                            <p>Learn at your own pace with unlimited access to course materials. Progress through
                                lessons on
                                your schedule and revisit content whenever you need.</p>
                        </div>
                    </div>
                    <div class="col-md-4">
                        <div class="feature-card">
                            <div class="feature-icon">
                                <i class="fas fa-user-tie"></i>
                            </div>
                            <h3>Industry Experts</h3>
                            <p>Learn from recognized industry professionals with real-world experience. Our instructors
                                are
                                passionate about sharing their knowledge and helping you succeed.</p>
                        </div>
                    </div>
                    <div class="col-md-4">
                        <div class="feature-card">
                            <div class="feature-icon">
                                <i class="fas fa-laptop-code"></i>
                            </div>
                            <h3>Hands-On Projects</h3>
                            <p>Reinforce your learning with practical projects and assignments. Apply what you've
                                learned
                                and
                                build a portfolio to showcase your skills to potential employers.</p>
                        </div>
                    </div>
                    <div class="col-md-4">
                        <div class="feature-card">
                            <div class="feature-icon">
                                <i class="fas fa-certificate"></i>
                            </div>
                            <h3>Certificates</h3>
                            <p>Earn industry-recognized certificates upon completion of your courses. Add them to your
                                resume
                                and LinkedIn profile to enhance your professional credibility.</p>
                        </div>
                    </div>
                    <div class="col-md-4">
                        <div class="feature-card">
                            <div class="feature-icon">
                                <i class="fas fa-comments"></i>
                            </div>
                            <h3>Community Support</h3>
                            <p>Join a community of like-minded learners. Participate in forums, group discussions, and
                                networking events to connect with peers and instructors.</p>
                        </div>
                    </div>
                    <div class="col-md-4">
                        <div class="feature-card">
                            <div class="feature-icon">
                                <i class="fas fa-mobile-alt"></i>
                            </div>
                            <h3>Mobile Learning</h3>
                            <p>Access your courses on the go with our mobile-friendly platform. Learn anytime, anywhere
                                on
                                your smartphone or tablet with our responsive design.</p>
                        </div>
                    </div>
                </div>
            </div>
        </section>

        <!-- Popular Courses Section -->
        <section class="popular-courses" id="popular-courses">
            <div class="container">
                <div class="section-title">
                    <h2>Our Most Popular Courses</h2>
                    <p>Explore our top-rated courses designed to help you master in-demand skills.</p>
                </div>
                <div class="row">
                    <c:forEach var="course" items="${courses}" varStatus="loop">
                        <div class="col-lg-4 col-md-6 mt-2 course-box <c:if test='${loop.index >= 3}'>d-none</c:if>">
                            <div class="course-card">
                                <div class="course-img position-relative">
                                    <img src="download_media.do?thumbnail=${course.thumbnail}"
                                        alt="${course.courseName}">
                                    <c:if test="${course.starRank >= 4.8}">
                                        <span class="course-badge">Bestseller</span>
                                    </c:if>
                                    <div class="wishlist-icon position-absolute top-0 end-0 p-2">
                                        <button class="btn btn-light btn-sm rounded-circle"
                                            onclick="addToWishlist('${course.courseId}', this)">
                                            <i class="far fa-heart"></i>
                                        </button>
                                    </div>
                                </div>
                                <div class="course-content">
                                    <span class="course-category">${course.courseTopic}</span>
                                    <h3>${course.courseName}</h3>
                                    <p>${course.description}</p>

                                    <div class="course-meta">
                                        <!-- Rating and price on the same line -->
                                        <div class="d-flex justify-content-between align-items-center mb-2">
                                            <div class="course-rating me-3">
                                                <i class="fas fa-star"></i>
                                                <span>${course.starRank} (${course.totalClick} reviews)</span>
                                            </div>
                                            <div class="course-price fw-bold ms-auto">&#8377;${course.price}</div>
                                        </div>

                                        <!-- Buttons on a separate line -->
                                        <div class="d-flex align-items-center" style="gap: 10px;">
                                            <button class="btn btn-sm btn-primary"
                                                onclick="addToCart('${course.courseId}','${course.price}', this, '${course.courseName}', '${course.thumbnail}', '${course.discount}',)">
                                                <i class="fas fa-shopping-cart"></i> Cart
                                            </button>

                                            <button class="btn btn-sm btn-outline-secondary"
                                                onclick="showAllCourseTopics('${course.courseId}', '${course.courseName}', '${course.thumbnail}', '${course.description}', '${course.keyFeature}')"
                                                data-bs-toggle="modal" data-bs-target="#courseTopicsModal">
                                                Explore
                                            </button>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </c:forEach>
                </div>
                <!-- 🔸 Modal for showing course topics -->
                <!-- <div class="modal fade" id="courseTopicsModal" tabindex="-1" aria-labelledby="courseTopicsModalLabel"
                    aria-hidden="true">
                    <div class="modal-dialog modal-xl modal-dialog-scrollable">
                        <div class="modal-content">
                            <div class="modal-header">
                                <h5 class="modal-title" id="courseTopicsModalLabel">Course Topics</h5>
                                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                            </div>
                            <div class="modal-body" id="modalTopicsContainer">
                            </div>
                        </div>
                    </div>
                </div> -->

                <div class="modal fade" id="courseTopicsModal" tabindex="-1">
                    <div class="modal-dialog modal-fullscreen">
                        <div class="modal-content position-relative">
                            <!-- Close Icon in Top-Right Corner -->
                            <button type="button" class="btn position-absolute top-0 end-0 m-3" data-bs-dismiss="modal"
                                aria-label="Close" style="font-size: 1.5rem; border: none; background: transparent;">
                                &times;
                            </button>

                            <div class="modal-header">
                                <h5 class="modal-title">Comprehensive Course Overview</h5>
                            </div>

                            <div class="modal-body" id="modalContent" style="max-height: 80vh; overflow-y: auto;">
                                <!-- dynamic content here -->
                            </div>
                        </div>
                    </div>
                </div>




                <div class="text-center mt-5">
                    <button class="hero-btn" onclick="showMoreCourses()">View More</button>
                </div>
        </section>


        <!-- Testimonials Section -->
        <section class="testimonials">
            <div class="container">
                <div class="section-title">
                    <h2>What Our Students Say</h2>
                    <p>Success stories and experiences from our community of learners.</p>
                </div>

                <div class="row">
                    <div class="col-lg-4 col-md-6">
                        <div class="testimonial">
                            <div class="testimonial-content">
                                <p>"EduPro completely transformed my career path. The structured curriculum and expert
                                    instructors helped me gain practical skills that employers actually value. Within
                                    three
                                    months of completing my web development course, I landed a job that doubled my
                                    previous
                                    salary!"</p>
                                <div class="testimonial-author">
                                    <div class="author-image">
                                        <img src="/api/placeholder/60/60" alt="Jane Doe">
                                    </div>
                                    <div class="author-info">
                                        <h4>Jane Doe</h4>
                                        <p>Frontend Developer at TechCorp</p>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-4 col-md-6">
                        <div class="testimonial">
                            <div class="testimonial-content">
                                <p>"As someone who's tried multiple learning platforms, EduPro stands out for its
                                    quality
                                    content and supportive community. The interactive exercises helped me apply concepts
                                    immediately, and the mentorship program gave me personalized guidance when I needed
                                    it
                                    most."</p>
                                <div class="testimonial-author">
                                    <div class="author-image">
                                        <img src="/api/placeholder/60/60" alt="John Smith">
                                    </div>
                                    <div class="author-info">
                                        <h4>John Smith</h4>
                                        <p>Data Analyst at FinanceX</p>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-4 col-md-6">
                        <div class="testimonial">
                            <div class="testimonial-content">
                                <p>"The flexibility of self-paced learning combined with high-quality content made
                                    EduPro
                                    the perfect platform for me to upskill while working full-time. The bite-sized
                                    lessons
                                    and weekend workshops helped me stay consistent and actually complete the course,
                                    unlike
                                    other platforms I've tried."</p>
                                <div class="testimonial-author">
                                    <div class="author-image">
                                        <img src="/api/placeholder/60/60" alt="Alex Johnson">
                                    </div>
                                    <div class="author-info">
                                        <h4>Alex Johnson</h4>
                                        <p>Marketing Manager at CreativeAgency</p>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </section>

        <!-- Featured Instructors Section -->
        <section class="trainers" id="trainers-row">
            <div class="container">
                <div class="section-title">
                    <h2>Meet Our Expert Instructors</h2>
                    <p>Learn from industry professionals with years of experience and passion for teaching.</p>
                </div>

                <div class="row">
                    <div class="col-lg-3 col-md-6">
                        <div class="trainer-card">
                            <div class="trainer-img">
                                <img src="/api/placeholder/300/300" alt="Trainer">
                                <div class="trainer-social">
                                    <a href="#"><i class="fab fa-linkedin-in"></i></a>
                                    <a href="#"><i class="fab fa-twitter"></i></a>
                                    <a href="#"><i class="fas fa-globe"></i></a>
                                </div>
                            </div>
                            <div class="trainer-info">
                                <h4>Dr. Michael Chen</h4>
                                <span>Data Science Expert</span>
                                <p>Former Research Scientist at Google with 12+ years of experience in machine learning
                                    and
                                    AI.</p>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-3 col-md-6">
                        <div class="trainer-card">
                            <div class="trainer-img">
                                <img src="/api/placeholder/300/300" alt="Trainer">
                                <div class="trainer-social">
                                    <a href="#"><i class="fab fa-linkedin-in"></i></a>
                                    <a href="#"><i class="fab fa-twitter"></i></a>
                                    <a href="#"><i class="fas fa-globe"></i></a>
                                </div>
                            </div>
                            <div class="trainer-info">
                                <h4>Sarah Williams</h4>
                                <span>UX/UI Design Lead</span>
                                <p>Design Director with experience at leading tech companies including Apple and Adobe.
                                </p>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-3 col-md-6">
                        <div class="trainer-card">
                            <div class="trainer-img">
                                <img src="/api/placeholder/300/300" alt="Trainer">
                                <div class="trainer-social">
                                    <a href="#"><i class="fab fa-linkedin-in"></i></a>
                                    <a href="#"><i class="fab fa-twitter"></i></a>
                                    <a href="#"><i class="fas fa-globe"></i></a>
                                </div>
                            </div>
                            <div class="trainer-info">
                                <h4>David Rodriguez</h4>
                                <span>Full-Stack Developer</span>
                                <p>Senior Engineer with 15+ years building scalable applications for Fortune 500
                                    companies.
                                </p>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-3 col-md-6">
                        <div class="trainer-card">
                            <div class="trainer-img">
                                <img src="/api/placeholder/300/300" alt="Trainer">
                                <div class="trainer-social">
                                    <a href="#"><i class="fab fa-linkedin-in"></i></a>
                                    <a href="#"><i class="fab fa-twitter"></i></a>
                                    <a href="#"><i class="fas fa-globe"></i></a>
                                </div>
                            </div>
                            <div class="trainer-info">
                                <h4>Emily Jackson</h4>
                                <span>Digital Marketing Strategist</span>
                                <p>Marketing Director who has led campaigns for Coca-Cola, Nike, and other global
                                    brands.
                                </p>
                            </div>
                        </div>
                    </div>
                </div>

                <div class="text-center mt-5">
                    <a href="#" class="hero-btn">Join Our Teaching Team</a>
                </div>
            </div>
        </section>

        <!-- Call to Action Section -->
        <section class="container">
            <div class="call-to-action">
                <h2>Start Your Learning Journey Today</h2>
                <p>Join over 100,000 students who have transformed their careers through our platform. Get unlimited
                    access
                    to all courses with a premium membership.</p>
                <a href="#" class="cta-btn">Sign Up Now</a>
            </div>
        </section>

        <!-- Newsletter Section -->
        <section class="newsletter">
            <div class="container">
                <div class="newsletter-content">
                    <h2>Subscribe to Our Newsletter</h2>
                    <p>Stay updated with our latest courses, workshops, and exclusive learning resources. No spam, just
                        valuable content delivered to your inbox.</p>
                    <form class="newsletter-form">
                        <input type="email" placeholder="Enter your email address" required>
                        <button type="submit">Subscribe</button>
                    </form>
                </div>
            </div>
        </section>

        <!-- Floating Cart Button -->
        <div class="cart-button" id="cartButton">
            <i class="fas fa-shopping-cart fa-lg"></i>
            <div class="cart-count" id="cartCount">0</div>
        </div>

        <!-- Cart Container -->
        <div class="cart-container" id="cartContainer">
            <div class="cart-header">
                <h4 class="m-0">Your Learning Cart</h4>
                <div class="cart-close" id="cartClose">
                    <i class="fas fa-times"></i>
                </div>
            </div>

            <div id="cartItems">
                <!-- Cart items will be inserted here via JS -->
                <div class="empty-cart" id="emptyCart">
                    <i class="fas fa-shopping-cart fa-3x mb-3 text-muted"></i>
                    <h5>Your cart is empty</h5>
                    <p class="text-muted">Explore our courses and start learning!</p>
                </div>
            </div>

            <div class="checkout-bar d-none" id="checkoutBar">
                <div class="card p-3">
                    <h5 class="mb-3">Price Details</h5>
                    <div class="d-flex justify-content-between mb-2">
                        <span>Price (<span id="cartItemCount">0</span> items)</span>
                        <span><i class="fas fa-rupee-sign"></i> <span id="cartTotal">0.00</span></span>
                    </div>
                    <div class="d-flex justify-content-between mb-2">
                        <span>Discount</span>
                        <span class="text-success">- <i class="fas fa-rupee-sign"></i> <span
                                id="cartDiscount">0.00</span></span>
                    </div>
                    <hr>
                    <div class="d-flex justify-content-between fw-bold">
                        <span>Total Amount</span>
                        <span><i class="fas fa-rupee-sign"></i> <span id="cartFinalAmount">0.00</span></span>
                    </div>
                    <div class="text-end mt-3">
                        <button class="btn btn-success">Checkout</button>
                    </div>
                </div>
            </div>

        </div>

        <!-- Footer -->
        <footer>
            <div class="container">
                <div class="row footer-top">
                    <div class="col-lg-3 col-md-6 footer-col">
                        <a href="#" class="footer-logo">Edu<span>Pro</span></a>
                        <div class="footer-about">
                            <p>EduPro is a leading online learning platform dedicated to helping individuals gain the
                                skills
                                they need to advance their careers and achieve their professional goals.</p>
                            <div class="footer-social">
                                <a href="#"><i class="fab fa-facebook-f"></i></a>
                                <a href="#"><i class="fab fa-twitter"></i></a>
                                <a href="#"><i class="fab fa-instagram"></i></a>
                                <a href="#"><i class="fab fa-linkedin-in"></i></a>
                                <a href="#"><i class="fab fa-youtube"></i></a>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-3 col-md-6 footer-col">
                        <h3 class="footer-title">Quick Links</h3>
                        <ul class="footer-links">
                            <li><a href="#"><i class="fas fa-chevron-right"></i> Home</a></li>
                            <li><a href="#"><i class="fas fa-chevron-right"></i> About Us</a></li>
                            <li><a href="#"><i class="fas fa-chevron-right"></i> Courses</a></li>
                            <li><a href="#"><i class="fas fa-chevron-right"></i> Instructors</a></li>
                            <li><a href="#"><i class="fas fa-chevron-right"></i> Blog</a></li>
                            <li><a href="#"><i class="fas fa-chevron-right"></i> Contact Us</a></li>
                        </ul>
                    </div>
                    <div class="col-lg-3 col-md-6 footer-col">
                        <h3 class="footer-title">Popular Categories</h3>
                        <ul class="footer-links">
                            <li><a href="#"><i class="fas fa-chevron-right"></i> Web Development</a></li>
                            <li><a href="#"><i class="fas fa-chevron-right"></i> Data Science</a></li>
                            <li><a href="#"><i class="fas fa-chevron-right"></i> Mobile Development</a></li>
                            <li><a href="#"><i class="fas fa-chevron-right"></i> Digital Marketing</a></li>
                            <li><a href="#"><i class="fas fa-chevron-right"></i> UX/UI Design</a></li>
                            <li><a href="#"><i class="fas fa-chevron-right"></i> Business & Entrepreneurship</a></li>
                        </ul>
                    </div>

                    <div class="col-lg-3 col-md-6 footer-col" id="contacts">
                        <h3 class="footer-title">Contact Us</h3>
                        <ul class="footer-contact footer-links">
                            <li>
                                <i class="fas fa-map-marker-alt"></i>
                                <span>123 Education Street, Learning City, 10001</span>
                            </li>
                            <li>
                                <i class="fas fa-phone-alt"></i>
                                <span>+1 (555) 123-4567</span>
                            </li>
                            <li>
                                <i class="fas fa-envelope"></i>
                                <span>info@edupro.com</span>
                            </li>
                            <li>
                                <i class="fas fa-clock"></i>
                                <span>Monday - Friday: 9:00 AM - 6:00 PM</span>
                            </li>
                        </ul>
                    </div>
                </div>
                <div class="footer-bottom">
                    <p>&copy; 2025 EduPro Learning Platform. All rights reserved.</p>
                </div>
            </div>
        </footer>

        <!-- Be a Trainer Offcanvas -->
        <div class="offcanvas offcanvas-end" tabindex="-1" id="about_trainer" aria-labelledby="offcanvasRightLabel">
            <div class="offcanvas-header">
                <h5 class="offcanvas-title" id="offcanvasRightLabel">Become an Instructor</h5>
                <button type="button" class="btn-close" data-bs-dismiss="offcanvas" aria-label="Close"></button>
            </div>
            <div class="offcanvas-body">
                <form action="trainer_detail.do" method="post" class="trainer-form">
                    <div class="mb-4">
                        <label for="experience" class="form-label fw-semibold">Professional Experience</label>
                        <textarea class="form-control" id="experience" name="experience" rows="3"
                            placeholder="Describe your professional experience" maxlength="500" required></textarea>
                    </div>
                    <div class="mb-4">
                        <label for="skills" class="form-label fw-semibold">Areas of Expertise</label>
                        <input type="text" class="form-control" id="skills" name="skills"
                            placeholder="e.g., Web Development, Data Science, Digital Marketing" maxlength="255"
                            required>
                    </div>
                    <div class="mb-4">
                        <label for="launched_courses" class="form-label fw-semibold">Number of Courses Created</label>
                        <input type="number" class="form-control" id="launched_courses" name="launched_courses"
                            placeholder="0" min="0" required>
                    </div>
                    <div class="mb-4">
                        <label for="profession" class="form-label fw-semibold">Current Profession</label>
                        <input type="text" class="form-control" id="profession" name="profession"
                            placeholder="e.g., Senior Developer, Marketing Director" maxlength="255" required>
                    </div>
                    <div class="mb-4">
                        <label for="education" class="form-label fw-semibold">Educational Background</label>
                        <textarea class="form-control" id="education" name="education" rows="3"
                            placeholder="Describe your education and relevant certifications" maxlength="255"
                            required></textarea>
                    </div>
                    <button type="submit" class="btn-submit">Submit Application</button>
                </form>
            </div>
        </div>

        <!-- Fullscreen My Courses Modal -->
        <div class="modal fade" id="myCoursesModal" tabindex="-1" aria-labelledby="myCoursesLabel" aria-hidden="true">
            <div class="modal-dialog modal-fullscreen">
                <div class="modal-content">
                    <div class="modal-header bg-primary text-white">
                        <h5 class="modal-title" id="myCoursesLabel">My Enrolled Courses</h5>
                        <button type="button" class="btn-close btn-close-white" data-bs-dismiss="modal"
                            aria-label="Close"></button>
                    </div>
                    <div class="modal-body p-4" id="myCoursesContent">
                        <div class="text-center text-muted">
                            <i class="material-icons" style="font-size: 48px;">school</i>
                            <h5 class="mt-3">No Courses Enrolled</h5>
                            <p>You have not enrolled in any courses yet. So Enroll the courses and start learning today!
                            </p>
                            <!-- <a href="allCourses.do" class="btn btn-outline-primary mt-3">Browse Courses</a> -->
                        </div>
                    </div>

                </div>
            </div>
        </div>


        <!-- Bootstrap & jQuery Scripts -->
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
        <script src="static/js/header.js"></script>
        <script src="static/js/learner.js"></script>

    </body>

    </html>