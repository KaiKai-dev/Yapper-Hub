# Design System Strategy: Luminous Editorial

## 1. Overview & Creative North Star
The Creative North Star for this design system is **"The Luminous Editor."**

While many light-mode interfaces feel clinical or "default," this system translates the "Midnight Editorial" aesthetic into a high-end, gallery-inspired space. We are moving away from the rigid, boxed-in layouts of traditional chat apps toward a fluid, breathy, and layered experience. The goal is to make the interface feel like a premium digital publication—where the white space isn't just "empty," but is a deliberate structural element. We achieve this through **intentional asymmetry**, **exaggerated roundedness**, and a **total rejection of structural lines** in favor of tonal depth.

---

## 2. Colors & Tonal Architecture
This system utilizes a sophisticated palette of whites and cool grays to create a "paper-on-glass" effect.

### The "No-Line" Rule
**Strict Mandate:** Designers are prohibited from using 1px solid borders to section content.
Separation must be achieved through background shifts. For example, a chat bubble or a side panel should be defined by its transition from `surface` (#f5f7fa) to `surface-container-low` (#eef1f4). If you feel the need to "outline" something, you have failed the layout; use white space or a subtle tonal shift instead.

### Surface Hierarchy & Nesting
Treat the UI as a physical stack of fine materials.
* **Base Layer:** `background` (#f5f7fa) – The infinite canvas.
* **Mid Layer:** `surface-container` (#e5e8ec) – Used for persistent sidebars or navigation zones.
* **Top Layer:** `surface-container-lowest` (#ffffff) – Reserved for the most important interactive elements, like the active chat bubble or a focused text input, to make them "pop" against the off-white background.

### The "Glass & Gradient" Rule
To inject "soul" into the brand, primary actions should never be flat.
* **Signature CTAs:** Use a linear gradient from `primary` (#005ab2) to `primary_container` (#64a1ff) at a 135-degree angle.
* **Floating Elements:** Use `surface_container_lowest` with an 80% opacity and a 20px `backdrop-blur` to create a "frosted" editorial feel for floating headers or context menus.

---

## 3. Typography
We use **Inter** not as a utility font, but as an editorial voice.

* **Display & Headline:** Use `display-lg` and `headline-lg` with tight letter-spacing (-0.02em) to create an authoritative, "news-masthead" feel.
* **Body:** `body-lg` (1rem) is our workhorse. Ensure a generous line-height (1.6) to maintain the airy, editorial vibe.
* **Hierarchy Tip:** Contrast `title-lg` in `on_surface` (#2c2f32) with `label-md` in `on_surface_variant` (#595c5e) to create clear visual anchors without needing bold weights for everything.

---

## 4. Elevation & Depth
In this design system, depth is "baked in" rather than "dropped on."

* **Tonal Layering:** Instead of a shadow, place a `surface_container_lowest` (#ffffff) card on a `surface_container_low` (#eef1f4) background. The 2% difference in luminosity is enough for the human eye to perceive a lift.
* **Ambient Shadows:** If a floating state is required (e.g., a Modal), use a shadow color derived from `on_surface` at 6% opacity: `box-shadow: 0 20px 40px rgba(44, 47, 50, 0.06);`.
* **The Ghost Border Fallback:** If accessibility requires a container boundary, use `outline_variant` (#abadb0) at **15% opacity**. It should be a whisper, not a shout.

---

## 5. Components

### Buttons
* **Primary:** Gradient (Primary to Primary-Container), `full` (9999px) roundedness, `on_primary` text.
* **Secondary:** `surface_container_high` background with `on_surface` text. No border.
* **Tertiary:** Ghost style. No background; `primary` text. Use for low-emphasis actions like "Cancel."

### Chat Bubbles (The Core Experience)
* **Sender:** `primary` gradient with `on_primary` text. Radius: `md` (1.5rem), but `sm` (0.5rem) on the bottom-right corner to point to the sender.
* **Recipient:** `surface_container_highest` (#d9dde1) with `on_surface` text. Radius: `md` (1.5rem), but `sm` (0.5rem) on the bottom-left.
* **Spacing:** Use `spacing-2` (0.5rem) between bubbles in a cluster, and `spacing-4` (1rem) between different speakers.

### Input Fields
* **Text Input:** Use `surface_container_lowest` (#ffffff). Instead of a box, use a `full` (9999px) pill shape.
* **Focus State:** A soft 4px outer glow of `primary` at 20% opacity. Never a solid 1px line.

### Cards & Lists
* **Rule:** Forbid divider lines.
* **Implementation:** Use `spacing-6` (1.5rem) of vertical white space to separate list items. For hovering states, transition the background to `surface_container_low`.

---

## 6. Do’s and Don’ts

### Do
* **Do** embrace asymmetry. In a chat list, let the timestamps be `label-sm` and float subtly without a rigid column grid.
* **Do** use `xl` (3rem) or `full` rounded corners for a friendly, modern "Messenger-pro" feel.
* **Do** use `tertiary` (#853d97) sparingly for "System Moments" (e.g., "Encrypted Message" or "New Feature") to provide a pop of editorial color.

### Don’t
* **Don’t** use pure black (#000000) for text. Always use `on_surface` (#2c2f32) to keep the contrast high-end rather than jarring.
* **Don’t** use "Card Shadows" for every element. If it's not floating, it shouldn't have a shadow.
* **Don’t** use standard "Blue" links. Use the `primary` token and consider a 2px underline with `outline_variant` at 30% opacity for a bespoke feel.

---

## 7. Signature Interactions
* **The Soft Scale:** When a user presses a button or chat bubble, it should scale down to 98% rather than just changing color. This mimics the "squish" of premium physical materials.
* **Haptic Transitions:** Screen transitions should use a "Slide + Fade" where the incoming surface moves up 20px while its opacity goes from 0 to 100, using a `cubic-bezier(0.22, 1, 0.36, 1)` easing for a buttery, editorial flow.