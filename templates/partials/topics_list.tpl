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
					<a class="dlh-tr-ht" itemprop="url" href="{config.relative_path}/topic/{./slug}">
						<span itemprop="name">{./title}</span>
					</a>
					{{{ if ./pinned }}}
					<span class="dlh-tr-pin" title="[[topic:pinned]]"><span class="dlh-i dlh-i-12"><svg viewBox="0 0 24 24"><path d="M12 2l3.09 6.26L22 9.27l-5 4.87 1.18 6.88L12 17.77l-6.18 3.25L7 14.14 2 9.27l6.91-1.01L12 2z"/></svg></span></span>
					{{{ end }}}
					{{{ if ./locked }}}
					<span class="dlh-tr-lock" title="[[topic:locked]]"><span class="dlh-i dlh-i-12"><svg viewBox="0 0 24 24"><rect x="3" y="11" width="18" height="11" rx="2" ry="2"/><path d="M7 11V7a5 5 0 0110 0v4"/></svg></span></span>
					{{{ end }}}
					{{{ if ./new }}}
					<span class="dlh-tr-new">Mới</span>
					{{{ end }}}
				</div>
				<div class="dlh-tr-m">
					<a class="dlh-ct" href="{config.relative_path}/category/{./category.slug}" style="background:{./category.bgColor};color:{./category.color};">{./category.name}</a>
					<span class="dlh-mt">{./user.displayname}</span>
					<span class="dlh-mt"><time datetime="{./timestampISO}" class="timeago" title="{./timestampISO}"></time></span>
				</div>
				{{{ if ./tags.length }}}
				<div class="dlh-tr-tags">
					{{{ each ./tags }}}
					<a class="dlh-tr-tag" href="{config.relative_path}/tags/{./valueEncoded}">{./valueEscaped}</a>
					{{{ end }}}
				</div>
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
