			</div><!-- /.dlh-wrap#content -->
		</main>
	</div>

	<!-- ═══ BOTTOM NAV (Mobile) ═══ -->
	<nav class="dlh-bottom-nav" component="dlh/bottom-nav">
		<a class="dlh-bottom-nav-item" href="{relative_path}/" data-dlh-tab="home">
			<span class="dlh-i dlh-i-20"><svg viewBox="0 0 24 24"><path d="M3 9l9-7 9 7v11a2 2 0 01-2 2H5a2 2 0 01-2-2z"/><polyline points="9 22 9 12 15 12 15 22"/></svg></span>
			Nhật ký
		</a>
		<a class="dlh-bottom-nav-item" href="{relative_path}/categories" data-dlh-tab="categories">
			<span class="dlh-i dlh-i-20"><svg viewBox="0 0 24 24"><path d="M4 19.5A2.5 2.5 0 016.5 17H20"/><path d="M6.5 2H20v20H6.5A2.5 2.5 0 014 19.5v-15A2.5 2.5 0 016.5 2z"/></svg></span>
			Chương
		</a>
		{{{ if config.searchEnabled }}}
		<a class="dlh-bottom-nav-item" href="{relative_path}/search" data-dlh-tab="search">
			<span class="dlh-i dlh-i-20"><svg viewBox="0 0 24 24"><circle cx="11" cy="11" r="8"/><line x1="21" y1="21" x2="16.65" y2="16.65"/></svg></span>
			Tìm
		</a>
		{{{ end }}}
		{{{ if config.loggedIn }}}
		<a component="notifications/icon" class="dlh-bottom-nav-item" href="{relative_path}/notifications" data-dlh-tab="notifications">
			<span class="dlh-i dlh-i-20"><svg viewBox="0 0 24 24"><path d="M18 8A6 6 0 006 8c0 7-3 9-3 9h18s-3-2-3-9"/><path d="M13.73 21a2 2 0 01-3.46 0"/></svg></span>
			Báo
			<span component="notifications/count" class="dlh-bnb {{{ if !unreadCount.notification }}}hidden{{{ end }}}"></span>
		</a>
		<a class="dlh-bottom-nav-item" href="{relative_path}/user/{user.userslug}" data-dlh-tab="profile">
			<span class="dlh-i dlh-i-20"><svg viewBox="0 0 24 24"><path d="M20 21v-2a4 4 0 00-4-4H8a4 4 0 00-4 4v2"/><circle cx="12" cy="7" r="4"/></svg></span>
			Tôi
		</a>
		{{{ else }}}
		<a class="dlh-bottom-nav-item" href="{relative_path}/login" data-dlh-tab="login">
			<span class="dlh-i dlh-i-20"><svg viewBox="0 0 24 24"><path d="M15 3h4a2 2 0 012 2v14a2 2 0 01-2 2h-4"/><polyline points="10 17 15 12 10 7"/><line x1="15" y1="12" x2="3" y2="12"/></svg></span>
			Đăng nhập
		</a>
		{{{ end }}}
	</nav>

	<!-- ═══ FAB (Mobile) ═══ -->
	{{{ if config.loggedIn }}}
	<button class="dlh-fab" component="dlh/fab" title="Viết mới">
		<span class="dlh-i dlh-i-22"><svg viewBox="0 0 24 24"><path d="M17 3a2.83 2.83 0 114 4L7.5 20.5 2 22l1.5-5.5z"/></svg></span>
	</button>
	{{{ end }}}

	<!-- ═══ BACK TO TOP ═══ -->
	<button class="dlh-btt" id="dlh-btt" title="Lên đầu trang">
		<span class="dlh-i dlh-i-18"><svg viewBox="0 0 24 24"><polyline points="18 15 12 9 6 15"/></svg></span>
	</button>

	<!-- ═══ TOAST ═══ -->
	{{{ if !isSpider }}}
	<div>
		<div component="toaster/tray" class="alert-window fixed-bottom mb-5 mb-md-2 me-2 me-md-5 ms-auto" style="width:300px; z-index: 1090;">
			<!-- IMPORT partials/reconnect-alert.tpl -->
		</div>
	</div>
	{{{ end }}}

	<!-- ═══ SIGNOFF ═══ -->
	<div class="dlh-signoff">
		<div class="dlh-signoff-title">Hết trang — {{{ if config.siteTitle }}}{config.siteTitle}{{{ else }}}Đà Lạt Hoa{{{ end }}}</div>
		<div class="dlh-signoff-sub">Nhật ký cộng đồng · Powered by NodeBB</div>
	</div>

	<!-- IMPORT partials/footer/js.tpl -->
</body>
</html>
