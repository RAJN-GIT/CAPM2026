namespace globaldata.common;

using { Currency } from '@sap/cds/common';

type Dec: Decimal(5,2); 


type Guid   : String(32);


type Gender : String(1) enum {
    male = 'M';
    female = 'F';
    Undisclosed = 'U';
}

type AmountT: Decimal(10,2) @(
    Semantic.amount.currencyCode: 'CURRENCY_CODE'
); 

//Custom Structre
aspect Amount{
    CURRENCY: Currency@(title:'{i18n>CURRENCY}');
    Gross_AMount: AmountT@(title:'{i18n>Gross_AMount}'); 
    NET_AMOUNT: AmountT@(title:'{i18n>NET_AMOUNT}'); 
    TAX_AMOUNT: AmountT@(title:'{i18n>TAX_AMOUNT}'); 
}
//@assert.format adds a validation constraint
type PhoneNumber : String(30) @assert.format : '^\+?[0-9]{10,15}$';
type Email: String(100) @asser.format : '^[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\.[A-Za-z]{2,}$';





