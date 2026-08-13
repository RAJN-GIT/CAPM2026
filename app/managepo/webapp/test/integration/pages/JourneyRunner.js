sap.ui.define([
    "sap/fe/test/JourneyRunner",
	"drajp/ui/managepo/test/integration/pages/PurchaseorderList.gen",
	"drajp/ui/managepo/test/integration/pages/PurchaseorderObjectPage.gen",
	"drajp/ui/managepo/test/integration/pages/PoitemObjectPage.gen"
], function (JourneyRunner, PurchaseorderListGenerated, PurchaseorderObjectPageGenerated, PoitemObjectPageGenerated) {
    'use strict';

    const runner = new JourneyRunner({
        launchUrl: sap.ui.require.toUrl('drajp/ui/managepo') + '/test/flp.html#app-preview',
        pages: {
			onThePurchaseorderListGenerated: PurchaseorderListGenerated,
			onThePurchaseorderObjectPageGenerated: PurchaseorderObjectPageGenerated,
			onThePoitemObjectPageGenerated: PoitemObjectPageGenerated
        },
        async: true
    });

    return runner;
});

