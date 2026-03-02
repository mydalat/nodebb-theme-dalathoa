# Lessons — nodebb-theme-dalathoa

> Patterns and rules learned from corrections. Review at session start.

## Session 2026-03-02

### 1. Always create lessons.md at project start
- **Pattern**: User expects `lessons.md` to exist from the beginning per workflow principles
- **Rule**: When CLAUDE.md mentions `lessons.md`, create it immediately — don't wait for a correction

### 2. Read files before editing
- **Pattern**: The Edit tool requires files to be Read first in the same conversation
- **Rule**: Always `Read` a file before `Edit`, even if you recently wrote it. The tool enforces this.

### 3. Use `dlh-` prefix for all custom CSS
- **Pattern**: Child theme CSS must not conflict with Harmony base theme
- **Rule**: Every custom class uses `dlh-` prefix (e.g., `.dlh-nav`, `.dlh-tr`, `.dlh-jc`)
- **Rule**: CSS variables use `--dlh-*` prefix (e.g., `--dlh-pri`, `--dlh-sec`)

### 4. Rename must be thorough
- **Pattern**: Renaming quickstart→dalathoa required changes across 7+ files including template filename
- **Rule**: After rename, always `grep` the codebase to verify no references remain in code files

### 5. Follow CLAUDE.md workflow strictly
- **Pattern**: User set up specific workflow in CLAUDE.md (plan→verify→track→explain→document→lessons)
- **Rule**: Follow the 6-step task management process. Don't skip steps.
- **Rule**: Update `todo.md` progress as you go. Create `lessons.md` entries after corrections.

### 6. Commit frequently with descriptive messages
- **Pattern**: Each logical unit of work should be a separate commit
- **Rule**: Commit after each phase completion. Message should describe what and why.

### 7. Preserve NodeBB component attributes when overriding templates
- **Pattern**: NodeBB's client-side JS depends on `component="..."` attributes (e.g., `component="category/topic"`, `component="post"`, `component="post/content"`)
- **Rule**: When overriding Harmony templates, always preserve ALL `component` attributes, `data-tid`, `data-index`, and other data attributes
- **Rule**: Keep importing Harmony sub-partials (reactions, post-menu, groups/badge) — don't recreate their functionality

### 8. Don't override complex partials if CSS can do the job
- **Pattern**: `partials/account/header.tpl` has complex open-close structure with sidebar-left
- **Rule**: Prefer CSS restyling over template override for deeply nested partials with critical structural dependencies
- **Rule**: Only override templates where the HTML structure genuinely needs to change

### 9. Use inline SVG for Lucide icons, not icon fonts
- **Pattern**: Lucide icons via `.dlh-i` class with inline `<svg>` elements
- **Rule**: All custom icons use inline SVG within `<span class="dlh-i dlh-i-{size}">` wrapper
- **Rule**: Keep SVGs minimal: viewBox, path/circle/line only, no unnecessary attributes

### 10. Compare mockup CSS section-by-section, not just visually
- **Pattern**: After initial implementation, many CSS values drifted from the mockup (wrong gradients, border-radius, padding, font-size)
- **Rule**: When aligning theme to mockup, extract the full mockup CSS and compare property-by-property for each component
- **Rule**: Pay attention to: `border-radius` variants (`--dlh-r` vs `--dlh-rl`), `clamp()` vs fixed sizes, gradient directions/colors

### 11. Tablet paper-lines effect needs coordinated CSS
- **Pattern**: Paper lines (horizontal ruling + left margin red line) must be applied to multiple related elements (entry-head, post-card, post-head, post-body, post-foot, quick-reply)
- **Rule**: Use `repeating-linear-gradient` for horizontal lines, `::before` pseudo-element for left margin line
- **Rule**: All child elements need matching `padding-left` (e.g., 52px) to clear the red margin line

### 12. Mockup class names differ from theme prefix
- **Pattern**: Mockup uses unprefixed classes (`.j-cover`, `.post`, `.cat-c`, `.pt`) while theme uses `dlh-` prefix
- **Rule**: When translating mockup CSS, map unprefixed → prefixed (`.j-cover` → `.dlh-j-cover`, `.pt` → `.dlh-post-act`)
- **Rule**: Keep a mental mapping table to avoid missing translations
