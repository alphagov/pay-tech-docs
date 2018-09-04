# Switching to live

Follow these steps to switch your account from 'test' to 'live'. You should
only do this when you’ve finished testing with your sandbox account, and
you’re confident that your integration is working.

GOV.UK Pay currently supports [Worldpay](/#set-up-worldpay),
[ePDQ](/#set-up-epdq) and [Smartpay](/#set-up-smartpay) live gateways. 

## Before you begin

Unless stated otherwise, this guidance is for services that have integrated
with the GOV.UK Pay API or which use the [self-service payment
link](/#self-service-payments) functionality.

Before you start taking live payments, make sure that the right people on your
team [know how to report an emergency](#emergency-contact-details).

## Request a live account

1. Sign in to your [GOV.UK Pay
   account](https://selfservice.payments.service.gov.uk/login).
1. Select __Switch service__.
1. For the test account you want to make live, select __Manage team members__
   on the dashboard.
1. Copy the full page URL - this will be of the form
   https://selfservice.payments.service.gov.uk/service/23f0eb425a9569988b99b5bb641a541d
1. Send this to the GOV.UK Pay team at
   [govuk-pay-support@digital.cabinet-office.gov.uk](govuk-pay-support@digital.cabinet-office.gov.uk).

We will change your account to live within one business day.

Once your account is live it will appear in the __Switch service__ page
labelled as a ‘Live card account’.

## Complete organisation details

Payment processors require organisation information to be displayed on payment
pages. Before going live, you need to provide this information to GOV.UK Pay
so that we can display it on the payment pages for you.

1. Sign in to your [GOV.UK Pay
   account](https://selfservice.payments.service.gov.uk/login).
1. Select __Switch service__.
1. For the test account you want to make live, select __Organisation
   details__.
1. Complete the __Name__ and __Address__ fields.
1. Select __Save__

> Make sure that the organisation is the entity that has a contract with the PSP.

## Generate an API key

Refer to the instructions on how to [generate an API key for use with your
live
service](https://docs.payments.service.gov.uk/#generate-api-key-for-api-explorer).

## Set up Worldpay

Worldpay uses the term ‘production’ for live accounts.

Before you begin, make sure you have:

- an admin account with both Worldpay and GOV.UK Pay both your [Worldpay
- account](https://secure.worldpay.com/sso/public/auth/login.html) and your
- [GOV.UK Pay account](https://selfservice.payments.service.gov.uk/login) open
- in different tabs in a web browser

### Set up the merchant code

Sign in to your [Worldpay
account](https://secure.worldpay.com/sso/public/auth/login.html) and use
‘Select MerchantCode’ to find the appropriate merchant code.

If __Switch to Production__ is at the bottom of the left-hand menu, select it
once. 

### Set up your profile

Select __Profile__ in the left-hand menu in your Worldpay account.

To set up your profile, you should copy information from your Worldpay account
into your GOV.UK Pay account credentials. 

In one browser tab, sign in to your [GOV.UK Pay
account](https://selfservice.payments.service.gov.uk/login) and go to __Switch
service__ to select the live service you want to set up. Select __Settings__,
then __Account credentials__, then __Edit credentials__.

In another browser tab, sign in to your Worldpay account. Go to your
__Profile__ page, then select __Identification__. 

1. Copy the Worldpay __Merchant Code__ into the GOV.UK Pay __Merchant ID__ field.

2. Copy the __Original XML Username__ into the GOV.UK Pay __Username__ field.

Change the XML password:

    - select the pencil icon next to __XML Password__
    - change the password and select __Add new Password__
    - select __OK__ to go back to the __Profile__ page
    - select the pencil icon again, then __Complete__ then __OK__

Copy the XML password into the GOV.UK Pay __Password__ field.

On the GOV.UK Pay page, select __Save credentials__ to go back to the __Account credentials__ page.

In your Worldpay account __Profile__ page, go to the __Payment service__ section. Set __Capture delay (days)__ to __Off__.

### Set up “Merchant Channel”

In the left-hand menu, select __Merchant Channel__. Go to the __http Protocol__ row of the __Merchant Channels (Production)__ category.

1. Under __Active__, select __yes__.
2. Set __Address__ to `https://notifications.payments.service.gov.uk/v1/api/notifications/worldpay`.
3. Set __Method__ to __POST__.
4. Set __Client certificate__ to __no__.
5. Under __Merchant Channels (Production)__, set the __email__ and __shopper email__ protocols to __no__ under __Active__.

Use the same settings for the __Merchant Channels (Test)__ category.

#### Merchant Channel Events settings

Make sure the email and HTTP settings for the __Merchant Channel Events (Production)__ and __Merchant Channel Events (Test)__ categories are set up according to [this image](/images/worldpay_merchantchanneleventsettings.png).

### Check Worldpay is set up correctly

1. Speak to your Worldpay account manager to check that cards you want to accept are set up.
2. Make a test transaction on your live account. You can use the API to do this, or test it using [payment links](/payment_links) if your service is not yet connected to GOV.UK Pay.
3. Sign in to your [GOV.UK Pay account](https://selfservice.payments.service.gov.uk/).
4. Go to the [__Transactions__ page](https://selfservice.payments.service.gov.uk/transactions) and check that the test transaction is in the list of transactions.
5. Select the test transaction, and check if you can refund it.

> The refund option may take up to 20 minutes to appear after submitting the transaction.

### Set up 3D Secure

Ask your Worldpay account manager to configure your merchant code to enable 3D Secure for all payments.

When this is available, sign in to your [GOV.UK Pay account](https://selfservice.payments.service.gov.uk/login). Go to __Switch service__ to select the live service you want to set up. Select __Settings__, then __3D Secure__ and then __turn 3D Secure on__.

## Set up ePDQ

### Add payment methods to your account


Sign in to the [ePDQ admin site](https://payments.epdq.co.uk/Ncol/Prod/BackOffice/login/index). On the homepage, go to __Configuration__ then __Payment methods__ and select __Choose new payment methods__. Select __Add__ next to the relevant payment method.

On the __Contract data__ tab:
    - specify whether you have signed a contract for distance selling with an acquiring bank
    - complete the __Affiliation number (UID/Merch ID/VP number)__ field
    - select Submit

Go to the PM Activation tab:
    - select __Yes__ for __Activation__
    - select __Submit__

Finally, add all relevant payment methods to your account.

### Set up account security parameters

#### Set up hashing method


Go to __Configuration__ then __Technical information__

1. On the __Technical Information__ page, select the __Global security parameters__ tab.
1. For the __Hash algorithm__, choose __SHA-512__.
1. For the __Character encoding__, choose __UTF-8__ and select __Save__.

#### Set up checks for e-Commerce & Alias Gateway


1. On the __Technical information__ page, select the __Data and origin verification__ tab.
1. Go to the __Checks for e-Commerce & Alias Gateway__ section.
1. Leave the __URL of the ... orderstandard.asp__ field blank.
1. Enter a strong SHA-IN passphrase in plaintext (do not use a hash).
> This passphrase as it must be copied into the GOV.UK Pay account credentials page.
1. Go to the __Checks for Barclaycard Direct Link__ section.
1. Leave the __IP address__ blank.
1. Enter the same SHA-IN passphrase as the __Checks for e-Commerce & Alias Gateway__ section and select __Save__.

> A strong passphrase has at least 16 characters, contains at least 4 different characters, at least one letter (a-z), and at least one number (0-9) or symbol (&, @, #, !, etc.). You cannot use ^, {, }, [, ], “, ‘, |, <, or >.

### Set up notification settings

#### Set up Direct HTTP server to server requests


1. On the __Technical information__ page, select __Transaction feedback__.
1. Go to the __e-Commerce__ then __Direct HTTP server-to-server request__ section.
1. Leave __Timing of the request__ on the default __No request__ setting.
1. Leave the fields - __If the payment's ... "uncertain"__ and __If the payment's ... the acquirer"__ blank.
1. Set the __Request method__ to __POST__.
1. Go to the __e-Commerce__ then __Dynamic e-Commerce parameters__ section.
1. Check if “PAYIDSUB” is included in the Selected box - if it is not, find it in the __Available__ box and select __>__ to add it to the __Selected__ box.

#### Set up security for request parameters

> Take note of the passphrase you set in this section. It must be copied into the GOV.UK Pay account credentials page later.

1. Go to the __All transaction submission modes > Security for request parameters__ section.
1. Enter a strong SHA-OUT passphrase in plain text - do not a hash.
1. Leave the __Basic Authentication Credentials__ blank.
1. Set __Timing of the request__ to __For each offline status change (payment, cancellation, etc.)__
1. Enter https://notifications.payments.service.gov.uk/v1/api/notifications/epdq into the __URL on which the merchant ... change offline__ field.
1. Select __Save__.

### Set up an API user

#### Add a user manager

1. Go to __Configuration__ then __Account__.
1. Go to the __Your options__ tab.
1. Under the __Available options__ sub-tab, you’ll see a list of IDs with __Activate__ options. 1. Activate one of the __User Manager__ options.
1. Select __Accept__ on the __General Conditions__ screen.
1. Sign out and then sign back in again.
1. You should now be able to go to __Configuration__ then __Users__ to create an API user.

#### Create an API user

1. On the __Users__ page, select __New User__.
1. Complete the __UserID__ and __User’s name__ fields.
1. Complete the __email address__ field with the email that should receive notifications about this account.
1. Select __Admin__ in the __Profile__ field.
1. Check the __Special user for API (no access to admin.)__ option.
1. Enter your own password.
1. Select __Create__.

To create a password for the API user:

    - enter your own password
    - enter a password for the API user
    - confirm the password for the API user
    - select __Submit__

> Store the API user’s username and password securely. You will need to copy them into the GOV.UK Pay account credentials page later.

### Set up 3D Secure for ePDQ

To enable 3D Secure payment authentication, sign in to the [GOV.UK Pay self-service admin site](https://selfservice.payments.service.gov.uk/). Go to __Switch service__ to select the live service you want to set up. Select __Settings__, then __3D Secure__ and then __turn 3D Secure on__. 

3D Secure should be enabled by default on the [ePDQ admin site](https://payments.epdq.co.uk/Ncol/Prod/BackOffice/login/index). To check this, go to __Configuration__ then  __Payment methods__ and select __3D Secure column__.

### Set up live account credentials

1. Sign in to your [GOV.UK Pay account](https://selfservice.payments.service.gov.uk/login).
1. Go to __Switch service__ and select the live service you want to set up.
1. Go to __Settings__ then __Account credentials__ then Edit credentials__.

Complete the following fields:

    - __PSP ID__ - enter your PSP ID for ePDQ
    - __Username__ - enter the API user’s username
    - __Password__ - enter the API user’s password
    - __SHA-IN passphrase__ - this passphrase is created on the [_Data and origin verification_ page](/#set-up-checks-for-e-commerce-amp-alias-gateway)
    - __SHA-OUT passphrase__ - this passphrase is created on the [_All transaction submission modes_ page](/#set-up-security-for-request-parameters)

Select __Save credentials__ to go back to the __Account credentials__ page

## Set up Smartpay



### Configure your user profile on Smartpay

#### Sign in to Smartpay

Sign in to Smartpay, then select the correct merchant account. You can view all merchant accounts by selecting the organisation name at the top of the page.

#### Add new user

1. Select __Settings__ and then __Users__.
1. Select the __Add new user__ button.
1. Select __Web Service__ as the user type.
1. Complete both the __Password__ fields (SmartPay assigns the username) - the password must be at least 20 characters long.
1. Leave the __Client Certificate (DN)__ field blank.

You will use this username and password on the GOV.UK Pay admin site to [set up your account credentials](/#).

#### Enable roles and accounts

Under __Roles and Associated Accounts__, select __Roles__ and enable the following roles:

    - API PCI Payments role
    - Merchant PAL Webservice role
    - Merchant Recurring role

> Contact Smartpay if any of these roles are not available.

Select __Accounts__ and enable your merchant account, then select __Save__.

#### Generate client encryption key

Under __Easy Encryption__, select __Generate__. Leave the other options in this section as their defaults.

#### Edit allowed user IP range

Set the __IP address__ to `0.0.0.1`. Leave the other options in this section as their defaults.

### Configure server communication on Smartpay

Select __Settings__ and then select __Server Communication__.

On the __Server Communication settings for__ page, select __Add__ in the Standard notification row.


Complete all the fields on the __Standard Notification settings__ page.

#### Set up “Transport” 

Complete fields in the __Transport__ page as follows:

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

> You will use this username and password on the GOV.UK Pay admin site to set up your notification credentials.

Leave all other settings to their defaults and select __Save configuration__.

### 3D Secure for Smartpay

To enable 3D Secure payment authentication, sign in to the [GOV.UK Pay self-service admin site](https://selfservice.payments.service.gov.uk/). Go to __Switch service__ to select the live service you want to set up. Select __Settings__, then __3D Secure__ and then __Turn on 3D Secure__. 

Barclaycard are responsible for setting up 3D Secure payment authentication for your Smartpay account. You do not need to set anything manually.


### Set up credentials on GOV.UK Pay

1. Sign in to your [GOV.UK Pay account](https://selfservice.payments.service.gov.uk/login).
1. Go to __Switch service__ and select the Smartpay live service you want to set up.
1. Go to __Settings__ then __Account credentials__.

#### Set up account credentials

Under __Your Smartpay credentials__, select __Edit credentials__ .

Complete the following fields on this page:

* **Merchant ID**
* **Username**
* **Password**

> Your merchant ID should be for Smartpay, and you should have a username and
> password from [adding a new user](#add-new-user).


#### Set up notification credentials

1. Under __Your Smartpay notification credentials__, select __Edit notification credentials__.
1. Complete the __Username__ and __Password__ fields on this page using the username and password you chose when you [configured the notification authentication settings](/#Authentication).
1. Select __Save credentials__ to go back to the __Account credentials__ page.

### Test your configuration

Sign in to GOV.UK Pay and create a payment link](https://selfservice.payments.service.gov.uk/create-payment-link), then try to make a payment. If this is successful, your Smartpay account is set up correctly.


## Emergency contact details

Before you switch to live, make sure that the right people on your team know how to report an emergency.

Your service manager should have emergency contact details to reach our support team in case of an urgent problem. For example, if you suspect that fraudulent transactions are being made on your account.

In the event of an emergency, first check the [status page](https://payments.statuspage.io). Select __subscribe to updates__ to get email notifications whenever GOV.UK Pay creates or updates an incident.


## Support

While GOV.UK Pay is in beta, we can provide hands-on support to you as you make your service live, if you require it.



