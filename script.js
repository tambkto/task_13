// Placeholder for future JavaScript functionality

document.addEventListener('DOMContentLoaded', function() {
    console.log("Blog is ready!");
    
    const form = document.querySelector('#newsletter form');
    form.addEventListener('submit', function(event) {
        event.preventDefault();
        alert('Thank you for subscribing to our newsletter!');
    });
});
