# Theme Implementation Plan: Đà Lạt Hoa — Travel Journal

> Tích hợp mockup HTML "Travel Journal V1.2" vào nodebb-theme-dalathoa (child theme of Harmony)

## Design Decisions
- **Home page**: Custom home + categories riêng
- **Icons**: Lucide Icons (inline SVG)
- **Approach**: SCSS + Templates song song, từng trang
- **Mobile**: Triển khai đầy đủ (bottom nav, FAB, pull-to-refresh, swipe)

---

## Phase 0: Foundation ✅

- [x] Rename `quickstart` → `dalathoa` across all config files
- [x] Add Google Fonts: Caveat + Be Vietnam Pro (via @import in theme.scss)
- [x] Add Lucide Icons (inline SVG with `.dlh-i` class system)
- [x] Set up CSS custom properties `--dlh-*` in theme.scss
- [x] Update `scss/overrides.scss` with Bootstrap 5 variable overrides

## Phase 1: Global Shell ✅

- [x] Override `templates/header.tpl` — garland, navbar, desktop tabs, search/notif/avatar
- [x] Override `templates/footer.tpl` — bottom nav, FAB, back-to-top, toast, signoff
- [x] Global SCSS: body, selection, icon system, garland, navbar, bottom nav, FAB, back-to-top

## Phase 2: Home Page ✅

- [x] Override `templates/recent.tpl` — cover hero, 2-column grid, widget areas
- [x] Override `templates/partials/topics_list.tpl` — journal-style topic rows
- [x] SCSS: cover hero, topic rows, stat grid, mobile tags, tab bar, pagination

## Phase 3: Topic Page ✅

- [x] Override `templates/topic.tpl` — breadcrumb, entry header, posts grid, sidebar
- [x] Override `templates/partials/topic/post.tpl` — post cards with actions
- [x] SCSS: entry header, post cards, post actions, vote pills

## Phase 4: Categories ✅

- [x] Override `templates/categories.tpl` — chapter intro, category grid
- [x] Override `templates/partials/categories/item.tpl` — category cards with tape decoration
- [x] Override `templates/category.tpl` — chapter detail banner
- [x] SCSS: category grid, category cards, chapter detail banner

## Phase 5: Profile ✅

- [x] Override `templates/account/profile.tpl` — stats grid, about me journal card
- [x] SCSS: profile banner restyle, avatar, stats grid

## Phase 6: Overlays & Modals ✅

- [x] Composer modal restyling
- [x] Quick reply restyling
- [x] Modal/dropdown border-radius + shadows
- [x] Pagination override (journal style)
- [x] Post bar floating nav

## Phase 7: Client JS ✅

- [x] Bottom navigation active tab tracking
- [x] Desktop navigation active tab tracking
- [x] FAB → open composer
- [x] Back-to-top scroll handler
- [x] Swipe actions on topic rows (bookmark/mark-read)
- [x] Pull-to-refresh

## Phase 8: Polish & Dark Mode ✅

- [x] Dark mode `[data-bs-theme="dark"]` overrides for all --dlh-* variables
- [x] Fade-in animations for cards and sections
- [x] Responsive adjustments at 640px, 768px, 1024px
- [x] Desktop hover effects (cards, tags, topic rows)

## Phase 9: Mockup CSS Alignment ✅

- [x] Cover hero: dark gradient (`linear-gradient(170deg)`) + gold stat badges + white text
- [x] Body: `overflow-x: hidden` + `padding-bottom: 72px` for mobile bottom nav
- [x] Entry header: `border-radius: var(--dlh-rl)`, `clamp()` font-size
- [x] Post cards: toolbar-style actions, proper padding structure, `overflow: hidden`
- [x] Post body: serif blockquotes, correct spacing
- [x] Category cards: centered tape `::after`, horizontal flex layout, `:active` state
- [x] Chapter detail banner: simplified to match mockup
- [x] Profile: gradient banner + dashed border overlay + profile tabs
- [x] Quick reply: journal card style with textarea/button
- [x] Tablet (≥640px): paper lines + left margin red line on posts/entry-head
- [x] Desktop (≥768px): updated hover effects for post actions
- [x] Updated `recent.tpl` cover hero structure (stamp, h1 em, stats)

---

## Files Created/Modified

### Templates (10 files)
- `templates/header.tpl` — Custom navbar
- `templates/footer.tpl` — Bottom nav, FAB, back-to-top
- `templates/recent.tpl` — Home page
- `templates/topic.tpl` — Topic detail page
- `templates/category.tpl` — Single category (chapter detail)
- `templates/categories.tpl` — Categories list
- `templates/account/profile.tpl` — User profile
- `templates/partials/topics_list.tpl` — Topic rows
- `templates/partials/topic/post.tpl` — Post cards
- `templates/partials/categories/item.tpl` — Category cards

### Styles
- `theme.scss` — ~1850 lines: all custom components + dark mode
- `scss/overrides.scss` — Bootstrap 5 variable overrides

### Client JS
- `public/client.js` — All interactions (nav, FAB, scroll, swipe, pull-to-refresh)

### Config
- `theme.json`, `plugin.json`, `package.json` — Renamed to dalathoa
- `lib/theme.js`, `lib/controllers.js` — Updated routes/templates
