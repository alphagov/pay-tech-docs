require 'govuk_tech_docs'
require 'html-proofer'

GovukTechDocs::SourceUrls.class_eval do
  def report_issue_url
    "mailto:govuk-pay-support@digital.cabinet-office.gov.uk?subject=Problem with GOV.UK Pay technical documentation"
  end
end

GovukTechDocs.configure(self)

redirect "payment_flow_overview/index.html", to: "payment_flow/index.html"
