# Testing GOV.UK Pay

You will receive a sandbox account for testing in addition to your live credentials.

When testing, you’ll need to ensure:

 - you’ve tested with mock card numbers (see below) to simulate both successful and unsuccessful transactions - never use real card numbers for testing purposes, as this breaks PCI rules
 - you test with your sandbox account, not your live account
 - REST calls succeed with 200 API codes
 - you’ve tested the user journey from your service to the payments platform using end-to-end/smoke tests

Services testing with sandbox accounts can optionally use HTTP (rather than HTTPS)
for return URLs. You can read more about this in [the "Security"
section](/security/#https). 

## Integration testing

To check your integration with GOV.UK Pay is working as expected, you’ll need to run a series of tests.

We recommend that you build tests to include both the GOV.UK Pay API and its front end user journey. We are constantly iterating our interface, so you should not rely on any specific page layout, but you can build tests that address form elements (such as buttons) using their IDs. Alternatively, you can build stubs that will emulate GOV.UK Pay functionality.

Our APIs will evolve over time. We will always let you know in advance if we intend to make any breaking, or backwards-incompatible API changes so you can ensure your service works with the new version. Please see our section on versioning for more information.

There is guidance in the GOV.UK Service Manual on [smoke testing](https://www.gov.uk/service-manual/making-software/deployment.html). At the Government Digital Service, we tend to use Cucumber for testing (regardless of the core code language), as you can easily describe the behaviour you expect at the appropriate level.

If you experience any problems when testing, please email us at [govuk-pay-support@digital.cabinet-office.gov.uk](mailto:govuk-pay-support@digital.cabinet-office.gov.uk).

## Mock card numbers for testing purposes

When you're testing your integration, you must not use real card numbers. Use the below test numbers.

When you're using these card numbers, you can enter any valid value for the other details (name, expiry date, card security code etc). For example, it does not matter what expiry date you enter, but it must be in the future.

|Testing action |Card numbers to use | Card type | Debit/Credit |
| --------  | ------- | ------- | ------- |
|Simulate a successful transaction | 4444333322221111 | Visa | Credit |
||4242424242424242| Visa | Credit |
||4000056655665556| Visa | Debit |
||5105105105105100| Mastercard | Debit |
||5200828282828210| Mastercard | Debit |
||371449635398431| American Express | Credit |
||3566002020360505| JCB | Credit |
||6011000990139424|Discover| Credit |
||36148900647913|Diners Club| Credit |
|Simulate card type not accepted |6759649826438453|Maestro| Debit |
|Simulate a declined card|4000000000000002|Visa| N/A |
|Simulate an invalid CVC security code|4000000000000127|Visa| N/A |
|Simulate an expired card|4000000000000069|Visa| N/A |
|Simulate a general processing error|4000000000000119|Visa| N/A |

<div style="height:1px;font-size:1px;">&nbsp;</div>

### For _Worldpay_ accounts

Please refer to [Worldpay test card numbers](http://support.worldpay.com/support/kb/gg/corporate-gateway-guide/content/reference/testvalues.htm#Test)

### For _Barclays ePDQ_ accounts
Please go to [ePDQ Get Started](https://support.epdq.co.uk/en/products/onboarding) and click on __What credit cards can I use for testing?__

### For _Barclays SmartPay_ accounts
Please go to [SmartPay TestCards](https://www.barclaycard.co.uk/business/files/SmartPay_Test_Cards_document.pdf)

##  Performance testing

If you’d like to carry out any kind of performance testing, including in a rate-limiting environment, please contact us at [govuk-pay-support@digital.cabinet-office.gov.uk](mailto:govuk-pay-support@digital.cabinet-office.gov.uk).
