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



function togglePreview(subTopicId, badgeElement) {
    // Read current preview state from DOM attribute
    const currentPreview = badgeElement.getAttribute("data-preview") === "true";
    const newPreview = !currentPreview;

    changePreview(subTopicId, newPreview).then((data) => {
        const previewStatus = JSON.parse(data);

        // Update badge UI
        badgeElement.setAttribute("data-preview", previewStatus);

        if (previewStatus) {
            badgeElement.textContent = "Turn Preview Off";
            badgeElement.classList.remove('bg-success');
            badgeElement.classList.add('bg-danger');
        } else {
            badgeElement.textContent = "Turn Preview On";
            badgeElement.classList.remove('bg-danger');
            badgeElement.classList.add('bg-success');
        }
    }).catch((err) => {
        console.error(err);
        alert('Failed to update preview status.');
    });
}




// function togglePreview(subTopicId, currentPreview, badgeElement) {
    //     // Toggle the preview state (invert current state)
    //     const newPreview = !currentPreview;
    
    //     // Call the changePreview function
    //     changePreview(subTopicId, newPreview).then((data) => {
    //         // Convert string response to boolean
    //         const previewStatus = JSON.parse(data);
    
    //         if (previewStatus) {
    //             console.log(`${previewStatus} - Changing color to red (bg-danger)`);
    //             badgeElement.textContent = "Turn Preview Off";
    //             badgeElement.classList.remove('bg-success');
    //             badgeElement.classList.add('bg-danger');
    //         } else {
    //             console.log(`${previewStatus} - Changing color to green (bg-success)`);
    //             badgeElement.textContent = "Turn Preview On";
    //             badgeElement.classList.remove('bg-danger');
    //             badgeElement.classList.add('bg-success');
    //         }
    //     }).catch((err) => {
    //         console.error(err);
    //         alert('Failed to update preview status.');
    //     });
    // }
    







    //--------------------- when i click on explore courses-------------
function showAllCourseTopics(courseId, courseName, thumbnail, description, keyFeature) {
    fetch(`collectAllCourseTopics.do?course_id=${courseId}`)
        .then(response => response.json())
        .then(data => {
            console.log(data); // list of CourseTopic with subTopics
            console.log(courseName);
            console.log(thumbnail);
            console.log(description);
            console.log(keyFeature);
            renderCourseTopicsInModal(data, courseName, thumbnail, description, keyFeature); // a function to update the modal
        })
        .catch(error => console.error('Error fetching topics:', error));
}


function renderCourseTopicsInModal(topicList,courseName, thumbnail, description, keyFeature) {
    const modalContent = document.getElementById('modalContent');
    modalContent.innerHTML = '';
    console.log(courseName);
    console.log(thumbnail);
    console.log(description);
    console.log(keyFeature);

    // const coursesList = modalContent.querySelector('.course-list');
    const courseHeaderHtml = `
        <div class="d-flex align-items-center gap-3 p-3 rounded shadow-sm bg-white mb-4" style="position: sticky; top: 0; z-index: 1000;">
            <img src="download_media.do?thumbnail=${thumbnail}" alt="${courseName}" class="rounded shadow" style="max-width: 100%; height: auto; max-height: 300px; object-fit: cover;">
            <div>
                <h4 class="fw-bold">${courseName}</h4>
                <p class="text-muted mb-0">${description}</p>
            </div>
            <div class="ms-auto">
            <button class="btn btn-success px-4 py-2 rounded-pill fw-semibold">Enroll Now</button>
        </div>
        </div>
    `;

    // Key Features
    let courseFeatureHtml = `
    <section class="p-3 mb-4 bg-light rounded">
        <h5 class="fw-bold mb-3">Key Features</h5>
        <ul class="list-unstyled">`;

    if (keyFeature) {
        const featureList = keyFeature.split(',');
        featureList.forEach(feature => {
            courseFeatureHtml += `<li class="mb-1">&bull; ${feature.trim()}</li>`;
        });
    }

    courseFeatureHtml += `</ul></section>`;
   
    // Two-column layout
    const layoutHtml = `
        <div class="row">
            <div class="col-md-4">
                <div class="list-group modules-list shadow-sm rounded overflow-auto" style="max-height: 70vh;">
                    <!-- Modules will be inserted here -->
                </div>
            </div>
            <div class="col-md-8">
                <div class="lectures-container p-3 rounded shadow-sm bg-white" style="min-height: 400px;">
                    <!-- Lectures will be displayed here -->
                </div>
            </div>
        </div>
    `;

    // Final combined HTML
    modalContent.innerHTML = courseHeaderHtml + courseFeatureHtml + layoutHtml;
    
    
    const modulesList = modalContent.querySelector('.modules-list');
    const lecturesContainer = modalContent.querySelector('.lectures-container');
    
    // Add modules to the left sidebar
    topicList.forEach((topic, index) => {
        const isActive = index === 0;
        const moduleElement = document.createElement('div');
        moduleElement.className = `list-group-item list-group-item-action module-item ${isActive ? 'active' : ''}`;
        moduleElement.dataset.topicIndex = index;

        
        moduleElement.innerHTML = `
            <div class="d-flex justify-content-between align-items-center">
                <div>
                    <div class="text-muted small">Module${index + 1}</div>
                    <div class="fw-bold">${topic.topicName}</div>
                </div>
                <i class="fas fa-chevron-right"></i>
            </div>
        `;
        
        moduleElement.addEventListener('click', () => {
            // Remove active class from all modules
            document.querySelectorAll('.module-item').forEach(el => {
                el.classList.remove('active');
            });
            
            // Add active class to clicked module
            moduleElement.classList.add('active');
            
            // Show lectures for this module
            displayLectures(topic, lecturesContainer);
        });
        
        modulesList.appendChild(moduleElement);
        
        // Display lectures for the first module by default
        if (isActive) {
            displayLectures(topic, lecturesContainer);
        }
    });


    
    // Add some basic styling
    const style = document.createElement('style');
    style.textContent = `
        .module-item {
            cursor: pointer;
            transition: background 0.3s, border 0.3s;
        }
        .module-item.active {
            border-left: 4px solid #ff6b6b;
            background-color: #f8f9fa;
        }
        .lecture-item {
            padding: 15px;
            border-bottom: 1px solid #eee;
            position: relative;
            background: #fafafa;
            margin-bottom: 10px;
            border-radius: 8px;
            transition: background 0.3s;
        }
        .locked-icon {
            color: #adb5bd;
            position: absolute;
            right: 15px;
            top: 50%;
            transform: translateY(-50%);
        }
        .play-icon {
            color: #ff6b6b;
            background-color: #fff;
            border-radius: 50%;
            padding: 5px;
            position: absolute;
            right: 15px;
            top: 50%;
            transform: translateY(-50%);
        }
    `;
    
    modalContent.appendChild(style);
}

