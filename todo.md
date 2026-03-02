# Theme Implementation Plan: Đà Lạt Hoa — Travel Journal

> Tích hợp mockup HTML "Travel Journal V1.2" vào nodebb-theme-dalathoa (child theme of Harmony)

## Design Decisions
- **Home page**: Custom home + categories riêng
- **Icons**: Lucide Icons (thêm mới)
- **Approach**: SCSS + Templates song song, từng trang
- **Mobile**: Triển khai đầy đủ (bottom nav, FAB, pull-to-refresh, swipe)

---

## Phase 0: Foundation

- [ ] Rename `quickstart` → `dalathoa` across all config files
  - `package.json` (name)
  - `plugin.json` (id, admin route, module mappings)
  - `theme.json` (id, name, description)
  - `theme.scss` ($font-path)
  - `lib/theme.js` (admin route)
  - `lib/controllers.js` (template render name)
  - `templates/admin/plugins/theme-quickstart.tpl` → `theme-dalathoa.tpl`
- [ ] Add Google Fonts: Caveat + Be Vietnam Pro
  - Option A: `@fontsource` packages + staticDirs in plugin.json
  - Option B: Google Fonts `@import` in theme.scss
- [ ] Add Lucide Icons
  - Option A: `lucide` npm package + client script
  - Option B: CDN in header partial
  - Option C: SVG sprite in public/
- [ ] Set up CSS custom properties in `theme.scss` (after Harmony import)
  ```
  :root {
    --pri: #313911; --sec: #fdbd33; --acc: #e7672e;
    --bg: #f4f2e5; --paper: #faf8f0; --ink: #2c3318;
    --hand: 'Caveat', cursive;
    --sans: 'Be Vietnam Pro', system-ui, sans-serif;
    ...all variables from mockup
  }
  ```
- [ ] Update `scss/overrides.scss` with Bootstrap 5 variable overrides
  ```
  $primary: #313911;
  $body-bg: #f4f2e5;
  $body-color: #272c32;
  $border-color: #e0dccf;
  $font-family-sans-serif: "Be Vietnam Pro", system-ui, sans-serif;
  ...
  ```

## Phase 1: Global Shell (Header + Footer + Navigation)

- [ ] Override `templates/partials/header.tpl`
  - Garland `.gar` decoration
  - Sticky navbar: brand "🌸 Đà Lạt Hoa", desktop tabs, search/notif icons, avatar
  - "Viết mới" desktop button
- [ ] Create `templates/partials/dalathoa/bottom-nav.tpl`
  - 5 tabs: Nhật ký, Chương, Tìm, Báo, Tôi
  - Mobile only (hidden ≥768px)
- [ ] Create `templates/partials/dalathoa/fab.tpl`
  - Floating compose button (mobile only)
- [ ] Add back-to-top button (CSS + JS)
- [ ] Global SCSS in `theme.scss`:
  - Body background (noise texture SVG)
  - `::selection` color
  - Common components: `.jc`, `.tc`, `.tp`, `.stamp`, `.ct`, `.mt`, `.bc`
  - Pagination override
  - Toast styles
  - Overlay system

## Phase 2: Home Page

- [ ] Determine home page strategy:
  - Override `templates/recent.tpl` as home (set homepage route = /recent)
  - Or create custom template + route
- [ ] Home template with:
  - Cover hero section `.j-cover` (stats: authors, pages, reads)
  - Mobile tags horizontal scroll
  - Tab bar (Tất cả, Theo chương, Theo thẻ)
  - Topic list `.tl` → `.tr` rows with Benchpress `{{{ each topics }}}`
  - Sidebar: Online users, Tags
  - Pagination
- [ ] Home SCSS:
  - Cover hero gradient + border decoration
  - Topic row styles (avatar, title, category badge, meta, read count)
  - Unread indicator (left border)
  - Pin/lock/new/hot badges
  - Tab bar styles
  - Skeleton loading animation
  - Swipe action backgrounds

## Phase 3: Topic Page

- [ ] Override `templates/topic.tpl`
  - Breadcrumb `.bc`
  - Entry header `.entry-head` (journal label, title, meta tags)
  - Polaroid image (optional, for first image in topic)
  - Posts loop `{{{ each posts }}}`:
    - Post card with avatar, username (clickable → usercard), time
    - Post body (content)
    - Post toolbar: like, dislike, reply, share, bookmark, more
    - "Tác giả" badge for OP
  - Quick composer `.comp`
  - Sidebar: Reading now, Tags, Related topics, Stats
- [ ] Topic SCSS:
  - Entry header with journal styling
  - Paper lines + red margin (tablet+ only)
  - Polaroid frame
  - Post cards
  - Post toolbar with icon hover effects
  - Quick composer
  - Liked state animation

## Phase 4: Categories

- [ ] Override `templates/categories.tpl`
  - Chapter intro with stamp decoration
  - Category grid `.cat-grid` → `.cat-c` cards
  - Icon + name + description + stats per category
  - Tape decoration on cards (CSS pseudo-element)
- [ ] Override `templates/category.tpl`
  - Chapter detail banner `.chap-detail` (dark bg)
  - Subcategory bookmarks grid `.bookmarks`
  - Topic list within category
  - Pagination
- [ ] Categories SCSS:
  - Grid responsive: 1 col → 2 cols (≥640px) → 3 cols (≥1024px)
  - Chapter detail dark banner
  - Bookmark cards
  - Category card hover effects

## Phase 5: Profile

- [ ] Override `templates/account/profile.tpl`
  - Profile banner `.prof-banner` (gradient)
  - Profile card `.prof-card` (overlapping avatar, name, role stamp, bio)
  - Stats grid (posts, replies, votes, reputation)
  - Tabs: Trang viết, Phản hồi, Đã lưu
  - Recent posts list `.rp`
  - Sidebar: Profile info, Badges, Activity grid
- [ ] Profile SCSS:
  - Banner gradient
  - Overlapping avatar
  - Role stamp rotation
  - Activity grid (35 cells)
  - Profile tabs underline style

## Phase 6: Overlays & Modals

- [ ] Search panel styling (slide-down, search tags, results)
- [ ] Notification panel styling (slide-in, unread indicator, avatars)
- [ ] User menu override (slide-in, profile section, font size toggle, items)
- [ ] Share modal (bottom sheet mobile / centered desktop)
- [ ] User card popup override (`templates/partials/usercard.tpl`)
- [ ] Compose modal styling (override composer plugin CSS)

## Phase 7: Mobile Interactions (client.js)

- [ ] Bottom navigation: highlight active tab based on `ajaxify` route
- [ ] FAB: open composer on click
- [ ] Pull-to-refresh: touchstart/move/end handlers
- [ ] Swipe actions on topic rows: left=save, right=mark-read
- [ ] Back-to-top: show/hide on scroll
- [ ] Auto-grow textarea for quick composer
- [ ] User card popup: show on username click, position near target

## Phase 8: Polish & Dark Mode

- [ ] Dark mode: `[data-bs-theme="dark"]` overrides for all custom CSS
- [ ] Font size toggle: body class + user setting persistence
- [ ] Animations: page fade-in, hover rotate/shadow (desktop), touch scale (mobile)
- [ ] Responsive testing: <640px, 640-768px, ≥768px, ≥1024px
- [ ] Performance: check font loading, CSS size, JS bundle

---

## Review
*(To be filled after implementation)*
