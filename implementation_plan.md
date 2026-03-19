# Testimonials Section Redesign — Prof. Nzioki Erik Website

Elevate the Praise/Testimonials section from static placeholder cards to a premium, motion-driven testimonial experience befitting a global keynote speaker.

## Current State

The existing testimonials section (lines 2784–2926 in `index.html`) has:
- **10 static cards** in a 3-column CSS grid, all with **placeholder text** (`[Quote pending from…]`)
- **No photos** — only initial-based circle avatars
- No motion or animation
- Some names and titles don't match the folder assets

## Testimonial Data (from Folder Assets)

These 8 testimonials from `Testimonials/` folder will replace placeholders with **real quotes and photos**:

| # | Person | Title | Quote |
|---|--------|-------|-------|
| 1 | H.E. Dr. Stephen Kalonzo Musyoka, E.G.H | Tenth Vice President of Kenya | "I see you. May the light that you carry light up this country and Africa at large." |
| 2 | Stellamaries Mutua | Managing Director, Shadel International School | "You represent young leadership exceptionally well. You are a go-getter who shows up and pushes for the right decisions. Keep becoming, I will always be ready to support the transition." |
| 3 | Pst. Dr. Robert Burale | CEO, The RB Company & The Naked Truth | "You are a blessing to this generation. I am proud of you, I watch your progress and I can't wait to see what God does through your life. Keep going, I am praying for you and supporting you all the way." |
| 4 | Dr. Daniel Yumbya, M.B.S, E.B.S, C.B.S | Founding CEO, KMPDC | "Eric is part of a new generation of critical thinkers in the field of leadership and governance. His courage to ask difficult questions and advocate for meaningful inclusion of young people in decision-making spaces is commendable. Young leaders like him are key for the future of our institutions." |
| 5 | Brian Nyambego | CEO, Aven Global | "Sometimes you just see someone with grit, audacity and a genuine love for growth and you support them as a brother, expecting nothing but to see them succeed." |
| 6 | Prof. Acquillahs Muteti | CEO, ACQ Consultants (U.S.A) | "I am proud of what you are doing and what you are about to do. Keep at it. I am certain I will hear great things about you sooner than later. It's your time, go change the world." |
| 7 | Khalif Kairo | CEO, Kai & Karo | "Nzioki represents a rising young voice in this generation. Committed to bringing out the best in young people and contributing meaningfully to our continent." |
| 8 | Dr. Emily Okoth Okuku, Ph.D. | Manager, Career Planning & Placement, KCA University | "I am proud of you. You will go places. We didn't make a mistake by choosing you for a panel discussion at career fair. May God go ahead and make you great, Professor." |

> [!NOTE]
> Original website had Charlene Ruto, Lennox Omondi, and Oscar Kampala as placeholder testimonials. Since no real quotes/photos exist for them in the folders, they will be removed and replaced with the 8 real testimonials above.

---

## Proposed Changes

### Testimonials Section — Complete Redesign

#### [MODIFY] [index.html](file:///c:/Users/ADMIN/OneDrive/Desktop/Projects/public_speaker/public_speaker/index.html)

**CSS Changes (within `<style>` block):**
- Remove existing `.t-grid`, `.tc`, `.tc-qm`, `.tc-stars`, `.tc-q`, `.tc-auth`, `.tc-av`, `.tc-name`, `.tc-role` styles
- Add new CSS for the marquee-based testimonial system:
  - `.praise-marquee-row` — A horizontal container with `overflow: hidden` and `display: flex`
  - `.praise-marquee-track` — The animated inner track using CSS `@keyframes` for infinite horizontal scroll (similar to the existing `.ticker` system but more sophisticated)
  - `.praise-card` — Individual testimonial cards with grayscale photo, quote, name, and title
  - Multiple speed variants: `.praise-row-slow`, `.praise-row-med`, `.praise-row-fast` for visual variety (staggered speeds create a premium layered effect)
  - Reverse direction on alternating rows for visual dynamism
  - Hover interaction: pause animation on hover, subtle card elevation
  - Responsive rules for mobile (stacked single column with touch-scroll)
- Add `.praise-card-img` — Circular cropped photo with `filter: grayscale(100%) contrast(1.1)` for consistent graphite aesthetic
- The section header (`.t-hdr`) styling will remain with minor refinements

**HTML Changes (Section `#testi`, lines 2784–2926):**
- Replace the entire `<div class="t-grid">...</div>` block with the new marquee system
- Structure: 3 flowing rows of testimonial cards
  - Row 1 (→ direction, slow): Cards 1, 2, 3 (duplicated for infinite loop)
  - Row 2 (← direction, medium): Cards 4, 5, 6 (duplicated for infinite loop)
  - Row 3 (→ direction, fast): Cards 7, 8, and selected additional quotes (duplicated)
- Each card will reference images from the `Testimonials/` folder (e.g., `Testimonials/1.png`)
- The section tag/header text will become "Praise" instead of "Social Proof"

**JavaScript Changes (within `<script>` block):**
- Add hover-to-pause logic for all `.praise-marquee-track` elements
- Add performance-optimized `will-change: transform` management
- Update cursor hover effect targets to include new `.praise-card` elements

**Responsive CSS updates:**
- At `≤900px`: 2 rows instead of 3, card width adjusts
- At `≤640px`: Single scrollable row or stacked layout

### Image Selection from `Prof. Nzioki ERiK Website` Folder

After reviewing all 96 images, the following are candidates for improving the website:

> [!IMPORTANT]
> The testimonials section will use the 8 testimonial card images from the `Testimonials/` folder directly. These are already in a consistent grayscale editorial style. No additional image processing is needed for testimonial photos — the folder images serve as both the source material (for extracting quotes) and visual reference.

For testimonial avatar photos, I will crop the person's face from each testimonial card image using CSS (`object-fit: cover` with `object-position`), applying the graphite filter consistently.

---

## Verification Plan

### Browser Testing
1. Open `index.html` in the browser using the browser tool
2. Scroll to the Testimonials/Praise section
3. Verify:
   - 3 horizontal rows of testimonial cards are visible
   - Cards flow smoothly in alternating directions
   - Hovering over a card pauses the row animation
   - All 8 real quotes appear with correct names and titles
   - Testimonial card images display properly with grayscale filter
   - The section header says "Praise" with the correct styling
4. Resize browser to test responsive behavior:
   - Test at 900px width (tablet)
   - Test at 640px width (mobile)
5. Verify there are no visual glitches, layout breaks, or performance issues

### Manual Verification (User)
- User can open the page locally to verify brand consistency and overall design quality
- User can verify quote accuracy against the original testimonial cards
