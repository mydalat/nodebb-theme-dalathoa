# CLAUDE.md - nodebb-theme-dalathoa

## Project Overview
**Đà Lạt Hoa** — Travel Journal theme for NodeBB. Child theme inheriting from **nodebb-theme-harmony**.
Design: "nhật ký du lịch" (travel journal) with handwriting fonts, paper textures, dashed borders, stamp decorations.

## Architecture

```
nodebb-theme-harmony (base theme)
  └── nodebb-theme-dalathoa (this theme - child/override)
```

### Key Files
- `theme.json` — Theme metadata (`id: nodebb-theme-dalathoa`, `baseTheme: nodebb-theme-harmony`)
- `plugin.json` — Hooks, scripts, templates, modules, staticDirs
- `package.json` — NPM config (`name: nodebb-theme-dalathoa`, compat `^4.0.0`)
- `theme.scss` — SCSS entry: imports Harmony, Google Fonts, then all custom `.dlh-*` styles
- `scss/overrides.scss` — Bootstrap 5 variable overrides (Dalathoa palette, warm greys, Be Vietnam Pro font)
- `lib/theme.js` — Server hooks: routes (`/admin/plugins/theme-dalathoa`), config, widget areas, settings
- `lib/controllers.js` — Express controllers (admin page, user theme settings)
- `public/client.js` — Client JS (jQuery-based, ajaxify events)
- `templates/` — Benchpress `.tpl` overrides (same filename = auto-override Harmony)
- `todo.md` — Implementation plan with checkable items
- `lessons.md` — Patterns and rules learned from corrections

### Design System
- **CSS prefix**: All custom classes use `dlh-` (dalathoa) prefix
- **CSS variables**: `--dlh-pri`, `--dlh-sec`, `--dlh-acc`, `--dlh-bg`, `--dlh-paper`, etc.
- **Fonts**: Caveat (handwriting/headings), Be Vietnam Pro (body), Georgia (quotes)
- **Palette**: olive green `#313911`, golden `#fdbd33`, orange accent `#e7672e`, cream bg `#f4f2e5`
- **Icon system**: Lucide SVG inline via `.dlh-i` classes

### Template System
- NodeBB uses **Benchpress** template engine (`.tpl` files)
- To override a Harmony template, create a file with the **same path/name** in `templates/`
- Templates use `{variable}`, `{{{ if condition }}}`, `{{{ each items }}}` syntax
- Partials imported via `<!-- IMPORT path/to/partial.tpl -->`

### SCSS/CSS System
- `scss/overrides.scss` — Bootstrap 5 variables (runs BEFORE BS5 compilation)
- `theme.scss` — Imports Harmony, then Google Fonts, then all custom dalathoa styles
- All custom SCSS uses `.dlh-*` prefix to avoid conflicts with Harmony
- Responsive breakpoints: mobile (<640), tablet (≥640), desktop (≥768), wide (≥1024)
- Supports dark mode via `[data-bs-theme="dark"]`

### Hooks (plugin.json)
- `static:app.load` → init routes
- `filter:admin.header.build` → admin nav
- `filter:widgets.getAreas` → widget areas (header, sidebar, footer per template)
- `filter:config.get` → inject theme config to client
- `filter:settings.get` → admin settings defaults
- `filter:user.saveSettings` → per-user theme settings
- `filter:user.profileMenu` → add theme settings link in profile
- `filter:middleware.renderHeader` → inject Bootswatch skin options

## Development Status

### Completed
- **Rename**: quickstart → dalathoa (all config files, routes, templates)
- **Design system**: CSS variables, Bootstrap overrides, Google Fonts, Lucide icons
- **Global SCSS**: navbar, bottom nav, FAB, back-to-top, journal cards, tag pills, stamps, topic rows, tab bar, pagination, overlay, toast, skeleton loading — all responsive

### In Progress
- Template overrides (header, home, topic, categories, profile)
- Client JS (bottom nav, FAB, pull-to-refresh, swipe, back-to-top)

### TODO
- Override Harmony templates to match Travel Journal mockup
- Mobile interactions (pull-to-refresh, swipe actions)
- Dark mode custom styles
- Font size toggle persistence

## Customization Strategy
- **Override templates**: Place `.tpl` files in `templates/` matching Harmony filenames
- **Override styles**: All custom SCSS appended after Harmony import in `theme.scss`
- **Client JS**: Add behavior in `public/client.js` via `$(window).on('action:ajaxify.end', ...)`
- **New routes**: Register in `lib/theme.js` init function, handle in `lib/controllers.js`

## Commands
- No build step required — NodeBB compiles SCSS at runtime
- Theme is installed as a NodeBB plugin via `npm link` or direct install
- NodeBB must rebuild assets after template/SCSS changes: `./nodebb build`

## Git
- Main branch: `master`
- Development branch: `claude/customize-nodebb-dalathoa-theme-I9xpd`

---

# Claude - Workflow & Principles

## Workflow Orchestration

### 1. Plan Node Default
* Enter plan mode for **ANY non-trivial task** (3+ steps or architectural decisions)
* If something goes sideways, **STOP and re-plan immediately** - don't keep pushing
* Use plan mode for verification steps, not just building
* Write detailed specs upfront to reduce ambiguity

### 2. Subagent Strategy
* Use subagents liberally to keep main context window clean
* Offload research, exploration, and parallel analysis to subagents
* For complex problems, throw more compute at it via subagents
* One task per subagent for focused execution

### 3. Self-Improvement Loop
* After ANY correction from the user: update `lessons.md` with the pattern
* Write rules for yourself that prevent the same mistake
* Ruthlessly iterate on these lessons until mistake rate drops
* Review lessons at session start for relevant project

### 4. Verification Before Done
* Never mark a task complete without proving it works
* Diff behavior between main and your changes when relevant
* Ask yourself: *"Would a staff engineer approve this?"*
* Run tests, check logs, demonstrate correctness

### 5. Demand Elegance (Balanced)
* For non-trivial changes: pause and ask *"is there a more elegant way?"*
* If a fix feels hacky: *"Knowing everything I know now, implement the elegant solution"*
* Skip this for simple, obvious fixes - don't over-engineer
* Challenge your own work before presenting it

### 6. Autonomous Bug Fixing
* When given a bug report: **just fix it**. Don't ask for hand-holding
* Point at logs, errors, failing tests - then resolve them
* Zero context switching required from the user
* Go fix failing CI tests without being told how

## Task Management
1. **Plan First**: Write plan to `todo.md` with checkable items
2. **Verify Plan**: Check in before starting implementation
3. **Track Progress**: Mark items complete as you go
4. **Explain Changes**: High-level summary at each step
5. **Document Results**: Add review section to `todo.md`
6. **Capture Lessons**: Update `lessons.md` after corrections

## Core Principles

> **Simplicity First** — Make every change as simple as possible. Impact minimal code.

> **No Laziness** — Find root causes. No temporary fixes. Senior developer standards.

> **Minimal Impact** — Changes should only touch what's necessary. Avoid introducing bugs.
