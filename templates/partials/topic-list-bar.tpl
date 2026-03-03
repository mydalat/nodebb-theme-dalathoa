<!-- ═══ FILTER BAR — Styled as tab bar with NodeBB filter dropdowns ═══ -->
<div class="dlh-tb dlh-filter-bar" component="category/controls">
	<button class="dlh-tb-b on" data-dlh-action="reset">
		<span class="dlh-i dlh-i-14"><svg viewBox="0 0 24 24"><path d="M2 3h6a4 4 0 014 4v14a3 3 0 00-3-3H2z"/><path d="M22 3h-6a4 4 0 00-4 4v14a3 3 0 013-3h7z"/></svg></span>
		Tất cả
	</button>

	{{{ if (template.unread || (template.recent || (template.popular || template.top))) }}}
	<div class="dlh-tb-dd">
		<!-- IMPORT partials/category/filter-dropdown-left.tpl -->
	</div>
	<div class="dlh-tb-dd">
		<!-- IMPORT partials/tags/filter-dropdown-left.tpl -->
	</div>
	{{{ end }}}

	{{{ if template.category }}}
	<div class="dlh-tb-dd">
		<!-- IMPORT partials/category/watch.tpl -->
	</div>
	<div class="dlh-tb-dd">
		<!-- IMPORT partials/tags/filter-dropdown-left.tpl -->
	</div>
	<div class="dlh-tb-dd">
		<!-- IMPORT partials/category/sort.tpl -->
	</div>
	{{{ end }}}

	{{{ if template.tag }}}
	<div class="dlh-tb-dd">
		<!-- IMPORT partials/category/filter-dropdown-left.tpl -->
	</div>
	<div class="dlh-tb-dd">
		<!-- IMPORT partials/tags/watch.tpl -->
	</div>
	{{{ end }}}

	{{{ if template.unread }}}
	<div class="markread dlh-tb-dd {{{ if !topics.length }}}hidden{{{ end }}}">
		<!-- IMPORT partials/category/selector-dropdown-left.tpl -->
	</div>
	{{{ end }}}

	<div class="dlh-tb-dd">
		<!-- IMPORT partials/category/tools-dropdown-left.tpl -->
	</div>

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
	</div>

	<!-- New topics alert -->
	<a href="{{{ if (template.category || template.world) }}}{url}{{{ else }}}{config.relative_path}/{selectedFilter.url}{querystring}{{{ end }}}" class="dlh-new-alert hide" id="new-topics-alert">
		<span class="dlh-i dlh-i-14"><svg viewBox="0 0 24 24"><polyline points="18 15 12 9 6 15"/></svg></span>
		[[recent:load-new-posts]]
	</a>
</div>
