# Switching to production

Once you have finished testing with your sandbox account, here are the steps you will need to take to switch over from testing to production.

1. Go to the [self-service admin site](https://selfservice.payments.service.gov.uk) and log in with production credentials, not your sandbox credentials. Contact us if you need production credentials.
2. While logged in with your production credentials, generate an API key for use with your production code.
3. Set up the Worldpay account as explained in the section below.

The API endpoint for production is now the same as for testing:  https://publicapi.payments.service.gov.uk/


#### Worldpay setup

You must change some settings in your Worldpay account to get it ready for production use.

1. Log in to Worldpay and in your Worldpay profile, set **Capture delay** to "Off".<br /><br />![](https://s3-eu-west-1.amazonaws.com/pay-govuk-documentation/pay-worldpay-autocaptureoff.png)
2. Still in Worldpay, go to **Profile > Merchant Channel** and set the endpoint for HTTP notifications from Worldpay to GOV.UK Pay to https://notifications.payments.service.gov.uk/v1/api/notifications/worldpay
<br /><br />
Use the same URL for Test and Production channels within Worldpay. The completed settings should look like this:
<br /><br />![](https://s3-eu-west-1.amazonaws.com/pay-govuk-documentation/worldpay-settings1.png)

##### Worldpay setup for 3D Secure

If you want to use 3D Secure authentication for your payments, ask your Worldpay account manager to configure your merchant code (you cannot do this yourself by logging in to Worldpay). Ask them to enable 3D Secure for all payments. Once this is done, you can sign in to the [GOV.UK Pay self-service admin site and turn on 3D Secure](https://selfservice.payments.service.gov.uk/3ds).

#### Emergency contact details

Your service manager should have been given details of emergency contact methods to reach our support team in case of an urgent problem (for example, if you suspect that fraudulent transactions are being made on your account).

Before you enter production, you should make sure that the right people on your team know how to report an emergency.

#### Integrating with existing reporting systems

If you’re a beta partner, the GOV.UK Pay team will hold technical workshops with you to discuss how to integrate the reporting from GOV.UK Pay with your own financial systems.
