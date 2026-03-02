# CLAUDE.md - nodebb-theme-dalathoa

## Project Overview
NodeBB theme for Dalathoa, forked from nodebb-theme-quickstart. This is a **child theme** inheriting from **nodebb-theme-harmony** (NodeBB's official base theme).

## Architecture

```
nodebb-theme-harmony (base theme)
  └── nodebb-theme-dalathoa (this theme - child/override)
```

### Key Files
- `theme.json` — Theme metadata, declares `baseTheme: "nodebb-theme-harmony"`
- `plugin.json` — Hooks registration, client scripts, template paths, module mappings
- `package.json` — NPM package config, compatibility `^4.0.0`
- `theme.scss` — SCSS entry point, imports entire Harmony theme
- `scss/overrides.scss` — Bootstrap 5 variable overrides (runs before BS5 compilation)
- `lib/theme.js` — Server-side hooks: routes, config, widget areas, settings
- `lib/controllers.js` — Express route controllers (admin page, user theme settings)
- `public/client.js` — Client-side JavaScript (jQuery-based)
- `templates/` — Benchpress `.tpl` template overrides (same filename = auto-override Harmony)

### Template System
- NodeBB uses **Benchpress** template engine (`.tpl` files)
- To override a Harmony template, create a file with the **same path/name** in `templates/`
- Example: `templates/categories.tpl` overrides Harmony's `categories.tpl`
- Templates use `{variable}`, `<!-- IF condition -->`, `<!-- BEGIN items -->` syntax
- Partials imported via `<!-- IMPORT path/to/partial.tpl -->`

### SCSS/CSS System
- `scss/overrides.scss` — Modify Bootstrap 5 / Harmony variables (colors, fonts, spacing)
- `theme.scss` — Main entry; imports Harmony then custom styles can be appended after `@import`
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

## Development Notes

### Renaming Status
- **DONE**: All config files renamed from `quickstart` to `dalathoa` (package.json, plugin.json, theme.json, theme.scss, lib/theme.js, lib/controllers.js, admin template)

### Customization Strategy
- **Override templates**: Place `.tpl` files in `templates/` matching Harmony filenames
- **Override styles**: Modify `scss/overrides.scss` for variables, append custom CSS in `theme.scss`
- **Client JS**: Add behavior in `public/client.js`
- **New routes**: Register in `lib/theme.js` init function, handle in `lib/controllers.js`

### Integration Approach for Custom HTML/CSS
1. Map custom HTML sections to corresponding NodeBB templates (header, categories, topic, etc.)
2. Convert HTML to Benchpress `.tpl` format with NodeBB template variables
3. Add custom SCSS after the Harmony import in `theme.scss`
4. Use `scss/overrides.scss` for Bootstrap variable changes (colors, fonts)
5. Static assets go in `public/` directory

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
