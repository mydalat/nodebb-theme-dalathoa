<!-- Widget: Header -->
<div data-widget-area="header">
	{{{ each widgets.header }}}
	{{widgets.header.html}}
	{{{ end }}}
</div>

<!-- ═══ COVER HERO ═══ -->
<section class="dlh-j-cover">
	<div class="dlh-j-cover-inner">
		<div class="dlh-j-label">📖 Nhật ký Cộng đồng</div>
		<h1 class="dlh-j-cover-title">{{{ if config.siteTitle }}}{config.siteTitle}{{{ else }}}Đà Lạt Hoa{{{ end }}}</h1>
		<p class="dlh-j-cover-sub">Nơi lưu giữ câu chuyện, ký ức và tình yêu dành cho Đà Lạt</p>
		<div class="dlh-stat-grid dlh-stat-grid-3">
			<div class="dlh-stat-box">
				<div class="sv" component="dlh/stat-users">—</div>
				<div class="sl">Tác giả</div>
			</div>
			<div class="dlh-stat-box">
				<div class="sv" component="dlh/stat-topics">—</div>
				<div class="sl">Trang viết</div>
			</div>
			<div class="dlh-stat-box">
				<div class="sv" component="dlh/stat-posts">—</div>
				<div class="sl">Lượt đọc</div>
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
