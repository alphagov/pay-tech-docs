## Welsh language support 

GOV.UK Pay supports Welsh-language payment pages. 

To use Welsh, you can include `"language": "cy"` in the body of
a request to create a payment. Users will see Welsh text on the payment
pages as they complete the [payment flow](/payment_flow_overview).  

Sign in to your [GOV.UK Pay
account](https://selfservice.payments.service.gov.uk/login) and use the admin
tool to add a Welsh service name to your service.  

If you add a Welsh service
name to your service, users will see this on Welsh-language payment pages instead of the
usual service name.  

When users make a payment, they will also [see a
`description`](/payment_flow_overview/#making-a-payment). If you use Welsh-language
payment pages, you may also want to use Welsh text in the
`description`.  

GOV.UK Pay does not automatically translate emails into Welsh. Please [contact
us](/support_contact_and_more_information) if you would like to send Welsh language emails to your users.

## Delayed capture

GOV.UK Pay supports the delayed capture of payments.

To use delayed capture, include `"delayed_capture": true` in the body of a [create new payment](https://gds-payments.gelato.io/api-explorer/gov-uk-pay-api/versions/1.0.2/general/create-new-payment) [external link] request.

The user experience matches the current payment flow. Once the user selects “Confirm” on the “Confirm your details” page, your service can send a delayed capture request by calling the `POST /v1/payments/{paymentId}/capture` endpoint.

There are 4 possible responses:

| Response Code  | Meaning                    |
| -------------- | -------------------------- |
|204             | Capture request accepted   |
|404             | `paymentId` does not exist |
|409             | Capture request rejected   |
|500             | Downstream error           |

Your service must send the delayed capture request within 90 minutes of when the payment is created, regardless of how long the user takes to complete the payment flow, or it will expire.

If your service has enabled payment receipt emails, GOV.UK Pay will send a payment receipt email to the user once your service's capture request is received and accepted.
