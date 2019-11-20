require 'govuk_tech_docs'
require 'html-proofer'

GovukTechDocs::SourceUrls.class_eval do
  def report_issue_url
    "mailto:govuk-pay-support@digital.cabinet-office.gov.uk?subject=Problem with GOV.UK Pay technical documentation"
  end
end

GovukTechDocs.configure(self)

after_build do |builder|
  begin
    HTMLProofer.check_directory(config[:build_dir],
      { :assume_extension => true,
        :disable_external => true,
        :allow_hash_href => true,
        :url_ignore => [
          /.+-authentication/,
          /.+-before-you-start/,
          /.+-filtering-by-date/,
          /.+-set-up-3d-secure/,
          /.+-splitting-results-into-pages/,
          /.+-test-your-configuration/,
          /.+-the-gov-uk-pay-api/,
          /.+creating-a-refund-amount/,
          /.+creating-a-payment-amount/,
          /.+before-you-switch-to-live-support/,
          /.+support-2/
        ],
        :url_swap => { "https://docs.payments.service.gov.uk/" => "" } }).run
  rescue RuntimeError => e
    abort e.to_s
  end
end

redirect "payment_flow_overview/index.html", to: "payment_flow/index.html"
