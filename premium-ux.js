document.addEventListener("DOMContentLoaded", () => {
    // 1. Global Scroll Progress Bar
    const progressBar = document.createElement("div");
    Object.assign(progressBar.style, {
        position: "fixed", top: "0", left: "0",
        height: "3px", backgroundColor: "var(--red)",
        zIndex: "9999", transition: "width 0.1s ease-out",
        boxShadow: "0 0 10px rgba(182, 34, 46, 0.8)",
        width: "0%"
    });
    document.body.appendChild(progressBar);

    window.addEventListener("scroll", () => {
        const docHeight = document.documentElement.scrollHeight - window.innerHeight;
        const scrollPct = docHeight > 0 ? (window.scrollY / docHeight) * 100 : 0;
        progressBar.style.width = scrollPct + "%";
    }, { passive: true });

    // 2. Smooth Page Transitions (SPA Feel)
    document.body.style.opacity = "0";
    document.body.style.transition = "opacity 0.4s cubic-bezier(0.4, 0, 0.2, 1)";
    requestAnimationFrame(() => { document.body.style.opacity = "1"; });

    document.querySelectorAll("a").forEach(link => {
        if (link.hostname === window.location.hostname && !link.hash && link.getAttribute("target") !== "_blank") {
            link.addEventListener("click", (e) => {
                e.preventDefault();
                const target = link.href;
                document.body.style.opacity = "0";
                setTimeout(() => { window.location.href = target; }, 400); 
            });
        }
    });

    // 3. Floating Back to Top Button
    const topBtn = document.createElement("button");
    topBtn.innerHTML = "<svg width='20' height='20' viewBox='0 0 24 24' fill='none' stroke='currentColor' stroke-width='2' stroke-linecap='round' stroke-linejoin='round'><path d='M12 19V5M5 12l7-7 7 7'/></svg>";
    Object.assign(topBtn.style, {
        position: "fixed", bottom: "30px", right: "30px",
        width: "48px", height: "48px", borderRadius: "50%",
        backgroundColor: "var(--red)", color: "#fff",
        border: "none", display: "flex", justifyContent: "center", alignItems: "center",
        cursor: "none", opacity: "0", pointerEvents: "none",
        zIndex: "9998", transition: "opacity 0.4s ease, transform 0.4s cubic-bezier(0.4, 0, 0.2, 1)",
        boxShadow: "0 8px 32px rgba(182, 34, 46, 0.4)",
        transform: "translateY(20px)"
    });
    document.body.appendChild(topBtn);

    window.addEventListener("scroll", () => {
        if (window.scrollY > window.innerHeight * 0.5) {
            topBtn.style.opacity = "1";
            topBtn.style.pointerEvents = "auto";
            topBtn.style.transform = "translateY(0)";
        } else {
            topBtn.style.opacity = "0";
            topBtn.style.pointerEvents = "none";
            topBtn.style.transform = "translateY(20px)";
        }
    }, { passive: true });

    topBtn.addEventListener("click", () => { window.scrollTo({ top: 0, behavior: "smooth" }); });

    // Ensure custom cursor scales on this new button
    const ring = document.getElementById("cur-ring");
    if (ring) {
        topBtn.addEventListener("mouseenter", () => { ring.style.width = '56px'; ring.style.height = '56px'; ring.style.opacity = '.6'; });
        topBtn.addEventListener("mouseleave", () => { ring.style.width = '32px'; ring.style.height = '32px'; ring.style.opacity = '1'; });
    }
});
