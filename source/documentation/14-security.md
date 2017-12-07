# Security

## Reporting vulnerabilities

If you believe GOV.UK Pay security has been breached, contact us immediately at [govuk-pay-support@digital.cabinet-office.gov.uk] (mailto:govuk-pay-support@digital.cabinet-office.gov.uk). If you are a live user and the suspected breach is severe, consider using the urgent contact details provided to your service manager.

Please don’t disclose the suspected breach publically until it has been fixed.

## Securing your developer keys

The GOV.UK Pay platform will let you create as many API keys as you want.

We suggest letting all your developers experiment with their own test keys in the Sandbox environment, but keys for real integrations should only be shared with the minimum number of people necessary. This is because these keys can be used to create and manipulate payments. Do not commit these keys to public source code repositories.

Revoke your key immediately using the self-service site if you believe it has been accidentally shared or compromised.

> If you believe your key has been used to make fraudulent payments, contact the GOV.UK support team using the urgent contact methods provided to your service manager.


To further secure your live developer keys:

 - don’t embed your developer keys in any of your code - this only increases the risk that they will be discovered (instead store your keys inside your configuration files)
 - don’t store your API keys in your application source tree (even when you’re not making your source code publically available)
 - revoke your developer keys when they’re no longer required (this limits the number of entry points into your account)
 - have a leavers’ process, so that a developer's API key is revoked when they leave

## Securing your integration with GOV.UK Pay

Make sure you’ve fully tested your integration with GOV.UK Pay. When doing so, take care not to use any real card numbers. Read our testing section for more details.

## Securing user information

GOV.UK Pay doesn’t store full card numbers or CVV data for security reasons. This means you won’t be able to search for transactions using card numbers. You’ll only be able to look up certain transactions using the:

 - payment ID
 - reference metadata put into the system when creating the payment ID

## Payment Card Industry (PCI) compliance

