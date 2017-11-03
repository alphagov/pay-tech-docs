# Switching to live

Once you have finished testing with your sandbox account, here are the steps you will need to take to switch over from testing to live.

## Set up GOV.UK Pay account

Request a live account by emailing GOV.UK Pay at [govuk-pay-support@digital.cabinet-office.gov.uk](govuk-pay-support@digital.cabinet-office.gov.uk). Once you have a live account, it will appear in the “My Services” section and be clearly labelled as a “Live” account, e.g. “worldpay live”, “smartpay live” or “ePDQ live”.

To set up your live account credentials:

1. Go to the [GOV.UK Pay admin site](https://selfservice.payments.service.gov.uk/login).
1. Sign in to your GOV.UK Pay account.
1. Go to _My Services_ and click on the _ePDQ Live_ service.
1. Go to _Settings > Account Credentials > Edit credentials_.
1. Complete the fields on this page; these will vary depending on which live service you use.
1. Click _Save credentials_ to go back to the _Account Credentials_ page.

>For an _ePDQ_ live account, enter the SHA-IN passphrase created on the _Data and origin verification_ page, and the SHA-OUT passphrase created on the _All transaction submission modes_ page


## Generate API Key

Refer to the documentation for instructions on how to [generate an API key for use with your live code](https://govukpay-docs.cloudapps.digital/#generate-api-key-for-api-explorer).

GOV.UK currently supports Worldpay and Barclays ePDQ live gateways. Setup instructions are explained in the Worldpay and ePDQ sections.

The API endpoint for live is now the same as for testing: https://publicapi.payments.service.gov.uk/

## Worldpay setup

You must change some settings in your Worldpay account to get it ready for live use.

1. Log in to Worldpay and in your Worldpay profile, set *Capture delay* to "Off".<br /><br />![](https://s3-eu-west-1.amazonaws.com/pay-govuk-documentation/pay-worldpay-autocaptureoff.png)
2. Still in Worldpay, go to *Profile > Merchant Channel* and set the endpoint for HTTP notifications from Worldpay to GOV.UK Pay to https://notifications.payments.service.gov.uk/v1/api/notifications/worldpay
<br /><br />
Use the same URL for Test and Live channels within Worldpay. The completed settings should look like this:
<br /><br />![](https://s3-eu-west-1.amazonaws.com/pay-govuk-documentation/worldpay-settings1.png)

### Worldpay setup for 3D Secure

If you want to use 3D Secure authentication for your payments, ask your Worldpay account manager to configure your merchant code (you cannot do this yourself by logging in to Worldpay). Ask them to enable 3D Secure for all payments. Once this is done, you can sign in to the [GOV.UK Pay self-service admin site and turn on 3D Secure](https://selfservice.payments.service.gov.uk/3ds).

## ePDQ setup

To set up ePDQ to work with GOV.UK Pay, you must log into the ePDQ admin site and:

1. Add payment methods to your account.
1. Set up account security parameters.
1. Set up notification settings.
1. Set up an API user.

### Add payment methods to your account

![](images/epq-2.png)

1. Log into the [ePDQ admin site](https://payments.epdq.co.uk/Ncol/Prod/BackOffice/login/index). On the homepage, go to _Configuration > Payment methods_ and select _Choose new payment methods_

1. Click _Add_ next to the relevant payment method.
1. On the _Contract data_ tab:
    - Specify whether you have signed a contract for distance selling with an acquiring bank
    - Complete the _Affiliation number (UID/Merch ID/VP number)_ field
    - Click Submit
1. Go to the PM Activation tab:
    - Select _Yes_ for _Activation_
    - Click _Submit_
1. Add all relevant payment methods to your account.



### Set up account security parameters

#### Set up hashing method

![](images/epq-3.png)

Go to _Configuration > Technical information_
> If you cannot access this page, ask an admin user to grant you access to it; they can do this at _Configuration > Users_

1. On the _Technical Information_ page, click the _Global security parameters_ tab.
1. For the _Hash algorithm_, choose _SHA-512_.
1. For the _Character encoding_, choose _UTF-8_ and click _Save_.



#### Set up checks for e-Commerce & Alias Gateway

![](images/epq-4.png)

1. On the _Technical information_ page, click the _Data and origin verification_ tab.
1. Scroll to the _Checks for e-Commerce & Alias Gateway_ section.
1. Leave the _URL of the merchant page containing the payment form that will call the page: orderstandard.asp_ field blank.
1. Enter a strong SHA-IN passphrase (plain text, not a hash); this will be used when setting up the GOV.UK Pay account credentials.
1. Scroll down to the _Checks for Barclaycard Direct Link_ section.
1. Leave the _IP address_ blank.
1. Enter the same SHA-IN passphrase as the _Checks for e-Commerce & Alias Gateway_ section and click _Save_.

> _Strong_ is defined as a passphrase with at least 16 characters, containing at least 4 different characters, at least one letter (a-z) and at least one number (0-9) or symbol (&, @, #, !, etc.). The following symbols cannot be used: ^, {, }, [, ], “, ‘, |, <, >

### Set up notification settings

#### Set up Direct HTTP server to server requests

![](images/epq-5.png)

1. On the _Technical information_ page, click _Transaction feedback_.
1. Scroll to the _e-Commerce → Direct HTTP server-to-server request_ section.
1. Leave _Timing of the request_ on the default _No request_ setting.
1. Leave the following two fields blank:
    - _If the payment's status is "accepted", "on hold" or "uncertain"_
    - _If the payment's status is "cancelled by the client" or "too many rejections by the acquirer"_
1. Set the _Request method_ to _POST_.
1. Scroll to the _e-Commerce → Dynamic e-Commerce parameters_ section.
1. Check if PAYIDSUB is included in the Selected box:
    - If it is not included, find it in the Available box and click “>” to add it to the Selected box.

#### Set up security for request parameters

![](images/epq-6.png)

1. Scroll to the _All transaction submission modes > Security for request parameters_ section.
1. Enter a strong SHA-OUT passphrase (plain text, not a hash); this will be used when setting up the GOV.UK Pay account credentials.
1. Leave the _Basic Authentication Credentials_ blank.
1. Set _Timing of the request_ to _For each offline status change (payment, cancellation, etc.)_
1. Enter **https://notifications.payments.service.gov.uk/v1/api/notifications/epdq** into the _URL on which the merchant wishes to receive a deferred HTTP request, should the status of a transaction change offline_ field.
1. Click _Save_.




### Set up an API user

To set up an API user:

1. Activate your account
1. Add a user manager
1. Create an API user

#### Activate your account

Account activation is completed during ePDQ account creation.

#### Add a user manager

![](images/epq-7.png)


1. Go to _Configuration → Account_.
1. On the _Your options_ tab, under the _Available options_ sub-tab, you will see a list of IDs with Activate buttons. Activate one of the User Manager options.

1. Click accept on the _General Conditions_ screen.
1. Log out by clicking the _Logout_ option in the top right hand corner of the screen, and then log back in again.
1. You can now go to _Configuration => Users_ to create an API user.

#### Create an API user

![](images/epq-8.png)

1. On the _Users_ page, click _New User_.
1. Complete the _UserID_ and _User’s name_ fields.
1. Complete the _email address_ field with the email of the person who should receive notifications about this account.
1. Select _Admin_ in the _Profile_ field.
1. Check the _Special user for API (no access to admin.)_ option.
1. Enter your own password.
1. Click _Create_.
1. You will then create a password for the API user:
    - Enter your own password.
    - Enter a password for the API user.
    - Confirm the password for the API user.
    - Click _Submit_.
1. You will see a message that your password has been successfully updated. Click _Back to List_.

You have now successfully set up your ePDQ account to work with GOV.UK Pay.

## Emergency contact details

Your service manager should have been given details of emergency contact methods to reach our support team in case of an urgent problem (for example, if you suspect that fraudulent transactions are being made on your account).

Before you enter live, you should make sure that the right people on your team know how to report an emergency.

## Integrating with existing reporting systems

If you’re a beta partner, the GOV.UK Pay team will hold technical workshops with you to discuss how to integrate the reporting from GOV.UK Pay with your own financial systems.
