# Set up a live Smartpay account

You should follow these instructions in order.

## Configure your user profile on Smartpay

Sign in to Smartpay, then select the correct merchant account. You can select
the organisation name at the top of the page to view all merchant accounts. 

### Add new user

1. Select __Settings__ and then __Users__.
1. Select __Add new user__.
1. Select __Web Service__ as the user type.
1. Complete both the __Password__ fields. 
1. Leave the __Client Certificate (DN)__ field blank.

>  You will use this username and password on the GOV.UK Pay admin site to
>  [set up your account credentials](/switching_to_live/#set-up-credentials-on-gov-uk-pay).

### Enable roles and accounts

Under __Roles and Associated Accounts__, select __Roles__ and enable the
following roles:

  * API PCI Payments role
  * Merchant PAL Webservice role
  * Merchant Recurring role

> Contact Smartpay if any of these roles are not available.

Select __Accounts__ and enable your merchant account, then select __Save__.

### Generate client encryption key

Under __Easy Encryption__, select __Generate__. Leave the other options 
as their defaults.

### Edit allowed user IP range

Set the __IP address__ to `0.0.0.1`. Leave the other options 
as their defaults.
    
## Configure server communication on Smartpay

Select __Settings__ and then __Server Communication__.

On the __Server Communication settings__ page, select __Add__ in the
Standard notification row.

Complete all the fields on the __Standard Notification settings__ page.

### Set up "Transport" 

Complete the fields in the __Transport__ page as follows:

- __URL__: `https://notifications.payments.service.gov.uk/v1/api/notifications/smartpay`
- __SSL Version__: TLSv1.2 
- __Active__: Checked 
- __Accept expired__:  Leave unchecked 
- __Accept self-signed__:  Leave unchecked 
- __Accept untrusted Root certificates__:  Leave unchecked 
- __Service version__: 1 
- __Method__: JSON
- __Populate SOAP Action header__: Leave unchecked

### Authentication

Enter a unique username and password. The password must be at least 10
characters long.

> You will use this username and password on the GOV.UK Pay admin site later, to set
> up your notification credentials.

Leave all other settings to their defaults and select __Save configuration__.

## 3D Secure for Smartpay

To enable 3D Secure payment authentication, sign in to the [GOV.UK Pay
self-service admin site](https://selfservice.payments.service.gov.uk/). Go to
__Switch service__ to select the live service you want to set up. Select
__Settings__, then __3D Secure__ and then __Turn on 3D Secure__. 

Barclaycard are responsible for setting up 3D Secure payment authentication
for your Smartpay account. You do not need to set anything manually.

## Set up credentials on GOV.UK Pay

1. Sign in to your [GOV.UK Pay
   account](https://selfservice.payments.service.gov.uk/login).
1. Go to __Switch service__ and select the Smartpay live service you want to
   set up.
1. Go to __Settings__ then __Account credentials__.

### Set up account credentials

Under __Your Smartpay credentials__, select __Edit credentials__ .

Complete the following fields on this page:

* **Merchant ID**
* **Username**
* **Password**

> Your merchant ID should be for Smartpay, and you should have a username and
> password from [adding a new user](#add-new-user).

### Set up notification credentials

1. Under __Your Smartpay notification credentials__, select __Edit
   notification credentials__. 
1. Complete the __Username__ and __Password__ fields on this page using the
   username and password described in ["Authentication"](#authentication).
1. Select __Save credentials__ to go back to the __Account credentials__ page.

## Test your configuration

Sign in to GOV.UK Pay and create a payment link, then try to make a payment. If this is successful, your Smartpay account is set up
correctly. 

You can [read about how to create payment links](/payment_links/#payment-links).
