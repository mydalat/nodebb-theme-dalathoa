<!-- Widget: Header -->
<div data-widget-area="header">
	{{{ each widgets.header }}}
	{{widgets.header.html}}
	{{{ end }}}
</div>

<!-- ═══ COVER HERO ═══ -->
<section class="dlh-j-cover">
	<div class="dlh-j-cover-inner">
		<div class="dlh-j-cover-stamp">✦ EST. 2006 ✦</div>
		<h1>Nhật ký<br><em>Đà Lạt</em></h1>
		<p>Mỗi câu chuyện là một trang nhật ký — nơi người Đà Lạt kể về thành phố sương mù qua ảnh xưa, vườn yên, và những đổi thay.</p>
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

<!-- Mobile tags bar -->
<div class="dlh-mobile-tags">
	<span class="dlh-tp hot">#đàlạt</span>
	<span class="dlh-tp">#đôthịhóa</span>
	<span class="dlh-tp hot">#ngườiđàlạt</span>
	<span class="dlh-tp">#ảnhxưa</span>
	<span class="dlh-tp">#vườnyên</span>
</div>

<!-- ═══ MAIN GRID ═══ -->
<div class="dlh-grid2">
	<!-- Main Column -->
	<div class="dlh-main">
		<!-- IMPORT partials/topic-list-bar.tpl -->
		<div class="dlh-stitle">
			<span class="dlh-i dlh-i-20"><svg viewBox="0 0 24 24"><polyline points="23 6 13.5 15.5 8.5 10.5 1 18"/><polyline points="17 6 23 6 23 12"/></svg></span>
			Mới nhất
		</div>
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
