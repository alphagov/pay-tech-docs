# Payment flow overview

This section outlines how your service will interact with GOV.UK Pay after integration.

#### Overview of payment flow

When an end user needs to make a payment, your service makes an API call to create a new payment, then redirects the user to the payment pages hosted on GOV.UK Pay.

The end user enters their payment details (for example, credit/debit card details and billing address) on the Pay pages. Pay handles all the details of verifying the payment with the underlying Payment Service Provider.

After the transaction reaches a final state, the end user is then redirected back to your service.

A final state means that the transaction:

+ succeeds
+ fails (for example because the payment details are wrong)
+ cannot be completed because of a technical error
+ was cancelled by your service

When the user arrives back at your service, you can use the API to check the status of the transaction and show them an appropriate message.

![](https://s3-eu-west-1.amazonaws.com/pay-govuk-documentation/pay-transaction-states.png)

#### Payment flow: making a payment

Let's walk through an example of the payment flow in more detail.

Imagine that this is a page on your service, where the end user needs to make a payment.

![](https://s3-eu-west-1.amazonaws.com/pay-govuk-documentation/flow-service-pay-page.png)

Note that this page might be the end point of a series of pages you host which allow the user to choose between a variety of possible payments. This page should:

- make it clear to the user that they are about to pay for your product or service with a clear call to action, for example, a button that says “Pay now” or “Continue to payment”; the user will then be taken to the GOV.UK Pay pages to complete their transaction 
- include clear information on what is being purchased; you do not need to tell the user that they are being handed over to GOV.UK Pay’s pages to make their payment

The user clicks **Continue**.

At this point, your service makes a [**Create new payment**](https://gds-payments.gelato.io/api-explorer/gov-uk-pay-api/versions/1.0.0/general/create-new-payment) call to the Pay API. The body of the call contains information in JSON format:


```javascript
{
  "amount": 14500,
  "reference" : "12345"
  "description": "Payment description",
  "return_url": "https://your.service.gov.uk/completed",
}
```


+ **amount**: in pence; in this example, the payment is for £145
+ **reference**: This is the reference number you wish to associate with this payment. The format is up to you, so if you have an existing format, you can keep using it with Pay (maximum 255 characters; it must not contain URLs)
+ **description**: A human-readable description of the payment; this will be shown to the end user on the payment pages and to your staff on the GOV.UK Pay self-service site (maximum 255 characters; it must not contain URLs)
+ **return_url**: This is an HTTPS URL on your site that the user will be sent back to once they have completed their payment attempt on GOV.UK Pay (this should not be JSON-encoded as backslashes will not be accepted)

This is the header and the first part of the JSON body of the response to the **Create new payment** API call that your service will receive:

```response
HTTP/1.1 201 Created
Content-Type: application/json
Location: https://publicapi.pymnt.uk/v1/payments/icus7b4umg4b4g5fat4831es5f
```

```javascript
{
  "payment_id": "icus7b4umg4b4g5fat4831es5f",
  "payment_provider": "acme",
  "amount": 14500,
  "state": {
    "status": "created",
    "finished": false
  },
  "description": "Payment description",
  "return_url": "https://your.service.gov.uk/completed",
  "reference": "12345",
  "created_date": "2016-06-24T11:46:11.414Z",
  "_links": {
    "self": {
      "href": "https://publicapi.pymnt.uk/v1/payments/icus7b4umg4b4g5fat4831es5f",
      "method": "GET"
    },
    "next_url": {
      "href": "https://www-integration-2.pymnt.uk/secure/bb0a272c-8eaf-468d-b3xf-ae5e000d2231",
      "method": "GET"
    },
 ...}  
}
```

The beginning of the response confirms the properties of the attempted payment.

The ``self`` URL (also provided in the Location header of the response) is a unique identifier for the payment. It can be used to retrieve its status details in future.

The ``next_url`` is the URL where you should now direct the end user. It points to a payment page hosted by GOV.UK Pay where the user can enter their payment details. Note that this is a one-time URL; after it's been visited once, it will give an error message.

When your service redirects the user to ``next_url``, they see a page something like this:

![](https://s3-eu-west-1.amazonaws.com/pay-govuk-documentation/flow-payment-page.png)

The page shows the ``description`` you provided as well as the amount the end user has to pay, making it clear what they're paying for.

The user enters their payment details and clicks **Continue**.

![](https://s3-eu-west-1.amazonaws.com/pay-govuk-documentation/flow-payment-details-page.png)

If the details are valid and the payment is approved, the user is then taken to a payment confirmation page, still hosted by GOV.UK Pay:

![](https://s3-eu-west-1.amazonaws.com/pay-govuk-documentation/flow-payment-confirm-page.png)

If the payment is successful, the user will:

- receive a confirmation email (if you have chosen to send these using GOV.UK Pay)
- return to your service and see your confirmation page

It is up to your page at the ``return_url`` to show an appropriate message based on the state of the payment. For example, for a successful payment, you would likely want to confirm that the payment has been received and explain what will happen next. For a failed payment, you should make clear that payment failed and offer the user a chance to try again.

##### Confirmation Email

The user will receive a payment confirmation email containing:

- payment reference number
- date of payment
- who the payment was to
- the total payment amount

You can add a custom paragraph to a payment confirmation email at the [Email notifications page](https://selfservice.payments.service.gov.uk/email-notifications) on the GOV.UK Pay admin site. For further customisation, you can visit [GOV.UK Notify](https://www.notifications.service.gov.uk/) to set up custom notifications. It is recommended to disable GOV.UK Pay notifications if you do this.

###### Confirmation Page

The confirmation page is hosted by you and should:

- contain a reference number (make them short and usable)
- have a clear payment summary, showing the amount and description
- clearly state what is going to happen next (this will be different for each service)
- if applicable, let the user know they will receive a receipt email (services can either use GOV.UK Notify to send email payment receipts or ask GOV.UK Pay to do that for them)

Users have different ways of recording this confirmation information, including screenshots, prints, pdf receipts to download, and writing down the reference number and other relevant information. Teams building services should be aware of, and cater for, all these behaviours.

>Read more about confirmation pages in the [service manual](https://www.gov.uk/service-manual/design/confirmation-pages).

##### After confirmation

After confirming, the user is directed to the ``return_url`` you provided in the initial request.

If the payment *cannot* be approved, the user is shown an error page with a message describing the reason, for example:

![](https://s3-eu-west-1.amazonaws.com/pay-govuk-documentation/flow-payment-declined.png)

The link to try the payment again sends the user to the ``return_url`` you provided in the initial request.

#### Payment flow: after payment

After the user attempts payment, GOV.UK Pay returns them to the ``return_url`` you provided in the initial request, whatever the status of the payment.

The ``return_url`` should specify a page on your service. When the user visits the ``return_url``, your service should:
  + match the returning user with their payment (with a secure cookie, or a secure random ID string included in the ``return_url``)
  + check the status of the payment using an API call

See the [Integration details](https://govukpay-docs.cloudapps.digital/#integration-details) section for more details about how to match the user to the payment.

To check the status of the payment, you must make a [**Find payment by ID**](https://gds-payments.gelato.io/api-explorer/gov-uk-pay-api/versions/1.0.0/v1/find-payment-by-id) API call, using the ``payment_id`` of the payment as the parameter.

The URL to do this is the same as the ``self`` URL provided in the response when the payment was first created.

The response body contains information about the payment encoded in JSON format. Here is the beginning of a typical response:

```javascript
{
  "payment_id": "i3us7bqumg4b4g5fae48h1es5f",
  "payment_provider": "acme",
  "amount": 14500,
  "state": {
    "status": "success",
    "finished": true
  },
...
}
```

The ``state`` array within the JSON lets you know the outcome of the payment:

+ The ``status`` value describes a stage of the payment journey.
+ The ``finished`` value indicates if the payment journey is complete or not; that is, if the ``status`` of this payment can change.

Now that you understand the payment process, see the [Integration details](https://govukpay-docs.cloudapps.digital/#integration-details) section for more  about how you can integrate your service with GOV.UK Pay.
