# Contribute

GOV.UK Pay's main application code is public and freely available under an [MIT Licence](https://en.wikipedia.org/wiki/MIT_License) and the GOV.UK Pay team [codes in the open](https://gds.blog.gov.uk/2012/10/12/coding-in-the-open/) in our [GitHub account](https://github.com/alphagov?q=pay-).

We are experimenting with taking in Open Source contributions from our live partner services and we hope to widen this further  after learning more about integrating outside contributions into our workflow.

>If you’d like to speak to us about writing a developer library for GOV.UK Pay, we’d love to hear from you: please [email us](mailto:govuk-pay-support@digital.cabinet-office.gov.uk)

## Key Open Source components

| Name | Description | Use |
| --- | --- | --- |
| [pay-adminusers](https://github.com/alphagov/pay-adminusers) | GOV.UK Pay identity and service management component. | Used by pay-selfservice to allow users authenticate and configure GOV.UK Pay. |
| [pay-cardid](https://github.com/alphagov/pay-cardid) | GOV.UK Pay Card Type Identification Service. | Used by pay-frontend validate card details and autocomplete card brand. |
| [pay-connector](https://github.com/alphagov/pay-connector) | GOV.UK Pay payments connector. | Used by other services to configure payment gateways and handle transactions. |
| [pay-frontend](https://github.com/alphagov/pay-frontend) | GOV.UK Pay frontend payments application. | Used to collect payment details from our users. |
| [pay-publicapi](https://github.com/alphagov/pay-publicapi) | GOV.UK Pay public API endpoint. | Used by partner services to manage a payment, report and configure their account. |
| [pay-publicauth](https://github.com/alphagov/pay-publicauth) | GOV.UK Pay API authentication service. | Used by pay-publicapi to validate API tokens and by pay-selfservice to mange API tokens. |
| [pay-selfservice](https://github.com/alphagov/pay-selfservice) | GOV.UK Pay self service application. | Used by authenticated users of our partner services to administer their accounts. |
