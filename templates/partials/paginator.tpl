<!-- Pagination — Journal-style dashed borders -->
{{{ if pagination.pages.length }}}
<nav class="dlh-pagination" component="pagination">
	<!-- Prev -->
	<a class="dlh-pg-btn{{{ if !pagination.prev.active }}} disabled{{{ end }}}" href="?{pagination.prev.qs}" data-page="{pagination.prev.page}">
		<span class="dlh-i dlh-i-14"><svg viewBox="0 0 24 24"><polyline points="15 18 9 12 15 6"/></svg></span>
	</a>

	<!-- Page numbers -->
	{{{ each pagination.pages }}}
		{{{ if ./separator }}}
		<span class="dlh-pg-dots">&hellip;</span>
		{{{ else }}}
		<a class="dlh-pg-btn{{{ if ./active }}} on{{{ end }}}" href="?{./qs}" data-page="{./page}">{./page}</a>
		{{{ end }}}
	{{{ end }}}

	<!-- Next -->
	<a class="dlh-pg-btn{{{ if !pagination.next.active }}} disabled{{{ end }}}" href="?{pagination.next.qs}" data-page="{pagination.next.page}">
		<span class="dlh-i dlh-i-14"><svg viewBox="0 0 24 24"><polyline points="9 18 15 12 9 6"/></svg></span>
	</a>
</nav>
{{{ end }}}
