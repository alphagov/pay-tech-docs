# Set up a live Worldpay account

Please read the guidance on what to do [before you switch to
live](/switching_to_live/before_you_switch_to_live/#before-you-switch-to-live)
first.

You should follow these instructions in order.

> Worldpay uses the term 'production' for live accounts.

You can also read about setting up live
[ePDQ](/switching_to_live/set_up_a_live_epdq_account) and
[Smartpay](/switching_to_live/set_up_a_live_smartpay_account) accounts.

## Prerequisites

Before you begin, make sure you have an admin account with both Worldpay and GOV.UK Pay.

## Set up your merchant code

Sign in to your [Worldpay
account](https://secure.worldpay.com/sso/public/auth/login.html) and use
__Select MerchantCode__ to find your merchant code.

If __Switch to Production__ is at the bottom of the left-hand menu, toggle it.

## Set up your profile

To set up your profile, you need to copy credentials from your Worldpay account
into your GOV.UK Pay account. 

You will need both your [Worldpay
account](https://secure.worldpay.com/sso/public/auth/login.html) and your
[GOV.UK Pay account](https://selfservice.payments.service.gov.uk/login) open
and signed in, in different web browser tabs.  

1. Select __Profile__ in the left-hand menu in your Worldpay account.

1. In your GOV.UK Pay browser tab, go to __Switch
service__ to select the live service you want to set up. Select __Settings__,
then __Account credentials__, then __Edit credentials__.

1. In your Worldpay browser tab, go to the __Profile__ page, then select
__Identification__. 

1. Copy the Worldpay __Merchant Code__ into the GOV.UK Pay __Merchant ID__
   field.

1. Copy the Worldpay __Original XML Username__ into the GOV.UK Pay __Username__ field.

1. Change the Worldpay XML password:

    <br> select the pencil icon next to __XML Password__ </br>
    <br> change the password and select __Add new Password__ </br>
    <br> select __OK__ to go back to the __Profile__ page </br> 
    <br> select the pencil icon again, then __Complete__ then __OK__ </br>
    <br><br>

1. Copy the Worldpay XML password into the GOV.UK Pay __Password__ field.

1. In your GOV.UK Pay browser tab, select __Save credentials__ to go back to the
__Account credentials__ page.

1. In your Worldpay browser tab, go to the __Profile__ page. Go to the __Payment service__
section and set __Capture delay (days)__ to __Off__.

## Set up “Merchant Channel”

In the left-hand menu of [your Worldpay
account](https://secure.worldpay.com/sso/public/auth/login.html), select
__Merchant Channel__. Go to the __http Protocol__ row of the __Merchant
Channels (Production)__ category.

1. Under __Active__, select __yes__.
2. Set __Address__ to
   `https://notifications.payments.service.gov.uk/v1/api/notifications/worldpay`.
3. Set __Method__ to __POST__.
4. Set __Client certificate__ to __no__.
5. Under __Merchant Channels (Production)__ and __Active__, set the __email__ and __shopper
   email__ protocols to __no__.

Use the same settings for the __Merchant Channels (Test)__ category.

> Your settings should match [those in this image](/images/worldpay_merchantchanneleventsettings.png). 

## How to check Worldpay settings  

1. Contact your Worldpay account manager to confirm that cards you want to
   accept are set up.
2. Make a test transaction on your live account. You can use [the GOV.UK Pay
   API](/api_reference) to do this, or use [payment
   links](/payment_links) if your service is not yet connected to GOV.UK Pay. 
3. Sign in to your [GOV.UK Pay
   account](https://selfservice.payments.service.gov.uk/).
4. Go to the [__Transactions__
   page](https://selfservice.payments.service.gov.uk/transactions) and check
   that your test transaction is in the list of transactions.
5. Select the test transaction, and check if you can refund it.

> The refund option may take up to 20 minutes to appear after submitting the transaction.

## Set up 3D Secure

Ask your Worldpay account manager to configure your merchant code to enable 3D
Secure for all payments.

When this is available, sign in to your [GOV.UK Pay
account](https://selfservice.payments.service.gov.uk/login). Go to __Switch
service__ to select the live service you want to set up. Select __Settings__,
then __3D Secure__ and then select __Turn 3D Secure on__. 

