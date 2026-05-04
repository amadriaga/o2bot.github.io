// O2Bot Website JavaScript

// Smooth scrolling for anchor links
document.querySelectorAll('a[href^="#"]').forEach(anchor => {
    anchor.addEventListener('click', function (e) {
        e.preventDefault();
        const target = document.querySelector(this.getAttribute('href'));
        if (target) {
            target.scrollIntoView({
                behavior: 'smooth',
                block: 'start'
            });
        }
    });
});

// Contact form now handled by Formspree (https://formspree.io/f/xvzdadga)
// No custom JavaScript needed - native form submission works!

// Add animation on scroll
const observerOptions = {
    threshold: 0.1,
    rootMargin: '0px 0px -50px 0px'
};

const observer = new IntersectionObserver((entries) => {
    entries.forEach(entry => {
        if (entry.isIntersecting) {
            entry.target.style.opacity = '1';
            entry.target.style.transform = 'translateY(0)';
        }
    });
}, observerOptions);

// Observe all feature cards and content sections
document.addEventListener('DOMContentLoaded', () => {
    const animatedElements = document.querySelectorAll('.feature-card, .content-text, .contact-form-wrapper');
    
    animatedElements.forEach(el => {
        el.style.opacity = '0';
        el.style.transform = 'translateY(20px)';
        el.style.transition = 'opacity 0.6s ease, transform 0.6s ease';
        observer.observe(el);
    });
});

// Mobile menu toggle (for future enhancement)
function createMobileMenu() {
    const navbar = document.querySelector('.navbar');
    const navLinks = document.querySelector('.nav-links');
    
    if (window.innerWidth <= 768 && !document.querySelector('.mobile-menu-toggle')) {
        const menuToggle = document.createElement('button');
        menuToggle.className = 'mobile-menu-toggle';
        menuToggle.innerHTML = '☰';
        menuToggle.style.cssText = 'background: none; border: none; font-size: 1.5rem; cursor: pointer; display: none;';
        
        navbar.querySelector('.container').insertBefore(menuToggle, navLinks);
        
        menuToggle.addEventListener('click', () => {
            navLinks.classList.toggle('active');
        });
    }
}

// Add this CSS dynamically for mobile menu if needed
if (window.innerWidth <= 768) {
    const style = document.createElement('style');
    style.textContent = `
        @media (max-width: 768px) {
            .mobile-menu-toggle {
                display: block !important;
            }
            .nav-links {
                display: none;
            }
            .nav-links.active {
                display: flex;
            }
        }
    `;
    document.head.appendChild(style);
}

console.log('O2Bot website loaded successfully! 🚀');
