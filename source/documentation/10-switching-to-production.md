# Switching to live

Once you’ve finished testing with your sandbox account, follow these steps to switch from testing to live.

Unless stated otherwise, this section applies both to services that have integrated with the GOV.UK Pay API, and to services that use the [self service payment link](/#self-service-payments) functionality.

## Request a live account

You must send GOV.UK Pay your test account’s service ID before the account can go live. To get the service ID:

1. Sign in to your [GOV.UK Pay account](https://selfservice.payments.service.gov.uk/login).
1. Select __My services__ in the header menu.
1. Select __Manage team members__ for the test account you want to make live.
1. Copy the page URL, for example https://selfservice.payments.service.gov.uk/service/23f0eb425a9569988b99b5bb641a541d
1. Send the service ID to the GOV.UK Pay team at [govuk-pay-support@digital.cabinet-office.gov.uk](govuk-pay-support@digital.cabinet-office.gov.uk).

It will take up to one business day to switch your account from test to live.

Once your account is live, it will appear in __My Services__ labelled as a "Live account".

Your account must be live before you can set up your PSP credentials.

## Complete organisation details

You must display organisation information in the footer of the payment pages where the user enters their card details. Note:

- the organisation must be the entity that has a contract with the PSP
- your completed organisation account details apply to both your test and live accounts

To complete your organisation details:

1. Go to the [GOV.UK Pay admin site](https://selfservice.payments.service.gov.uk/login).
1. Sign in to your GOV.UK Pay account.
1. Go to __Switch services > Edit organisation Details__.
1. Complete the __Organisation name__ and __Organisation address__ fields on this page.
1. Select __Save__ to see the following message: "Organisation Details updated".

## Generate API Key

Refer to the documentation on how to [generate an API key for use with your live service](https://docs.payments.service.gov.uk/#generate-api-key-for-api-explorer).

GOV.UK currently supports [Worldpay](/#set-up-worldpay), [ePDQ](/#set-up-epdq) and [Smartpay](/#set-up-smartpay) live gateways. 

The API base URL for live is now the same as for testing: https://publicapi.payments.service.gov.uk/

## Set up Worldpay

To set up your Worldpay live account, you must:

1. Select the merchant code.
1. Set up your profile.
1. Set up the merchant channel.
1. Check that Worldpay has been set up correctly.
1. Set up 3D Secure.

### Prerequisites

You must have:

- an admin account with both Worldpay and GOV.UK Pay
- both your [Worldpay account](https://secure.worldpay.com/sso/public/auth/login.html) and your [GOV.UK Pay account](https://selfservice.payments.service.gov.uk/login) open in different windows in a web browser

### Set up the merchant code

1. Sign in to your [Worldpay account](https://secure.worldpay.com/sso/public/auth/login.html).
1. Select the appropriate merchant code.

If __Switch to Production__ is at the bottom of the left hand menu, select it once to switch from test to production.

Select __Profile__ in the left hand menu.

### Set up profile

You must copy information from your Worldpay account into your GOV.UK Pay account credentials. 

Open your Worldpay and GOV.UK Pay accounts in 2 different web browser windows

1. Go to the [GOV.UK Pay admin site](https://selfservice.payments.service.gov.uk/login).
1. Sign in to your GOV.UK Pay account.
1. Go to __My Services__ and select the live service you want to set up.
1. Select __Settings > Account Credentials > Edit credentials__.

In your Worldpay account Profile page, in the __Identification__ category:

1. Copy the __Merchant Code__ into the GOV.UK Pay __Merchant ID__ field.
1. Copy the __Original XML Username__ into the GOV.UK Pay __Username__ field.
1. Change the XML password:
    - select the pencil icon next to __XML Password__
    - change the password and select __Add new Password__
    - select __OK__ to go back to the Profile page
    - select the pencil icon again, select __Complete__ and then select __OK__
1. Copy the XML password into the GOV.UK Pay __Password__ field.
1. On the GOV.UK Pay page, select __Save credentials__ to go back to the __Account Credentials__ page.

In the __Payment Service__ category on the Worldpay account Profile page, set __Capture delay (days)__ to __Off__.

Select __Merchant Channel__ in the left hand menu.

### Set up merchant channel

In the __http Protocol__ row of the __Merchant Channels (Production)__ category:

1. Select __yes__ under __Active__.
1. Set the Address to https://notifications.payments.service.gov.uk/v1/api/notifications/worldpay.
1. Set __Method__ to __POST__.
1. Set __Client certificate__ to __no__.
1. Set email and shopper email protocols to __no__ under __Active__.

Use the same settings for __Merchant Channels (Test)__ category.

Ensure that the email and http settings for the __Merchant Channel Events (Production)__ and __Merchant Channel Events (Test)__ categories are the same as the image.

### Check that Worldpay has been set up correctly

1. Speak to your Worldpay account manager to check that the cards you want to accept have been set up.
1. Make a test transaction on your live account.
1. Sign in to your [GOV.UK Pay account](https://selfservice.payments.service.gov.uk/).
1.  Go to the [__Transactions__](https://selfservice.payments.service.gov.uk/transactions) page and check that the test transaction is on the transaction list.
1. Select the transaction, and check if you can refund it. Note that the refund button may take up to 20 minutes to appear after submitting the transaction.

### Set up 3D Secure
3D Secure is an additional security layer for online credit and debit card transactions. Card payment organisations offer it to customers under a variety of names e.g. Verified by Visa.  

Ask your Worldpay account manager to configure your merchant code to enable 3D Secure for all payments.

Once complete, sign in to the GOV.UK Pay self-service admin site, select [3D Secure and turn 3D Secure on](https://selfservice.payments.service.gov.uk/3ds).


## Set up ePDQ

To set up ePDQ to work with GOV.UK Pay, you must sign in to the ePDQ admin site and:

1. Add payment methods to your account.
1. Set up account security parameters.
1. Set up notification settings.
1. Set up an API user.
1. Set up live account credentials

### Add payment methods to your account

![](images/epq-2.png)

1. Sign in to the [ePDQ admin site](https://payments.epdq.co.uk/Ncol/Prod/BackOffice/login/index). On the homepage, go to __Configuration > Payment methods__ and select __Choose new payment methods__

1. Select __Add__ next to the relevant payment method.
1. On the __Contract data__ tab:
    - specify whether you have signed a contract for distance selling with an acquiring bank
    - complete the __Affiliation number (UID/Merch ID/VP number)__ field
    - select Submit
1. Go to the PM Activation tab:
    - select __Yes__ for __Activation__
    - select __Submit__
1. Add all relevant payment methods to your account.

### Set up account security parameters

#### Set up hashing method

![](images/epq-3.png)

Go to __Configuration > Technical information__
> Admin users can give you access to this page at __Configuration > Users__

1. On the __Technical Information__ page, select the __Global security parameters__ tab.
1. For the __Hash algorithm__, choose __SHA-512__.
1. For the __Character encoding__, choose __UTF-8__ and select __Save__.

#### Set up checks for e-Commerce & Alias Gateway

![](images/epq-4.png)

1. On the __Technical information__ page, select the __Data and origin verification__ tab.
1. Go to the __Checks for e-Commerce & Alias Gateway__ section.
1. Leave the __URL of the ... orderstandard.asp__ field blank.
1. Enter a strong SHA-IN passphrase in plain text (do not use a hash).
>Note this passphrase as it must be copied into the GOV.UK Pay account credentials page.
1. Go to the __Checks for Barclaycard Direct Link__ section.
1. Leave the __IP address__ blank.
1. Enter the same SHA-IN passphrase as the __Checks for e-Commerce & Alias Gateway__ section and select __Save__.

> A strong passphrase has at least 16 characters, contains at least 4 different characters, at least one letter (a-z) and at least one number (0-9) or symbol (&, @, #, !, etc.). The following symbols cannot be used: ^, {, }, [, ], “, ‘, |, <, >

### Set up notification settings

#### Set up Direct HTTP server to server requests

![](images/epq-5.png)

1. On the __Technical information__ page, select __Transaction feedback__.
1. Go to the __e-Commerce → Direct HTTP server-to-server request__ section.
1. Leave __Timing of the request__ on the default __No request__ setting.
1. Leave the following two fields blank:
    - __If the payment's ... "uncertain"__
    - __If the payment's ... the acquirer"__
1. Set the __Request method__ to __POST__.
1. Go to the __e-Commerce → Dynamic e-Commerce parameters__ section.
1. Check if PAYIDSUB is included in the Selected box:
    - If it is not included, find it in the Available box and select “>” to add it to the Selected box.

#### Set up security for request parameters

![](images/epq-6.png)

1. Go to the __All transaction submission modes > Security for request parameters__ section.
1. Enter a strong SHA-OUT passphrase in plain text (do not a hash).
>Note this passphrase as it must be copied into the GOV.UK Pay account credentials page.
1. Leave the __Basic Authentication Credentials__ blank.
1. Set __Timing of the request__ to __For each offline status change (payment, cancellation, etc.)__
1. Enter https://notifications.payments.service.gov.uk/v1/api/notifications/epdq into the __URL on which the merchant ... change offline__ field.
1. Select __Save__.

### Set up an API user

To set up an API user:

1. Activate your account.
1. Add a user manager.
1. Create an API user.

#### Activate your account

Account activation is completed during ePDQ account creation.

#### Add a user manager

![](images/epq-7.png)

1. Go to __Configuration → Account__.
1. On the __Your options__ tab, under the __Available options__ sub-tab, you will see a list of IDs with Activate buttons. Activate one of the User Manager options.

1. Select accept on the __General Conditions__ screen.
1. Sign out and then sign back in again.
1. You can now go to __Configuration => Users__ to create an API user.

#### Create an API user

![](images/epq-8.png)

1. On the __Users__ page, select __New User__.
1. Complete the __UserID__ and __User’s name__ fields.
1. Complete the __email address__ field with the email that should receive notifications about this account.
1. Select __Admin__ in the __Profile__ field.
1. Check the __Special user for API (no access to admin.)__ option.
1. Enter your own password.
1. Select __Create__.
1. You will then create a password for the API user:
    - enter your own password
    - enter a password for the API user
    - confirm the password for the API user
    - select __Submit__
1. You will see a message that your password has been updated. Select __Back to List__.

>Note the API user’s username and password as you must copy them into the GOV.UK Pay account credentials page. 

### Set up 3D Secure for ePDQ

3D Secure is an additional security layer for online credit and debit card transactions. Card payment organisations offer it to customers under a variety of names e.g. Verified by Visa. 

To enable 3D Secure payment authentication:

1. Sign in to the [GOV.UK Pay self-service admin site](https://selfservice.payments.service.gov.uk/).
1. Select __3D Secure__ and turn 3D Secure on.

3D Secure should be enabled by default on the [ePDQ admin site](https://payments.epdq.co.uk/Ncol/Prod/BackOffice/login/index). To check, go to __Configuration > Payment methods__ and select __3D Secure column__.

### Set up live account credentials

1. Go to the [GOV.UK Pay admin site](https://selfservice.payments.service.gov.uk/login).
1. Sign in to your GOV.UK Pay account.
1. Go to __My Services__ and select the live service you want to set up.
1. Go to __Settings > Account Credentials > Edit credentials__.
1. Complete the fields on this page:
    - __PSP ID__ - enter your PSP ID for ePDQ
    - __Username__ - enter the API user’s username
    - __Password__ - enter the API user’s password
    - __SHA-IN passphrase__ - this passphrase is created on the [_Data and origin verification_ page](/#set-up-checks-for-e-commerce-amp-alias-gateway)
    - __SHA-OUT passphrase__ - this passphrase is created on the [_All transaction submission modes_ page](/#set-up-security-for-request-parameters)
    - select __Save credentials__ to go back to the __Account Credentials__ page    

You have now successfully set up your ePDQ account to work with GOV.UK Pay.

## Set up Smartpay

To set up Smartpay to work with GOV.UK Pay, you must:

1. Configure your user profile on Smartpay.
1. Configure server communication on Smartpay.
1. Set up credentials on GOV.UK Pay.
1. Test your configuration.

### Configure your user profile on Smartpay

![](images/smartpay-set-up-usr.png)

#### Sign in to Smartpay

1. Sign in to Smartpay and your Smartpay organisation.
1. Select the correct merchant account (you can view all merchant accounts by selecting the organisation name at the top of the page).

#### Add new user

1. Select __Settings__ and select __Users__.
1. Select the __Add new user__ button.
1. Select __Web Service__ as the user type.
1. Complete both the __Password__ fields (SmartPay assigns the username); the password must be at least 20 characters long.
1. Leave the __Client Certificate (DN)__ field blank.

You will use this username and password on the GOV.UK Pay admin site to [set up your account credentials](/#).

#### Enable roles and accounts

1. Under __Roles and Associated Accounts__, select __Roles__ and enable the following roles:
    - API PCI Payments role
    - Merchant PAL Webservice role
    - Merchant Recurring role

    >Contact Smartpay if any of these roles are not available.

1. Select __Accounts__ and enable your merchant account.
1. Select __Save__.

#### Generate client encryption key

1. Under __Easy Encryption__, select __Generate__.
1. Leave the other options in this section as default.

#### Edit Allowed User IP Range

1. Set the __IP address__ to 0.0.0.1.
1. Leave the other options in this section as default.
    > You do not need to press allow

### Configure server communication on Smartpay

1. Select __Settings__ and then select __Server Communication__.
1. On the __Server Communication settings for__ page, select __Add__ in the Standard notification row.

![](images/smartpay-stndrd-add.png)

Complete the fields on the __Standard Notification settings__ page.

![](images/smartpay-servr-comms.png)

#### Transport

- __URL__: [https://notifications.payments.service.gov.uk/v1/api/notifications/smartpay](https://notifications.payments.service.gov.uk/v1/api/notifications/smartpay)
- __SSL Version__: TLSv1.2
- __Active__: Checked
- __Accept expired__:  Leave unchecked
- __Accept self-signed__:  Leave unchecked
- __Accept untrusted Root certificates__:  Leave unchecked
- __Service version__: 1
- __Method__: JSON
- __Populate SOAP Action header__: Leave unchecked

#### Authentication

Enter a unique username and password. The password must be at least 10 characters long.

>You will use this username and password on the GOV.UK Pay admin site to set up your notification credentials.

Leave all other settings as default and select __Save configuration__.

### Set up credentials on GOV.UK Pay

You must set up both your Smartpay account credentials and account notification credentials.

1. Go to the [GOV.UK Pay admin site](https://selfservice.payments.service.gov.uk/login).
1. Sign in to your GOV.UK Pay account.
1. Go to __My Services__ and select the Smartpay live service you want to set up.
1. Go to __Settings__ > __Account Credentials__.

#### Set up account credentials

1. Select __Edit credentials__ under __Your smartpay Credentials__.
1. Complete the fields on this page:
    - __Merchant ID__ - enter your merchant ID for Smartpay
    - __Username__ - enter the username allocated to you when you [added a news user](/#Add new user)
    - __Password__ - enter the password you chose when you [added a news user](/#Add new user)
    - select __Save credentials__ to go back to the __Account Credentials__ page

#### Set up notification credentials

1. Select __Edit notification credentials__ under __Your smartpay Notification Credentials__.
1. Complete the __Username__ and __Password__ fields on this page using the username and password you chose when you [configured the notification authentication settings](/#Authentication).
1. Select __Save credentials__ to go back to the __Account Credentials__ page.

### Test your configuration

Check that you have set up your Smartpay account correctly by [creating a payment link](https://selfservice.payments.service.gov.uk/create-payment-link) (requires signing into GOV.UK Pay) and trying to make a payment.

Contact us at [govuk-pay-support@digital.cabinet-office.gov.uk](govuk-pay-support@digital.cabinet-office.gov.uk) if you have any questions.

## Emergency contact details
In the event of an emergency, first check the [status page](https://payments.statuspage.io). Select __subscribe to updates__ to get email notifications whenever GOV.UK Pay creates or updates an incident.

Your service manager has emergency contact details to reach our support team in case of an urgent problem (for example, if you suspect that fraudulent transactions are being made on your account).

Before you enter live, make sure that the right people on your team know how to report an emergency.

## Integrating with existing reporting systems

If you’re a beta partner, the GOV.UK Pay team will hold technical workshops with you to discuss how to integrate GOV.UK Pay reporting with your own financial systems.


## Support 

If you have raised a support request, we will communicate with you individually using our Deskpro ticketing system via [govuk-pay-support@digital.cabinet-office.gov.uk](govuk-pay-support@digital.cabinet-office.gov.uk). This will ensure that you are not relying on a single individual for comms.

We will provide general incident updates to all GOV.UK Pay users through an email mailing list. All users of GOV.UK Pay will be subscribed to this list. You can choose to unsubscribe, but you should ensure that anyone who needs to know about incident or maintenance alerts is subscribed. If you would like someone subscribed to this list please email [govuk-pay-support@digital.cabinet-office.gov.uk](govuk-pay-support@digital.cabinet-office.gov.uk)

You can also select __subscribe to updates__ on the [status page](https://payments.statuspage.io) to get email notifications whenever GOV.UK Pay creates or updates an incident.

In the event of an emergency, first check the [status page](https://payments.statuspage.io). Select __subscribe to updates__ to get email notifications whenever GOV.UK Pay creates or updates an incident.