function displayLectures(topic, container) {
    container.innerHTML = '';
    console.log(topic);

    topic.subTopics.forEach((lecture, index) => {
        const lectureElement = document.createElement('div');
        lectureElement.className = 'lecture-item';

        const isPreview = lecture.preview;

        // Create HTML structure
        lectureElement.innerHTML = `
            <h6 class="lecture-title" style="cursor: pointer;">Lecture ${index + 1} : ${lecture.title}</h6>
            ${isPreview ? 
                '<i class="fas fa-play-circle play-icon" style="cursor: pointer;"></i>' :
                '<i class="fas fa-lock locked-icon"></i>'
            }
            <div class="video-container" style="display: none; margin-top: 10px;"></div>
        `;

        container.appendChild(lectureElement);

        // Add click listener if preview is true
        if (isPreview) {
            const title = lectureElement.querySelector('.lecture-title');
            const playIcon = lectureElement.querySelector('.play-icon');
            const videoContainer = lectureElement.querySelector('.video-container');

            const toggleVideo = () => {
                if (videoContainer.innerHTML === '') {
                    videoContainer.innerHTML = `
                        <video controls width="400" autoplay>
                            <source src="download_video.do?video=${lecture.video}" type="video/mp4">
                            Your browser does not support the video tag.
                        </video>
                    `;
                    videoContainer.style.display = 'block';
                } else {
                    videoContainer.innerHTML = '';
                    videoContainer.style.display = 'none';
                }
            };

            title.addEventListener('click', toggleVideo);
            playIcon.addEventListener('click', toggleVideo);
        }
    });
}

//--------------------- when i click on explore courses-------------




const addToCartRequest = async (courseId, price) => {
    let response = await fetch(`add_to_cart.do?course_id=${courseId}&course_Price=${price}`);

    let result = await response.text();

    return result;
};



const addToCart = (courseId, price, button,courseName, thumbnail, discount) => {
    addToCartRequest(courseId,price)
        .then((result) => {
            if(result == 'true'){

                console.log("-----"+result);
                button.innerHTML = '<i class="fas fa-check"></i> Added ';
                button.classList.remove('btn-primary');
                button.classList.add('btn-success');
                button.disabled = true; // optional: disable after adding

                addToCartUI(courseId, price, button,courseName, thumbnail, discount)
                // showCartItems();
            }
        
        })
        .catch((error) => {
            console.error("Error handling action:", error);
        });
};


