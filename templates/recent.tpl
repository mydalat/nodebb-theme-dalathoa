<!-- Widget: Header -->
<div data-widget-area="header">
	{{{ each widgets.header }}}
	{{widgets.header.html}}
	{{{ end }}}
</div>

<!-- ═══ COVER HERO ═══ -->
<section class="dlh-j-cover">
	<div class="dlh-j-cover-inner">
		<div class="dlh-j-cover-stamp">📖 Nhật ký</div>
		<h1>{{{ if config.siteTitle }}}{config.siteTitle}{{{ else }}}Đà Lạt <em>Hoa</em>{{{ end }}}</h1>
		<p>Nơi lưu giữ câu chuyện, ký ức và tình yêu dành cho Đà Lạt</p>
		<div class="dlh-j-stats">
			<div class="dlh-j-stat">
				<div class="n" component="dlh/stat-users">—</div>
				<div class="l">Tác giả</div>
			</div>
			<div class="dlh-j-stat">
				<div class="n" component="dlh/stat-topics">—</div>
				<div class="l">Trang viết</div>
			</div>
			<div class="dlh-j-stat">
				<div class="n" component="dlh/stat-posts">—</div>
				<div class="l">Lượt đọc</div>
			</div>
		</div>
	</div>
</section>

<!-- ═══ MAIN GRID ═══ -->
<div class="dlh-grid2">
	<!-- Main Column -->
	<div class="dlh-main">
		<!-- IMPORT partials/topic-list-bar.tpl -->
		<!-- IMPORT partials/topics_list.tpl -->
		{{{ if config.usePagination }}}
		<!-- IMPORT partials/paginator.tpl -->
		{{{ end }}}
	</div>

	<!-- Sidebar -->
	<div data-widget-area="sidebar" class="dlh-side {{{ if !widgets.sidebar.length }}}hidden{{{ end }}}">
		{{{ each widgets.sidebar }}}
		{{widgets.sidebar.html}}
		{{{ end }}}
	</div>
</div>

<!-- Widget: Footer -->
<div data-widget-area="footer">
	{{{ each widgets.footer }}}
	{{widgets.footer.html}}
	{{{ end }}}
</div>
