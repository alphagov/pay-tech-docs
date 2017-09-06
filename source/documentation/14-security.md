# Security

### Reporting vulnerabilities

If you believe GOV.UK Pay security has been breached, contact us immediately at [govuk-pay-support@digital.cabinet-office.gov.uk] (mailto:govuk-pay-support@digital.cabinet-office.gov.uk). If you are a live user and the suspected breach is severe, consider using the urgent contact details provided to your service manager.

Please don’t disclose the suspected breach publically until it has been fixed.

### Securing your developer keys

The GOV.UK Pay platform will let you create as many API keys as you want.

We suggest letting all your developers experiment with their own test keys in the Sandbox environment, but keys for real integrations should only be shared with the minimum number of people necessary. This is because these keys can be used to create and manipulate payments. Do not commit these keys to public source code repositories.

Revoke your key immediately using the self-service site if you believe it has been accidentally shared or compromised.

> If you believe your key has been used to make fraudulent payments, contact the GOV.UK support team using the urgent contact methods provided to your service manager.


To further secure your live developer keys:

 - don’t embed your developer keys in any of your code - this only increases the risk that they will be discovered (instead store your keys inside your configuration files)
 - don’t store your API keys in your application source tree (even when you’re not making your source code publically available)
 - revoke your developer keys when they’re no longer required (this limits the number of entry points into your account)
 - have a leavers’ process, so that a developer's API key is revoked when they leave

### Securing your integration with GOV.UK Pay

Make sure you’ve fully tested your integration with GOV.UK Pay. When doing so, take care not to use any real card numbers. Read our testing section for more details.

### Securing user information

GOV.UK Pay doesn’t store full card numbers or CVV data for security reasons. This means you won’t be able to search for transactions using card numbers. You’ll only be able to look up certain transactions using the:

 - payment ID
 - reference metadata put into the system when creating the payment ID

### Payment Card Industry (PCI) compliance

Anyone involved with the processing, transmission, or storage of card data must comply with the [Payment Card Industry Data Security Standards](https://www.pcisecuritystandards.org/) (PCI DSS) [external link]. GOV.UK Pay is certified as fully compliant as a Level 1 Service Provider with PCI DSS version 3.2.

All GOV.UK Pay partners must validate their PCI DSS compliance annually. A typical approach is to break down reporting by payment channel and independently report your PCI DSS status for each channel to your acquiring bank. This approach must be agreed with your acquiring bank, but is usually accepted.  The individual channels are normally established based on Merchant ID (MID) so it is important that you use unique MIDs for this payment channel (as discussed with your acquiring bank).

Your requirements depend on the number of transactions your payment channel/MID processes in a year.

#### Process fewer than 6 million transactions per year

If your payment channel/MID processes fewer than 6 million transactions per year, you can self-assess by completing the PCI DSS Self-Assessment Questionnaire (SAQ); this is a self-assessment tool to assess security for cardholder data. 

Most services will be asked to complete the SAQ A questionnaire which can be found in the [PCI documents library](https://www.pcisecuritystandards.org/document_library) [external link]; see the criteria in the table below:

| SAQ A eligibility criteria | Notes |
| :---- | :---- |
| Your payment channel accepts only card-not-present (e-commerce or mail/telephone-order) transactions. | This applies where your MID is exclusive to transactions processed via GOV.UK Pay. | 
| All processing of cardholder data is entirely outsourced to PCI DSS validated third-party service providers. | GOV.UK Pay is PCI DSS certified. |
| Your company does not electronically store, process, or transmit any cardholder data on your systems or premises, but relies entirely on a third party(s) to handle all these functions. | This applies where your MID is exclusive to transactions processed via GOV.UK Pay. |
| Your company has confirmed that all third party(s) handling storage, processing, and/or transmission of cardholder data are PCI DSS compliant. | GOV.UK Pay is PCI DSS compliant. |
| Any cardholder data your company retains is on paper (for example, printed reports or receipts), and these documents are not received electronically. | You may need to dispose of any earlier receipts containing cardholder data. |
| All elements of the payment page(s) delivered to the consumer’s browser originate only and directly from a PCI DSS validated third-party service provider(s). | The payment page will be delivered to the end user directly from a PCI DSS validated service provider, GOV.UK Pay. |

#### Process more than 6 million transactions per year

If your payment channel/MID processes more than 6 million transactions a year, you will need to undertake a formal on-site security assessment by a PCI DSS Qualified Security Assessor (QSA). It may be possible to be assessed against only the SAQ A requirements but this should be discussed with your own PCI DSS compliance team and your acquiring bank. More information on this can be found at the [PCI Security Standards Council website](https://www.pcisecuritystandards.org) [external link].

Your service manager may also be asked to supply extra evidence on your internal security protocols, and you may have to undertake security awareness training to ensure you are qualified to handle credit card data.


### HTTPS

GOV.UK Pay follows [government HTTPS security guidelines](https://www.gov.uk/service-manual/domain-names/https.html). The Hypertext Transfer Protocol Secure (HTTPS), which involves the Transport Layer Security  (TLS) protocol is used by the platform to authenticate servers / clients and to provide secure connections.

Your government service will only be able to integrate with the GOV.UK Pay if it also uses HTTPS.
