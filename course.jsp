<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

    <!DOCTYPE html>
    <html lang="en">

    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Document</title>
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css">
        <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Icons">
        <style>
            /* Add custom CSS for enhanced visuals */
            body {
                background-color: #f8f9fa;
                font-family: 'Poppins', sans-serif;
            }

            .bg-gradient-primary {
                background: linear-gradient(135deg, #4e73df, #224abe);
            }

            .transition-300 {
                transition: all 0.3s ease;
            }

            .hover-shadow:hover {
                transform: translateY(-5px);
                box-shadow: 0 10px 20px rgba(0, 0, 0, 0.1) !important;
            }

            .card {
                overflow: hidden;
                border-radius: 0.5rem;
            }

            .material-icons {
                vertical-align: middle;
            }

            /* Add colorful themes */
            .text-primary {
                color: #4e73df !important;
            }

            .text-success {
                color: #1cc88a !important;
            }

            .text-info {
                color: #36b9cc !important;
            }

            .text-warning {
                color: #f6c23e !important;
            }

            .text-danger {
                color: #e74a3b !important;
            }

            .bg-primary {
                background-color: #4e73df !important;
            }

            .bg-success {
                background-color: #1cc88a !important;
            }

            .bg-info {
                background-color: #36b9cc !important;
            }

            .bg-warning {
                background-color: #f6c23e !important;
            }

            .bg-danger {
                background-color: #e74a3b !important;
            }

            .border-primary {
                border-color: #4e73df !important;
            }

            .border-success {
                border-color: #1cc88a !important;
            }

            .border-info {
                border-color: #36b9cc !important;
            }

            .border-warning {
                border-color: #f6c23e !important;
            }

            .border-danger {
                border-color: #e74a3b !important;
            }

            /* Custom form focus states */
            .form-control:focus {
                box-shadow: 0 0 0 0.25rem rgba(78, 115, 223, 0.25);
            }

            .topic-badge {
                display: inline-flex;
                align-items: center;
                background-color: #e7f1ff;
                color: #0d6efd;
                padding: 0.35rem 0.75rem;
                border-radius: 1.25rem;
                margin-right: 0.5rem;
                margin-bottom: 0.5rem;
                font-size: 0.875rem;
                font-weight: 500;
            }

            .topic-badge .btn-close {
                margin-left: 0.5rem;
                background-color: transparent;
                background-image: url("data:image/svg+xml,%3csvg xmlns='http://www.w3.org/2000/svg' viewBox='0 0 16 16' fill='%230d6efd'%3e%3cpath d='M.293.293a1 1 0 0 1 1.414 0L8 6.586 14.293.293a1 1 0 1 1 1.414 1.414L9.414 8l6.293 6.293a1 1 0 0 1-1.414 1.414L8 9.414l-6.293 6.293a1 1 0 0 1-1.414-1.414L6.586 8 .293 1.707a1 1 0 0 1 0-1.414z'/%3e%3c/svg%3e");
                opacity: 0.7;
                width: 1rem;
                height: 1rem;
            }

            .topic-badge .btn-close:hover {
                opacity: 1;
            }
        </style>

    </head>

    <body>
        <!-- course modal start ############## -->
        <div class="modal fade" id="new_course_box" tabindex="-1">
            <div class="modal-dialog modal-dialog-scrollable modal-lg">
                <div class="modal-content border-0 shadow">
                    <div class="modal-header bg-gradient-primary text-white">
                        <h5 class="modal-title">
                            <i class="material-icons me-2">school</i>Create New Course
                        </h5>
                        <button type="button" class="btn-close btn-close-white" data-bs-dismiss="modal"
                            aria-label="Close"></button>
                    </div>
                    <div class="modal-body p-4">
                        <form id="course_form" class="row g-3">
                            <!-- Form layout improved with card sections and two-column layout -->
                            <div class="col-12 mb-3">
                                <div class="card bg-light border-0 shadow-sm">
                                    <div class="card-header bg-primary bg-opacity-10">
                                        <h6 class="mb-0 text-primary"><i
                                                class="material-icons me-2 align-middle">info</i>Basic Information</h6>
                                    </div>
                                    <div class="card-body">
                                        <div class="row g-3">
                                            <div class="col-md-8">
                                                <label for="course_name" class="form-label fw-semibold">Course
                                                    Name</label>
                                                <input type="text" id="course_name"
                                                    class="form-control form-control-lg border-primary border-opacity-25"
                                                    placeholder="Enter course title">
                                            </div>
                                            <div class="col-md-4">
                                                <label for="price" class="form-label fw-semibold">Price</label>
                                                <div class="input-group">
                                                    <span class="input-group-text bg-primary text-white">&#8377;</span>
                                                    <input type="number" id="price"
                                                        class="form-control border-primary border-opacity-25"
                                                        placeholder="0.00">
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>

                            <div class="col-md-6">
                                <div class="card bg-light border-0 shadow-sm h-100">
                                    <div class="card-header bg-success bg-opacity-10">
                                        <h6 class="mb-0 text-success"><i
                                                class="material-icons me-2 align-middle">description</i>Content Details
                                        </h6>
                                    </div>
                                    <div class="card-body">
                                        <div class="mb-3">
                                            <label for="learning_outcomes" class="form-label fw-semibold">
                                                <i
                                                    class="material-icons me-1 text-success align-middle small">check_circle</i>Learning
                                                Outcomes
                                            </label>
                                            <textarea type="text" id="learning_outcomes"
                                                class="form-control border-success border-opacity-25" cols="25" rows="3"
                                                placeholder="Separate each outcome with a comma"></textarea>
                                            <div class="form-text">List skills students will gain, separated by commas
                                            </div>
                                        </div>
                                        <div class="mb-3">
                                            <label for="description" class="form-label fw-semibold">
                                                <i
                                                    class="material-icons me-1 text-success align-middle small">subject</i>Description
                                            </label>
                                            <textarea type="text" id="description"
                                                class="form-control border-success border-opacity-25" cols="25" rows="4"
                                                placeholder="Describe your course content and benefits"></textarea>
                                        </div>
                                        <div class="mb-3">
                                            <label for="key_features" class="form-label fw-semibold">
                                                <i
                                                    class="material-icons me-1 text-success align-middle small">stars</i>Key
                                                Features
                                            </label>
                                            <input type="text" id="key_features"
                                                class="form-control border-success border-opacity-25"
                                                placeholder="Separate features with commas">
                                        </div>
                                    </div>
                                </div>
                            </div>

                            <div class="col-md-6">
                                <div class="card bg-light border-0 shadow-sm h-100">
                                    <div class="card-header bg-info bg-opacity-10">
                                        <h6 class="mb-0 text-info"><i
                                                class="material-icons me-2 align-middle">settings</i>Course Settings
                                        </h6>
                                    </div>
                                    <div class="card-body">
                                        <div class="mb-3" id="course_topic_container">
                                            <label for="course_topics" class="form-label fw-semibold">
                                                <i
                                                    class="material-icons me-1 text-info align-middle small">category</i>Course
                                                Topics
                                            </label>
                                            <div class="input-group">
                                                <input type="text" id="course_topics"
                                                    class="form-control border-info border-opacity-25"
                                                    placeholder="e.g. Programming, Design, Business">
                                                <button class="btn btn-info" type="button" id="add_topic_btn">
                                                    Add Topic
                                                </button>
                                            </div>
                                            <input type="hidden" id="hidden_topics" name="hidden_topics">

                                        </div>
                                        <!-- Container for added topics -->
                                        <div id="topics_list" class="d-flex flex-wrap gap-2"></div>
                                        <div class="mb-3">
                                            <label for="prerequisites" class="form-label fw-semibold">
                                                <i
                                                    class="material-icons me-1 text-info align-middle small">history_edu</i>Prerequisites
                                            </label>
                                            <input type="text" id="prerequisites"
                                                class="form-control border-info border-opacity-25"
                                                placeholder="Prior knowledge required, if any">
                                        </div>
                                        <div class="mb-3">
                                            <label for="certification" class="form-label fw-semibold">
                                                <i
                                                    class="material-icons me-1 text-info align-middle small">workspace_premium</i>Certification
                                            </label>
                                            <input type="text" id="certification"
                                                class="form-control border-info border-opacity-25"
                                                placeholder="Type of certificate offered">
                                        </div>
                                        <div class="mb-3">
                                            <label for="refund_policy" class="form-label fw-semibold">
                                                <i
                                                    class="material-icons me-1 text-info align-middle small">policy</i>Refund
                                                Policy
                                            </label>
                                            <input type="text" id="refund_policy"
                                                class="form-control border-info border-opacity-25"
                                                placeholder="e.g. 30-day money back guarantee">
                                        </div>

                                    </div>
                                </div>
                            </div>

                            <div class="col-12">
                                <div class="card bg-light border-0 shadow-sm">
                                    <div class="card-header bg-warning bg-opacity-10">
                                        <h6 class="mb-0 text-warning"><i
                                                class="material-icons me-2 align-middle">upload_file</i>Course Materials
                                        </h6>
                                    </div>
                                    <div class="card-body">
                                        <div class="row g-3">
                                            <div class="col-md-6">
                                                <label for="thumbnail" class="form-label fw-semibold">
                                                    <i
                                                        class="material-icons me-1 text-warning align-middle small">image</i>Thumbnail
                                                    Image
                                                </label>
                                                <input type="file" id="thumbnail"
                                                    class="form-control border-warning border-opacity-25">
                                                <div class="form-text">Recommended size: 800x450px</div>
                                            </div>
                                            <div class="col-md-6">
                                                <label for="pdf" class="form-label fw-semibold">
                                                    <i
                                                        class="material-icons me-1 text-warning align-middle small">picture_as_pdf</i>Course
                                                    PDF
                                                </label>
                                                <input type="file" id="pdf"
                                                    class="form-control border-warning border-opacity-25">
                                                <div class="form-text">Upload syllabus or course materials</div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </form>
                    </div>
                    <div class="modal-footer bg-light">
                        <button type="button" class="btn btn-outline-secondary" data-bs-dismiss="modal">
                            <i class="material-icons me-1 small align-middle">close</i>Cancel
                        </button>
                        <button type="button" id="save_course" class="btn btn-primary px-4">
                            <i class="material-icons me-1 small align-middle">save</i>Save Course
                        </button>
                    </div>
                </div>
            </div>
        </div>
        <!-- course modal end ############## -->

        <div class="container-fluid p-0">
            <!-- header start -->
            <c:import url="header.jsp" />
            <!-- header end -->

            <div class="bg-primary bg-gradient text-white py-4 mb-4">
                <div class="container-fluid">
                    <div class="row align-items-center">
                        <div class="col-lg-8">
                            <nav aria-label="breadcrumb">
                                <ol class="breadcrumb mb-0">
                                    <li class="breadcrumb-item"><a href="index.do"
                                            class="text-white opacity-75">Home</a></li>
                                    <li class="breadcrumb-item active text-white" aria-current="page">Course Dashboard
                                    </li>
                                </ol>
                            </nav>
                        </div>
                        <div class="col-lg-4 text-lg-end mt-3 mt-lg-0">
                            <button type="button" id="new_course" data-bs-toggle="modal"
                                data-bs-target="#new_course_box"
                                class="btn btn-light btn-lg d-inline-flex align-items-center">
                                <span class="material-icons me-2">add</span>
                                Create New Course
                            </button>
                        </div>
                    </div>
                </div>
            </div>

            <div class="container-fluid pb-5">

                <!-- Course list title -->
                <div class="d-flex align-items-center mb-4">
                    <div class="bg-primary rounded p-2 me-3">
                        <i class="material-icons text-white">format_list_bulleted</i>
                    </div>
                    <h2 class="h3 mb-0">All Courses</h2>
                </div>

                <!-- Course cards -->
                <div class="row g-4" id="all_courses">
                    <!-- Course cards will be dynamically added here -->

                    <!-- Sample course card for preview -->
                    <div class="col-md-6 col-lg-4">
                        <div class="card h-100 border-0 shadow-sm hover-shadow transition-300">
                            <div class="position-relative">
                                <img src="/api/placeholder/800/450" class="card-img-top" alt="Course thumbnail">
                                <span class="badge bg-primary position-absolute top-0 end-0 m-3">Web Development</span>
                            </div>
                            <div class="card-body">
                                <div class="d-flex justify-content-between align-items-center mb-2">
                                    <h5 class="card-title fw-bold mb-0">Introduction to HTML & CSS</h5>
                                    <span class="fs-5 fw-bold text-primary">$49</span>
                                </div>
                                <p class="card-text text-muted">Learn the fundamentals of web development with this
                                    comprehensive course for beginners.</p>
                                <div class="d-flex align-items-center text-warning mb-3">
                                    <i class="material-icons small">star</i>
                                    <i class="material-icons small">star</i>
                                    <i class="material-icons small">star</i>
                                    <i class="material-icons small">star</i>
                                    <i class="material-icons small">star_half</i>
                                    <span class="ms-1 text-muted">(42 reviews)</span>
                                </div>
                                <hr>
                                <div class="d-flex justify-content-between align-items-center">
                                    <button class="btn btn-sm btn-outline-primary" data-bs-toggle="modal"
                                        data-bs-target="#courseDetailsModal">
                                        <i class="material-icons me-1 small align-middle">info</i>Details
                                    </button>
                                    <div class="d-flex">
                                        <button class="btn btn-sm btn-outline-warning me-1">
                                            <i class="material-icons small">edit</i>
                                        </button>
                                        <button class="btn btn-sm btn-outline-danger">
                                            <i class="material-icons small">delete</i>
                                        </button>
                                    </div>
                                </div>
                            </div>
                            <div class="card-footer bg-white border-0 py-3">
                                <div class="d-flex align-items-center text-muted small">
                                    <i class="material-icons me-1 small">person</i>
                                    <span class="me-3">42 Students</span>
                                    <i class="material-icons me-1 small">schedule</i>
                                    <span>8 Weeks</span>
                                </div>
                            </div>
                        </div>
                    </div>

                    <!-- Sample card end -->
                </div>
            </div>
            <form id="courseForm" action="CourseDetailsController.do" method="get">
                <input type="hidden" name="courseId" id="courseIdField">
            </form>
        </div>


        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>

        <script>
            const course_name = document.querySelector('#course_name');
            const thumbnail = document.querySelector('#thumbnail');
            const learning_outcomes = document.querySelector('#learning_outcomes');
            const description = document.querySelector('#description');
            const course_topics = document.querySelector('#course_topics');
            const key_features = document.querySelector('#key_features');
            const pdf = document.querySelector('#pdf');
            const certification = document.querySelector('#certification');
            const prerequisites = document.querySelector('#prerequisites');
            const refund_policy = document.querySelector('#refund_policy');
            const price = document.querySelector('#price');
            const hidden_topics = document.querySelector('#hidden_topics');

            const save_course = document.querySelector('#save_course');
            const all_courses = document.querySelector('#all_courses');
            const course_form = document.querySelector('#course_form');

            let new_course_box = new bootstrap.Modal('#new_course_box')

            let topicsArray = [];

            document.getElementById("add_topic_btn").addEventListener("click", function () {
                let topicInput = document.getElementById("course_topics");
                let topic = topicInput.value.trim();

                if (topic !== "" && !topicsArray.includes(topic)) {
                    topicsArray.push(topic);

                    document.getElementById("hidden_topics").value = topicsArray.join(",");
                }

            });

            // add course more topic  ~~~~~~~~~
            document.addEventListener('DOMContentLoaded', function () {
                const topicInput = document.getElementById('course_topics');
                const addTopicBtn = document.getElementById('add_topic_btn');
                const topicsList = document.getElementById('topics_list');

                let topicsArray = [];
                const courseId = 1; // Change this dynamically as per your requirement

                // Function to create a topic badge
                function createTopicBadge(topic) {
                    const badgeDiv = document.createElement('div');
                    badgeDiv.className = 'badge bg-info text-white p-2 me-2 d-flex align-items-center';
                    badgeDiv.style.borderRadius = "12px";

                    const topicSpan = document.createElement('span');
                    topicSpan.textContent = topic;

                    const closeBtn = document.createElement('span');
                    closeBtn.innerHTML = '&times;';
                    closeBtn.className = 'ms-2 text-white';
                    closeBtn.style.cursor = 'pointer';

                    // Remove topic when close button is clicked
                    closeBtn.addEventListener('click', function () {
                        topicsArray = topicsArray.filter(t => t !== topic);
                        badgeDiv.remove();
                    });

                    badgeDiv.appendChild(topicSpan);
                    badgeDiv.appendChild(closeBtn);

                    return badgeDiv;
                }



                // Add topic when button is clicked
                addTopicBtn.addEventListener('click', function () {
                    const topicValue = topicInput.value.trim();
                    if (topicValue && !topicsArray.includes(topicValue)) {
                        topicsArray.push(topicValue);
                        const topicBadge = createTopicBadge(topicValue);
                        topicsList.appendChild(topicBadge);
                        topicInput.value = '';
                    }
                });
            });

            // add course more topic  ~~~~~~~~~

            //------------------------------------

            const collectAllCourses = async () => {
                let response = await fetch('collect_all_courses.do');
                let result = await response.json();

                return result;
            };

            const showAllCourses = () => {
                collectAllCourses().then((data) => {
                    if (data != 'expired') {
                        // Clear existing content
                        all_courses.innerHTML = '';

                        // Create category-based accent colors
                        const categories = {
                            'development': '#4CAF50',
                            'design': '#2196F3',
                            'business': '#FF9800',
                            'marketing': '#E91E63',
                            'photography': '#9C27B0',
                            'music': '#F44336',
                            'default': '#607D8B'
                        };

                        // Loop through each course
                        for (let course of data) {
                            // Determine category
                            const category = course.category || 'default';
                            const accentColor = categories[category] || categories.default;

                            // Use string concatenation for compatibility
                            let cardHTML = '<div class="col-xl-3 col-lg-4 col-md-6 col-sm-12 mb-4">' +
                                '<div class="card course-card h-100" style="border-radius: 12px; overflow: hidden; box-shadow: 0 8px 16px rgba(0,0,0,0.1); transition: all 0.3s ease; border: none;" ' +
                                'onclick="openCoursePage(\'' + course.courseId + '\')">' +

                                '<div class="position-relative">' +
                                '<div class="category-indicator" style="position: absolute; top: 0; left: 0; width: 5px; height: 100%; background-color: ' + accentColor + ';"></div>';

                            if (category && category !== 'default') {
                                cardHTML += '<div class="category-badge" style="position: absolute; top: 12px; right: 12px; background-color: ' + accentColor + '; color: white; padding: 4px 10px; border-radius: 20px; font-size: 0.75rem; font-weight: 600;">' + category + '</div>';
                            }

                            cardHTML += '<img id="_' + course.courseId + '" src="download_media.do?thumbnail=' + (course.thumbnail || '') + '" class="card-img-top" style="height: 200px; object-fit: cover; filter: brightness(0.95);">' +
                                '</div>' +

                                '<div class="card-body d-flex flex-column" style="padding: 1.5rem;">' +
                                '<h5 id="t_' + course.courseId + '" class="card-title fw-bold" style="color: #333; font-size: 1.15rem; margin-bottom: 0.75rem;">' + (course.courseName || 'Untitled Course') + '</h5>' +
                                '<p class="card-text flex-grow-1" style="color: #555; font-size: 0.9rem; line-height: 1.6;">' + (course.description || 'No description available.').substring(0, 90) + '...</p>' +

                                '<div class="mt-3 d-flex justify-content-center">' +
                                '<button class="view_detail btn" ' +
                                'onclick="event.stopPropagation(); viewCourseDetail(\'' + course.courseId + '\')" ' +
                                'style="background-color: ' + accentColor + '; color: white; border-radius: 8px; padding: 0.5rem 1.5rem; font-weight: 500; border: none; transition: all 0.2s ease; width: 100%;">' +
                                'View Details' +
                                '</button>' +
                                '</div>' +
                                '</div>' +
                                '</div>' +
                                '</div>';

                            all_courses.innerHTML += cardHTML;


                        }

                        // Initialize popovers after adding to DOM
                        setTimeout(() => {
                            const popoverTriggerList = document.querySelectorAll('[data-bs-toggle="popover"]');
                            popoverTriggerList.forEach(popoverTriggerEl => {
                                if (bootstrap && bootstrap.Popover) {
                                    new bootstrap.Popover(popoverTriggerEl, {
                                        html: true,
                                        placement: 'top',
                                        container: 'body'
                                    });
                                }
                            });

                            // Add hover effects
                            document.querySelectorAll('.course-card').forEach(card => {
                                // Hover effects
                                card.addEventListener('mouseenter', () => {
                                    card.style.transform = 'translateY(-8px)';
                                    card.style.boxShadow = '0 16px 30px rgba(0,0,0,0.15)';
                                });

                                card.addEventListener('mouseleave', () => {
                                    card.style.transform = 'translateY(0)';
                                    card.style.boxShadow = '0 8px 16px rgba(0,0,0,0.1)';
                                });
                            });
                        }, 100);



                    } else {
                        console.log("Failed to load course data");
                        all_courses.innerHTML = '<div class="col-12 text-center py-5">' +
                            '<div class="alert alert-warning">' +
                            '<i class="material-icons me-2">error_outline</i>' +
                            'Unable to load courses. Please try again later.' +
                            '</div>' +
                            '</div>';
                    }
                }).catch((err) => {
                    console.log(err);
                    all_courses.innerHTML = '<div class="col-12 text-center py-5">' +
                        '<div class="alert alert-danger">' +
                        '<i class="material-icons me-2">error</i>' +
                        'Error loading courses: ' + (err.message || 'Unknown error') +
                        '</div>' +
                        '</div>';
                });
            };

            // Helper function for view details

            showAllCourses();

            const openCoursePage = (courseId) => {
                document.getElementById("courseIdField").value = courseId;
                document.getElementById("courseForm").submit();
            };




            function viewCourseDetail(courseId) {
                collectAllCourses().then((data) => {
                    for (let course of data) {
                        if (course.courseId == courseId) {
                            console.log(data);

                            // Remove existing modal if it exists
                            let existingModal = document.getElementById("courseDetailModal");
                            if (existingModal) existingModal.remove();

                            // Create Bootstrap modal
                            let modal = document.createElement("div");
                            modal.classList.add("modal", "fade");
                            modal.id = "courseDetailModal";
                            modal.setAttribute("tabindex", "-1");


                            // Helper function to format learning outcomes as a list if they contain commas or semicolons
                            function formatLearningOutcomes(outcomes) {
                                if (outcomes.includes(',') || outcomes.includes(';')) {
                                    var items = outcomes.split(/[,;]/).filter(item => item.trim() !== '');
                                    var listItems = '';
                                    for (var i = 0; i < items.length; i++) {
                                        listItems += '<li class="mb-2"><i class="bi bi-check-circle-fill text-success me-2"></i>' + items[i].trim() + '</li>';
                                    }
                                    return '<ul class="list-unstyled">' + listItems + '</ul>';
                                }
                                return '<p>' + outcomes + '</p>';
                            }

                            // Modal content creation

                            var modalContent = '<div class="modal-dialog modal-lg">' +
                                '<div class="modal-content border-0 shadow-lg rounded-3 overflow-hidden">' +

                                // Header with Course Name and Close Button
                                '<div class="modal-header bg-gradient bg-primary text-white py-3">' +
                                '<h5 class="modal-title"><i class="bi bi-book-half me-2"></i>' + course.courseName + '</h5>' +
                                '<button type="button" class="btn-close btn-close-white" data-bs-dismiss="modal" aria-label="Close"></button>' +
                                '</div>' +

                                // Modal Body
                                '<div class="modal-body px-4">' +

                                // Course Thumbnail
                                '<div class="text-center mb-3">' +
                                '<img src="download_media.do?thumbnail=' + course.thumbnail + '" class="img-fluid rounded shadow-sm" style="max-height: 200px; border: 5px solid #f0f0f0;" alt="Course Image">' +
                                '</div>' +

                                // Course Details in Cards
                                '<div class="row g-3">' +
                                '<div class="col-md-6">' +
                                '<div class="card shadow-sm border-0 rounded">' +
                                '<div class="card-body">' +
                                '<h6 class="fw-bold text-primary"><i class="bi bi-clock-history me-2"></i> Total Hours</h6>' +
                                '<p>' + (course.totalHour ? course.totalHour + " hrs" : "0 hrs") + '</p>' +
                                '</div>' +
                                '</div>' +
                                '</div>' +
                                '<div class="col-md-6">' +
                                '<div class="card shadow-sm border-0 rounded">' +
                                '<div class="card-body">' +
                                '<h6 class="fw-bold text-primary"><i class="bi bi-cash-coin me-2"></i> Price</h6>' +
                                '<p class="text-success fs-5 fw-bold">' + (course.price ? '\u20B9' + course.price : 'Free') + '</p>' +
                                '</div>' +
                                '</div>' +
                                '</div>' +
                                '<div class="col-md-6">' +
                                '<div class="card shadow-sm border-0 rounded">' +
                                '<div class="card-body">' +
                                '<h6 class="fw-bold text-primary"><i class="bi bi-lightbulb me-2"></i>Validity Till</h6>' +
                                '<p class="text-success fs-5 fw-bold">' + (course.validityTill ? course.validityTill : '-1') + '</p>' +
                                '</div>' +
                                '</div>' +
                                '</div>' +
                                '<div class="col-md-6">' +
                                '<div class="card shadow-sm border-0 rounded">' +
                                '<div class="card-body">' +
                                '<h6 class="fw-bold text-primary"><i class="bi bi-lightbulb me-2"></i>Discount</h6>' +
                                '<p class="text-success fs-5 fw-bold">' + (course.discount ? course.discount : '0') + '</p>' +
                                '</div>' +
                                '</div>' +
                                '</div>' +
                                '<div class="col-md-6">' +
                                '<div class="card shadow-sm border-0 rounded">' +
                                '<div class="card-body">' +
                                '<h6 class="fw-bold text-primary"><i class="bi bi-lightbulb me-2"></i>Subscribers</h6>' +
                                '<p class="text-success fs-5 fw-bold">' + (course.subscriber ? course.subscriber : '0') + '</p>' +
                                '</div>' +
                                '</div>' +
                                '</div>' +
                                '<div class="col-md-6">' +
                                '<div class="card shadow-sm border-0 rounded">' +
                                '<div class="card-body">' +
                                '<h6 class="fw-bold text-primary"><i class="bi bi-lightbulb me-2"></i>Total Clicks</h6>' +
                                '<p class="text-success fs-5 fw-bold">' + (course.totalClick ? course.totalClick : '0') + '</p>' +
                                '</div>' +
                                '</div>' +
                                '</div>' +
                                '<div class="col-md-6">' +
                                '<div class="card shadow-sm border-0 rounded">' +
                                '<div class="card-body">' +
                                '<h6 class="fw-bold text-primary"><i class="bi bi-lightbulb me-2"></i>Star Rank</h6>' +
                                '<p class="text-success fs-5 fw-bold">' + (course.starRank ? course.starRank : '0') + '</p>' +
                                '</div>' +
                                '</div>' +
                                '</div>' +
                                '<div class="col-md-6">' +
                                '<div class="card shadow-sm border-0 rounded">' +
                                '<div class="card-body">' +
                                '<h6 class="fw-bold text-primary"><i class="bi bi-lightbulb me-2"></i>Videos</h6>' +
                                '<p class="text-success fs-5 fw-bold">' + (course.video ? course.video : '0') + '</p>' +
                                '</div>' +
                                '</div>' +
                                '</div>' +
                                '<div class="col-md-6">' +
                                '<div class="card shadow-sm border-0 rounded">' +
                                '<div class="card-body">' +
                                '<h6 class="fw-bold text-primary"><i class="bi bi-lightbulb me-2"></i> Key Features</h6>' +
                                (course.keyFeature ? (
                                    '<ul>' +
                                    course.keyFeature.split(',').map(function (feature) {
                                        return '<li>' + feature.trim() + '</li>';
                                    }).join('') +
                                    '</ul>'
                                ) : '<p>N/A</p>') +
                                '</div>' +
                                '</div>' +
                                '</div>' +
                                '<div class="col-md-6">' +
                                '<div class="card shadow-sm border-0 rounded">' +
                                '<div class="card-body">' +
                                '<h6 class="fw-bold text-primary"><i class="bi bi-lightbulb me-2"></i> Course Topic</h6>' +
                                (course.courseTopic ? (
                                    '<ul>' +
                                    course.courseTopic.split(',').map(function (topic) {
                                        return '<li>' + topic.trim() + '</li>';
                                    }).join('') +
                                    '</ul>'
                                ) : '<p>N/A</p>') +
                                '</div>' +
                                '</div>' +
                                '</div>' +
                                '<div class="col-md-6">' +
                                '<div class="card shadow-sm border-0 rounded">' +
                                '<div class="card-body">' +
                                '<h6 class="fw-bold text-primary"><i class="bi bi-lightbulb me-2"></i>Discription</h6>' +
                                '<p>' + (course.description || "N/A") + '</p>' +
                                '</div>' +
                                '</div>' +
                                '</div>' +
                                '<div class="col-md-6">' +
                                '<div class="card shadow-sm border-0 rounded">' +
                                '<div class="card-body">' +
                                '<h6 class="fw-bold text-primary"><i class="bi bi-lightbulb me-2"></i>Prerequisites</h6>' +
                                '<p>' + (course.prerequisite || "N/A") + '</p>' +
                                '</div>' +
                                '</div>' +
                                '</div>' +
                                '<div class="col-md-6">' +
                                '<div class="card shadow-sm border-0 rounded">' +
                                '<div class="card-body">' +
                                '<h6 class="fw-bold text-primary"><i class="bi bi-award me-2"></i> Certification</h6>' +
                                '<p>' + (course.certification ? '<span class="badge bg-success">Yes</span>' : '<span class="badge bg-danger">No</span>') + '</p>' +
                                '</div>' +
                                '</div>' +
                                '</div>' +
                                '</div>' +

                                // Learning Outcome
                                '<div class="mt-4">' +
                                '<h6 class="fw-bold text-primary"><i class="bi bi-trophy me-2"></i>Learning Outcomes</h6>' +
                                (course.learningOutcome ? formatLearningOutcomes(course.learningOutcome) : "<p>No learning outcomes specified.</p>") +
                                '</div>' +

                                '</div>' +

                                // Modal Footer Buttons
                                '<div class="modal-footer d-flex justify-content-between bg-light">' +
                                '<button type="button" class="btn btn-outline-secondary px-4" data-bs-dismiss="modal">' +
                                '<i class="bi bi-x-circle"></i> Close' +
                                '</button>' +
                                '<a href="download_pdf.do?pdf=' + course.pdf + '" target="_blank" class="btn btn-outline-primary px-4">' +
                                '<i class="bi bi-file-earmark-pdf"></i> View Course PDF' +
                                '</a>' +
                                '</div>' +

                                '</div>' +
                                '</div>';
                            modal.innerHTML = modalContent;

                            // Append modal to body
                            document.body.appendChild(modal);

                            // Initialize and show the modal using Bootstrap
                            var bsModal = new bootstrap.Modal(document.getElementById("courseDetailModal"));
                            bsModal.show();
                        }
                    }

                }).catch((err) => {
                    console.log(err);
                })
            }

            //------------------------------------




            const saveCourse = async () => {
                const formData = new FormData();
                formData.append('thumbnail', thumbnail.files[0]);

                formData.append('course_name', course_name.value);
                formData.append('learning_outcomes', learning_outcomes.value);
                formData.append('description', description.value);
                formData.append('hidden_topics', hidden_topics.value);
                console.log(hidden_topics.value);

                formData.append('key_features', key_features.value);
                formData.append('pdf', pdf.files[0]);


                formData.append('certification', certification.value);
                formData.append('prerequisites', prerequisites.value);
                formData.append('refund_policy', refund_policy.value);
                formData.append('price', price.value);

                let response = await fetch('save_course.do', {
                    method: 'POST', body: formData
                });
                console.log(response);
                let result = await response.text();
                console.log(result);

                return result;
            };

            save_course.addEventListener('click', () => {
                console.log(thumbnail.files[0]);
                console.log(pdf.files[0]);
                console.log(certification.value);


                saveCourse().then((data) => {
                    if (data == 'saved') {
                        new_course_box.hide();
                        showAllCourses();

                        course_form.reset();
                    } else if (data == 'expired') {
                        console.log(data);

                        // window.location = 'index.do';
                    }

                }).catch((error) => {
                    console.log(err);
                });
            });
        </script>

        <script src="static/js/header.js"> </script>
    </body>

    </html>