# Design System Strategy: The Midnight Editorial

## 1. Overview & Creative North Star: "The Midnight Editorial"
This design system moves beyond the utility of a standard chat app to embrace a high-end, editorial aesthetic. Our Creative North Star is **"The Midnight Editorial"**—a philosophy that treats every conversation like a curated story. We achieve this through a "Deep Ink" canvas, high-contrast typography scales, and a departure from the rigid, boxed-in grids of legacy messengers.

By utilizing intentional asymmetry—such as varying message bubble widths and generous, breathing white space—we create a rhythm that feels human rather than machine-generated. This system isn't just a dark mode; it’s a high-contrast environment where vibrant accents don't just sit on the surface—they glow from within.

---

## 2. Colors: The Depth of Ink
Our palette is rooted in pure blacks and atmospheric greys, allowing our vibrant primary blues and tertiary violets to pierce through the darkness.

### Surface Hierarchy & Nesting
To create a premium feel, we abandon the concept of "flat" design. We treat the UI as a series of physical layers:
* **Base Layer:** `surface-container-lowest` (#000000) for the deepest background.
* **The Content Bed:** `surface-container` (#191919) for main feed areas.
* **Elevated Elements:** `surface-container-highest` (#262626) for active cards or persistent headers.

### The "No-Line" Rule
**Explicit Instruction:** Do not use 1px solid borders to section content. Boundaries must be defined solely through background shifts. For instance, a `surface-container-low` list item sitting on a `surface` background provides all the separation the eye needs.

### The "Glass & Gradient" Rule
Floating elements (like the Bottom Navigation Bar) must utilize **Glassmorphism**. Apply `surface-container` with a 70% opacity and a 20px backdrop-blur. To provide "soul," use a subtle linear gradient on main CTAs, transitioning from `primary` (#7eafff) to `primary-container` (#64a1ff) at a 135-degree angle.

---

## 3. Typography: Authority in Every Character
We use **Inter** for its neutral yet authoritative stance. The hierarchy is designed to feel like a high-end digital magazine.

* **Display & Headline:** Use `display-md` (2.75rem) for main headings like "Chats" or "Stories." The extreme contrast between `display-md` and `body-sm` metadata creates a sophisticated, editorial "Big & Small" dynamic.
* **Titles:** `title-lg` (1.375rem) is the workhorse for contact names, ensuring legibility against the deep black background.
* **Body & Labels:** `body-md` (0.875rem) is optimized for message bubbles. Use `label-sm` (0.6875rem) in `on-surface-variant` (#ababab) for timestamps to keep them secondary to the conversation.

---

## 4. Elevation & Depth: Tonal Layering
Traditional shadows look "muddy" in true dark mode. Instead, we use **Tonal Layering**.

* **The Layering Principle:** Place a `surface-container-highest` card atop a `surface-container-low` section. The contrast in grey values provides a "soft lift" that feels architectural.
* **Ambient Shadows:** If an element must float (e.g., a context menu), use an extra-diffused shadow: `box-shadow: 0 20px 40px rgba(0, 0, 0, 0.6);`.
* **The Ghost Border:** If accessibility requires a stroke (e.g., in a high-glare environment), use the `outline-variant` token at **15% opacity**. Never use a 100% opaque border.
* **Glassmorphism:** Use semi-transparent `surface-variant` (#262626) with a blur effect for story rings and overlays to let the vibrant profile imagery bleed through.

---

## 5. Components: Refined Interaction

### Chat Bubbles
* **Outgoing:** `primary` (#7eafff) with `on-primary` (#002e60) text. Roundedness: `md` (1.5rem) on three corners, `sm` (0.5rem) on the tail.
* **Incoming:** `surface-container-highest` (#262626) with `on-surface` (#ffffff) text.
* **Layout:** Use vertical spacing `2` (0.5rem) between bubbles from the same sender; use `4` (1rem) for different senders.

### Story Avatars
* **Construction:** Circular `full` roundedness.
* **Active Ring:** Use a `px` stroke with a gradient from `primary` (#7eafff) to `tertiary` (#f2aaff).
* **Padding:** Place a `2.5` (0.625rem) gap between the avatar and the active ring to create a "halo" effect.

### Input Fields
* **Style:** `surface-container-high` (#1f1f1f) background. No border. Roundedness: `full`.
* **States:** On focus, the background transitions to `surface-container-highest` (#262626) with a subtle `primary` glow (using the `surface-tint` token at 10% opacity).

### Bottom Navigation Bar
* **Aesthetic:** Glassmorphic. Use `surface-container` at 80% opacity with `24px` backdrop-blur.
* **Icons:** Use `primary` for active states and `on-surface-variant` for inactive. No text labels—let the iconography speak.

---

## 6. Do’s and Don’ts

### Do:
* **Do** use asymmetrical spacing. A wider margin on the left for incoming messages than the right for outgoing creates a natural "ebb and flow."
* **Do** use `tertiary` (#f2aaff) for "Magic" or "AI" features to differentiate them from standard utility.
* **Do** leverage the `surface-container-lowest` (#000000) for the most critical content to maximize OLED contrast.

### Don’t:
* **Don’t** use dividers or horizontal lines. If you need to separate two chat threads, use a `6` (1.5rem) spacing gap or a slight background color shift.
* **Don’t** use pure white (#FFFFFF) for long-form body text; it causes "halation" (eye strain) on deep black. Use `on-surface-variant` (#ababab) for secondary info.
* **Don’t** use standard "drop shadows" on message bubbles. Let the tonal shift between surfaces define the depth.