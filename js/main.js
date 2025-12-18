// JavaScript for Dropdown Menu Functionality
const dropdown = document.querySelector('.dropdown');
const button = dropdown.querySelector('.dropdown-toggle');
const menu = dropdown.querySelector('.dropdown-menu');
button.addEventListener('click', function() {
    menu.classList.toggle('smooth-dropdown');
        });
        // rgb(57 62 68) for bg ground color for numbers
const navbar = document.querySelector('.navbar');
const title = document.querySelector('nav .active').innerText;
console.log(title);
if (title === 'Home') {
window.addEventListener('scroll', function () {
    if (window.scrollY > 500) {
        navbar.classList.add('position-fixed', 'shadow', 'navbar-show');
    } else {
        navbar.classList.remove('position-fixed', 'shadow', 'navbar-show');
    }
});}
