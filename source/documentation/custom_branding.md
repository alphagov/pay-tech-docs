## Custom branding 

GOV.UK Pay supports custom branding on payment pages.

You can [contact the GOV.UK Pay](/support_contact_and_more_information) to
request customisation for the following features:

* the logo displayed in the left-hand side of the top banner
* the background and border colour of the top banner
* your payment confirmation email from GOV.UK Notify

### Banner logo

You should provide an image of your desired custom banner logo [to GOV.UK Pay
directly](/support_contact_and_more_information). Your image should:

* be in PNG or SVG format
* be at least 2x the image that will be displayed on-screen
* be cropped to leave minimal whitespace around the logo
* be optimised for web and compressed using imageOptim or similar software

### Banner background and border colour

You can make a request for custom colours [to GOV.UK Pay
directly](/support_contact_and_more_information). 




To customise the banner colours, you can make a copy of the SCSS file 
`assets/sass/custom/custom.scss`.  You must give the new file a unique name,
and place it in the `public/stylesheets/custom` directory. 

In your new file, you should only change the following values:

```
$custom-banner-colour
$custom-banner-border-colour
$custom-text-colour
```

Builds should automatically generate a CSS file and place it in
`public/stylesheets/custom`. You can run the command `grunt
generate-assets` to build manually.


