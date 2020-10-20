require 'govuk_tech_docs'
require 'html-proofer'
require 'fileutils'

GovukTechDocs::SourceUrls.class_eval do
  def report_issue_url
    "mailto:govuk-pay-support@digital.cabinet-office.gov.uk?subject=Problem with GOV.UK Pay technical documentation"
  end
end

GovukTechDocs.configure(self)

redirect "payment_flow_overview/index.html", to: "payment_flow/index.html"

sprockets.append_path File.join root, "node_modules"
after_configuration do
  FileUtils.mkdir_p 'node_modules/@govuk-pay/pay-js-commons/lib/analytics/dist'
  FileUtils.mkdir_p 'node_modules/govuk-frontend/govuk/components/button'
  FileUtils.touch 'node_modules/govuk-frontend/govuk/components/button/_button.scss'
end
