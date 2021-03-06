/**********************************************************************************************
 *
 *                       VALIDATION TEST METHOD : IDEAL
 *
 *  To launch test, please pass two arguments URL (BASE URL)  and TYPE_CC ( CB,VI,MC )
 *
/**********************************************************************************************/

var paymentType = "HiPay Enterprise iDeal";

casper.test.begin('Test Checkout ' + paymentType + ' with ' + typeCC, function(test) {
    phantom.clearCookies();

    casper.start(baseURL)
    .then(function() {
        this.logToBackend();
        this.gotToHiPayConfiguration();
        this.activateMethod("ideal");
        this.configureSettingsMode("api");
        this.waitForSelector('input[name="ideal_displayName[fr]"]', function success() {
            label = this.getElementAttribute('input[name="ideal_displayName[fr]"]', 'value');
            test.info("Display name in checkout should be :" + label);
        }, function fail() {
            test.assertExists('input[name="ideal_displayName[fr]"]', "Input name exist");
        });
    })
    .then(function() {
        this.activateLocalization('NL');
    })
    .thenOpen(baseURL, function() {
        this.selectItemAndOptions();
    })
    .then(function() {
        this.personalInformation();
    })
    .then(function() {
        this.billingInformation('NL');
    })
    .then(function() {
        this.shippingMethod();
    })
    .then(function() {
        this.selectMethodInCheckout("Payer par " + label,false);
    })
    .then(function() {
        this.echo("Filling Business Identifier BIC with wrong value...", "INFO");

        this.waitForSelector('input#ideal-issuer_bank_id', function success() {
            this.fillSelectors('form#ideal-hipay', {
                'input[name="issuer_bank_id"]': 'BNPAFRPPXXX WRONG',
            }, false);

            this.click('form#conditions-to-approve input');
            this.click("div#payment-confirmation button");
            test.assertTextExists('BIC incorrect', 'Validation error done');
        }, function fail() {
            test.assertExists('input#ideal-issuer_bank_id', "Field Business Identifier exists");
        });
    })
    /* Fill IDeal formular */
    .then(function() {
        this.echo("Filling CBusiness Identifier BIC...", "INFO");

        this.waitForSelector('input#ideal-issuer_bank_id', function success() {
            this.fillSelectors('form#ideal-hipay', {
                'input[name="issuer_bank_id"]': 'BNPAFRPPXXX',
            }, false);

            this.click("div#payment-confirmation button");
        }, function fail() {
            test.assertExists('input#ideal-issuer_bank_id', "Field Business Identifier exists");
        });
    })
    /* Fill IDeal formular */
    .then(function() {
        this.echo("Filling payment formular...", "INFO");
        this.waitForUrl(/paymentscreen\/issuer/, function success() {

/*            this.fillSelectors("form#form-payment", {
                'select[name="issuer_bank_id"]': "TESTNL99"
            }, true);*/

            this.click('button[value="ideal_TESTNL99"]');

            this.waitForUrl(/paymentscreen\/testmode/, function success() {
                this.click('input[name="final_state"][value="paid"]');
                this.click('#footer button.button');
                test.info("Done");

            }, function fail() {
                test.assertUrlMatch(/paymentscreen\/ideal\/testmode/, "Payment IDeal page exists");
            }, 15000);
        }, function fail() {
            test.assertUrlMatch(/payment\/web\/pay/, "Payment page exists");
        }, 20000);
    })
    .then(function() {
        this.orderResultSuccess(paymentType);
    })
    .run(function() {
        test.done();
    });
});