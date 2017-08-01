#Security

#### Reporting vulnerabilities

If you believe GOV.UK Pay security has been breached, contact us immediately at [govuk-pay-support@digital.cabinet-office.gov.uk] (mailto:govuk-pay-support@digital.cabinet-office.gov.uk). If you are a production user and the suspected breach is severe, consider using the urgent contact details provided to your service manager.

Please don’t disclose the suspected breach publically until it has been fixed.

#### Securing your developer keys

The GOV.UK Pay platform will let you create as many API keys as you want.

We suggest letting all your developers experiment with their own test keys in the Sandbox environment, but keys for real integrations should only be shared with the minimum number of people necessary. This is because these keys can be used to create and manipulate payments. Do not commit these keys to public source code repositories.

Revoke your key immediately using the self-service site if you believe it has been accidentally shared or compromised.

> If you believe your key has been used to make fraudulent payments, contact the GOV.UK support team using the urgent contact methods provided to your service manager.


To further secure your live developer keys:

 - don’t embed your developer keys in any of your code - this only increases the risk that they will be discovered (instead store your keys inside your configuration files)
 - don’t store your API keys in your application source tree (even when you’re not making your source code publically available)
 - revoke your developer keys when they’re no longer required (this limits the number of entry points into your account)
 - have a leavers’ process, so that a developer's API key is revoked when they leave

#### Securing your integration with GOV.UK Pay

Make sure you’ve fully tested your integration with GOV.UK Pay. When doing so, take care not to use any real card numbers. Read our testing section for more details.

#### Securing user information

GOV.UK Pay doesn’t store full card numbers or CVV data for security reasons. This means you won’t be able to search for transactions using card numbers. You’ll only be able to look up certain transactions using the:

 - payment ID
 - reference metadata put into the system when creating the payment ID

#### Payment Card Industry (PCI) compliance

A major benefit of integrating with GOV.UK Pay is that you’ll have immediate access to a fully secure and PCI accredited platform.

[The Payment Card Industry Security Standards Council](https://www.pcisecuritystandards.org/) is an open global forum, launched in 2006, that develops, maintains and manages the PCI Security Standards. These cover everything from the point of entry of card data into a system, to how the data is processed, through to secure payment applications.

Compliance with PCI Security Standards is governed by the payment brands and their partners. Although the GOV.UK Pay team has completed the majority of work to ensure compliance with the PCI standard, your service may be asked by your payment provider to supply extra evidence on your internal security protocols. You will have to complete a self-assessment questionnaire called the [PCI DSS SAQ](https://www.pcisecuritystandards.org/pci_security/completing_self_assessment) that will include a series of yes or no questions about your security practises. Your service manager may also be asked to undertake security awareness training to ensure they are qualified to handle credit card data.

#### HTTPS

GOV.UK Pay follows [government HTTPS security guidelines](https://www.gov.uk/service-manual/domain-names/https.html). The Hypertext Transfer Protocol Secure (HTTPS), which involves the Transport Layer Security  (TLS) protocol is used by the platform to authenticate servers and clients/secure connections.

Your government service will only be able to integrate with the GOV.UK Pay if it also uses HTTPS.
