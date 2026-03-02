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
- **TODO**: All config files still reference `quickstart` — need to rename to `dalathoa` across `package.json`, `plugin.json`, `theme.json`, `theme.scss`, `lib/theme.js`, `lib/controllers.js`

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
