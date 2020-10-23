//= require govuk_tech_docs
//= require analytics
//= require_directory ../../node_modules/@govuk-pay/pay-js-commons/lib/analytics/dist/

window.addEventListener('DOMContentLoaded', function() {
  if (window.GovUkPay) {
    //TODO - Disabling the banner for now, will reinstate in later
    //once the code for checking the consent cookie and executing the analytics
    // has been deployed. 
    // window.GovUkPay.cookies.showBannerIfConsentNotSet(loadGoogleAnalytics)

    if (window.GovUkPay.cookies.hasAnalyticsConsent()) {
      window.initialiseGoogleAnalytics()
    }
  }
})