function addToCartUI(courseId, price, button,courseName, courseThumbnail, discount) {
    // Get cart UI elements
    const cartItems = document.getElementById('cartItems');
    const emptyCart = document.getElementById('emptyCart');
    const checkoutBar = document.getElementById('checkoutBar');
    const cartCount = document.getElementById('cartCount');
    const cartTotal = document.getElementById('cartTotal');
    
    // Hide empty cart message
    emptyCart.classList.add('d-none');
    
    // Show checkout bar
    checkoutBar.classList.remove('d-none');
    
    // Create course card element
    const courseCard = document.createElement('div');
    courseCard.className = 'cart-course-card';
    courseCard.setAttribute('data-id', courseId);
    courseCard.innerHTML = `
        <div class="row g-0">
            <div class="col-4">
                <img src="download_media.do?thumbnail=${courseThumbnail}" alt="Course Image" class="img-fluid">
            </div>

            <div class="col-8">
                <div class="card-body">
                    <h5 class="card-title">${courseName}</h5>
                    <p class="card-text fw-bold cart_item_price">${price}</p>
                    <p class="card-text fw-bold cart_item_discount">${discount}%</p>
                    <button class="btn btn-sm btn-outline-danger remove-item" data-id="${courseId}">
                        <i class="fas fa-trash-alt"></i> Remove
                    </button>
                </div>
            </div>
        </div>
    `;
    
    // Add to cart container
    cartItems.insertBefore(courseCard, emptyCart);
    
    // Update cart count
    updateCartCount();
    
    // Update cart total
    updateCartTotal();
    
    // Add event listener to remove button
    const removeButton = courseCard.querySelector('.remove-item');
    removeButton.addEventListener('click', function() {
        removeFromCart(courseId);
    });
}



// Function to update cart count
function updateCartCount() {
    const cartCount = document.getElementById('cartCount');
    // Get all course cards in cart
    const courseCards = document.querySelectorAll('.cart-course-card');
    // Update count
    cartCount.textContent = courseCards.length;
}

// Function to update cart total
function updateCartTotal() {
    const cartTotal = document.getElementById('cartTotal');
    const cartDiscount = document.getElementById('cartDiscount');
    const cartFinalAmount = document.getElementById('cartFinalAmount');
    const cartItemCount = document.getElementById('cartItemCount');

    if (!cartTotal || !cartDiscount || !cartFinalAmount || !cartItemCount) return; // Safety check

    let total = 0;
    let totalDiscount = 0;
    let itemCount = 0;

    // Get all course cards in cart
    const courseCards = document.querySelectorAll('.cart-course-card');

    courseCards.forEach(card => {
        const priceElement = card.querySelector('.cart_item_price');
        const discountElement = card.querySelector('.cart_item_discount');

        if (priceElement) {
            const priceText = priceElement.textContent.trim().replace('$', '').replace('₹', '');
            const price = parseFloat(priceText);
            if (!isNaN(price)) {
                total += price;
            }
        }

        if (discountElement) {
            const discountText = discountElement.textContent.trim().replace('%', '');
            const discountPercent = parseFloat(discountText);
            if (!isNaN(discountPercent) && priceElement) {
                const priceText = priceElement.textContent.trim().replace('$', '').replace('₹', '');
                const price = parseFloat(priceText);
                if (!isNaN(price)) {
                    totalDiscount += (price * discountPercent / 100);
                }
            }
        }

        itemCount++;
    });

    const finalAmount = total - totalDiscount;

    // Update displays
    cartItemCount.textContent = itemCount;
    cartTotal.textContent = total.toFixed(2);
    cartDiscount.textContent = totalDiscount.toFixed(2);
    cartFinalAmount.textContent = finalAmount.toFixed(2);
}



// Function to remove from cart
function removeFromCart(courseId) {
    // Find and remove course card
    const courseCard = document.querySelector(`.course-card[data-id="${courseId}"]`);
    if (courseCard) {
        courseCard.remove();
    }
    
    // Update cart count
    updateCartCount();
    
    // Update cart total
    updateCartTotal();
    
    // Show/hide empty cart message and checkout bar
    const courseCards = document.querySelectorAll('.course-card');
    const emptyCart = document.getElementById('emptyCart');
    const checkoutBar = document.getElementById('checkoutBar');
    
    if (courseCards.length === 0) {
        emptyCart.classList.remove('d-none');
        checkoutBar.classList.add('d-none');
    }
}

document.addEventListener('DOMContentLoaded', function() {
    // Toggle cart visibility
    const cartButton = document.getElementById('cartButton');
    const cartContainer = document.getElementById('cartContainer');
    const cartClose = document.getElementById('cartClose');
    
    cartButton.addEventListener('click', function() {
        cartContainer.classList.toggle('open');
    });
    
    cartClose.addEventListener('click', function() {
        cartContainer.classList.remove('open');
    });
    
    // Load cart after login if needed
    // Uncomment and call this function after user logs in
    // loadCartAfterLogin();
});






