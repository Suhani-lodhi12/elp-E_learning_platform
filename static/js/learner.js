// Add animations on scroll
document.addEventListener('DOMContentLoaded', function () {
    // Smooth scrolling for anchor links
    document.querySelectorAll('a[href^="#"]').forEach(anchor => {
        anchor.addEventListener('click', function (e) {
            e.preventDefault();
            const target = document.querySelector(this.getAttribute('href'));
            if (target) {
                window.scrollTo({
                    top: target.offsetTop - 100,
                    behavior: 'smooth'
                });
            }
        });
    });

    // Initialize tooltips
    var tooltipTriggerList = [].slice.call(document.querySelectorAll('[data-bs-toggle="tooltip"]'))
    var tooltipList = tooltipTriggerList.map(function (tooltipTriggerEl) {
        return new bootstrap.Tooltip(tooltipTriggerEl)
    });
});


function showMoreCourses() {
    const hiddenCourses = document.querySelectorAll('.course-box.d-none');
    hiddenCourses.forEach(course => course.classList.remove('d-none'));

    // Optionally hide the button after expanding
    document.querySelector('.hero-btn').style.display = 'none';
}

//--------------------My Courses----------------------------

document.addEventListener('DOMContentLoaded', function () {
    const myCoursesModal = document.getElementById('myCoursesModal');

    // Event: When the modal is about to be shown
    myCoursesModal.addEventListener('show.bs.modal', function () {
        const container = document.getElementById('myCoursesContent');
        container.innerHTML = `<p class="text-center text-muted">Loading courses...</p>`;

        fetch('myCourses.do')
            .then(response => {
                if (!response.ok) throw new Error("Network response was not ok");
                return response.json();
            })
            .then(data => {
                container.innerHTML = '';
                console.log(data);
                

                if (!Array.isArray(data) || data.length === 0) {
                    container.innerHTML = `
                        <div class="text-center text-muted">
                            <i class="material-icons" style="font-size: 48px;">school</i>
                            <h5 class="mt-3">No Courses Enrolled</h5>
                            <p>You have not enrolled in any courses yet. So enroll and start learning today!</p>
                        </div>
                    `;
                } else {
                    let html = '<div class="row">';
                        data.forEach(course => {
                            html += `
                                <div class="col-md-4 mb-4">
                                    <div class="card shadow-sm h-100">
                                        <img src="download_media.do?thumbnail=${course.course.thumbnail}" class="card-img-top" alt="${course.course.courseName}">
                                        <div class="card-body">
                                            <h5 class="card-title">${course.course.courseName}</h5>
                                            <button type="button" class="btn btn-primary mt-auto"
                                                onclick="continueCourse(${course.course.courseId})">
                                                Continue
                                            </button>
                                        </div>
                                    </div>
                                </div>
                            `;
                        });
                        html += '</div>';
                        container.innerHTML = html;

                }
            })
            .catch(error => {
                console.error('Error fetching courses:', error);
                container.innerHTML = '<p class="text-danger text-center">Failed to load courses. Please try again later.</p>';
            });
    });
});


function continueCourse(courseId){
    const form = document.getElementById('user_course');       
    const courseInput = document.getElementById('course_id');  

    courseInput.value = courseId;  // set course_id value
    form.submit();                 // submit form
}

//--------------------My Courses----------------------------

//------------ For wishList ---------------
// const collectWishlistAdd = async (courseId) => {
//     let response = await fetch('add_to_wishlist.do?course_id=' + courseId);

//     let result = await response.text();
//     console.log(result);
    
//     return result;
// };

const collectWishlistAdd = async (courseId) => {
    let response = await fetch('add_to_wishlist.do', {
        method: 'POST',
        headers: {
            'Content-Type': 'application/x-www-form-urlencoded',
        },
        body: new URLSearchParams({
            course_id: courseId
        })
    });

    let result = await response.text();
    return result;
};

