'use strict';

/*
 * Đà Lạt Hoa — User Card Popup
 * Fetches user data from NodeBB API and shows a floating card near click position.
 */

$(document).ready(function () {
	var $usercard = null;
	var usercardCache = {};

	function getCard() {
		if (!$usercard || !$usercard.length) {
			$usercard = $('#dlh-usercard');
		}
		return $usercard;
	}

	function positionUsercard(x, y) {
		var $c = getCard();
		if (!$c.length) { return; }
		var cardW = 260;
		var cardH = $c.outerHeight() || 220;
		var vw = window.innerWidth;
		var vh = window.innerHeight;
		var left = x + 12;
		var top = y + 12;
		if (left + cardW > vw - 8) { left = x - cardW - 8; }
		if (top + cardH > vh - 8) { top = vh - cardH - 8; }
		if (left < 8) { left = 8; }
		if (top < 8) { top = 8; }
		$c.css({ left: left + 'px', top: top + 'px' });
	}

	function populate(u, userslug, x, y) {
		var $c = getCard();
		var avatarSrc = u.picture || '';
		var topHtml = (avatarSrc ? '<img class="dlh-usercard-avatar" src="' + avatarSrc + '" alt="">' : '') +
			'<div class="dlh-usercard-info">' +
			'<div class="dlh-usercard-name">' + (u.username || '') + '</div>' +
			'<div class="dlh-usercard-role">' + (u.groupTitle || '') + '</div>' +
			'</div>';
		$c.find('.dlh-usercard-top').html(topHtml);

		var bio = u.aboutme || u.signature || '';
		$c.find('.dlh-usercard-bio').text(bio).toggle(!!bio);

		var statsHtml =
			'<div class="dlh-usercard-stat">' +
			'<span class="dlh-usercard-stat-val">' + (u.postcount || 0) + '</span>' +
			'<span class="dlh-usercard-stat-lbl">Bài</span></div>' +
			'<div class="dlh-usercard-stat">' +
			'<span class="dlh-usercard-stat-val">' + (u.topiccount || 0) + '</span>' +
			'<span class="dlh-usercard-stat-lbl">Chủ đề</span></div>' +
			'<div class="dlh-usercard-stat">' +
			'<span class="dlh-usercard-stat-val">' + (u.reputation || 0) + '</span>' +
			'<span class="dlh-usercard-stat-lbl">Điểm</span></div>';
		$c.find('.dlh-usercard-stats').html(statsHtml);

		var profileUrl = config.relative_path + '/user/' + userslug;
		var msgUrl = config.loggedIn
			? config.relative_path + '/chats/' + userslug
			: config.relative_path + '/login';
		$c.find('.dlh-usercard-btn-pri').attr('href', msgUrl);
		$c.find('.dlh-usercard-btn-view').attr('href', profileUrl);

		positionUsercard(x, y);
		$c.addClass('dlh-usercard-visible');
	}

	function showUsercard(userslug, x, y) {
		if (usercardCache[userslug]) {
			populate(usercardCache[userslug], userslug, x, y);
			return;
		}
		require(['api'], function (api) {
			api.get('/user/userslug/' + userslug, {}).then(function (data) {
				if (data) {
					usercardCache[userslug] = data;
					populate(data, userslug, x, y);
				}
			}).catch(function () {});
		});
	}

	window.dlhHideUsercard = function () {
		getCard().removeClass('dlh-usercard-visible');
	};

	$(document).on('click', '.dlh-post-name', function (e) {
		e.preventDefault();
		var userslug = $(this).attr('data-userslug') ||
			$(this).closest('[data-userslug]').attr('data-userslug');
		if (!userslug) { return; }
		showUsercard(userslug, e.clientX, e.clientY);
	});

	$(document).on('click', function (e) {
		if (!getCard().hasClass('dlh-usercard-visible')) { return; }
		if (!$(e.target).closest('#dlh-usercard, .dlh-post-name').length) {
			window.dlhHideUsercard();
		}
	});

	$(window).on('action:ajaxify.end', function () {
		window.dlhHideUsercard();
		$usercard = null;
	});
});
