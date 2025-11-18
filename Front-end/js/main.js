// JavaScript for Dropdown Menu Functionality
const dropdown = document.querySelector('.dropdown');
const button = dropdown.querySelector('.dropdown-toggle');
const menu = dropdown.querySelector('.dropdown-menu');
button.addEventListener('click', function() {
    menu.classList.toggle('smooth-dropdown');
        });
        // rgb(57 62 68) for bg ground color for numbers