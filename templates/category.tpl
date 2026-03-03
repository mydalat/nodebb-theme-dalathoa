<!-- IMPORT partials/breadcrumbs-json-ld.tpl -->

<!-- ═══ BREADCRUMB ═══ -->
<nav class="dlh-bc">
	<a href="{config.relative_path}/">
		<span class="dlh-i dlh-i-14"><svg viewBox="0 0 24 24"><path d="M3 9l9-7 9 7v11a2 2 0 01-2 2H5a2 2 0 01-2-2z"/><polyline points="9 22 9 12 15 12 15 22"/></svg></span>
		Nhật ký
	</a>
	<span class="sep">›</span>
	<a href="{config.relative_path}/categories">Mục lục</a>
	<span class="sep">›</span>
	<span class="dlh-bc-current">{./name}</span>
</nav>

<!-- ═══ CHAPTER DETAIL BANNER ═══ -->
<div class="dlh-chap-detail">
	<h2>{{{ if ./icon }}}<i class="fa {./icon}"></i> {{{ end }}}{./name}</h2>
	{{{ if ./descriptionParsed }}}
	<p>{./descriptionParsed}</p>
	{{{ end }}}
	<div class="dlh-chap-detail-stats">
		<span><b>{humanReadableNumber(totalTopicCount)}</b> trang</span>
		<span><b>{humanReadableNumber(totalPostCount)}</b> bình luận</span>
	</div>
</div>

<!-- Widget: Header -->
<div data-widget-area="header">
	{{{ each widgets.header }}}
	{{widgets.header.html}}
	{{{ end }}}
</div>

<!-- ═══ SUBCATEGORIES (Bookmarks) ═══ -->
{{{ if ./children.length }}}
<div class="dlh-bookmarks">
	{{{ each ./children }}}
	{{{ if !./isSection }}}
	<a class="dlh-bm" href="{config.relative_path}/category/{./slug}">
		<h5>{./name}</h5>
		<div class="cnt">{./totalTopicCount} trang</div>
	</a>
	{{{ end }}}
	{{{ end }}}
</div>
{{{ end }}}

<!-- ═══ MAIN GRID ═══ -->
<div class="dlh-grid2">
	<div class="dlh-main category">
		{{{ if (topics.length || privileges.topics:create) }}}
		<!-- IMPORT partials/topic-list-bar.tpl -->
		{{{ end }}}

		{{{ if (./inbox && (./hasFollowers == false)) }}}
		<div class="dlh-jc dlh-jc-hl">
			<p>[[category:no-followers]]</p>
		</div>
		{{{ end }}}

		{{{ if (!topics.length && privileges.topics:create) }}}
		<div class="dlh-jc dlh-jc-hl">
			<p>[[category:no-topics]]</p>
		</div>
		{{{ end }}}

		<div class="dlh-stitle">Trang trong chương</div>

		<!-- IMPORT partials/topics_list.tpl -->

		{{{ if config.usePagination }}}
		<!-- IMPORT partials/paginator.tpl -->
		{{{ end }}}
	</div>

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
