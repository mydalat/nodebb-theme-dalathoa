<!DOCTYPE html>
<html lang="{function.localeToHTML, userLang, defaultLang}" {{{if languageDirection}}}data-dir="{languageDirection}" style="direction: {languageDirection};"{{{end}}}>
<head>
	<title>{browserTitle}</title>
	{{{each metaTags}}}{function.buildMetaTag}{{{end}}}
	<link rel="stylesheet" type="text/css" href="{relative_path}/assets/client{{{if bootswatchSkin}}}-{bootswatchSkin}{{{end}}}{{{ if (languageDirection=="rtl") }}}-rtl{{{ end }}}.css?{config.cache-buster}" />
	{{{each linkTags}}}{function.buildLinkTag}{{{end}}}

	<script>
		var config = JSON.parse('{{configJSON}}');
		var app = {
			user: JSON.parse('{{userJSON}}')
		};
		document.documentElement.style.setProperty('--panel-offset', '0px');
	</script>

	{{{if useCustomHTML}}}
	{{customHTML}}
	{{{end}}}
	{{{if useCustomCSS}}}
	<style>{{customCSS}}</style>
	{{{end}}}
</head>

<body class="{bodyClass} skin-{{{if bootswatchSkin}}}{bootswatchSkin}{{{else}}}noskin{{{end}}} dlh-body">

	<a class="visually-hidden-focusable position-absolute top-0 start-0 p-3 m-3 bg-body" style="z-index: 1021;" href="#content">[[global:skip-to-content]]</a>

	<!-- ═══ GARLAND ═══ -->
	<div class="dlh-gar" role="presentation"></div>

	<!-- ═══ NAVBAR ═══ -->
	<nav class="dlh-nav" component="navbar">
		<a class="dlh-nav-brand" href="{relative_path}/">
			<span class="brand-flower">🌸</span>
			{{{ if config.siteTitle }}}{config.siteTitle}{{{ else }}}Đà Lạt Hoa{{{ end }}}
		</a>
		<div class="spacer"></div>
		<div class="dlh-nav-tabs">
			<a class="dlh-nav-tab" href="{relative_path}/" data-dlh-tab="home">
				<span class="dlh-i dlh-i-18"><svg viewBox="0 0 24 24"><path d="M3 9l9-7 9 7v11a2 2 0 01-2 2H5a2 2 0 01-2-2z"/><polyline points="9 22 9 12 15 12 15 22"/></svg></span>
				Nhật ký
			</a>
			<a class="dlh-nav-tab" href="{relative_path}/recent" data-dlh-tab="recent">
				<span class="dlh-i dlh-i-18"><svg viewBox="0 0 24 24"><path d="M2 3h6a4 4 0 014 4v14a3 3 0 00-3-3H2z"/><path d="M22 3h-6a4 4 0 00-4 4v14a3 3 0 013-3h7z"/></svg></span>
				Bài viết
			</a>
			<a class="dlh-nav-tab" href="{relative_path}/categories" data-dlh-tab="categories">
				<span class="dlh-i dlh-i-18"><svg viewBox="0 0 24 24"><path d="M4 19.5A2.5 2.5 0 016.5 17H20"/><path d="M6.5 2H20v20H6.5A2.5 2.5 0 014 19.5v-15A2.5 2.5 0 016.5 2z"/></svg></span>
				Chương
			</a>
			{{{ if config.loggedIn }}}
			<a class="dlh-nav-tab" href="{relative_path}/user/{user.userslug}" data-dlh-tab="profile">
				<span class="dlh-i dlh-i-18"><svg viewBox="0 0 24 24"><path d="M17 3a2.83 2.83 0 114 4L7.5 20.5 2 22l1.5-5.5z"/></svg></span>
				Tác giả
			</a>
			{{{ end }}}
		</div>
		<div class="spacer"></div>
		<div class="dlh-nav-r">
			{{{ if config.loggedIn }}}
			<button class="dlh-btn-write" component="composer/new-topic">
				<span class="dlh-i dlh-i-16"><svg viewBox="0 0 24 24"><path d="M12 5v14M5 12h14"/></svg></span>
				Viết mới
			</button>
			{{{ end }}}

			{{{ if config.searchEnabled }}}
			<a class="dlh-nav-ic" href="{relative_path}/search" title="[[global:search]]">
				<span class="dlh-i dlh-i-18"><svg viewBox="0 0 24 24"><circle cx="11" cy="11" r="8"/><line x1="21" y1="21" x2="16.65" y2="16.65"/></svg></span>
			</a>
			{{{ end }}}

			{{{ if config.loggedIn }}}
			<a component="notifications/icon" class="dlh-nav-ic" href="{relative_path}/notifications" title="[[global:header.notifications]]">
				<span class="dlh-i dlh-i-18"><svg viewBox="0 0 24 24"><path d="M18 8A6 6 0 006 8c0 7-3 9-3 9h18s-3-2-3-9"/><path d="M13.73 21a2 2 0 01-3.46 0"/></svg></span>
				<span component="notifications/count" class="dlh-badge {{{ if !unreadCount.notification }}}hidden{{{ end }}}">{unreadCount.notification}</span>
			</a>
			{{{ end }}}

			{{{ if config.loggedIn }}}
			<a class="dlh-nav-av" href="{relative_path}/user/{user.userslug}" title="{user.username}">
				{{{ if user.picture }}}
				<img src="{user.picture}" alt="{user.username}" style="width:32px;height:32px;border-radius:50%;object-fit:cover;" />
				{{{ else }}}
				{user.icon.text}
				{{{ end }}}
			</a>
			{{{ else }}}
			<a class="dlh-nav-ic" href="{relative_path}/login" title="[[global:login]]">
				<span class="dlh-i dlh-i-18"><svg viewBox="0 0 24 24"><path d="M15 3h4a2 2 0 012 2v14a2 2 0 01-2 2h-4"/><polyline points="10 17 15 12 10 7"/><line x1="15" y1="12" x2="3" y2="12"/></svg></span>
			</a>
			{{{ end }}}
		</div>
	</nav>

	<!-- ═══ MAIN LAYOUT ═══ -->
	<div class="d-flex flex-column flex-grow-1" style="min-width: 0;">
		<main id="panel" class="d-flex flex-column flex-grow-1">
			<div class="dlh-wrap" id="content">
			<!-- IMPORT partials/noscript/warning.tpl -->
			<!-- IMPORT partials/noscript/message.tpl -->
