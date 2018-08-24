# Security

## Reporting vulnerabilities

If you believe GOV.UK Pay security has been breached, contact us immediately at [govuk-pay-support@digital.cabinet-office.gov.uk] (mailto:govuk-pay-support@digital.cabinet-office.gov.uk). If you are a live user and the suspected breach is severe, consider using the urgent contact details provided to your service manager.

Please do not disclose the suspected breach publicly until it has been fixed.

## Securing your developer keys

The GOV.UK Pay platform will let you create as many API keys as you want.

We suggest letting all your developers experiment with their own test keys in the Sandbox environment, but keys for real integrations should only be shared with the minimum number of people necessary. This is because these keys can be used to create and manipulate payments. Do not commit these keys to public source code repositories.

Revoke your key immediately using the self-service site if you believe it has been accidentally shared or compromised.

> If you believe your key has been used to make fraudulent payments, contact the GOV.UK support team using the urgent contact methods provided to your service manager.


To further secure your live developer keys:

 - avoid embedding your developer keys in any of your code - this only increases the risk that they will be discovered (instead store your keys inside your configuration files)
 - avoid storing your API keys in your application source tree (even when you’re not making your source code publicly available)
 - revoke your developer keys when they’re no longer required (this limits the number of entry points into your account)
 - have a leavers’ process, so that a developer's API key is revoked when they leave

## Securing your integration with GOV.UK Pay

Make sure you’ve fully tested your integration with GOV.UK Pay. When doing so, take care not to use any real card numbers. Read our testing section for more details.

## Securing user information

GOV.UK Pay does not store full card numbers or CVV data for security reasons. This means you will not be able to search for transactions using card numbers.

## Payment Card Industry (PCI) compliance

Anyone involved with the processing, transmission, or storage of cardholder data must comply with the [Payment Card Industry Data Security Standards](https://www.pcisecuritystandards.org/) (PCI DSS) [external link]. GOV.UK Pay is certified as fully compliant as a Level 1 Service Provider with PCI DSS version 3.2. All GOV.UK Pay partners must be compliant with PCI DSS, and must validate their compliance annually.

### Use your Merchant ID to report PCI DSS compliance

A merchant ID is a unique number that identifies you to your payment processor and acquiring bank. The recommended approach is to report PCI DSS compliance by MID by:

- agreeing with your acquiring bank to allocate an unique MID for each separate payment channel you have in place
- reporting your PCI DSS compliance status for each of these unique MIDs to your acquiring bank

If you have one MID that encompasses multiple payment channels, the compliance requirements will be more complex for that MID. Check the PCI DSS for more information.

### Determine your PCI DSS compliance requirements

Your requirements depend on the number of transactions that you process as a merchant per scheme (Visa, MasterCard) per year. For example, if you process 4 million transactions with Visa and 3 million with MasterCard, the "Fewer than 6 million transactions per year" category still applies despite the fact that the total number of transactions is larger than 6 million. Your merchant level should be confirmed with your acquiring bank.

### Assessing your compliance requirements

#### Process fewer than 6 million transactions per year

If you process fewer than 6 million transactions per scheme per year, you may be able to self-assess by completing one of the PCI DSS Self-Assessment Questionnaire (SAQ); this is a self-assessment tool to assess security for cardholder data.

When using the GOV.UK Pay service, the SAQ A questionnaire should apply. You should be eligible to complete the SAQ A questionnaire if you fulfil all the eligibility criteria and comply with SAQ A requirements 2, 8, 9 and 12:

- the SAQ A questionnaire can be found in the [PCI documents library](https://www.pcisecuritystandards.org/document_library) [external link]
- more detailed information on meeting requirements 2 and 8 can be found in [this article](https://pcissc.secure.force.com/faq/articles/Frequently_Asked_Question/How-do-PCI-DSS-Requirements-2-and-8-apply-to-SAQ-A-merchants) [external link]
- more detailed information on the eligibility criteria can be found in the table below

| SAQ A eligibility criteria | Notes |
| :---- | :---- |
| Your MID accepts only card-not-present (e-commerce or mail/telephone-order) transactions | This applies where your MID is exclusive to transactions processed via GOV.UK Pay |
| All processing of cardholder data (CHD) by that MID is entirely outsourced to PCI DSS validated third-party service providers |  Both GOV.UK Pay and the PSPs it supports are PCI DSS compliant|
| The merchant does not electronically store, process, or transmit any CHD for that MID on your systems or premises, but relies entirely on a third party(s) to handle all these functions | This applies where your MID is exclusive to transactions processed via GOV.UK Pay |
| The merchant has confirmed that all third party(s) handling storage, processing, and/or transmission of CHD for that MID are PCI DSS compliant | GOV.UK Pay is PCI DSS certified; we can provide an Attestation of Compliance (AoC) on request |
| Any CHD the merchant retains is on paper (for example, printed reports or receipts), and these documents are not received electronically | Chargebacks received from your bank would fall into this category |
| All elements of the payment page(s) delivered to the consumer’s browser originate only and directly from a PCI DSS validated third-party service provider(s) | The payment page will be delivered to the end user directly from a PCI DSS validated service provider, GOV.UK Pay |

<div style="height:1px;font-size:1px;">&nbsp;</div>

#### Process more than 6 million transactions per year

If you process more than 6 million transactions per scheme per year, you will need to undertake a formal on-site security assessment by a PCI DSS Qualified Security Assessor (QSA). It may be possible to be assessed against only the SAQ A requirements but this should be discussed with your own PCI DSS compliance team and your acquiring bank. More information on this can be found at the [PCI Security Standards Council website](https://www.pcisecuritystandards.org) [external link].

Your service manager may also be asked to supply extra evidence on your internal security protocols, and you may have to undertake security awareness training to ensure you are qualified to handle credit card data.

## HTTPS

GOV.UK Pay follows [government HTTPS security guidelines](https://www.gov.uk/service-manual/domain-names/https.html). The Hypertext Transfer Protocol Secure (HTTPS), which involves the Transport Layer Security  (TLS) protocol is used by the platform to authenticate servers / clients and to provide secure connections.

Your government service will only be able to integrate with the GOV.UK Pay if it also uses HTTPS.
