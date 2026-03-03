<!-- Widget: Header -->
<div data-widget-area="header">
	{{{ each widgets.header }}}
	{{widgets.header.html}}
	{{{ end }}}
</div>

<!-- ═══ BREADCRUMB ═══ -->
<nav class="dlh-bc">
	<a href="{config.relative_path}/">
		<span class="dlh-i dlh-i-14"><svg viewBox="0 0 24 24"><path d="M3 9l9-7 9 7v11a2 2 0 01-2 2H5a2 2 0 01-2-2z"/><polyline points="9 22 9 12 15 12 15 22"/></svg></span>
		Nhật ký
	</a>
	<span class="sep">›</span>
	<span class="dlh-bc-current">Mục lục</span>
</nav>

<!-- ═══ CHAPTER INTRO ═══ -->
<section class="dlh-chap-intro">
	<div class="dlh-stamp dlh-stamp-acc">✦ Mục lục ✦</div>
	<h2>Các chương nhật ký</h2>
	<p>Mỗi chương là một góc nhìn — cùng giở từng trang Đà Lạt</p>
</section>

<!-- ═══ CATEGORY GRID ═══ -->
<ul component="categories/container" class="dlh-cat-grid">
	{{{ each categories }}}
	<!-- IMPORT partials/categories/item.tpl -->
	{{{ end }}}
</ul>

<!-- Sidebar -->
<div data-widget-area="sidebar" class="dlh-side {{{ if !widgets.sidebar.length }}}hidden{{{ end }}}">
	{{{ each widgets.sidebar }}}
	{{widgets.sidebar.html}}
	{{{ end }}}
</div>

<!-- Widget: Footer -->
<div data-widget-area="footer">
	{{{ each widgets.footer }}}
	{{widgets.footer.html}}
	{{{ end }}}
</div>
