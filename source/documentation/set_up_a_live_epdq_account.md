# Set up a live ePDQ account

Please read the guidance on what to do [before you switch to
live](/switching_to_live/before_you_switch_to_live/#before-you-switch-to-live)
first.

You should follow these instructions in order.

You can also read about setting up live [Smartpay](/switching_to_live/set_up_a_live_smartpay_account) and
[Worldpay](/switching_to_live/set_up_a_live_worldpay_account) accounts. 

## Add payment methods to your account

Sign in to the [ePDQ admin
site](https://payments.epdq.co.uk/Ncol/Prod/BackOffice/login/index). On the
landing page, go to __Configuration__ then __Payment methods__ and select __Choose
new payment methods__. Select __Add__ next to all relevant payment methods.

On the __Contract data__ tab:
    
  * specify whether you have signed a contract for distance selling with an acquiring bank 
  * complete the __Affiliation number (UID/Merch ID/VP number)__ field 
  * select __Submit__

On the __PM Activation__ tab:
    
  * select __Yes__ for __Activation__
  * select __Submit__

## Set up account security parameters

### Set up hashing method

On the [ePDQ admin
site](https://payments.epdq.co.uk/Ncol/Prod/BackOffice/login/index), go to
__Configuration__. 

1. On the __Technical Information__ page, select the __Global security
   parameters__ tab.
1. For the __Hash algorithm__, choose __SHA-512__.
1. For the __Character encoding__, choose __UTF-8__ and select __Save__.

### Set up checks for "e-Commerce & Alias Gateway"

On the [ePDQ admin
site](https://payments.epdq.co.uk/Ncol/Prod/BackOffice/login/index), go to
__Configuration__. 

1. On the __Technical information__ page, select the __Data and origin
   verification__ tab.
1. Go to the __Checks for e-Commerce & Alias Gateway__ section.
1. Leave the following field blank: __URL of the merchant page containing the payment form that will
   call the page: orderstandard.asp__.
1. Enter a strong SHA-IN passphrase in plaintext. Do not use a hash. You will
   need to copy this passphrase into the GOV.UK Pay account credentials page
   later.

    > A strong passphrase has at least 16 characters, contains at least 4 different characters, at least one letter (a-z), and at least one number (0-9) or symbol (&, @, #, !, etc.). You cannot use ^, {, }, [, ], “, ‘, |, <, or >.

1. Go to the __Checks for Barclaycard Direct Link__ section.
1. Leave the __IP address__ blank.
1. Enter the same SHA-IN passphrase as in the __Checks for e-Commerce & Alias
Gateway__ section and select __Save__.


## Set up notification settings

### Set up Direct HTTP server to server requests

On the [ePDQ admin
site](https://payments.epdq.co.uk/Ncol/Prod/BackOffice/login/index), go to
__Configuration__. 

1. On the __Technical information__ page, select __Transaction feedback__.
1. Go to __e-Commerce__ and the __Direct HTTP server-to-server request__
   section.
1. Leave __Timing of the request__ on the default __No request__ setting.
1. Leave the following fields blank: 
<br>__If the payment's status is "accepted", "on hold" or "uncertain"__</br> 
<br>__If the payment's status is "cancelled by the client" or "too many rejections by the acquirer"__ </br>

1. Set the __Request method__ to __POST__.
1. Go to the __e-Commerce__ then __Dynamic e-Commerce parameters__ section.
1. Check if "PAYIDSUB" is included in the __Selected__ box. If it is not, find it
   in the __Available__ box and select __>__ to add it. 

### Set up security for request parameters

> Take note of the passphrase you set in this section. It must be copied into the GOV.UK Pay account credentials page later.

1. Go to __All transaction submission modes__ and the __Security for request
   parameters__ section.
1. Enter a strong SHA-OUT passphrase in plain text. Do not use a hash. 
1. Leave the __Basic Authentication Credentials__ field blank.
1. Set __Timing of the request__ to: <br> __For each offline status change
   (payment, cancellation, etc.)__</br>
1. In the __URL on which the merchant wishes to receive a deferred HTTP request,
should the status of a transaction change offline__ field, enter:
<br> `https://notifications.payments.service.gov.uk/v1/api/notifications/epdq`
</br> 
1. Select __Save__.

## Set up an API user

You can add a user manager, then create an API user. 

### Add a user manager

1. Go to __Configuration__ then __Account__.
1. Go to the __Your options__ tab.
1. Under the __Available options__ sub-tab, you’ll see a list of IDs with
   __Activate__ options. 
1. Activate one of the __User Manager__ options.
1. Select __Accept__ on the __General Conditions__ screen.
1. Sign out and then sign back in again.

### Create an API user

1. On the __Users__ page, select __New User__.
1. Complete the __UserID__ and __User’s name__ fields.
1. Complete the __Email address__ field. This should contain the email address you want to receive notifications at.
1. In the __Profile__ field, select __Admin__.  
1. Check the __Special user for API (no access to admin.)__ option.
1. Enter your own password and select __Create__.

> Store the API user’s username and password securely. You will need to copy them into the GOV.UK Pay account credentials page later.

## Set up 3D Secure for ePDQ

To enable 3D Secure payment authentication, sign in to the [GOV.UK Pay
self-service admin site](https://selfservice.payments.service.gov.uk/). Go to
__Switch service__ to select the live service you want to set up. Select
__Settings__, then __3D Secure__ and then __turn 3D Secure on__. 

3D Secure should be enabled by default on the [ePDQ admin
site](https://payments.epdq.co.uk/Ncol/Prod/BackOffice/login/index). To check
this, go to __Configuration__ then  __Payment methods__ and select __3D Secure__.

## Set up live GOV.UK Pay credentials

1. Sign in to your [GOV.UK Pay
   account](https://selfservice.payments.service.gov.uk/login).
1. Go to __Switch service__ and select the live service you want to set up.
1. Go to __Settings__ then __Account credentials__ then __Edit credentials__.

1. Complete the following fields:
  <br> __PSP ID__ - enter your PSP ID for ePDQ</br>
  <br> __Username__ enter the API user’s username</br>
  <br> __Password__ - enter the API user’s password</br> 
  <br> __SHA-IN passphrase__ - described in ["Set up account security parameters"](#set-up-account-security-parameters)</br>
  <br> __SHA-OUT passphrase__ - described in ["Set up notification settings"](#set-up-notification-settings)</br>

1. Select __Save credentials__.  