const addToWishlist = (courseId, button) => {
    collectWishlistAdd(courseId)
        .then((result) => {
            const heartIcon = button.querySelector('i'); // button ke andar ka <i> tag select kiya

            if (result === 'added') {
                alert('Added to wishlist!');
                heartIcon.classList.remove('far'); // 'far' = regular empty heart
                heartIcon.classList.add('fas');     // 'fas' = solid filled heart
                heartIcon.style.color = 'red';      // Heart ka color red
            } else if (result === 'removed') {
                alert('Removed from wishlist.');
                heartIcon.classList.remove('fas'); // 'fas' = solid filled heart
                heartIcon.classList.add('far');    // 'far' = regular empty heart
                heartIcon.style.color = '';        // Default color (white ya jo bhi tha)
            } else {
                alert('Something went wrong.');
            }
        })
        .catch((error) => {
            console.error("Error handling wishlist action:", error);
        });
};
//------------ For wishList ---------------


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


function renderCourseTopicsInModal(topicList, courseName, thumbnail, description, keyFeature) {
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

    // FAQ Section
    const faqHtml = `
        <section class="p-3 mt-4 bg-light rounded shadow-sm">
            <h5 class="fw-bold mb-3">Frequently Asked Questions</h5>
            <div class="accordion" id="courseFaqAccordion">
                ${generateFaqItems()}
            </div>
        </section>
    `;

    // Final combined HTML
    modalContent.innerHTML = courseHeaderHtml + courseFeatureHtml + layoutHtml + faqHtml;
    
    
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

    // Initialize accordion functionality for FAQ section
    initializeFaqAccordion();
    
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
        .accordion-button:not(.collapsed) {
            background-color: #f8f9fa;
            color: #000;
            font-weight: 700;
            box-shadow: none;
        }
        .accordion-button {
            color: #000;
            font-weight: 700;
        }
        .accordion-button:focus {
            box-shadow: none;
            border-color: rgba(0,0,0,.125);
        }
        .accordion-body {
            color: #555;
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

// Function to generate FAQ items
function generateFaqItems() {
    // These are common FAQs that will be the same for all courses
    const faqs = [
        {
            id: 'faq1',
            question: 'How long do I have access to the course?',
            answer: 'Once enrolled, you will have lifetime access to the course content. You can revisit the material as many times as you need.'
        },
        {
            id: 'faq2',
            question: 'Will I receive a certificate after completing the course?',
            answer: 'Yes, upon successful completion of the course and all required assignments, you will receive a digital certificate that you can share on your resume or social media platforms.'
        },
        {
            id: 'faq3',
            question: 'What if I am not satisfied with the course?',
            answer: 'We offer a 30-day money-back guarantee. If you are not satisfied with the course for any reason, you can request a full refund within 30 days of purchase.'
        },
        {
            id: 'faq4',
            question: 'Do I need any prerequisites for this course?',
            answer: 'The specific prerequisites for each course are mentioned in the course description. However, most of our courses are designed to accommodate learners at various skill levels.'
        },
        {
            id: 'faq5',
            question: 'Can I access the course on mobile devices?',
            answer: 'Yes, our platform is fully responsive. You can access the course content on any device including desktops, laptops, tablets and smartphones.'
        },
        {
            id: 'faq6',
            question: 'How do I get help if I have questions during the course?',
            answer: 'You can post your questions in the discussion forum associated with each lecture. Our instructors and community members regularly check these forums and respond to queries.'
        },
        {
            id: 'faq7',
            question: 'Are there any additional costs or fees?',
            answer: 'No, the course price covers all the materials and resources mentioned in the course description. There are no hidden costs or additional fees.'
        }
    ];

    // Generate HTML for each FAQ item
    return faqs.map(faq => `
        <div class="accordion-item border mb-2 rounded shadow-sm">
            <h2 class="accordion-header" id="heading${faq.id}">
                <button class="accordion-button collapsed fw-bold" type="button" data-bs-toggle="collapse" data-bs-target="#collapse${faq.id}" aria-Handed="false" aria-controls="collapse${faq.id}">
                    ${faq.question}
                </button>
            </h2>
            <div id="collapse${faq.id}" class="accordion-collapse collapse" aria-labelledby="heading${faq.id}" data-bs-parent="#courseFaqAccordion">
                <div class="accordion-body">
                    ${faq.answer}
                </div>
            </div>
        </div>
    `).join('');
}

// Function to initialize accordion functionality
function initializeFaqAccordion() {
    // This function will attach event listeners to the accordion buttons
    document.querySelectorAll('.accordion-button').forEach(button => {
        button.addEventListener('click', function() {
            // Toggle the class to change the appearance
            this.classList.toggle('collapsed');
            
            // Toggle aria-expanded attribute
            const expanded = this.getAttribute('aria-expanded') === 'true';
            this.setAttribute('aria-expanded', !expanded);
            
            // Find the target collapse element
            const targetId = this.getAttribute('data-bs-target').substring(1);
            const targetCollapse = document.getElementById(targetId);
            
            // Toggle the collapse
            if (targetCollapse) {
                targetCollapse.classList.toggle('show');
            }
        });
    });
}

//#################################################################

//---------^^ For cart ^^---------------
const addToCartRequest = async (courseId, price, discount) => {
    let response = await fetch(`add_to_cart.do?course_id=${courseId}&course_Price=${price}&course_discount=${discount}`);

    let result = await response.text();
    return result;
};

// New function to remove item from database
const removeFromCartRequest = async (courseId) => {
    let response = await fetch(`remove_from_cart.do?course_id=${encodeURIComponent(courseId)}`, {
        method: 'POST'
    });
    let result = await response.text();
    return result;
};

const addToCart = (courseId, price, button, courseName, thumbnail, discount) => {
    // Check if item is already in cart
    if (isItemInCart(courseId)) {
        // Item already in cart, show message or visual feedback
        button.innerHTML = '<i class="fas fa-check"></i> Added';
        button.classList.remove('btn-primary');
        button.classList.add('btn-success');
        button.disabled = true;
        return; // Exit early
    }

    addToCartRequest(courseId, price, discount)
        .then((result) => {
            if (result == 'true') {
                console.log("-----" + result);
                button.innerHTML = '<i class="fas fa-check"></i> Added';
                button.classList.remove('btn-primary');
                button.classList.add('btn-success');
                button.disabled = true; // Disable button after adding
                
                addToCartUI(courseId, price, button, courseName, thumbnail, discount);
            }
        })
        .catch((error) => {
            console.error("Error handling action:", error);
        });
};

// New function to check if an item is already in the cart
function isItemInCart(courseId) {
    return document.querySelector(`.cart-course-card[data-id="${courseId}"]`) !== null;
}

function addToCartUI(courseId, price, button, courseName, courseThumbnail, discount) {
    const cartItems = document.getElementById('cartItems');
    const emptyCart = document.getElementById('emptyCart');
    const checkoutBar = document.getElementById('checkoutBar');
    const cartCount = document.getElementById('cartCount');
    const cartTotal = document.getElementById('cartTotal');

    // Hide empty cart message
    emptyCart.classList.add('d-none');
    checkoutBar.classList.remove('d-none');

    // Avoid adding duplicate items
    if (document.querySelector(`.cart-course-card[data-id="${courseId}"]`)) {
        return;
    }

    const courseCard = document.createElement('div');
    courseCard.className = 'cart-course-card';
    courseCard.setAttribute('data-id', courseId);
    courseCard.innerHTML = `
    <div class="card mb-3 shadow-sm rounded-3">
        <div class="row g-0 align-items-center">
            <div class="col-md-4">
                <img src="download_media.do?thumbnail=${courseThumbnail}" 
                     alt="Course Image" 
                     class="img-fluid rounded-start">
            </div>
            <div class="col-md-8">
                <div class="card-body">
                    <h5 class="card-title mb-2">${courseName}</h5>
                    <div class="d-flex justify-content-between align-items-center mb-2">
                        <span class="fw-bold text-primary cart_item_price">${price}</span>
                        <span class="fw-bold text-success cart_item_discount">${discount}% OFF</span>
                    </div>
                    <button class="btn btn-sm btn-outline-danger remove-item" data-id="${courseId}">
                        <i class="fas fa-trash-alt me-1"></i> Remove
                    </button>
                </div>
            </div>
        </div>
    </div>
`;


    cartItems.insertBefore(courseCard, emptyCart);
    updateCartCount();
    updateCartTotal();
    saveCartToLocalStorage(); // Save to localStorage after adding

    const removeButton = courseCard.querySelector('.remove-item');
    removeButton.addEventListener('click', function () {
        removeFromCart(courseId);
    });
}

function updateCartCount() {
    const cartCount = document.getElementById('cartCount');
    const courseCards = document.querySelectorAll('.cart-course-card');
    cartCount.textContent = courseCards.length;
}

function updateCartTotal() {
    const cartTotal = document.getElementById('cartTotal');
    const cartDiscount = document.getElementById('cartDiscount');
    const cartFinalAmount = document.getElementById('cartFinalAmount');
    const cartItemCount = document.getElementById('cartItemCount');

    if (!cartTotal || !cartDiscount || !cartFinalAmount || !cartItemCount) return;

    let total = 0;
    let totalDiscount = 0;
    let itemCount = 0;

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

    cartItemCount.textContent = itemCount;
    cartTotal.textContent = total.toFixed(2);
    cartDiscount.textContent = totalDiscount.toFixed(2);
    cartFinalAmount.textContent = finalAmount.toFixed(2);
}

function removeFromCart(courseId) {
    const courseCard = document.querySelector(`.cart-course-card[data-id="${courseId}"]`);

    removeFromCartRequest(courseId)
        .then((result) => {
            console.log(result);
            
            if (result.trim() === 'success') {
                console.log("Item removed from database successfully");

                if (courseCard) {
                    courseCard.remove();
                }

                updateCartCount();
                updateCartTotal();
                saveCartToLocalStorage();
                resetAddToCartButton(courseId);

                const courseCards = document.querySelectorAll('.cart-course-card');
                const emptyCart = document.getElementById('emptyCart');
                const checkoutBar = document.getElementById('checkoutBar');

                if (courseCards.length === 0) {
                    emptyCart.classList.remove('d-none');
                    checkoutBar.classList.add('d-none');
                }
            } else {
                alert("Failed to remove item from cart: " + result);
            }
        })
        .catch(error => {
            console.error("Error removing item from database:", error);
            alert("Error removing item from cart.");
        });
}

// New function to reset the Add to Cart button when item is removed
function resetAddToCartButton(courseId) {
    // Find the button for this course ID - adjust the selector based on your page structure
    const addButton = document.querySelector(`[data-course-id="${courseId}"]`);
    if (addButton) {
        addButton.innerHTML = 'Add to Cart';
        addButton.classList.remove('btn-success');
        addButton.classList.add('btn-primary');
        addButton.disabled = false;
    }
}

// Save cart data to localStorage
function saveCartToLocalStorage() {
    const courseCards = document.querySelectorAll('.cart-course-card');
    const cartData = [];

    courseCards.forEach(card => {
        const courseId = card.getAttribute('data-id');
        const courseName = card.querySelector('.card-title').textContent;
        const price = card.querySelector('.cart_item_price').textContent;
        const discount = card.querySelector('.cart_item_discount').textContent;
        const thumbnail = card.querySelector('img').getAttribute('src');

        cartData.push({
            courseId,
            courseName,
            price,
            discount,
            thumbnail
        });
    });

    localStorage.setItem('cartItems', JSON.stringify(cartData));
}

// Function to load cart data from database
async function loadCartFromDatabase() {
    try {
        const response = await fetch('get_cart_items.do');
        const data = await response.json();
        
        // Clear existing cart items first
        const cartItems = document.querySelectorAll('.cart-course-card');
        cartItems.forEach(item => item.remove());
        
        // Add items from database to cart UI
        // Add items from database to cart UI
if (data && data.length > 0) {
    console.log(data);
    data.forEach(item => {
        console.log(item); 
        addToCartUI(
            item.course.courseId,       
            item.cartItem.price,        
            null,
            item.course.courseName,     
            item.course.thumbnail,      
            item.cartItem.discount      
        );
    });
}

        
        // Update all Add to Cart buttons for items in cart
        updateAddToCartButtons();
    } catch (error) {
        console.error("Error loading cart from database:", error);
        // Fall back to localStorage if database fetch fails
        loadCartFromLocalStorage();
    }
}

// Load cart data from localStorage on page load (fallback)
function loadCartFromLocalStorage() {
    const storedCart = localStorage.getItem('cartItems');
    if (storedCart) {
        const cartArray = JSON.parse(storedCart);
        cartArray.forEach(item => {
            addToCartUI(
                item.courseId,
                item.price,
                null,
                item.courseName,
                item.thumbnail.split('thumbnail=')[1],
                item.discount.replace('%', '')
            );
        });
        
        // Update all Add to Cart buttons for items in cart
        updateAddToCartButtons();
    }
}

// New function to update all Add to Cart buttons based on cart contents
function updateAddToCartButtons() {
    // Get all course IDs in the cart
    const cartCourseIds = Array.from(
        document.querySelectorAll('.cart-course-card')
    ).map(card => card.getAttribute('data-id'));
    
    // Find all Add to Cart buttons on the page and disable those for courses in cart
    const addButtons = document.querySelectorAll('[data-course-id]');
    addButtons.forEach(button => {
        const courseId = button.getAttribute('data-course-id');
        if (cartCourseIds.includes(courseId)) {
            button.innerHTML = '<i class="fas fa-check"></i> Added';
            button.classList.remove('btn-primary');
            button.classList.add('btn-success');
            button.disabled = true;
        }
    });
}

document.addEventListener('DOMContentLoaded', function () {
    const cartButton = document.getElementById('cartButton');
    const cartContainer = document.getElementById('cartContainer');
    const cartClose = document.getElementById('cartClose');

    cartButton.addEventListener('click', function () {
        cartContainer.classList.toggle('open');
    });

    cartClose.addEventListener('click', function () {
        cartContainer.classList.remove('open');
    });

    // Add clear cart button functionality
    const clearCartButton = document.getElementById('clearCartButton');
    if (clearCartButton) {
        clearCartButton.addEventListener('click', function() {
            clearCart();
        });
    }

    // Load cart from database first, fallback to localStorage
    loadCartFromDatabase();
});

// Function to clear all items from the cart
function clearCart() {
    // Clear from UI
    const cartItems = document.querySelectorAll('.cart-course-card');
    cartItems.forEach(item => {
        const courseId = item.getAttribute('data-id');
        removeFromCart(courseId);
    });
    
    // Clear from localStorage
    localStorage.removeItem('cartItems');
    
    // Clear from database
    fetch('clear_cart.do')
        .then(response => response.text())
        .then(result => {
            console.log("Cart cleared from database:", result);
        })
        .catch(error => {
            console.error("Error clearing cart from database:", error);
        });
    
    // Show empty cart message
    const emptyCart = document.getElementById('emptyCart');
    const checkoutBar = document.getElementById('checkoutBar');
    if (emptyCart) emptyCart.classList.remove('d-none');
    if (checkoutBar) checkoutBar.classList.add('d-none');
    
    // Reset all Add to Cart buttons
    const addButtons = document.querySelectorAll('[data-course-id]');
    addButtons.forEach(button => {
        button.innerHTML = 'Add to Cart';
        button.classList.remove('btn-success');
        button.classList.add('btn-primary');
        button.disabled = false;
    });
}










//****************************************************** 
// Wait for the DOM to be fully loaded
// Wait for the DOM to be fully loaded
document.addEventListener('DOMContentLoaded', function() {
    const checkoutButton = document.querySelector('.checkout-bar .btn-success');

    if (checkoutButton) {
        checkoutButton.addEventListener('click', function() {
            openQRPaymentModal();
        });
    }
});

function openQRPaymentModal() {
    const cartTotal = document.getElementById('cartFinalAmount').textContent;
    const itemCount = document.getElementById('cartItemCount').textContent;

    const modalHTML = `
        <div class="modal fade" id="qrPaymentModal" tabindex="-1" aria-labelledby="qrPaymentModalLabel" aria-hidden="true">
            <div class="modal-dialog modal-dialog-centered">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="qrPaymentModalLabel">Scan QR Code to Purchase All Courses</h5>
                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                    </div>
                    <div class="modal-body text-center">
                        <div class="mb-4">
                            <div class="step-container">
                                <div class="step active">1. Scan QR</div>
                                <div class="step">2. Upload Screenshot</div>
                                <div class="step">3. Confirm</div>
                            </div>
                        </div>
                        <div id="qrSection" class="payment-section">
                            <div class="qr-container mb-3">
                                <img src="static/media/images/QR.jpeg" alt="Payment QR Code" class="img-fluid border p-2" id="paymentQrCode">
                            </div>
                            <div class="payment-details mb-3">
                                <h6>Payment Details:</h6>
                                <p class="mb-1">Total Amount: <strong><i class="fas fa-rupee-sign"></i> ${cartTotal}</strong></p>
                                <p class="mb-1">Items: <strong>${itemCount}</strong></p>
                                <p class="text-danger mb-3">Scan QR code and pay using UPI</p>
                            </div>
                            <button type="button" class="btn btn-primary" id="paymentDoneBtn">Payment Done</button>
                        </div>
                        <div id="screenshotSection" class="payment-section d-none">
                            <h6 class="mb-3">Please Upload Your Payment Screenshot</h6>
                            <div class="mb-3">
                                <div class="upload-container border p-3 mb-3">
                                    <label for="paymentScreenshot" class="form-label upload-label">
                                        <i class="fas fa-cloud-upload-alt fs-1"></i>
                                        <div>Choose a file or drag it here</div>
                                    </label>
                                    <input class="form-control d-none" type="file" id="paymentScreenshot" accept="image/*">
                                    <div id="fileUploadStatus" class="mt-2 d-none">
                                        <span class="text-success"><i class="fas fa-check-circle"></i> File uploaded successfully</span>
                                    </div>
                                </div>
                            </div>
                            <button type="button" class="btn btn-primary" id="verifyPaymentBtn" disabled>Verify Payment</button>
                        </div>
                        <div id="confirmationSection" class="payment-section d-none">
                            <div class="text-center mb-4">
                                <i class="fas fa-check-circle text-success" style="font-size: 64px;"></i>
                                <h4 class="mt-3">Payment Successful!</h4>
                                <p>Your payment has been successfully processed.</p>
                                <p>A confirmation email has been sent to your registered email address.</p>
                                <p>Please check your email for further instructions.</p>
                            </div>
                            <button type="button" class="btn btn-success" data-bs-dismiss="modal">Complete</button>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    `;

    const modalContainer = document.createElement('div');
    modalContainer.innerHTML = modalHTML;
    document.body.appendChild(modalContainer);

    const style = document.createElement('style');
    style.innerHTML = `
        .step-container {
            display: flex;
            justify-content: space-between;
            margin-bottom: 20px;
        }
        .step {
            flex: 1;
            text-align: center;
            padding: 8px;
            background-color: #f0f0f0;
            border-radius: 4px;
            margin: 0 4px;
            font-size: 14px;
        }
        .step.active {
            background-color: #0d6efd;
            color: white;
        }
        .upload-label {
            cursor: pointer;
            display: flex;
            flex-direction: column;
            align-items: center;
            justify-content: center;
            height: 150px;
            background-color: #f8f9fa;
        }
    `;
    document.head.appendChild(style);

    const qrModal = new bootstrap.Modal(document.getElementById('qrPaymentModal'));
    qrModal.show();

    setupEventListeners();
}

function setupEventListeners() {
    const paymentDoneBtn = document.getElementById('paymentDoneBtn');
    if (paymentDoneBtn) {
        paymentDoneBtn.addEventListener('click', function() {
            showScreenshotUpload();
        });
    }

    const fileInput = document.getElementById('paymentScreenshot');
    if (fileInput) {
        fileInput.addEventListener('change', function(e) {
            const file = e.target.files[0];
            if (file) {
                handleFileUpload(file);
            }
        });
    }

    const verifyPaymentBtn = document.getElementById('verifyPaymentBtn');
    if (verifyPaymentBtn) {
        verifyPaymentBtn.addEventListener('click', async function() {
            const fileInput = document.getElementById('paymentScreenshot');
            if (fileInput.files.length > 0) {
                await saveSubscriptionToDatabase();
                showConfirmation();
            } else {
                alert('Please upload a screenshot before verifying payment.');
            }
        });
    }

    setupDragAndDrop();
}

function handleFileUpload(file) {
    if (!file) return;
    if (!file.type.match('image.*')) {
        alert('Please upload an image file.');
        return;
    }
    const fileUploadStatus = document.getElementById('fileUploadStatus');
    fileUploadStatus.classList.remove('d-none');
    document.getElementById('verifyPaymentBtn').disabled = false;
}

function setupDragAndDrop() {
    const uploadLabel = document.querySelector('.upload-label');
    const fileInput = document.getElementById('paymentScreenshot');

    if (uploadLabel && fileInput) {
        uploadLabel.addEventListener('dragover', function(e) {
            e.preventDefault();
            uploadLabel.style.backgroundColor = '#e9ecef';
        });
        uploadLabel.addEventListener('dragleave', function() {
            uploadLabel.style.backgroundColor = '#f8f9fa';
        });
        uploadLabel.addEventListener('drop', function(e) {
            e.preventDefault();
            uploadLabel.style.backgroundColor = '#f8f9fa';
            if (e.dataTransfer.files.length) {
                handleFileUpload(e.dataTransfer.files[0]);
                fileInput.files = e.dataTransfer.files;
            }
        });
        uploadLabel.addEventListener('click', function() {
            fileInput.click();
        });
    }
}

function showScreenshotUpload() {
    document.getElementById('qrSection').classList.add('d-none');
    document.getElementById('screenshotSection').classList.remove('d-none');
    const steps = document.querySelectorAll('.step');
    steps[0].classList.remove('active');
    steps[1].classList.add('active');
}

function showConfirmation() {
    document.getElementById('screenshotSection').classList.add('d-none');
    document.getElementById('confirmationSection').classList.remove('d-none');
    const steps = document.querySelectorAll('.step');
    steps[1].classList.remove('active');
    steps[2].classList.add('active');
    console.log('Payment verified. Email sent to user.');
}

async function saveSubscriptionToDatabase() {
    const cartFinalAmount = document.getElementById('cartFinalAmount').textContent.trim();
    const courseItems = Array.from(document.querySelectorAll('.cart-course-card')).map(item => item.dataset.id);

    if (courseItems.length === 0) {
        alert('Your cart is empty. Please add some courses.');
        return;
    }

    try {
        const params = new URLSearchParams();
        params.append('price', cartFinalAmount);
        courseItems.forEach(id => params.append('course_ids[]', id));

        const response = await fetch('SaveSubscription.do', {
            method: 'POST',
            headers: { 'Content-Type': 'application/x-www-form-urlencoded' },
            body: params.toString()
        });

        const result = await response.text();

        if (result.trim() === 'success') {
            alert('Subscription saved successfully!');
            clearCart(); // Optionally clear the cart after saving
        } else {
            alert('Failed to save subscription: ' + result);
        }

        console.log('Server response:', result);
    } catch (error) {
        console.error('Error saving subscription:', error);
        alert('An error occurred while saving the subscription.');
    }
}

