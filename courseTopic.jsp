<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <!DOCTYPE html>
    <html lang="en">

    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Course Details</title>
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css">
        <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Icons">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons/font/bootstrap-icons.css" rel="stylesheet">
        <!-- Font Awesome CDN -->
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css"
            integrity="sha512-..." crossorigin="anonymous" referrerpolicy="no-referrer" />


        <style>
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




            .topic-card {
                transition: all 0.3s ease;
                border-left: 4px solid #007bff;
            }

            .topic-card:hover {
                box-shadow: 0 5px 15px rgba(0, 0, 0, 0.1);
                transform: translateY(-2px);
            }

            .material-icons {
                vertical-align: middle;
            }

            .course-topic-header {
                background-color: #f8f9fa;
                border-radius: 8px;
                padding: 15px;
                margin-bottom: 20px;
            }


            .topic-item {
                transition: all 0.2s ease;
                background-color: #ffffff;
            }

            .topic-item:hover {
                transform: translateY(-3px);
                background-color: #f8f9fa;
                border-left-width: 6px !important;
            }

            .topic-number {
                box-shadow: 0 2px 5px rgba(0, 0, 0, 0.1);
            }

            .video-upload-container {
                text-align: center;
                cursor: pointer;
                height: 100%;
                display: flex;
                flex-direction: column;
                justify-content: center;
                align-items: center;
                padding: 20px;
                background-color: #f8f9fa;
                border-radius: 10px;
            }

            .video-icon-container {
                width: 180px;
                height: 180px;
                border-radius: 50%;
                background-color: #e9ecef;
                display: flex;
                align-items: center;
                justify-content: center;
                margin-bottom: 20px;
                box-shadow: 0 4px 15px rgba(0, 0, 0, 0.1);
                transition: all 0.3s;
                border: 3px solid #0d6efd;
            }

            .video-icon-container:hover {
                transform: scale(1.05);
                box-shadow: 0 6px 20px rgba(0, 0, 0, 0.2);
            }

            .video-icon {
                color: #0d6efd;
                font-size: 80px;
            }

            .form-container {
                height: 100%;
            }

            .list-group-item {
                border: none;
            }

            .list-group-item h6 {
                font-weight: 600;
            }

            video {
                max-width: 100%;
                width: 200px;
                height: auto;
            }

            .compact-dropdown {
                padding: 4px !important;
                margin: 4px !important;
                width: fit-content !important;
                min-width: auto !important;
            }

            .compact-item {
                padding: 6px 10px !important;
                font-size: 13px !important;
                line-height: 1.4;
            }
        </style>
    </head>

    <body>
        <!-- header start -->
        <div class="container-fluid p-0">
            <!-- header start -->
            <c:import url="header.jsp" />
            <!-- header end -->

            <div class="bg-primary bg-gradient text-white py-4 mb-6">
                <div class="container-fluid">
                    <div class="row align-items-center">
                        <div class="col-lg-8">
                            <nav aria-label="breadcrumb">
                                <ol class="breadcrumb mb-0">
                                    <li class="breadcrumb-item"><a href="index.do"
                                            class="text-white opacity-75">Home</a></li>
                                    <li class="breadcrumb-item"><a href="course.jsp"
                                            class="text-white opacity-75">Course Dashboard </a></li>
                                    <li class="breadcrumb-item active text-white" aria-current="page">Course Topics</li>
                                </ol>
                            </nav>
                        </div>
                        <div class="col-lg-4 text-lg-end mt-3 mt-lg-0">
                            <div class="dropdown">
                                <button class="btn btn-secondary dropdown-toggle" type="button"
                                    data-bs-toggle="dropdown" aria-expanded="false">
                                    <i class="material-icons text-white">format_list_bulleted</i>
                                </button>
                                <ul class="dropdown-menu">
                                    <li>
                                        <button class="dropdown-item" data-bs-toggle="modal"
                                            data-bs-target="#addTopicModal" data-course-id="${course.courseId}">
                                            <i class="material-icons">add</i> Add Course Topic
                                        </button>
                                    </li>
                                    <li>
                                        <button class="dropdown-item" data-bs-toggle="modal"
                                            data-bs-target="#addSubTopicModal">
                                            <i class="material-icons">add</i> Add Sub Topic
                                        </button>
                                    </li>
                                </ul>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

            <div class="content-container container-fluid mt-2">
                <!-- Course Statistics -->
                <div class="row mb-4 g-4">
                    <div class="col-md-4">
                        <div class="card">
                            <div class="card-body">
                                <div class="d-flex align-items-center">
                                    <div class="flex-shrink-0 me-3 bg-primary bg-opacity-10 p-3 rounded">
                                        <i class="material-icons text-primary">topics</i>
                                    </div>
                                    <div>
                                        <h6 class="text-muted mb-1">Total Topics</h6>
                                        <h3 class="mb-0">${topicList.size()}</h3>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-4">
                        <div class="card">
                            <div class="card-body">
                                <div class="d-flex align-items-center">
                                    <div class="flex-shrink-0 me-3 bg-info bg-opacity-10 p-3 rounded">
                                        <i class="material-icons text-info">video_library</i>
                                    </div>
                                    <div>
                                        <h6 class="text-muted mb-1">Total Lessons</h6>
                                        <h3 class="mb-0">${subtopicCount}</h3>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-4">
                        <div class="card">
                            <div class="card-body">
                                <div class="d-flex align-items-center">
                                    <div class="flex-shrink-0 me-3 bg-success bg-opacity-10 p-3 rounded">
                                        <i class="material-icons text-success">timer</i>
                                    </div>
                                    <div>
                                        <h6 class="text-muted mb-1">Total Duration</h6>
                                        <h3 class="mb-0">${totalDurationHours} hrs</h3>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <!-- <div class="col-md-3">
                        <div class="card">
                            <div class="card-body">
                                <div class="d-flex align-items-center">
                                    <div class="flex-shrink-0 me-3 bg-warning bg-opacity-10 p-3 rounded">
                                        <i class="material-icons text-warning">people</i>
                                    </div>
                                    <div>
                                        <h6 class="text-muted mb-1">Enrolled</h6>
                                        <h3 class="mb-0">156</h3>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div> -->
                </div>



                <div class="container-fluid pb-5">
                    <!-- Course list title -->
                    <div class="d-flex align-items-center mb-4 mt-4">
                        <div class="bg-primary rounded-circle p-2 me-3 d-flex align-items-center justify-content-center"
                            style="width: 40px; height: 40px;">
                            <i class="bi bi-journal-text text-white fs-5"></i>
                        </div>
                        <h2 class="h4 mb-0">Course Topics</h2>
                    </div>
                </div>

                <c:forEach var="topic" items="${topicList}" varStatus="status">
                    <div class="card shadow-sm mb-3 animate__animated animate__fadeIn">
                        <div class="card-body">
                            <div class="d-flex justify-content-between align-items-center">
                                <div class="d-flex align-items-center">
                                    <div class="bg-primary text-white rounded-circle d-flex align-items-center justify-content-center me-3"
                                        style="width: 36px; height: 36px; font-weight: 600;">
                                        ${status.count}
                                    </div>
                                    <h5 class="m-0 fw-semibold topic-name btn text-start" style="white-space: normal;"
                                        onclick="showSubTopics('${topic.courseTopicId}')">
                                        ${topic.topicName}
                                    </h5>
                                </div>
                                <button class="btn btn-light rounded-circle topic-toggle"
                                    onclick="toggleSubTopics('${topic.courseTopicId}', this)">
                                    <i class="bi bi-chevron-down fs-5"></i>
                                </button>
                            </div>
                            <div class="course_subtopic_container mt-3 ps-5" id="subtopics-${topic.courseTopicId}"
                                style="display: none;">
                                <!-- Subtopics will be injected here -->
                            </div>
                        </div>
                    </div>
                </c:forEach>
            </div>

            <!-- header end -->

            <!-- Add Course Topic Modal -->
            <div class="modal fade" id="addTopicModal" tabindex="-1">
                <div class="modal-dialog">
                    <form action="addCourseTopic.do" method="post">
                        <div class="modal-content">
                            <div class="modal-header">
                                <h5 class="modal-title">Add Course Topic</h5>
                                <button type="button" class="btn-close" data-bs-dismiss="modal"></button>
                            </div>
                            <div class="modal-body">
                                <input type="hidden" name="courseId" value="${courseId}">
                                <div class="mb-3">
                                    <label class="form-label">Topic Name</label>
                                    <input type="text" name="topicName" class="form-control" required>
                                </div>
                            </div>
                            <div class="modal-footer">
                                <button type="submit" class="btn btn-success">Save</button>
                                <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Cancel</button>
                            </div>
                        </div>
                    </form>
                </div>
            </div>



            <div class="modal fade" id="addSubTopicModal" tabindex="-1" aria-labelledby="addSubTopicModalLabel" aria-hidden="true">
    <div class="modal-dialog modal-lg">
        <form action="addSubTopic.do" method="post" enctype="multipart/form-data" id="subTopicForm">
            <div class="modal-content">
                <div class="modal-header bg-primary text-white">
                    <h5 class="modal-title">Add Sub Topic</h5>
                    <button type="button" class="btn-close btn-close-white" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>

                <div class="modal-body p-4">
                    <div class="row g-4">
                        <!-- Left column - Video upload section with icon -->
                        <div class="col-md-6">
                            <div class="video-upload-container" id="videoUploadContainer">
                                <input type="file" class="d-none" name="videoFile" id="videoFileInput" accept="video/*" required>
                                <div class="video-icon-container" onclick="document.getElementById('videoFileInput').click();">
                                    <div class="video-icon-circle mx-auto">
                                        <i class="fas fa-video fa-2x text-white"></i>
                                    </div>
                                </div>
                                <h4>Upload Video</h4>
                                <p class="text-muted" id="uploadInstructions">Click on the icon to select video</p>
                                <div id="uploadStatus" class="text-success fw-bold" style="display: none;">
                                    <i class="fas fa-check-circle"></i> Video selected successfully
                                </div>
                            </div>
                        </div>

                        <!-- Right column - Form fields -->
                        <div class="col-md-6">
                            <div class="form-container p-3">
                                <h5 class="mb-4 text-primary">Subtopic Details</h5>
                                <div class="mb-4">
                                    <label for="title" class="form-label fw-bold">Sub Topic Title</label>
                                    <input type="text" class="form-control" name="title" placeholder="Enter title" required>
                                </div>

                                <!-- Hidden input for duration -->
                                <input type="hidden" name="duration" id="duration">

                                <div class="mb-4">
                                    <label for="course_topic_id" class="form-label fw-bold">Course Topic</label>
                                    <select class="form-select" name="course_topic_id" id="select_course_topic_id" required onchange="setTopicName()">
                                        <option value="">Select a topic</option>
                                        <c:forEach var="ct" items="${topicList}">
                                            <option value="${ct.courseTopicId}">${ct.topicName}</option>
                                        </c:forEach>
                                    </select>
                                </div>
                                <input type="hidden" name="course_topic_name" id="course_topic_name">
                            </div>
                        </div>
                    </div>
                </div>

                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Cancel</button>
                    <button type="submit" class="btn btn-primary px-4">Add Sub Topic</button>
                </div>
            </div>
        </form>
    </div>
</div>

<!-- 🔽 Hidden video element to extract duration -->
<video id="videoPreview" style="display: none;" controls></video>




            <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
            <script src="static/js/courseTopic.js"></script>
    </body>

    </html>