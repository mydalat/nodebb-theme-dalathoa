'use strict';

/*
 * Đà Lạt Hoa — Client JS
 * Travel Journal Theme for NodeBB
 */

$(document).ready(function () {
	// ═══ BOTTOM NAV — Active tab tracking ═══
	function updateBottomNav() {
		var url = ajaxify.data.url || window.location.pathname.replace(config.relative_path, '');
		var $items = $('[component="dlh/bottom-nav"] .dlh-bottom-nav-item');
		$items.removeClass('on');

		var tab = 'home';
		if (/^categories/.test(url) || /^category\//.test(url)) {
			tab = 'categories';
		} else if (/^search/.test(url)) {
			tab = 'search';
		} else if (/^notifications/.test(url)) {
			tab = 'notifications';
		} else if (/^user\//.test(url)) {
			tab = 'profile';
		} else if (/^login/.test(url) || /^register/.test(url)) {
			tab = 'login';
		}

		$items.filter('[data-dlh-tab="' + tab + '"]').addClass('on');
	}

	// ═══ DESKTOP NAV — Active tab tracking ═══
	function updateDesktopNav() {
		var url = ajaxify.data.url || window.location.pathname.replace(config.relative_path, '');
		var $tabs = $('.dlh-nav-tab');
		$tabs.removeClass('on');

		var tab = 'home';
		if (/^recent/.test(url)) {
			tab = 'recent';
		} else if (/^categories/.test(url) || /^category\//.test(url)) {
			tab = 'categories';
		} else if (/^user\//.test(url)) {
			tab = 'profile';
		}

		$tabs.filter('[data-dlh-tab="' + tab + '"]').addClass('on');
	}

	// ═══ FAB — Open composer ═══
	$(document).on('click', '[component="dlh/fab"]', function () {
		// Trigger NodeBB's new topic composer
		var cid = ajaxify.data.cid || 0;
		if (cid) {
			require(['composer'], function (composer) {
				composer.newTopic({ cid: cid });
			});
		} else {
			require(['composer'], function (composer) {
				composer.newTopic({});
			});
		}
	});

	// ═══ BACK TO TOP ═══
	var $btt = $('#dlh-btt');
	var lastScrollY = 0;
	var ticking = false;

	function onScroll() {
		lastScrollY = window.scrollY;
		if (!ticking) {
			window.requestAnimationFrame(function () {
				if (lastScrollY > 400) {
					$btt.addClass('show');
				} else {
					$btt.removeClass('show');
				}
				ticking = false;
			});
			ticking = true;
		}
	}

	window.addEventListener('scroll', onScroll, { passive: true });

	$btt.on('click', function () {
		window.scrollTo({ top: 0, behavior: 'smooth' });
	});

	// ═══ AUTO-HIDE NAVBAR on scroll down (mobile only) ═══
	var navLastScrollTop = 0;
	var $navbar = $('.dlh-nav');
	window.addEventListener('scroll', function () {
		if (window.innerWidth >= 768) { return; }
		var st = window.scrollY;
		if (st > navLastScrollTop && st > 56) {
			$navbar.addClass('dlh-nav-hidden');
		} else {
			$navbar.removeClass('dlh-nav-hidden');
		}
		navLastScrollTop = st;
	}, { passive: true });

	// ═══ SWIPE ACTIONS on topic rows (mobile) ═══
	var swipeThreshold = 60;
	var swipeStartX = 0;
	var swipeCurrentX = 0;
	var $swipeTarget = null;

	$(document).on('touchstart', '.dlh-tr', function (e) {
		if (window.innerWidth >= 768) { return; }
		swipeStartX = e.originalEvent.touches[0].clientX;
		$swipeTarget = $(this);
	});

	$(document).on('touchmove', '.dlh-tr', function (e) {
		if (!$swipeTarget) { return; }
		swipeCurrentX = e.originalEvent.touches[0].clientX;
		var dx = swipeCurrentX - swipeStartX;
		var $wrap = $swipeTarget.closest('.dlh-tr-wrap');

		if (Math.abs(dx) > 10) {
			$swipeTarget.css('transform', 'translateX(' + dx + 'px)');
			$wrap.toggleClass('swiping-left', dx > swipeThreshold);
			$wrap.toggleClass('swiping-right', dx < -swipeThreshold);
		}
	});

	$(document).on('touchend', '.dlh-tr', function () {
		if (!$swipeTarget) { return; }
		var dx = swipeCurrentX - swipeStartX;
		var $wrap = $swipeTarget.closest('.dlh-tr-wrap');
		var tid = $wrap.attr('data-tid');

		if (dx > swipeThreshold && tid) {
			// Swipe right → bookmark
			require(['api'], function (api) {
				api.put('/topics/' + tid + '/bookmark');
			});
		} else if (dx < -swipeThreshold && tid) {
			// Swipe left → mark as read
			require(['api'], function (api) {
				api.put('/topics/' + tid + '/read');
			});
		}

		// Reset position
		$swipeTarget.css('transform', '');
		$wrap.removeClass('swiping-left swiping-right');
		$swipeTarget = null;
		swipeCurrentX = 0;
	});

	// ═══ PULL TO REFRESH ═══
	var pullStartY = 0;
	var pulling = false;

	document.addEventListener('touchstart', function (e) {
		if (window.scrollY === 0) {
			pullStartY = e.touches[0].clientY;
			pulling = true;
		}
	}, { passive: true });

	document.addEventListener('touchmove', function (e) {
		if (!pulling) { return; }
		var pullDistance = e.touches[0].clientY - pullStartY;
		if (pullDistance > 80 && window.scrollY === 0) {
			pulling = false;
			ajaxify.refresh();
		}
	}, { passive: true });

	document.addEventListener('touchend', function () {
		pulling = false;
	}, { passive: true });

	// ═══ STATS — Populate hero stats via NodeBB global config ═══
	function updateStats() {
		if (ajaxify.data && ajaxify.data.template && ajaxify.data.template.name === 'recent') {
			// Use socket to get global stats (no admin auth required)
			require(['api'], function (api) {
				api.get('/admin/dashboard', {}).then(function (data) {
					if (data && data.stats) {
						$('[component="dlh/stat-users"]').text(data.stats.users || '—');
						$('[component="dlh/stat-topics"]').text(data.stats.topics || '—');
						$('[component="dlh/stat-posts"]').text(data.stats.posts || '—');
					}
				}).catch(function () {
					// Fallback: use config if available
					if (ajaxify.data.topicCount !== undefined) {
						$('[component="dlh/stat-topics"]').text(ajaxify.data.topicCount);
					}
				});
			});
		}
	}

	// ═══ GARLAND — Show only in December–January (holiday season) ═══
	function updateGarland() {
		var month = new Date().getMonth(); // 0-indexed
		var $gar = $('.dlh-gar');
		if (month !== 11 && month !== 0) {
			$gar.hide();
		}
	}

	// ═══ FONT SIZE TOGGLE — Persist via localStorage ═══
	function initFontSize() {
		var saved = localStorage.getItem('dlh-font-size');
		if (saved) {
			document.body.classList.remove('dlh-fs-small', 'dlh-fs-large', 'dlh-fs-xlarge');
			if (saved !== 'default') {
				document.body.classList.add(saved);
			}
		}
	}

	// Expose globally for inline onclick handlers
	window.dlhSetFontSize = function (cls) {
		document.body.classList.remove('dlh-fs-small', 'dlh-fs-large', 'dlh-fs-xlarge');
		if (cls) {
			document.body.classList.add(cls);
		}
		localStorage.setItem('dlh-font-size', cls || 'default');
	};

	// ═══ TAB BAR — Toggle NodeBB filter dropdowns ═══
	$(document).on('click', '.dlh-tb-b', function (e) {
		var $btn = $(this);
		var action = $btn.data('dlh-action');

		$('.dlh-tb-b').removeClass('on');
		$btn.addClass('on');

		if (action === 'dropdown') {
			// Find the original NodeBB dropdown-toggle inside the same wrapper
			var $wrapper = $btn.closest('.dlh-tb-dd');
			var $toggle = $wrapper.find('.dropdown-toggle').first();
			if ($toggle.length) {
				e.stopPropagation();
				// Use Bootstrap 5 dropdown API
				var dd = bootstrap.Dropdown.getOrCreateInstance($toggle[0]);
				dd.toggle();
			}
		} else if (action === 'reset') {
			// "Tất cả" — reload current page without filters
			ajaxify.go('recent');
		}
	});

	// ═══ DATE FORMAT — Vietnamese relative + absolute dates ═══
	function formatDates() {
		$('.timeago').each(function () {
			var $el = $(this);
			var iso = $el.attr('title');
			if (!iso) { return; }
			var date = new Date(iso);
			if (isNaN(date.getTime())) { return; }
			var now = new Date();
			var diffMs = now - date;
			var diffDays = Math.floor(diffMs / (1000 * 60 * 60 * 24));
			var text;
			if (diffMs < 60000) {
				text = 'vừa xong';
			} else if (diffMs < 3600000) {
				var mins = Math.floor(diffMs / 60000);
				text = mins + ' phút trước';
			} else if (diffMs < 86400000) {
				var hrs = Math.floor(diffMs / 3600000);
				text = hrs + ' giờ trước';
			} else if (diffDays < 7) {
				text = diffDays + ' ngày trước';
			} else {
				var d = date.getDate();
				var m = date.getMonth() + 1;
				var y = date.getFullYear();
				text = d + ' thg ' + m + ', ' + y;
			}
			$el.text(text);
		});
	}

	// ═══ TIMEAGO — Vietnamese locale + re-init ═══
	function initTimeago() {
		formatDates();
		if (typeof jQuery !== 'undefined' && jQuery.timeago) {
			if (!jQuery.timeago.settings._dlhLocaleSet) {
				jQuery.timeago.settings.strings = {
					prefixAgo: null, prefixFromNow: null,
					suffixAgo: 'trước', suffixFromNow: 'từ bây giờ',
					seconds: 'vừa xong', minute: '1 phút', minutes: '%d phút',
					hour: '1 giờ', hours: '%d giờ',
					day: '1 ngày', days: '%d ngày',
					month: '1 tháng', months: '%d tháng',
					year: '1 năm', years: '%d năm',
					wordSeparator: ' ', numbers: [],
				};
				jQuery.timeago.settings.cutoff = 0; // Always show relative time
				jQuery.timeago.settings._dlhLocaleSet = true;
			}
			jQuery('.timeago').timeago();
		}
	}

	// ═══ COMPACT NUMBERS — Format 1500 → 1.5K ═══
	function formatCompactNumbers() {
		$('.dlh-tr-m b').each(function () {
			var $el = $(this);
			var num = parseInt($el.text(), 10);
			if (!isNaN(num) && num >= 1000) {
				var compact = num >= 1000000
					? (num / 1000000).toFixed(1).replace(/\.0$/, '') + 'M'
					: (num / 1000).toFixed(1).replace(/\.0$/, '') + 'K';
				$el.text(compact);
			}
		});
	}

	// ═══ INIT + PAGE CHANGE ═══
	$(window).on('action:ajaxify.end', function () {
		updateBottomNav();
		updateDesktopNav();
		updateStats();
		initFontSize();
		initTimeago();
		formatCompactNumbers();
	});

	// Initial state
	updateBottomNav();
	updateDesktopNav();
	updateStats();
	updateGarland();
	initFontSize();
	initTimeago();
	formatCompactNumbers();
});
