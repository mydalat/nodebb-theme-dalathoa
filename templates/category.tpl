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

<!-- ═══ SUBCATEGORY HEADER BANNER ═══ -->
<div class="dlh-subcat-header" {{{ if ./bgColor }}}style="background: linear-gradient(135deg, {./bgColor} 0%, var(--dlh-pri) 100%)"{{{ end }}}>
	<div class="dlh-subcat-header-bg"></div>
	<div class="dlh-subcat-header-content">
		<div class="dlh-subcat-icon">
			{{{ if ./icon }}}<i class="fa {./icon}"></i>{{{ else }}}📖{{{ end }}}
		</div>
		<div class="dlh-subcat-info">
			<h2>{./name}</h2>
			{{{ if ./descriptionParsed }}}
			<p class="dlh-subcat-desc">{./descriptionParsed}</p>
			{{{ end }}}
			<div class="dlh-subcat-stats">
				<span><svg viewBox="0 0 24 24" width="14" height="14"><path d="M14 2H6a2 2 0 00-2 2v16a2 2 0 002 2h12a2 2 0 002-2V8z" fill="none" stroke="currentColor" stroke-width="2"/><polyline points="14 2 14 8 20 8" fill="none" stroke="currentColor" stroke-width="2"/></svg> <b>{humanReadableNumber(totalTopicCount)}</b> trang</span>
				<span><svg viewBox="0 0 24 24" width="14" height="14"><path d="M21 15a2 2 0 01-2 2H7l-4 4V5a2 2 0 012-2h14a2 2 0 012 2z" fill="none" stroke="currentColor" stroke-width="2"/></svg> <b>{humanReadableNumber(totalPostCount)}</b> bình luận</span>
				<span><svg viewBox="0 0 24 24" width="14" height="14"><path d="M1 12s4-8 11-8 11 8 11 8-4 8-11 8-11-8-11-8z" fill="none" stroke="currentColor" stroke-width="2"/><circle cx="12" cy="12" r="3" fill="none" stroke="currentColor" stroke-width="2"/></svg> <b>{humanReadableNumber(pageCount)}</b> đọc</span>
				<span><svg viewBox="0 0 24 24" width="14" height="14"><path d="M20 21v-2a4 4 0 00-4-4H8a4 4 0 00-4 4v2" fill="none" stroke="currentColor" stroke-width="2"/><circle cx="12" cy="7" r="4" fill="none" stroke="currentColor" stroke-width="2"/></svg> <b>{humanReadableNumber(memberCount)}</b> tác giả</span>
			</div>
			<button class="dlh-subcat-subscribe" data-cid="{./cid}">
				<svg viewBox="0 0 24 24" width="14" height="14"><path d="M18 8A6 6 0 006 8c0 7-3 9-3 9h18s-3-2-3-9" fill="none" stroke="currentColor" stroke-width="2"/><path d="M13.73 21a2 2 0 01-3.46 0" fill="none" stroke="currentColor" stroke-width="2"/></svg>
				<span class="dlh-subcat-subscribe-text">Theo dõi</span>
			</button>
		</div>
	</div>
</div>

<!-- Widget: Header -->
<div data-widget-area="header">
	{{{ each widgets.header }}}
	{{widgets.header.html}}
	{{{ end }}}
</div>

<!-- ═══ SUBCATEGORIES GRID ═══ -->
{{{ if ./children.length }}}
<div class="dlh-subcat-children">
	<h4 class="dlh-subcat-children-title">
		<svg viewBox="0 0 24 24" width="16" height="16"><path d="M22 19a2 2 0 01-2 2H4a2 2 0 01-2-2V5a2 2 0 012-2h5l2 3h9a2 2 0 012 2z" fill="none" stroke="currentColor" stroke-width="2"/></svg>
		Chuyên mục con
	</h4>
	<div class="dlh-subcat-children-grid">
		{{{ each ./children }}}
		{{{ if !./isSection }}}
		<a class="dlh-subcat-child" href="{config.relative_path}/category/{./slug}" data-cid="{./cid}">
			<span class="dlh-subcat-child-icon">{{{ if ./icon }}}<i class="fa {./icon}"></i>{{{ else }}}📄{{{ end }}}</span>
			<span class="dlh-subcat-child-name">{./name}</span>
			<span class="dlh-subcat-child-count">{./totalTopicCount}</span>
		</a>
		{{{ end }}}
		{{{ end }}}
	</div>
</div>
{{{ end }}}

<!-- ═══ FILTER BAR ═══ -->
<div class="dlh-subcat-filter">
	<div class="dlh-subcat-filter-info">
		Hiện <b>{totalTopicCount}</b> trang · Sắp xếp theo <b>{selectedSort.name}</b>
	</div>
</div>

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
