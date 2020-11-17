/**
 * Load and configure google analytics, managed independently from the core
 * tech docs gem to allow running it exclusively based on custom
 * payments.service.gov.uk analytics consent rules.
 */
function initialiseGoogleAnalytics() {
  loadGoogleAnalytics()
}

/**
 * Allow only fetching files from Google if consent has been provided by the
 * user.
 * Forked from https://github.com/alphagov/tech-docs-gem/blob/90b6ac06e79aa155592f6ffe08d522b922483c6c/lib/source/layouts/_analytics.erb
 */
function loadGoogleAnalytics() {
	(function(i,s,o,g,r,a,m){i['GoogleAnalyticsObject']=r;i[r]=i[r]||function(){
  (i[r].q=i[r].q||[]).push(arguments)},i[r].l=1*new Date();a=s.createElement(o),
  m=s.getElementsByTagName(o)[0];a.async=1;a.src=g;m.parentNode.insertBefore(a,m)
  })(window,document,'script','https://www.google-analytics.com/analytics.js','ga');

  ga('create', 'UA-72121642-9', 'auto');
  ga('set', 'anonymizeIp', true);
  ga('set', 'displayFeaturesTask', null);
  ga('set', 'transport', 'beacon');
  ga('set', 'page', location.pathname+location.search+location.hash);
  ga('send', 'pageview');

	configureGoogleAnalytics(jQuery)
}

/**
 * Customise Google Analytics for the tech docs format, only configured provided
 * user consent and fetched analytics files from Google.
 * Forked from https://github.com/alphagov/tech-docs-gem/blob/f28d9dced2fbc0bc7d221ed82f696b81c958a03e/lib/assets/javascripts/_analytics.js
 */
function configureGoogleAnalytics($) {
	function trackLinkClick (action, $element) {
    var linkText = $.trim($element.text())
    var linkURL = $element.attr('href')
    var label = linkText + '|' + linkURL

    ga(
      'send',
      'event',
      'SM Technical Documentation', // Event Category
      action, // Event Action
      label // Event Label
    )
  }

  function linkTrackingEventHandler (action) {
    return function () {
      trackLinkClick(action, $(this))
    }
  }

  function catchBrokenFragmentLinks () {
    var fragment = window.location.hash
    var $target = $(fragment)
    if (!$target.get(0)) {
      ga(
        'send',
        'event',
        'Broken fragment ID', // Event Category
        'pageview', // Event Action
        window.location.pathname + fragment // Event Label
      )
    }
  }

  $(document).on('ready', function () {
    if (typeof ga === 'undefined') {
      return
    }

    $('.technical-documentation a').on('click', linkTrackingEventHandler('inTextClick'))
    $('.header a').on('click', linkTrackingEventHandler('topNavigationClick'))
    $('.toc a').on('click', linkTrackingEventHandler('tableOfContentsNavigationClick'))
    catchBrokenFragmentLinks()

    // Borrowed from:
    // https://github.com/alphagov/govuk_frontend_toolkit/blob/master/javascripts/govuk/analytics/analytics.js
    window.stripPIIFromString = function (string) {
      var EMAIL_PATTERN = /[^\s=/?&]+(?:@|%40)[^\s=/?&]+/g
      var POSTCODE_PATTERN = /[A-PR-UWYZ][A-HJ-Z]?[0-9][0-9A-HJKMNPR-Y]?(?:[\s+]|%20)*[0-9][ABD-HJLNPQ-Z]{2}/gi
      var DATE_PATTERN = /\d{4}(-?)\d{2}(-?)\d{2}/g
      var stripped = string.replace(EMAIL_PATTERN, '[email]')
        .replace(DATE_PATTERN, '[date]')
        .replace(POSTCODE_PATTERN, '[postcode]')
      return stripped
    }
  })
}

window.initialiseGoogleAnalytics = initialiseGoogleAnalytics
