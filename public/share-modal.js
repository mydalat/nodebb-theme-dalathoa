'use strict';

/*
 * Đà Lạt Hoa — Share Modal (bottom sheet)
 * Opens a share sheet with social platform buttons and a copy-link row.
 */

$(document).ready(function () {
	var PLATFORMS = [
		{
			key: 'facebook',
			label: 'Facebook',
			icon: '<svg viewBox="0 0 24 24" fill="#fff"><path d="M18 2h-3a5 5 0 00-5 5v3H7v4h3v8h4v-8h3l1-4h-4V7a1 1 0 011-1h3z"/></svg>',
			getUrl: function (u) { return 'https://www.facebook.com/sharer/sharer.php?u=' + encodeURIComponent(u); },
		},
		{
			key: 'zalo',
			label: 'Zalo',
			icon: '<svg viewBox="0 0 24 24"><text y="17" x="3" font-size="13" font-weight="bold" fill="#fff" font-family="sans-serif">Za</text></svg>',
			getUrl: function (u) { return 'https://zalo.me/share/url?url=' + encodeURIComponent(u); },
		},
		{
			key: 'messenger',
			label: 'Messenger',
			icon: '<svg viewBox="0 0 24 24" fill="#fff"><path d="M12 2C6.477 2 2 6.145 2 11.259c0 2.82 1.32 5.338 3.4 7.036V22l3.198-1.75A11.16 11.16 0 0012 20.518c5.523 0 10-4.145 10-9.259S17.523 2 12 2zm1.006 12.47l-2.548-2.715-4.973 2.715 5.474-5.81 2.61 2.715 4.91-2.715-5.473 5.81z"/></svg>',
			getUrl: function (u) {
				return 'https://www.facebook.com/dialog/send?link=' + encodeURIComponent(u) +
					'&app_id=291494419107518&redirect_uri=' + encodeURIComponent(u);
			},
		},
		{
			key: 'twitter',
			label: 'X (Twitter)',
			icon: '<svg viewBox="0 0 24 24" fill="#fff"><path d="M18.244 2.25h3.308l-7.227 8.26 8.502 11.24H16.17l-5.214-6.817L4.99 21.75H1.68l7.73-8.835L1.254 2.25H8.08l4.713 6.231zm-1.161 17.52h1.833L7.084 4.126H5.117z"/></svg>',
			getUrl: function (u) { return 'https://twitter.com/intent/tweet?url=' + encodeURIComponent(u); },
		},
	];

	function buildGrid(pageUrl) {
		var $grid = $('#dlh-share-modal .dlh-share-grid').empty();
		PLATFORMS.forEach(function (p) {
			var $btn = $('<button class="dlh-share-btn" type="button"></button>')
				.attr('data-share', p.key)
				.html('<span class="dlh-share-btn-icon">' + p.icon + '</span><span>' + p.label + '</span>');
			$btn.on('click', function () {
				window.open(p.getUrl(pageUrl), '_blank', 'noopener,width=600,height=480');
			});
			$grid.append($btn);
		});
		$('#dlh-share-modal .dlh-share-link-url').text(pageUrl);
	}

	function closeShare() {
		$('#dlh-share-overlay').removeClass('dlh-share-overlay-visible');
		$('#dlh-share-modal').removeClass('dlh-share-modal-visible');
	}

	window.dlhOpenShare = function () {
		var pageUrl = window.location.href;
		buildGrid(pageUrl);
		$('#dlh-share-overlay').addClass('dlh-share-overlay-visible');
		$('#dlh-share-modal').addClass('dlh-share-modal-visible');
	};

	$(document).on('click', '#dlh-share-overlay', closeShare);

	$(document).on('click', '#dlh-share-modal .dlh-share-link-copy', function () {
		var url = window.location.href;
		var $btn = $(this);
		if (navigator.clipboard && navigator.clipboard.writeText) {
			navigator.clipboard.writeText(url).then(function () {
				$btn.text('Đã sao chép!');
				setTimeout(function () { $btn.text('Sao chép'); }, 2000);
			}).catch(function () {});
		} else {
			// Fallback for older browsers
			var $tmp = $('<input>').val(url).appendTo('body').select();
			try { document.execCommand('copy'); } catch (e) {}
			$tmp.remove();
			$btn.text('Đã sao chép!');
			setTimeout(function () { $btn.text('Sao chép'); }, 2000);
		}
	});

	// Trigger from any element with data-dlh-action="share" or .dlh-share-trigger
	$(document).on('click', '[data-dlh-action="share"], .dlh-share-trigger', function (e) {
		e.preventDefault();
		window.dlhOpenShare();
	});

	$(window).on('action:ajaxify.end', closeShare);
});
