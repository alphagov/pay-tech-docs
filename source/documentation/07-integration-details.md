# Integration details

This section gives more technical detail about how to integrate your service with GOV.UK Pay.

#### Creating a payment

When you make a payment, you will need to supply a ``reference``. This is a unique identifier for the payment. If your organisation already has an existing identifier for payments, you can use it here.

You will also need to supply a ``return_url``, a URL hosted by your service for the user to return to after they have completed payment on GOV.UK Pay. See the section below on **Choosing the return URL** for more information.

You will need to store the URL from the Location header/in the ``self`` section of ``links`` in the JSON body (the same URL is shown in both places).  This URL contains the GOV.UK Pay ``payment_id`` which uniquely identifies the payment. An authenticated GET request to the URL will return information about the payment and its status.

>It is important that you do not expose the URL with the ``payment_id`` publically, for example as a URL parameter or in an insecure cookie. You should store it as a secure cookie or in a database.

You will receive the ``next_url``  to which you should direct the user to complete their payment. During the GOV.UK Pay beta, it is only returned in response to the initial POST call to create a payment, not on sub. It will only work once.


#### Tracking the progress of a payment

You can track the progress of a payment while the user is on GOV.UK Pay using the [**Find payment by ID**](https://gds-payments.gelato.io/api-explorer/gov-uk-pay-api/versions/1.0.0/v1/find-payment-by-id) call.

NOTE: The status of the payment will go through several phases until it either succeeds or fails. See the [API reference section](https://govukpay-docs.cloudapps.digital/#api-reference) for more details.

#### Choosing the return URL and matching user to payment

For security reasons, GOV.UK Pay does not add the payment ID or outcome to your ``return_url`` as parameters.

To match up a returning user with their payment, there are two recommended methods:

+ use a secure cookie containing the Payment ID from GOV.UK Pay, issued by your service when the payment is created (before sending the user to ``next_url``). Users won't be able to decrypt a secure cookie, so a fraudster could not alter the payment ID and intercept other users' payments.

+ create a secure random ID (such as a UUID) and include this as part of the ``return_url``, using a different ``return_url`` for each payment. Since a securely generated UUID is not guessable, fraudsters will not be able to intercept users’ payments.

>Note: If you create an ID yourself, you'll likely need to store this in a datastore mapped to the payment ID just after you create a payment.

#### Accepting returning users

 A user directed to the return URL could have:
 
 - paid successfully
 - not paid because their card was rejected or they clicked cancel
 - not paid because your service (via the API) or service manager (via the self-service dashboard) cancelled the payment in progress

Your service should use the API to check the payment status when the user reaches the return URL, and provide an appropriate response based on the final status of the payment attempt.

#### When a user doesn't complete their payment journey

The user may close their browser or lose internet connection in the middle of the payment flow on GOV.UK Pay. These users will not be redirected back to your service.

You can still check on the status of these payments by making a GET request using the Location Header or Self Link, the same way you would if they were redirected, but just after a set time (eg, an hour).

>Note: GOV.UK Pay will eventually expire incomplete payments, but you should expect an occasional success or failure if the user experienced problems right at the moment of the redirect.

If a user does not have enough funds in their account to make a payment, the current GOV.UK Pay frontend will not let them try again with separate card details. This will soon be fixed as part of the beta.


#### Cancelling a payment

You can cancel a payment that is not yet in a final state by using the [**Cancel payment**](https://gds-payments.gelato.io/api-explorer/gov-uk-pay-api/versions/1.0.0/payment-id/cancel-payment) API call.


#### Financial reporting integration

If you’re a beta partner, the GOV.UK Pay team will hold technical workshops with you to discuss how to integrate the reporting from GOV.UK Pay with your own financial systems.

With our API,  you’ll be able to:

 - GET the status of an individual payment
 - cancel a payment that’s not yet captured
 - soon get the status of multiple payments based on certain criteria, e.g. date range (this feature is under development)
 - soon issue full and partial refunds (this feature is under development)
