// const user_card_box = document.querySelector('#user_card_box');
// const users = new Array('Trainer', 'Learner');
// const utype = document.querySelector('#utype');

const country_list = document.querySelector('#country_list');
const country_id = document.querySelector('#country_id');
const country = document.querySelector('#country');

const signup_title = document.querySelector('#signup_title');
const signup_form = document.querySelector('#signup_inner_form');
const user_signup_report = document.querySelector('#user_signup_report');

const user_signin_report = document.querySelector('#user_signin_report');

const message_box = new bootstrap.Modal('#message_box'); // modal:message
const message_title = document.querySelector('#message_title'); // <h3>
const message = document.querySelector('#message'); //<p>

signup_form.addEventListener('submit', (ev) => {
    ev.preventDefault();

    const options = country_list.options;
    for (i = 0; i < options.length; i++) {
        if (options[i].value == country.value) {
            // console.log(options[i].id);
            country_id.value = options[i].id;
        }
    }

    signup_form.submit();
});

if (user_signup_report.value) {
    if (user_signup_report.value == 'true') {
        console.log(true);
    } else {
        message.innerHTML = 'Either Email and/or Contact already in use...!!!';
        message.classList.add('text-danger');
        message.classList.add('text-center');

        setTimeout(() => {
            message_box.show();
        }, 1000);
    }
}

if (user_signin_report.value) {
    switch (parseInt(user_signin_report.value)) {
        case -1:
            message.innerHTML = 'Account with the given Email does not exist...!!!';
            break;
        case 0:
            message.innerHTML = 'Incorrect Password...!!!';
            break;
        case 2:
            message.innerHTML = 'Your account is Inactive...!!! Please click here to get an account activation link to your email... <a href="send_activation_link.do?email=${param.email}">Activation Link</a>';
            break;
        case 4:
            message.innerHTML = 'Your account is Stoped by you...!!! Please click here to get an account activation link to your email... <a href="send_activation_link.do?email=${param.email}">Reopen My Account</a>';
            break;
        case 6:
            message.innerHTML = 'Your account is Ended...!!!';
    }

    message.classList.add('text-danger');
    message.classList.add('text-center');
    setTimeout(() => {
        message_box.show();

    }, 1000);
}