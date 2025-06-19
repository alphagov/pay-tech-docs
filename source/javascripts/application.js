//= require govuk_tech_docs
//= require analytics
//= require_directory ../../node_modules/@govuk-pay/pay-js-commons/lib/analytics/dist/

window.addEventListener('DOMContentLoaded', function() {
  if (window.GovUkPay) {
    window.GovUkPay.cookies.showBannerIfConsentNotSet(window.initialiseGtag)

    if (window.GovUkPay.cookies.hasAnalyticsConsent()) {
      window.initialiseGtag()
    }
  }
})

