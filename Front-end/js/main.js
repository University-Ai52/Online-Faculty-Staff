// JavaScript for Dropdown Menu Functionality
const dropdown = document.querySelector('.dropdown');
const button = dropdown.querySelector('.dropdown-toggle');
console.log(button);
const menu = dropdown.querySelector('.dropdown-menu');
button.addEventListener('click', function() {
    menu.classList.toggle('smooth-dropdown');
        });