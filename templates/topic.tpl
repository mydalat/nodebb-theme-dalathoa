<!-- IMPORT partials/breadcrumbs-json-ld.tpl -->

<!-- ═══ BREADCRUMB ═══ -->
<nav class="dlh-bc">
	<a href="{config.relative_path}/">Nhật ký</a>
	<span class="sep">›</span>
	<a href="{config.relative_path}/category/{category.slug}">{category.name}</a>
	<span class="sep">›</span>
	<span class="dlh-bc-current">{title}</span>
</nav>

{{{ if widgets.header.length }}}
<div data-widget-area="header">
	{{{ each widgets.header }}}
	{{widgets.header.html}}
	{{{ end }}}
</div>
{{{ end }}}

<div class="dlh-entry flex-fill" itemid="{url}" itemscope itemtype="https://schema.org/DiscussionForumPosting">
	<meta itemprop="headline" content="{escape(titleRaw)}">
	<meta itemprop="text" content="{escape(titleRaw)}">
	<meta itemprop="url" content="{url}">
	<meta itemprop="datePublished" content="{timestampISO}">
	<meta itemprop="dateModified" content="{lastposttimeISO}">
	<div itemprop="author" itemscope itemtype="https://schema.org/Person">
		<meta itemprop="name" content="{author.username}">
		{{{ if author.userslug }}}<meta itemprop="url" content="{config.relative_path}/user/{author.userslug}">{{{ end }}}
	</div>
	<div itemprop="interactionStatistic" itemscope itemtype="https://schema.org/InteractionCounter">
		<meta itemprop="interactionType" content="https://schema.org/CommentAction">
		<meta itemprop="userInteractionCount" content="{increment(postcount, "-1")}">
	</div>
	<div itemprop="interactionStatistic" itemscope itemtype="https://schema.org/InteractionCounter">
		<meta itemprop="interactionType" content="https://schema.org/LikeAction">
		<meta itemprop="userInteractionCount" content="{upvotes}">
	</div>

	<!-- ═══ ENTRY HEADER ═══ -->
	<div class="dlh-entry-head">
		<div class="dlh-j-label">📖 Trang viết</div>
		<h1 class="dlh-entry-title">
			<span class="topic-title" component="topic/title">{title}</span>
		</h1>
		<div class="dlh-entry-meta">
			<span component="topic/labels" class="dlh-entry-labels {{{ if (!scheduled && (!pinned && (!locked && (!icons.length && (!oldCid || (oldCid == "-1")))))) }}}hidden{{{ end }}}">
				<span component="topic/scheduled" class="dlh-stamp dlh-stamp-acc {{{ if !scheduled }}}hidden{{{ end }}}">[[topic:scheduled]]</span>
				<span component="topic/pinned" class="dlh-stamp dlh-stamp-acc {{{ if (scheduled || !pinned) }}}hidden{{{ end }}}">📌 {{{ if !pinExpiry }}}[[topic:pinned]]{{{ else }}}[[topic:pinned-with-expiry, {isoTimeToLocaleString(./pinExpiryISO, config.userLang)}]]{{{ end }}}</span>
				<span component="topic/locked" class="dlh-stamp {{{ if !locked }}}hidden{{{ end }}}">🔒 [[topic:locked]]</span>
				<a component="topic/moved" href="{config.relative_path}/category/{oldCid}" class="dlh-stamp {{{ if (!oldCid || (oldCid == "-1")) }}}hidden{{{ end }}}">
					{{{ if privileges.isAdminOrMod }}}[[topic:moved-from, {oldCategory.name}]]{{{ else }}}[[topic:moved]]{{{ end }}}
				</a>
				{{{ each icons }}}<span>{@value}</span>{{{ end }}}
			</span>
			<a class="dlh-ct" href="{config.relative_path}/category/{category.slug}" style="background:{category.bgColor};color:{category.color};">{category.name}</a>
			<span class="dlh-mt">
				<span class="dlh-i dlh-i-12"><svg viewBox="0 0 24 24"><path d="M20 21v-2a4 4 0 00-4-4H8a4 4 0 00-4 4v2"/><circle cx="12" cy="7" r="4"/></svg></span>
				{author.username}
			</span>
			<span class="dlh-mt">
				<span class="dlh-i dlh-i-12"><svg viewBox="0 0 24 24"><circle cx="12" cy="12" r="10"/><polyline points="12 6 12 12 16 14"/></svg></span>
				<time datetime="{timestampISO}" class="timeago" title="{timestampISO}"></time>
			</span>
			<span class="dlh-mt">
				<span class="dlh-i dlh-i-12"><svg viewBox="0 0 24 24"><path d="M1 12s4-8 11-8 11 8 11 8-4 8-11 8-11-8-11-8z"/><circle cx="12" cy="12" r="3"/></svg></span>
				{viewcount}
			</span>
		</div>
		{{{ if tags.length }}}
		<div data-tid="{./tid}" component="topic/tags" class="dlh-entry-tags">
			{{{ each tags }}}
			<a class="dlh-tp" href="{config.relative_path}/tags/{./valueEncoded}">{./valueEscaped}</a>
			{{{ end }}}
		</div>
		{{{ end }}}
	</div>

	<!-- ═══ MAIN GRID ═══ -->
	<div class="dlh-grid2">
		<div class="dlh-main">
			<!-- IMPORT partials/post_bar.tpl -->

			{{{ if merger }}}
			<!-- IMPORT partials/topic/merged-message.tpl -->
			{{{ end }}}
			{{{ if forker }}}
			<!-- IMPORT partials/topic/forked-message.tpl -->
			{{{ end }}}
			{{{ if !scheduled }}}
			<!-- IMPORT partials/topic/deleted-message.tpl -->
			{{{ end }}}

			<ul component="topic" class="dlh-posts list-unstyled p-0" data-tid="{tid}" data-cid="{cid}">
				{{{ each posts }}}
				<li component="post" class="dlh-post {{{ if posts.deleted }}}deleted{{{ end }}} {{{ if posts.selfPost }}}self-post{{{ end }}} {{{ if posts.topicOwnerPost }}}topic-owner-post{{{ end }}}" <!-- IMPORT partials/data/topic.tpl -->>
					<a component="post/anchor" data-index="{./index}" id="{increment(./index, "1")}"></a>
					<meta itemprop="datePublished" content="{./timestampISO}">
					{{{ if ./editedISO }}}
					<meta itemprop="dateModified" content="{./editedISO}">
					{{{ end }}}
					<!-- IMPORT partials/topic/post.tpl -->
				</li>
				{{{ if (config.topicPostSort != "most_votes") }}}
				{{{ each ./events }}}<!-- IMPORT partials/topic/event.tpl -->{{{ end }}}
				{{{ end }}}
				{{{ end }}}
			</ul>

			{{{ if browsingUsers }}}
			<div class="visible-xs">
				<!-- IMPORT partials/topic/browsing-users.tpl -->
			</div>
			{{{ end }}}

			{{{ if config.theme.enableQuickReply }}}
			<!-- IMPORT partials/topic/quickreply.tpl -->
			{{{ end }}}

			{{{ if !config.loggedIn }}}
			<!-- IMPORT partials/topic/guest-cta.tpl -->
			{{{ end }}}
		</div>

		<div data-widget-area="sidebar" class="dlh-side {{{ if !widgets.sidebar.length }}}hidden{{{ end }}}">
			{{{ each widgets.sidebar }}}
			{{widgets.sidebar.html}}
			{{{ end }}}
		</div>
	</div>
</div>

{{{ if config.usePagination }}}
<!-- IMPORT partials/paginator.tpl -->
{{{ end }}}

{{{ if widgets.footer.length }}}
<div data-widget-area="footer">
	{{{ each widgets.footer }}}
	{{widgets.footer.html}}
	{{{ end }}}
</div>
{{{ end }}}
