
function setTopicName() {
    const select = document.getElementById("select_course_topic_id");
    const selectedText = select.options[select.selectedIndex].text;
    document.getElementById("course_topic_name").value = selectedText;
}


//---------------------Ajax for Collect Sub Topics-----------------
const collectAllSubTopics = async (courseTopicId) => {
    let response = await fetch('viewSubTopics.do?course_topic_id=' + courseTopicId);

    let result = await response.json();

    return result;
};

const showSubTopics = (courseTopicId) => {
    collectAllSubTopics(courseTopicId)
        .then((data) => {
            const container = document.getElementById(`subtopics-${courseTopicId}`);
            container.innerHTML = ""; // Clear previous content

            if (data !== "khali") {
                data.forEach((subtopic, index) => {
                    console.log(subtopic.video);
                    console.log(subtopic.preview);
                    
                    // Create card container
                    const card = document.createElement("div");
                    card.className = "card mb-3 shadow-sm animate__animated animate__fadeIn";
                    card.style.maxWidth = "540px";
                    card.style.cursor = "pointer";

                    // Add the card content with image and text
                    card.setAttribute("id", `card-${index}`);
                    card.innerHTML = `
                    <div class="card mb-3 shadow-sm animate__animated animate__fadeIn" style="max-width: 100%;">
                        <div class="row g-0 align-items-stretch" style="height: 150px;">
                            <!-- Left: Thumbnail -->
                            <div class="col-md-4">
                                <img src="download_media.do?thumbnail=${subtopic.thumbnail}" class="img-fluid h-100 w-100 object-fit-cover rounded-start" alt="Thumbnail">
                            </div>

                            <!-- Right: Content -->
                            <div class="col-md-8 position-relative">
                                <div class="card-body h-100 d-flex flex-column justify-content-center">
                                    <h5 class="card-title mb-1 text-primary">${subtopic.title}</h5>
                                    <p class="card-text mb-1"><small class="text-muted">Duration: ${subtopic.duration} mins</small></p>
                                    <span 
                                        class="badge ${subtopic.preview ? 'bg-danger' : 'bg-success'}"
                                        style="cursor:pointer;"
                                        data-preview="${subtopic.preview ? 'true' : 'false'}"
                                        onclick="event.stopPropagation(); togglePreview(${subtopic.subTopicId}, this);">
                                        ${subtopic.preview ? 'Turn Preview Off' : 'Turn Preview On'}
                                    </span>

                                </div>

                                <!-- Three Dots Dropdown -->
                                <div class="dropdown position-absolute top-0 end-0 m-2">
                                    <button class="btn btn-sm btn-outline-secondary rounded-circle" type="button"
                                            id="dropdownMenu-${index}" data-bs-toggle="dropdown" aria-expanded="false"
                                            onclick="event.stopPropagation();">
                                        <i class="bi bi-three-dots-vertical"></i>
                                    </button>
                                    <ul class="dropdown-menu dropdown-menu-end compact-dropdown" aria-labelledby="dropdownMenu-${index}">
                                        <li><a class="dropdown-item compact-item" href="#" onclick="event.stopPropagation(); editSubTopic(${subtopic.subTopicId})">Edit</a></li>
                                        <li><a class="dropdown-item compact-item" href="#" onclick="event.stopPropagation(); deleteSubTopic(${subtopic.subTopicId})">Delete</a></li>
                                        <li><a class="dropdown-item compact-item" href="#" onclick="event.stopPropagation(); showModal('videoModal-${index}')">Video Play</a></li>
                                    </ul>

                                </div>
                            </div>
                        </div>
                    </div>

                    <!-- Modal -->
                    <div class="modal fade" id="videoModal-${index}" tabindex="-1" aria-hidden="true">
                        <div class="modal-dialog modal-lg modal-dialog-centered">
                            <div class="modal-content">
                                <div class="modal-header">
                                    <h5 class="modal-title">${subtopic.title}</h5>
                                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"
                                            onclick="stopVideo('video-${index}')"></button>
                                </div>
                                <div class="modal-body">
                                    <video id="video-${index}" class="w-100 rounded" controls>
                                        <source src="download_video.do?video=${subtopic.video}" type="video/mp4">
                                        Your browser does not support the video tag.
                                    </video>
                                </div>
                            </div>
                        </div>
                    </div>
                    `;


                    container.appendChild(card);
                });
            } else {
                container.innerHTML = `<p class='text-muted'>No subtopics available.</p>`;
            }
        })
        .catch((error) => {
            console.error("Error loading subtopics:", error);
        });
};

let isModalOpen = false;

function showModal(modalId) {
    const modalElement = document.getElementById(modalId);
    if (!isModalOpen) {  // Prevent opening modal if it's already open
        const modal = new bootstrap.Modal(modalElement);
        modal.show();
        isModalOpen = true;  // Mark the modal as open
    }
}


function stopVideo(videoId) {
    const video = document.getElementById(videoId);
    if (video) {
        video.pause();
        video.currentTime = 0;
    }
}

// Function to handle Edit action (you can implement your logic here)
function editSubTopic(subtopicId) {
    alert(`Edit Subtopic with ID: ${subtopicId}`);
    // Implement your edit logic here (e.g., show a form to edit the subtopic)
}

// Function to handle Delete action (you can implement your logic here)
// const requestSubTopicDelete = async (subTopicId) => {
//     let response = await fetch('deleteSubTopic.do?sub_topic_id=' + subTopicId);

