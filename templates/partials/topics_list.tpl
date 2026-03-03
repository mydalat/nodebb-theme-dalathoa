<ul component="category" class="dlh-tl">
	{{{ each topics }}}
	<li component="category/topic" class="dlh-tr-wrap{{{ if ./unread }}} dlh-unread{{{ end }}}{{{ if ./pinned }}} dlh-pin{{{ end }}}{{{ if ./locked }}} dlh-lock{{{ end }}}" data-tid="{./tid}" data-index="{./index}" data-bookmark="{./bookmark}" itemscope itemtype="https://schema.org/Question">
		<meta itemprop="name" content="{./title}">
		<meta itemprop="url" content="{config.relative_path}/topic/{./slug}">
		<meta itemprop="dateCreated" content="{./timestampISO}">
		<meta itemprop="answerCount" content="{./postcount}">

		<!-- Swipe action backgrounds (mobile) -->
		<div class="dlh-tr-swipe-bg">
			<div class="dlh-tr-swipe-left">
				<span class="dlh-i dlh-i-16"><svg viewBox="0 0 24 24"><path d="M19 21l-7-5-7 5V5a2 2 0 012-2h10a2 2 0 012 2z"/></svg></span>
				Lưu
			</div>
			<div class="dlh-tr-swipe-right">
				Đã đọc
				<span class="dlh-i dlh-i-16"><svg viewBox="0 0 24 24"><polyline points="20 6 9 17 4 12"/></svg></span>
			</div>
		</div>

		<div class="dlh-tr{{{ if ./unread }}} unread{{{ end }}}">
			<span class="dlh-tr-pg">{./index}</span>
			<a class="dlh-tr-av" href="{config.relative_path}/user/{./user.userslug}">
				{function.buildAvatar, ./user, "36px", true, "", "not-responsive"}
			</a>
			<div class="dlh-tr-b">
				<div class="dlh-tr-h">
					{{{ if ./pinned }}}<span class="dlh-tr-pin" title="[[topic:pinned]]"><span class="dlh-i dlh-i-12"><svg viewBox="0 0 24 24"><path d="M21.44 11.05l-9.19 9.19a6 6 0 01-8.49-8.49l9.19-9.19a4 4 0 015.66 5.66l-9.2 9.19a2 2 0 01-2.83-2.83l8.49-8.48" transform="rotate(45 12 12)"/></svg></span></span>{{{ end }}}
					<a class="dlh-tr-ht" itemprop="url" href="{config.relative_path}/topic/{./slug}">
						<span itemprop="name">{./title}</span>
					</a>
					<a class="dlh-ct" href="{config.relative_path}/category/{./category.slug}" style="background:{./category.bgColor};color:{./category.color};">{./category.name}</a>
					{{{ if ./locked }}}<span class="dlh-tr-lock" title="[[topic:locked]]"><span class="dlh-i dlh-i-12"><svg viewBox="0 0 24 24"><rect x="3" y="11" width="18" height="11" rx="2" ry="2"/><path d="M7 11V7a5 5 0 0110 0v4"/></svg></span></span>{{{ end }}}
					{{{ if ./isNew }}}<span class="dlh-tr-new">Mới</span>{{{ end }}}
					{{{ if ./heat }}}<span class="dlh-tr-hot"><span class="dlh-i dlh-i-14"><svg viewBox="0 0 24 24"><path d="M8.5 14.5A2.5 2.5 0 0011 12c0-1.38-.5-2-1-3-1.07-2.14 0-5.5 3.5-7.5C17 1.5 19.5 4.02 19.5 7c0 3.5-3 7-5.5 8a2.5 2.5 0 00-2.5 2.5v2.5"/></svg></span>Hot</span>{{{ end }}}
				</div>
				<div class="dlh-tr-m">
					<span class="timeago" title="{./timestampISO}"></span> · {./user.displayname} · {./postcount} trả lời · <b>{./viewcount}</b> đọc
				</div>
			{{{ if ./teaser.content }}}
			<div class="dlh-tr-preview">{./teaser.content}</div>
			{{{ end }}}
			</div>
			<div class="dlh-tr-r">
				<div class="dlh-tr-reads">
					<b>{./viewcount}</b>
					<div class="dlh-tr-n">đọc</div>
				</div>
				<div class="dlh-tr-lt">
					<span class="dlh-i dlh-i-12"><svg viewBox="0 0 24 24"><path d="M21 15a2 2 0 01-2 2H7l-4 4V5a2 2 0 012-2h14a2 2 0 012 2z"/></svg></span>
					{./postcount}
				</div>
			</div>
		</div>
	</li>
	{{{ end }}}
</ul>
