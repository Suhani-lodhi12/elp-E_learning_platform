<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <title>Course Details</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
    <style>
        .subtopic-item {
            border-left: 3px solid #6c757d;
            padding-left: 15px;
            margin-bottom: 10px;
        }
        .subtopic-item:hover {
            border-left-color: #0d6efd;
            background-color: #f8f9fa;
        }
        .video-container {
            background-color: #000;
            aspect-ratio: 16/9;
            display: flex;
            justify-content: center;
            align-items: center;
            margin-bottom: 20px;
            border-radius: 5px;
            overflow: hidden;
        }
        .preview-badge {
            font-size: 0.8rem;
            padding: 2px 8px;
            margin-left: 8px;
        }
        .topic-card {
            transition: all 0.3s ease;
        }
        .topic-card:hover {
            box-shadow: 0 5px 15px rgba(0,0,0,0.1);
        }
        .topic-header {
            cursor: pointer;
        }
        .selected-subtopic {
            background-color: #e9ecef;
            border-left-color: #0d6efd;
        }
    </style>
</head>
<body class="bg-light">
    <div class="container-fluid">
        <div class="row">
            <!-- Sidebar for topics and subtopics -->
            <div class="col-md-3 border-end p-4" style="min-height: 100vh;">
                <h3 class="mb-4">Course Content</h3>
                
                <c:forEach var="topic" items="${topicList}" varStatus="topicStatus">
                    <div class="card mb-3 topic-card">
                        <div class="card-header bg-primary text-white d-flex justify-content-between align-items-center topic-header" 
                             data-bs-toggle="collapse" href="#collapse${topicStatus.index}">
                            <h5 class="mb-0">${topic.topicName}</h5>
                            <i class="fas fa-chevron-down"></i>
                        </div>
                        <div class="collapse show" id="collapse${topicStatus.index}">
                            <div class="card-body py-2">
                                <c:if test="${not empty topic.subTopics}">
                                    <c:forEach var="subtopic" items="${topic.subTopics}" varStatus="subStatus">
                                        <div class="subtopic-item p-2 rounded" 
                                             data-video-url="<c:out value="download_video.do?video=${subtopic.video}"/>" 
                                             data-title="<c:out value="${subtopic.title}"/>"
                                             data-preview="<c:out value="${subtopic.preview}"/>"
                                             onclick="playVideoSafe(this)">
                                            <div class="d-flex justify-content-between align-items-center">
                                                <div>
                                                    <i class="fas fa-play-circle me-2 text-primary"></i>
                                                    <c:out value="${subtopic.title}"/>
                                                </div>
                                            </div>
                                        </div>
                                    </c:forEach>
                                </c:if>
                                <c:if test="${empty topic.subTopics}">
                                    <p class="text-muted small">No subtopics available</p>
                                </c:if>
                            </div>
                        </div>
                    </div>
                </c:forEach>
            </div>
            
            <!-- Main content area -->
            <div class="col-md-9 p-4">
                <div class="mb-4">
                    <nav aria-label="breadcrumb">
                        <ol class="breadcrumb">
                            <li class="breadcrumb-item"><a href="learner.jsp">learner</a></li>
                            <li class="breadcrumb-item active" id="currentTopic">Course Topics</li>
                        </ol>
                    </nav>
                </div>
                
                <!-- Video player area -->
                <div class="video-container shadow-sm" id="videoContainer">
                    <c:choose>
                        <c:when test="${not empty topicList && not empty topicList[0].subTopics && not empty topicList[0].subTopics[0].video}">
                            <video id="videoPlayer" width="100%" controls>
                                <source src="<c:out value="${topicList[0].subTopics[0].video}"/>" type="video/mp4">
                                Your browser does not support the video tag.
                            </video>
                        </c:when>
                        <c:otherwise>
                            <div class="text-center text-white p-5">
                                <i class="fas fa-film fa-3x mb-3"></i>
                                <h4>Select a lesson to start</h4>
                            </div>
                        </c:otherwise>
                    </c:choose>
                </div>
                
                <!-- Video title and description -->
                <div class="mb-4">
                    <h2 id="videoTitle">
                        <c:choose>
                            <c:when test="${not empty topicList && not empty topicList[0].subTopics}">
                                <c:out value="${topicList[0].subTopics[0].title}"/>
                            </c:when>
                            <c:otherwise>
                                Course Introduction
                            </c:otherwise>
                        </c:choose>
                    </h2>
                </div>
                
                <!-- Course resources and materials -->
                <div class="card mb-4">
                    <div class="card-header bg-white">
                        <h5 class="mb-0">Resources</h5>
                    </div>
                    <div class="card-body">
                        <div class="d-flex align-items-center mb-3">
                            <i class="far fa-file-pdf me-3 text-danger"></i>
                            <a href="#" class="text-decoration-none">Lecture Notes</a>
                        </div>
                        <div class="d-flex align-items-center mb-3">
                            <i class="far fa-file-code me-3 text-primary"></i>
                            <a href="#" class="text-decoration-none">Code Examples</a>
                        </div>
                        <div class="d-flex align-items-center">
                            <i class="far fa-file-alt me-3 text-success"></i>
                            <a href="#" class="text-decoration-none">Practice Exercises</a>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
    <script>
        // Safe function to play video using data attributes
        function playVideoSafe(element) {
            const videoUrl = element.getAttribute('data-video-url');
            const title = element.getAttribute('data-title');
            const isPreview = element.getAttribute('data-preview');
            
            const videoPlayer = document.getElementById('videoPlayer');
            const videoContainer = document.getElementById('videoContainer');
            const videoTitle = document.getElementById('videoTitle');
            const currentTopic = document.getElementById('currentTopic');
            
            // Update video source and play if it's a preview or user has access
            if (videoUrl && (isPreview === "true" || hasAccessToContent())) {
                if (videoContainer.innerHTML.includes('Your browser does not support')) {
                    videoContainer.innerHTML = 
                        '<video id="videoPlayer" width="100%" controls>' +
                            '<source src="' + videoUrl + '" type="video/mp4">' +
                            'Your browser does not support the video tag.' +
                        '</video>';
                } else {
                    videoPlayer.src = videoUrl;
                    videoPlayer.load();
                    videoPlayer.play();
                }
                
                // Update title
                videoTitle.textContent = title;
                currentTopic.textContent = title;
            }
            
            // Highlight selected subtopic
            const subtopics = document.querySelectorAll('.subtopic-item');
            subtopics.forEach(item => {
                item.classList.remove('selected-subtopic');
            });
            element.classList.add('selected-subtopic');
        }
        
        // Function to check if user has access to non-preview content
        // This would connect to your authentication system
        function hasAccessToContent() {
            // Replace with your actual authentication logic
            // For now, assuming all users have access
            return true;
        }
        
        // Initialize collapsible topics
        document.addEventListener('DOMContentLoaded', function() {
            const topicHeaders = document.querySelectorAll('.topic-header');
            topicHeaders.forEach(header => {
                header.addEventListener('click', function() {
                    const icon = this.querySelector('.fas');
                    icon.classList.toggle('fa-chevron-down');
                    icon.classList.toggle('fa-chevron-up');
                });
            });
            
            // Select first subtopic by default if available
            const firstSubtopic = document.querySelector('.subtopic-item');
            if (firstSubtopic) {
                firstSubtopic.classList.add('selected-subtopic');
            }
        });
    </script>
</body>
</html>