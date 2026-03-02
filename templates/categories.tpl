<!-- Widget: Header -->
<div data-widget-area="header">
	{{{ each widgets.header }}}
	{{widgets.header.html}}
	{{{ end }}}
</div>

<!-- ═══ CHAPTER INTRO ═══ -->
<section class="dlh-chap-intro">
	<div class="dlh-stamp dlh-stamp-acc">📚 Các chương</div>
	<h1 class="dlh-stitle">Mục lục nhật ký</h1>
	<p class="dlh-chap-sub">Khám phá từng chương trong cuốn nhật ký Đà Lạt</p>
</section>

<!-- ═══ MAIN GRID ═══ -->
<div class="dlh-grid2">
	<!-- Main Column -->
	<div class="dlh-main">
		<ul component="categories/container" class="dlh-cat-grid">
			{{{ each categories }}}
			<!-- IMPORT partials/categories/item.tpl -->
			{{{ end }}}
		</ul>
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