Anyone involved with the processing, transmission, or storage of cardholder data must comply with the [Payment Card Industry Data Security Standards](https://www.pcisecuritystandards.org/) (PCI DSS) [external link]. GOV.UK Pay is certified as fully compliant as a Level 1 Service Provider with PCI DSS version 3.2. All GOV.UK partners must be compliant with PCI DSS, and must validate their compliance annually.

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

When using the GOV.UK Pay service, the SAQ A questionnaire should apply. You should be eligible to complete the SAQ A questionnaire if you fulfil all the eligibility criteria and comply with SAQ A requirements 2, 8, 9 and 12. The SAQ A questionnaire can be found in the [PCI documents library](https://www.pcisecuritystandards.org/document_library) [external link]. The criteria and requirements, along with supporting information, can be found in the tables below.

| SAQ A eligibility criteria | Notes |
| :---- | :---- |
| Your merchant accepts only card-not-present (e-commerce or mail/telephone-order) transactions. | This applies where your MID is exclusive to transactions processed via GOV.UK Pay. |
| All processing of cardholder data (CHD) is entirely outsourced to PCI DSS validated third-party service providers. | GOV.UK Pay is PCI DSS certified. |
| Your company does not electronically store, process, or transmit any CHD on your systems or premises, but relies entirely on a third party(s) to handle all these functions. | This applies where your MID is exclusive to transactions processed via GOV.UK Pay. |
| Your company has confirmed that all third party(s) handling storage, processing, and/or transmission of CHD are PCI DSS compliant. | GOV.UK Pay is PCI DSS compliant. |
| Any CHD your company retains is on paper (for example, printed reports or receipts), and these documents are not received electronically. | You may need to dispose of any earlier receipts containing CHD. Chargebacks received from your bank may fall into this category. |
| All elements of the payment page(s) delivered to the consumer’s browser originate only and directly from a PCI DSS validated third-party service provider(s). | The payment page will be delivered to the end user directly from a PCI DSS validated service provider, GOV.UK Pay. |

| SAQ A requirements |Your responsibilities| Notes |
|:---|:---|:---|
|Requirement 2: Do not use vendor-supplied defaults for system passwords and other security parameters|- Review policies and procedures<br>- Examine vendor documentation<br>- Observe system configurations and account settings<br>- Interview personnel|This requirement must be satisfied by the web server responsible for redirecting customers to the GOV.UK Pay payment portal.|
|Requirement 8: Identify and authenticate access to system components||This requirement must be satisfied by the web server responsible for redirecting customers to the GOV.UK Pay payment portal.|
|Requirement 8.1.1: Are all users assigned a unique ID before allowing them to access system components or cardholder data?|- Review password procedures<br>- Interview personnel|As requirement 8|
|Requirement 8.1.3: Is access for any terminated users immediately deactivated or removed?|- Review password procedures<br>- Examine terminated users accounts<br>- Review current access lists<br>- Observe returned physical authentication devices|As requirement 8|
|Requirement 8.2: In addition to assigning a unique ID, is one or more of the following methods employed to authenticate all users?<br>- Something you know, such as a password or passphrase<br>- Something you have, such as a token or smart card<br>- Something you are, such as a biometric|- Review password procedures<br>- Observe authentication processes|As requirement 8|
|Requirement 8.2.3: (a) Are user password parameters configured to require passwords/passphrases meet the following?<br>- A minimum password length of at least seven characters<br>- Contain both numeric and alphabetic characters |- Examine system configuration settings to verify password parameters|As requirement 8|
|Requirement 8.5: Are group, shared, or generic accounts, passwords, or other authentication methods prohibited as follows:<br> - Generic user IDs and accounts are disabled or removed<br> - Shared user IDs for system administration activities and other critical functions do not exist<br>- Shared and generic user IDs are not used to administer any system components?|- Review policies and procedures<br>- Examine user ID lists<br>- Interview personnel|As requirement 8|
|Requirement 9: Restrict physical access to cardholder data||Applies if you have any physical media that contains cardholder data (CHD) such as the primary account number. This requirement is not met if you store any historic CHD in electronic format.|
|Requirement 9.5: Are all media physically secured (including but not limited to computers, removable electronic media, paper receipts, paper reports, and faxes)? For purposes of Requirement 9, “media” refers to all paper and electronic media containing CHD.| - Review policies and procedures for physically securing media<br>- Interview personnel|No media containing CHD is stored by GOV.UK Pay. If the organisation using GOV.UK Pay has any media containing CHD, requirement 9.* will need to be met. An example of this could be a chargeback from your acquiring bank.|
|Requirement 9.6: (a) Is strict control maintained over the internal or external distribution of any kind of media?|- Review policies and procedures for distribution of media|As requirement 9.5|
|Requirement 9.6.1: Is media classified so the sensitivity of the data can be determined?|- Review policies and procedures for distribution of media<br>- Interview security personnel|As requirement 9.5|
|Requirement 9.6.2: Is media sent by secured courier or other delivery method that can be accurately tracked?| - Interview personnel<br>- Examine media distribution tracking logs and documentation|As requirement 9.5|
|Requirement 9.6.3: Is management approval obtained prior to moving the media (especially when media is distributed to individuals)|- Interview personnel<br>- Examine media distribution tracking logs and documentation|As requirement 9.5|
|Requirement 9.7:	Is strict control maintained over the storage and accessibility of media?|- Review policies and procedures|As requirement 9.5|
|Requirement 9.8: (a) Is all media destroyed when it is no longer needed for business or legal reasons?|- Review periodic media destruction policies and procedures|As requirement 9.5|
|Requirement 9.8.1 (a): Are hardcopy materials cross-cut shredded, incinerated, or pulped so that CHD cannot be reconstructed?| - Review periodic media destruction policies and procedures<br>- Interview personnel<br>- Observe processes|As requirement 9.5|
|Requirement 9.8.1 (b): Are storage containers used for materials that contain information to be destroyed secured to prevent access to the contents?|- Examine security of storage containers|As requirement 9.5|
|Requirement 12.8: Are policies and procedures maintained and implemented to manage service providers with whom CHD is shared, or that could affect the security of CHD |||		
|Requirement 12.8.1: Is a list of service providers maintained, including a description of the service(s) provided?|- Review policies and procedures<br>- Observe processes<br>- Review list of service providers|The organisation using GOV.UK Pay should maintain a list of service providers involved in the payment process:<br>- GOV.UK Pay<br>- Payment Service Provider (e.g. Worldpay)<br>- Any organisation(s) responsible for meeting requirements 2 and 8|
| Requirement 12.8.2: Is a written agreement maintained that includes an acknowledgement that the service providers are responsible for the security of CHD the service providers possess or otherwise store, process, or transmit on behalf of the customer, or to the extent that they could impact the security of the customer’s CHD environment?|- Observe written agreements<br>- Review policies and procedures|If you have an external party responsible for meeting requirements 2 and 8 then you should have a written agreement (the Memorandum of Understanding) that they will maintain these requirements.|
|Requirement 12.8.3: Is there an established process for engaging service providers, including proper due diligence prior to engagement?|- Observe processes<br>- Review policies and procedures and supporting documentation|Government organisations typically have a formal process for engaging service providers.|
|Requirement 12.8.4: Is a program maintained to monitor service providers’ PCI DSS compliance status at least annually?|- Observe processes<br>- Review policies and procedures and supporting documentation|Validate that GOV.UK Pay and your service provider(s) maintain their PCI DSS compliance. Check for a new Attestation of Compliance (AoC) when the current one expires.|
|Requirement 12.8.5: Is information maintained about which PCI DSS requirements are managed by each service provider, and which are managed by the entity?|- Observe processes<br>- Review policies and procedures and supporting documentation|This document - once you have updated the sections 2, 8, 9 and 12.10.1 with your own situation.|
12.10.1	(a): Has an incident response plan been created to be implemented in the event of system breach?|- Review the incident response plan<br>- Review incident response plan procedures|You should have an Incident Response Procedure in place in case a card data security breach occurs. Visa, MasterCard and American Express published guidance is here:<br>- [Visa](https://www.visaeurope.com/media/images/security%20compromise%20factsheet%202015-73-18423.pdf)<br>- [Mastercard](https://www.mastercard.co.uk/content/dam/mccom/en-us/documents/account-data-compromise-manual.pdf)<br>- [American Express](https://www.americanexpress.com/uk/content/merchant/pdf/support-and-services/American_Express_Data_Security_Operating_Principles.pdf)|

Further information on meeting requirements 2 and 8 can be found in [this article](https://pcissc.secure.force.com/faq/articles/Frequently_Asked_Question/How-do-PCI-DSS-Requirements-2-and-8-apply-to-SAQ-A-merchants) [external link].

#### Process more than 6 million transactions per year

If you process more than 6 million transactions per scheme per year, you will need to undertake a formal on-site security assessment by a PCI DSS Qualified Security Assessor (QSA). It may be possible to be assessed against only the SAQ A requirements but this should be discussed with your own PCI DSS compliance team and your acquiring bank. More information on this can be found at the [PCI Security Standards Council website](https://www.pcisecuritystandards.org) [external link].

Your service manager may also be asked to supply extra evidence on your internal security protocols, and you may have to undertake security awareness training to ensure you are qualified to handle credit card data.


## HTTPS

GOV.UK Pay follows [government HTTPS security guidelines](https://www.gov.uk/service-manual/domain-names/https.html). The Hypertext Transfer Protocol Secure (HTTPS), which involves the Transport Layer Security  (TLS) protocol is used by the platform to authenticate servers / clients and to provide secure connections.

Your government service will only be able to integrate with the GOV.UK Pay if it also uses HTTPS.
