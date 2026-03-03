<!-- ═══ TOPIC LIST BAR — Alert only (filters moved to tab bar) ═══ -->
<div class="dlh-filter-bar" component="category/controls">
	<!-- New topics alert -->
	<a href="{{{ if (template.category || template.world) }}}{url}{{{ else }}}{config.relative_path}/{selectedFilter.url}{querystring}{{{ end }}}" class="dlh-new-alert hide" id="new-topics-alert">
		<span class="dlh-i dlh-i-14"><svg viewBox="0 0 24 24"><polyline points="18 15 12 9 6 15"/></svg></span>
		[[recent:load-new-posts]]
	</a>
</div>
