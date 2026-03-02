{{{ if (!./index && widgets.mainpost-header.length) }}}
<div data-widget-area="mainpost-header">
	{{{ each widgets.mainpost-header }}}
	{widgets.mainpost-header.html}
	{{{ end }}}
</div>
{{{ end }}}

{{{ if (./parent && !hideParent) }}}
<!-- IMPORT partials/topic/post-parent.tpl -->
{{{ end }}}

<div class="dlh-post-card post-container-parent d-flex align-items-start gap-3">
	<!-- Avatar (desktop) -->
	<div class="dlh-post-av-lg d-none d-sm-block">
		<a href="{{{ if ./user.userslug }}}{config.relative_path}/user/{./user.userslug}{{{ else }}}#{{{ end }}}">
			{buildAvatar(posts.user, "44px", true, "", "user/picture")}
		</a>
	</div>

	<div class="post-container d-flex flex-column flex-grow-1" style="min-width:0;">
		<!-- Post Header -->
		<div class="dlh-post-head post-header d-flex align-items-center gap-2 flex-wrap" itemprop="author" itemscope itemtype="https://schema.org/Person">
			<meta itemprop="name" content="{./user.displayname}">
			{{{ if ./user.userslug }}}<meta itemprop="url" content="{config.relative_path}/user/{./user.userslug}">{{{ end }}}

			<!-- Avatar (mobile) -->
			<div class="d-sm-none">
				<a href="{{{ if ./user.userslug }}}{config.relative_path}/user/{./user.userslug}{{{ else }}}#{{{ end }}}">
					{buildAvatar(posts.user, "28px", true, "", "user/picture")}
				</a>
			</div>

			<a class="dlh-post-name fw-bold" href="{{{ if ./user.userslug }}}{config.relative_path}/user/{./user.userslug}{{{ else }}}#{{{ end }}}" data-username="{posts.user.username}" data-uid="{posts.user.uid}">{posts.user.displayname}</a>

			{{{ if posts.topicOwnerPost }}}
			<span class="dlh-post-op">Tác giả</span>
			{{{ end }}}

			{{{ each posts.user.selectedGroups }}}
			{{{ if posts.user.selectedGroups.slug }}}
			<!-- IMPORT partials/groups/badge.tpl -->
			{{{ end }}}
			{{{ end }}}

			{{{ if posts.user.banned }}}
			<span class="badge bg-danger rounded-1">[[user:banned]]</span>
			{{{ end }}}

			<div class="d-flex gap-1 align-items-center ms-auto">
				<span class="dlh-post-time text-muted">{generateWrote(@value, config.timeagoCutoff)}</span>
				<i component="post/edit-indicator" class="fa fa-edit text-muted{{{ if privileges.posts:history }}} pointer{{{ end }}} edit-icon {{{ if !posts.editor.username }}}hidden{{{ end }}}" title="[[global:edited-timestamp, {isoTimeToLocaleString(./editedISO, config.userLang)}]]"></i>
				<span data-editor="{posts.editor.userslug}" component="post/editor" class="visually-hidden">[[global:last-edited-by, {posts.editor.username}]] <span class="timeago" title="{isoTimeToLocaleString(posts.editedISO, config.userLang)}"></span></span>
				<span class="bookmarked opacity-0 text-primary"><i class="fa fa-bookmark-o"></i></span>
				<a href="{config.relative_path}/post/{encodeURIComponent(./pid)}" class="dlh-post-index text-muted d-none d-md-inline">#{increment(./index, "1")}</a>
			</div>
		</div>

		<!-- Post Content -->
		<div class="dlh-post-body content text-break" component="post/content" itemprop="text">
			{posts.content}
		</div>

		{{{ if posts.user.signature }}}
		<div component="post/signature" data-uid="{posts.user.uid}" class="dlh-post-sig text-xs text-muted mt-2">{posts.user.signature}</div>
		{{{ end }}}

		<!-- Post Footer -->
		<div component="post/footer" class="dlh-post-foot post-footer">
			<div class="d-flex flex-wrap-reverse gap-2 {{{ if (hideReplies || !posts.replies.count) }}}justify-content-end{{{ else }}}justify-content-between{{{ end }}}">
				{{{ if !hideReplies }}}
				<a component="post/reply-count" data-target-component="post/replies/container" href="#" class="dlh-post-replies d-flex gap-2 align-items-center {{{ if (!./replies || shouldHideReplyContainer(@value)) }}}hidden{{{ end }}}">
					<span component="post/reply-count/avatars" class="d-flex gap-1 {{{ if posts.replies.hasMore }}}hasMore{{{ end }}}">
						{{{ each posts.replies.users }}}
						<span>{buildAvatar(posts.replies.users, "20px", true, "avatar-tooltip")}</span>
						{{{ end }}}
						{{{ if posts.replies.hasMore }}}
						<span style="height:20px;line-height:20px;"><i class="fa fa-ellipsis"></i></span>
						{{{ end }}}
					</span>
					<span class="fw-semibold text-nowrap" component="post/reply-count/text" data-replies="{posts.replies.count}">{posts.replies.text}</span>
					<i class="fa fa-fw fa-chevron-down" component="post/replies/open"></i>
				</a>
				{{{ end }}}

				<div component="post/actions" class="dlh-post-actions d-flex flex-grow-1 align-items-center justify-content-end gap-1 post-tools">
					<!-- IMPORT partials/topic/reactions.tpl -->

					{{{ if !reputation:disabled }}}
					<div class="dlh-post-votes d-flex align-items-center">
						<a component="post/upvote" href="#" class="dlh-post-act{{{ if posts.upvoted }}} on{{{ end }}}" title="[[topic:upvote-post]]">
							<span class="dlh-i dlh-i-16"><svg viewBox="0 0 24 24"><path d="M14 9V5a3 3 0 00-3-3l-4 9v11h11.28a2 2 0 002-1.7l1.38-9a2 2 0 00-2-2.3H14z"/><path d="M7 22H4a2 2 0 01-2-2v-7a2 2 0 012-2h3"/></svg></span>
						</a>
						<meta itemprop="upvoteCount" content="{posts.upvotes}">
						<meta itemprop="downvoteCount" content="{posts.downvotes}">
						<a href="#" class="dlh-post-vote-count px-1" component="post/vote-count" data-votes="{posts.votes}" title="[[global:voters]]">{posts.votes}</a>
						{{{ if !downvote:disabled }}}
						<a component="post/downvote" href="#" class="dlh-post-act{{{ if posts.downvoted }}} on{{{ end }}}" title="[[topic:downvote-post]]">
							<span class="dlh-i dlh-i-16"><svg viewBox="0 0 24 24"><path d="M10 15v4a3 3 0 003 3l4-9V2H5.72a2 2 0 00-2 1.7l-1.38 9a2 2 0 002 2.3H10z"/><path d="M17 2h3a2 2 0 012 2v7a2 2 0 01-2 2h-3"/></svg></span>
						</a>
						{{{ end }}}
					</div>
					{{{ end }}}

					<a component="post/reply" href="#" class="dlh-post-act {{{ if !privileges.topics:reply }}}hidden{{{ end }}}" title="[[topic:reply]]">
						<span class="dlh-i dlh-i-16"><svg viewBox="0 0 24 24"><polyline points="9 17 4 12 9 7"/><path d="M20 18v-2a4 4 0 00-4-4H4"/></svg></span>
					</a>
					<a component="post/quote" href="#" class="dlh-post-act {{{ if !privileges.topics:reply }}}hidden{{{ end }}}" title="[[topic:quote]]">
						<span class="dlh-i dlh-i-16"><svg viewBox="0 0 24 24"><path d="M21 15a2 2 0 01-2 2H7l-4 4V5a2 2 0 012-2h14a2 2 0 012 2z"/></svg></span>
					</a>

					<!-- IMPORT partials/topic/post-menu.tpl -->
				</div>
			</div>

			<div component="post/replies/container" class="my-2 border rounded-1 p-3 hidden-empty"></div>
		</div>
	</div>
</div>

{{{ if (!./index && widgets.mainpost-footer.length) }}}
<div data-widget-area="mainpost-footer">
	{{{ each widgets.mainpost-footer }}}
	{widgets.mainpost-footer.html}
	{{{ end }}}
</div>
{{{ end }}}
