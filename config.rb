require 'govuk_tech_docs'
require 'html-proofer'
require 'fileutils'

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
        :empty_alt_ignore => true,
        :log_level => ':debug',
        :url_ignore => [
          /.+-authentication/,
          /.+-before-you-start/,
          /.+-filtering-by-date/,
          /.+-set-up-3d-secure/,
          /.+-splitting-results-into-pages/,
          /.+-copy-your-details-into-your-gov-uk-pay-account/,
          /.+-set-up-notification-settings/,
          /.+-test-your-configuration/,
          /.+-set-up-an-api-user/,
          /.+-the-gov-uk-pay-api/,
          /.+creating-a-refund-amount/,
          /.+creating-a-payment-amount/,
          /.+before-you-switch-to-live-support/,
          /.+support-2/,
          /.+set-the-payment-capture-method/
        ],
        :url_swap => { "https://docs.payments.service.gov.uk" => "" } }).run
  rescue RuntimeError => e
    abort e.to_s
  end
end

redirect "payment_flow_overview/index.html", to: "payment_flow/index.html"

# Expose external assets (common analytics files) to to sprockets loader
sprockets.append_path File.join root, "node_modules"

# All linked assets referenced by sprockets have to exist or they will throw
# LoadFile errors during the build process. In order to allow developers to work
# on the project without installing additional (npm) shared client side JavaScripts
# ensure all of the directories required for the common analytics code exists at
# build time
after_configuration do
  FileUtils.mkdir_p 'node_modules/@govuk-pay/pay-js-commons/lib/analytics/dist'
  FileUtils.mkdir_p 'node_modules/govuk-frontend/govuk/components/button'
  FileUtils.touch 'node_modules/govuk-frontend/govuk/components/button/_button.scss'
end
