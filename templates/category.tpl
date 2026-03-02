<!-- IMPORT partials/breadcrumbs-json-ld.tpl -->

<!-- ═══ BREADCRUMB ═══ -->
<nav class="dlh-bc">
	<a href="{config.relative_path}/">Nhật ký</a>
	<span class="sep">›</span>
	<a href="{config.relative_path}/categories">Chương</a>
	<span class="sep">›</span>
	<span class="dlh-bc-current">{./name}</span>
</nav>

<!-- ═══ CHAPTER DETAIL BANNER ═══ -->
<div class="dlh-chap-detail" style="--chap-bg:{./bgColor}; --chap-fg:{./color};">
	<div class="dlh-chap-detail-icon">
		{{{ if ./icon }}}<i class="fa {./icon}"></i>{{{ else }}}<span>📖</span>{{{ end }}}
	</div>
	<h1 class="dlh-chap-detail-title">{./name}</h1>
	{{{ if ./descriptionParsed }}}
	<div class="dlh-chap-detail-desc">{./descriptionParsed}</div>
	{{{ end }}}
	<div class="dlh-chap-detail-stats">
		<span class="dlh-mt">{humanReadableNumber(totalTopicCount)} bài viết</span>
		<span class="dlh-mt">{humanReadableNumber(totalPostCount)} phản hồi</span>
	</div>
</div>

{{{ if widgets.header.length }}}
<div data-widget-area="header">
	{{{ each widgets.header }}}
	{{widgets.header.html}}
	{{{ end }}}
</div>
{{{ end }}}

<!-- ═══ SUBCATEGORIES ═══ -->
<!-- IMPORT partials/category/subcategory.tpl -->

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

{{{ if widgets.footer.length }}}
<div data-widget-area="footer">
	{{{ each widgets.footer }}}
	{{widgets.footer.html}}
	{{{ end }}}
</div>
{{{ end }}}
