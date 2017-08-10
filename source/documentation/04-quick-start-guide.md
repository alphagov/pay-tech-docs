# Quick start guide

The GOV.UK Pay platform is based on REST principles with endpoints returning data in JSON format, and standard HTTP error response codes. The platform API allows you to:

- initiate and complete payments
- issue refunds
- view the event history for individual payments
- view transactions within a specified time period
<br /><br />
This section explains how to get started with our API Explorer.

#### Account setup

If your department or agency is not yet a beta partner, please contact us at [govuk-pay-support@digital.cabinet-office.gov.uk](mailto:govuk-pay-support@digital.cabinet-office.gov.uk) to discuss using GOV.UK Pay

If your department or agency is participating in the beta, it will have a GOV.UK Pay service account (in some cases, it may have several service accounts, one for each service that is going to integrate with Pay).

To use the GOV.UK Pay API, you will need your own individual staff account. A staff account is linked to a service account and can be used to create API keys for that service, as well as access the transaction history and service settings.

1. Have your service manager email [govuk-pay-support@digital.cabinet-office.gov.uk](mailto:govuk-pay-support@digital.cabinet-office.gov.uk) to get your staff account credentials. You'll receive access to a sandbox account which allows you to familiarise yourself and your developers with the platform before processing real payments. The GOV.UK Pay team will set up your service and provide you with login details for your account.

2. Sign in to the [self-service admin site](https://selfservice.payments.service.gov.uk/) with the sandbox account login details you received.

3. Click on the API key section, then click **Generate a new key**.

![](https://s3-eu-west-1.amazonaws.com/pay-govuk-documentation/Generate+API+key+image1.png)
 <br /><br />Enter a description for your API key. <br /><br />
![](https://s3-eu-west-1.amazonaws.com/pay-govuk-documentation/DescribeAPIKey+image2.png)
<br /><br />Your API key will be shown on the screen for you to copy.<br /><br /> ![](https://s3-eu-west-1.amazonaws.com/pay-govuk-documentation/NewKeygenerate+image+3.png)

<blockquote>You must store your API keys away securely. Make sure you never share this key in publicly accessible documents or repositories, or with people who shouldn't be using the GOV.UK Pay API directly. <a href="https://govukpay-docs.cloudapps.digital/#security">Read our security section</a> for more information on how to keep your API key safe.</blockquote>

#### API Explorer setup

The quickest way to learn about the API is to use [the API Explorer](https://gds-payments.gelato.io/api-explorer/) with the API key that you just created.

1. [Go to the API Explorer](https://gds-payments.gelato.io/api-explorer/) and click the blue “Add API Credentials” button. <br/><br/>
![](https://s3-eu-west-1.amazonaws.com/pay-govuk-documentation/pay-add-api-key.png)
<br/><br/>In the resulting pop-up, enter the following values:
  + For **API Key**, enter "[YOUR-API-KEY]" (do not include the quotation marks), replacing [YOUR-API-KEY] with the actual value of your sandbox API key, as shown in the screenshot below. You do not need to put the "Bearer: " prefix which is required when calling the API from code; the API Explorer adds that automatically.
  + For **Label**, enter "Authorization" (do not include the quotation marks).

> Make sure you are using an API key from your sandbox account on the self-service site, not the production account.

#### Making a test API call

1. To test the API Explorer, select [Create new payment](https://gds-payments.gelato.io/api-explorer/gov-uk-pay-api/versions/1.0.0/general/create-new-payment) from the API Explorer **Action** dropdown menu. Click on the **Body** tab lower down to see an example JSON body that you would send when creating a payment.

```javascript
{
"amount": 12000,
"reference": "12345",
"description": "New passport application",
"return_url": "https://service-name.gov.uk/transactions/12345"
}
```

As well as details of the payment, you'll notice that you need to send a ``return_url`` when creating a payment. The reason for this is that users go to GOV.UK Pay hosted pages to actually make their payment.
The ``return_url`` is the URL of a page on your service that the user will be redirected to after they have completed their payment (or payment has failed).
<br/><br/>
![](https://s3-eu-west-1.amazonaws.com/pay-govuk-documentation/pay-api-explorer-createpay.png)

1. Click the green **Send Request** button.

1. If the API Explorer is set up correctly, you will receive a 201 Created response with a JSON body, confirming that the payment was created. Note that the JSON includes a ``next_url`` link. This URL is where your service should redirect the user for them to make their payment.
<br/><br/>
![](https://s3-eu-west-1.amazonaws.com/pay-govuk-documentation/pay-api-explorer-response.png)

1. Go to the ``next_url`` with your browser. You'll see the payment screen. Refer to the [Testing GOV.UK Pay](https://govukpay-docs.cloudapps.digital/#testing-gov-uk-pay) section to find a mock credit card number that you can enter to simulate a payment in the sandbox environment. For the rest of the details, enter some test information, bearing in mind that:
    + the expiry date must be in the future
    + the postcode must be valid

1. Submit the payment.

1. Go to the [service admin site](https://selfservice.payments.service.gov.uk/). Select **Transactions** at left. You’ll see the payment you just made.

![](https://s3-eu-west-1.amazonaws.com/pay-govuk-documentation/transaction+list+image+4.png)
