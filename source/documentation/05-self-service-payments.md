# Self-service payments

You may want to use self-service payment links rather than integrate with the GOV.UK Pay API if your service:

- is non-digital and uses paper applications to process payments
- is non-digital and has low transaction volumes
- asks users for payment by sending email or letters
- does not have a development team that can integrate your service with GOV.UK Pay

### Prerequisites

Before you set up a self-service payment link, you must have a [live service](/switching_to_production/#switching-to-live). You do not need an [API key](/#generate-api-key-for-api-explorer) or to use the [API explorer](/#api-explorer-setup).

### Create a payment link

1. Sign in to your [GOV.UK Pay account](https://selfservice.payments.service.gov.uk/).
1. Select [Create a payment link](https://selfservice.payments.service.gov.uk/create-payment-link) in the Dashboard.
1. Select __Create a payment link__.

### Set payment link information

On the __Set payment link information__ page:

1. Complete the __Title__ field.  
1. Complete the optional __Details__ field if necessary, and select __Continue__.
1. You must change your payment link if it is identical to an existing link.

### Specify payment reference

1. Select either __Yes, create a unique payment reference number for my users__ or __No, I would like to use my own__.
1. If you selected __No, I would like to use my own__, complete the __Name of your payment reference number__ and optional __Hint text__ fields if necessary.
1. Select __Continue__.

### Specify whether payment is fixed or variable

1. Select __Yes__ or __No, the user can choose the amount for the payment amount__
1. If you selected __Yes__, enter the payment amount.
1. Select __Continue__.

### Review payment link details

1. Review your payment link details.
1. Select __Create link__.

You can now send the live payment link to your users.

### Reference number and confirmation

Your users will receive a reference number and confirmation email when they use a self-service payment link. You can find the reference number on the [Transactions page](https://selfservice.payments.service.gov.uk/transactions). You will not receive a transaction reference number by default, unless you tell your users to send them to you.

GOV.UK Pay creates and hosts the self-service payment confirmation page.