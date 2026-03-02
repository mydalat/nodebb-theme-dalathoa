<!-- IMPORT partials/account/header.tpl -->

{{{ if widgets.profile-aboutme-before.length }}}
<div data-widget-area="profile-aboutme-before">
	{{{ each widgets.profile-aboutme-before }}}
	{./html}
	{{{ end }}}
</div>
{{{ end }}}

{{{ if aboutme }}}
<div class="dlh-jc dlh-prof-about">
	<h4>✍️ Giới thiệu</h4>
	<div component="aboutme" class="text-break">{aboutmeParsed}</div>
</div>
{{{ end }}}

{{{ if widgets.profile-aboutme-after.length }}}
<div data-widget-area="profile-aboutme-after">
	{{{ each widgets.profile-aboutme-after }}}
	{./html}
	{{{ end }}}
</div>
{{{ end }}}

<!-- ═══ STATS ═══ -->
<div class="dlh-prof-stats-grid">
	{{{ if !reputation:disabled }}}
	<div class="dlh-stat-box">
		<div class="sv" title="{formattedNumber(reputation)}">{humanReadableNumber(reputation)}</div>
		<div class="sl">[[global:reputation]]</div>
	</div>
	{{{ end }}}
	<div class="dlh-stat-box">
		<div class="sv" title="{formattedNumber(profileviews)}">{humanReadableNumber(profileviews)}</div>
		<div class="sl">[[user:profile-views]]</div>
	</div>
	<div class="dlh-stat-box">
		<div class="sv dlh-stat-time"><time class="timeago" datetime="{joindateISO}" title="{joindateISO}"></time></div>
		<div class="sl">[[user:joined]]</div>
	</div>
	<div class="dlh-stat-box">
		<div class="sv dlh-stat-time"><time class="timeago" datetime="{lastonlineISO}" title="{lastonlineISO}"></time></div>
		<div class="sl">[[user:lastonline]]</div>
	</div>
	{{{ if email }}}
	<div class="dlh-stat-box">
		<div class="sv dlh-stat-text">{email}</div>
		<div class="sl">[[user:email]] {{{ if emailHidden }}}([[global:hidden]]){{{ end }}}</div>
	</div>
	{{{ end }}}
	{{{ if age }}}
	<div class="dlh-stat-box">
		<div class="sv">{age}</div>
		<div class="sl">[[user:age]]</div>
	</div>
	{{{ end }}}
	{{{ each customUserFields }}}
	{{{ if ./value }}}
	<div class="dlh-stat-box">
		{{{ if (./type == "input-link") }}}
		<a class="sv dlh-stat-text" href="{./value}" rel="nofollow noreferrer">{./linkValue}</a>
		{{{ else }}}
		<div class="sv {{{ if (./type != "input-number") }}}dlh-stat-text{{{ end }}}">{./value}</div>
		{{{ end }}}
		<div class="sl">{./name}</div>
	</div>
	{{{ end }}}
	{{{ end }}}
</div>

<!-- IMPORT partials/account/footer.tpl -->
