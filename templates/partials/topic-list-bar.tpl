<!-- ═══ FILTER BAR — Journal-style tab bar with NodeBB filter dropdowns ═══ -->
<div class="dlh-filter-bar" component="category/controls">
	<div class="dlh-tb">
		{{{ if (template.unread || (template.recent || (template.popular || template.top))) }}}
		<!-- Topic filter (All Topics / New / Watched etc.) -->
		<!-- IMPORT partials/topic-filters.tpl -->

		<!-- Category filter dropdown -->
		<!-- IMPORT partials/category/filter-dropdown-left.tpl -->

		<!-- Tag filter dropdown -->
		<!-- IMPORT partials/tags/filter-dropdown-left.tpl -->
		{{{ end }}}

		{{{ if template.category }}}
		<!-- IMPORT partials/category/watch.tpl -->
		<!-- IMPORT partials/tags/filter-dropdown-left.tpl -->
		<!-- IMPORT partials/category/sort.tpl -->
		{{{ end }}}

		{{{ if template.tag }}}
		<!-- IMPORT partials/category/filter-dropdown-left.tpl -->
		<!-- IMPORT partials/tags/watch.tpl -->
		{{{ end }}}

		{{{ if template.unread }}}
		<div class="markread {{{ if !topics.length }}}hidden{{{ end }}}">
			<!-- IMPORT partials/category/selector-dropdown-left.tpl -->
		</div>
		{{{ end }}}

		<!-- IMPORT partials/category/tools-dropdown-left.tpl -->
	</div>

	<!-- New topic / Login button -->
	<div class="dlh-tb-actions">
		{{{ if (template.category || template.world) }}}
			{{{ if privileges.topics:create }}}
			<a href="{config.relative_path}/compose?cid={cid}" component="category/post" id="new_topic" class="dlh-btn-write" data-ajaxify="false">
				<span class="dlh-i dlh-i-14"><svg viewBox="0 0 24 24"><path d="M12 5v14M5 12h14"/></svg></span>
				[[category:new-topic-button]]
			</a>
			{{{ end }}}
		{{{ else }}}
			{{{ if canPost }}}
			<!-- IMPORT partials/buttons/newTopic.tpl -->
			{{{ end }}}
		{{{ end }}}
		{{{ if (!loggedIn && (!privileges.topics:create && !canPost))}}}
		<a component="category/post/guest" href="{config.relative_path}/login" class="dlh-btn-write">[[category:guest-login-post]]</a>
		{{{ end }}}
	</div>

	<!-- New topics alert -->
	<a href="{{{ if (template.category || template.world) }}}{url}{{{ else }}}{config.relative_path}/{selectedFilter.url}{querystring}{{{ end }}}" class="dlh-new-alert hide" id="new-topics-alert">
		<span class="dlh-i dlh-i-14"><svg viewBox="0 0 24 24"><polyline points="18 15 12 9 6 15"/></svg></span>
		[[recent:load-new-posts]]
	</a>
</div>