//     const result = await response.text();
//     return result;
// };
const requestSubTopicDelete = (subTopicId) => {
    return fetch(`/deleteSubTopic.do`, {
        method: 'POST',
        headers: {
            'Content-Type': 'application/x-www-form-urlencoded',
        },
        body: `sub_topic_id=${subTopicId}`
    })
    .then(response => response.text())
    .then(result => result);
};

const deleteSubTopic = (subTopicId) => {
    if (confirm("Are you sure you want to delete this subtopic?")) {
        requestSubTopicDelete(subTopicId)
            .then(result => {
                if (result === "success") {
                    alert("Subtopic deleted successfully!");
                    // Optionally remove the DOM element if needed
                    const deletedItem = document.getElementById("subtopic-" + subTopicId);
                    if (deletedItem) deletedItem.remove();
                } else if (result === "db_error") {
                    alert("Subtopic not found.");
                } else {
                    alert("An error occurred while deleting.");
                }
            });
    }
};





const changePreview = async (subtopicId,preview) => {
    let response = await fetch(`togglePreview.do?subTopicId=${subtopicId}&currPreview=${preview}`);

    let result = await response.text();

    return result;
};


function togglePreview(subTopicId, badgeElement) {
    // Read current preview state from element
    let currentPreview = badgeElement.getAttribute('data-preview') === 'true';

    changePreview(subTopicId, currentPreview).then((data) => {
        let newStatus = data.trim().toLowerCase() === 'true';

        // Update badge UI
        badgeElement.textContent = newStatus ? "Turn Preview Off" : "Turn Preview On";
        badgeElement.classList.remove('bg-success', 'bg-danger');
        badgeElement.classList.add(newStatus ? 'bg-danger' : 'bg-success');

        // ✅ Update data-preview attribute for next toggle
        badgeElement.setAttribute('data-preview', newStatus.toString());
    }).catch((err) => {
        console.error("Toggle failed", err);
    });
}





// function togglePreview(subTopicId, currentPreview, badgeElement) {
//     // Toggle the preview state (invert current state)
//     const newPreview = !currentPreview;

//     // Call the changePreview function (assuming it's a promise that returns the new state)
//     changePreview(subTopicId, newPreview).then((data) => {
//         if (data != null) {
//             // Update badge text and color based on new preview state
//             if (data === true) {
//                 console.log(`${data} - Changing color to red (bg-danger)`);
//                 badgeElement.textContent = "Turn Preview Off";
//                 badgeElement.classList.remove('bg-success');
//                 badgeElement.classList.add('bg-danger');
//             } else {
//                 console.log(`${data} - Changing color to green (bg-success)`);
//                 badgeElement.textContent = "Turn Preview On";
//                 badgeElement.classList.remove('bg-danger');
//                 badgeElement.classList.add('bg-success');
//             }
//         } else {
//             alert('Failed to update preview status.');
//         }
//     }).catch((err) => {
//         console.error(err);
//     });
// }










function setTopicName() {
const select = document.getElementById('select_course_topic_id');
if (select.selectedIndex > -1) {
    const selectedText = select.options[select.selectedIndex].text;
    document.getElementById('course_topic_name').value = selectedText;
}
}

// Initialize the form
document.addEventListener('DOMContentLoaded', function () {
setTopicName();

// Video upload handling with just icon click
const videoUploadIcon = document.getElementById('videoUploadIcon');
const videoInput = document.getElementById('videoFileInput');
const uploadStatus = document.getElementById('uploadStatus');
const uploadInstructions = document.getElementById('uploadInstructions');
const form = document.getElementById('subTopicForm');
const hiddenVideo = document.getElementById('videoPreview');
    const durationInput = document.getElementById('duration');

// Click to select file
videoUploadIcon.addEventListener('click', function () {
    videoInput.click();
});

// Handle file selection - just show confirmation, no preview
videoInput.addEventListener('change', function () {
    const file = e.target.files[0];
    if (!file) return;

    const videoElement = document.getElementById("videoPreview");
    const url = URL.createObjectURL(file);
    videoElement.preload = 'metadata';
    videoElement.src = url;

    videoElement.onloadedmetadata = function () {
        URL.revokeObjectURL(videoElement.src);
        const durationInSeconds = Math.round(videoElement.duration);
        document.getElementById("duration").value = durationInSeconds;
        console.log("Video duration set to:", durationInSeconds);  // Debug check
    };

    videoElement.onerror = function () {
        console.error("Failed to load video metadata.");
    };
});

// When the modal is hidden (closed), reset the form
const modal = document.getElementById('addSubTopicModal');
document.addEventListener('hidden.bs.modal', function (event) {
    // Check if the modal that was closed is the one we're interested in
    if (event.target.classList.contains('modal')) {
        isModalOpen = false; // Reset the flag when modal is closed
    }
});
});


function toggleSubTopics(topicId, button) {
    const subtopicsContainer = document.getElementById(`subtopics-${topicId}`);
    const icon = button.querySelector('i');
    
    // Toggle visibility
    if (subtopicsContainer.style.display === 'none') {
        // Show content and load subtopics
        subtopicsContainer.style.display = 'block';
        icon.classList.remove('bi-chevron-down');
        icon.classList.add('bi-chevron-up');
        
        // Call the existing function to load subtopics
        showSubTopics(topicId);
    } else {
        // Hide content
        subtopicsContainer.style.display = 'none';
        icon.classList.remove('bi-chevron-up');
        icon.classList.add('bi-chevron-down');
    }
}