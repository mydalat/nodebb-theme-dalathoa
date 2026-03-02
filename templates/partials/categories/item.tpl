<li component="categories/category" data-cid="{./cid}" data-numtopics="{./totalTopicCount}" class="dlh-cat-c {./unread-class}">
	<a class="dlh-cat-link" href="{config.relative_path}/category/{./slug}">
		<div class="dlh-cat-head">
			<div class="dlh-cat-icon" style="background-color: {./bgColor}; color: {./color};">
				{{{ if ./icon }}}
				<i class="fa {./icon}"></i>
				{{{ else }}}
				<span class="dlh-i dlh-i-24"><svg viewBox="0 0 24 24"><path d="M2 3h6a4 4 0 014 4v14a3 3 0 00-3-3H2z"/><path d="M22 3h-6a4 4 0 00-4 4v14a3 3 0 013-3h7z"/></svg></span>
				{{{ end }}}
			</div>
			<div class="dlh-cat-info">
				<h2 class="dlh-cat-name">{./name}</h2>
				{{{ if ./descriptionParsed }}}
				<div class="dlh-cat-desc">{./descriptionParsed}</div>
				{{{ end }}}
			</div>
		</div>
		<div class="dlh-cat-stats">
			<span class="dlh-cat-stat">
				<span class="dlh-i dlh-i-12"><svg viewBox="0 0 24 24"><path d="M14 2H6a2 2 0 00-2 2v16a2 2 0 002 2h12a2 2 0 002-2V8z"/><polyline points="14 2 14 8 20 8"/></svg></span>
				{./totalTopicCount}
			</span>
			<span class="dlh-cat-stat">
				<span class="dlh-i dlh-i-12"><svg viewBox="0 0 24 24"><path d="M21 15a2 2 0 01-2 2H7l-4 4V5a2 2 0 012-2h14a2 2 0 012 2z"/></svg></span>
				{./totalPostCount}
			</span>
		</div>
	</a>
	{{{ if ./children.length }}}
	<ul class="dlh-cat-children">
		{{{ each ./children }}}
		{{{ if !./isSection }}}
		<li>
			<a href="{config.relative_path}/category/{./slug}">
				{{{ if ./icon }}}<i class="fa {./icon}"></i>{{{ end }}}
				{./name}
			</a>
		</li>
		{{{ end }}}
		{{{ end }}}
	</ul>
	{{{ end }}}
</li>
