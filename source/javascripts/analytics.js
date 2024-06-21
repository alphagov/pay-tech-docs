/**
 * Load and configure google analytics (GA4), managed independently from the core
 * tech docs gem to allow running it exclusively based on custom
 * payments.service.gov.uk analytics consent rules.
 */


function initialiseGtag() {
    var gtagScript = document.createElement('script')
    gtagScript.async = true
    gtagScript.setAttribute('src', 'https://www.googletagmanager.com/gtag/js?id=G-XE9K05CFFE')
    document.head.appendChild(gtagScript)

    window.dataLayer = window.dataLayer || [];

    function gtag() {
        dataLayer.push(arguments);
    }

    gtagScript.onload = function () {
        gtag('js', new Date());
        gtag('config', 'G-XE9K05CFFE');
    }
}

window.initialiseGtag = initialiseGtag
