<li component="categories/category" data-cid="{./cid}" data-numtopics="{./totalTopicCount}" class="dlh-cat-c {./unread-class}">
	<a class="dlh-cat-link" href="{config.relative_path}/category/{./slug}">
		<div class="dlh-cat-icon" style="background-color: {./bgColor}; color: {./color};">
			{{{ if ./icon }}}
			<i class="fa {./icon}"></i>
			{{{ else }}}
			<span class="dlh-i dlh-i-24"><svg viewBox="0 0 24 24"><path d="M2 3h6a4 4 0 014 4v14a3 3 0 00-3-3H2z"/><path d="M22 3h-6a4 4 0 00-4 4v14a3 3 0 013-3h7z"/></svg></span>
			{{{ end }}}
		</div>
		<div class="dlh-cat-body">
			<h3 class="dlh-cat-name">{./name}</h3>
			{{{ if ./descriptionParsed }}}
			<p class="dlh-cat-desc">{./descriptionParsed}</p>
			{{{ end }}}
			<div class="dlh-cat-meta">{humanReadableNumber(./totalTopicCount)} trang · {humanReadableNumber(./totalPostCount)} bình luận</div>
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
