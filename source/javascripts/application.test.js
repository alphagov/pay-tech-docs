/**
 * @jest-environment jsdom
 */

const JsCookie = require("js-cookie");
require('../../node_modules/@govuk-pay/pay-js-commons/lib/analytics/dist/cookies')

describe("Application JS", () => {
  beforeEach(() => {
    // expire analytics cookie explictly, as cookies are not cleared in jest environment during the tests
    document.cookie = "govuk_pay_cookie_policy=;expires=Thu, 01 Jan 1970 00:00:00 UTC;domain=.example.org";

    loadGoogleAnalytics = jest.fn()

    jest.resetModules();
  }); 

  it("does not load Google analytics when there is no cokie consent cookie", () => {
    require("./application")

    expect(
      loadGoogleAnalytics.mock.calls.length
      ).toBe(0);
  });

  it("does not load Google analytics when cookie consent cookie = false", () => {
    const cookieValue = JSON.stringify({ analytics: false })
    JsCookie.set("govuk_pay_cookie_policy", cookieValue);
    require("./application")

    expect(
      loadGoogleAnalytics.mock.calls.length
      ).toBe(0);
  });

  it("should load Google analytics when cookie consent cookie = true", () => {
    const cookieValue = JSON.stringify({ analytics: true })
    JsCookie.set("govuk_pay_cookie_policy", cookieValue);
    const cookieValue2 = JsCookie.get("govuk_pay_cookie_policy") 
    console.log('cookie value: ', cookieValue2)
    const parsed = cookieValue2 && JSON.parse(cookieValue2)
    console.log('cookieValue2: ', parsed)
    console.log('parsedValue: ', parsed.analytics === true)
  
    require("./application")

    expect(
      loadGoogleAnalytics.mock.calls.length
      ).toBe(1);
  });
});

