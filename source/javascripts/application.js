//= require govuk_tech_docs
//= require_directory ../../node_modules/@govuk-pay/pay-js-commons/lib/analytics/dist/

if (window.GovUkPay) {
  window.GovUkPay.cookies.showBannerIfConsentNotSet()
}
