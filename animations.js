// dynamic active nav state
document.addEventListener("DOMContentLoaded", () => {
    const currentPath = window.location.pathname.split("/").pop() || "index.html";
    document.querySelectorAll(".nmenu a").forEach(link => {
        if (link.getAttribute("href") === currentPath || link.getAttribute("href").split("#")[0] === currentPath) {
            link.style.color = "var(--red)";
        }
    });

    // Load GSAP
    if (typeof gsap !== 'undefined') {
        // Hero parallax & staggered text
        gsap.from(".hero h1", { duration: 1.2, y: 50, opacity: 0, ease: "power4.out", delay: 0.2 });
        gsap.from(".h-sub", { duration: 1.2, y: 30, opacity: 0, ease: "power4.out", delay: 0.4 });
        gsap.from(".h-ctas .btn", { duration: 1, y: 20, opacity: 0, stagger: 0.15, ease: "back.out(1.7)", delay: 0.6 });
        
        // Magnetic button effect on major CTAs
        const magneticBtns = document.querySelectorAll(".btn-red");
        magneticBtns.forEach(btn => {
            btn.addEventListener("mousemove", (e) => {
                const rect = btn.getBoundingClientRect();
                const x = e.clientX - rect.left - rect.width / 2;
                const y = e.clientY - rect.top - rect.height / 2;
                gsap.to(btn, { duration: 0.3, x: x * 0.3, y: y * 0.3, ease: "power2.out" });
            });
            btn.addEventListener("mouseleave", () => {
                gsap.to(btn, { duration: 0.5, x: 0, y: 0, ease: "elastic.out(1, 0.3)" });
            });
        });
    }

});
