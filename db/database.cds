namespace mycap1.db;

// type Guid: String(32);
// using {types.common as common} from '../commons';

using {globaldata.common as common} from './commons';


using {     Currency,    cuid} from '@sap/cds/common';

context master {
    entity businesspartner {
        key NODE_KEY      : common.Guid; //Reusabality like adatemlnet in ABAP
            BP_ROLE       : String(2);
            EMAIL_ADDRESS : common.Email;
            PHONE_NUMBER  : common.PhoneNumber;
            FAX_NUMBER    : String(32);
            WEB_ADDRESS   : String(44);
                        COMPANY_NAME  : String(250);

            BP_ID         : String(2);
                        ADDRESS_GUID  : Association to one address;

    // BY default it will with Address table - Key - NODE KEY
    // Association
    };
//Check table 
    entity address {
        key NODE_KEY         : common.Guid;
            CITY             : String(44);
            POSTAL_CODE      : String(8);
            STREET           : String(32);
            // businesspart : Association to one buissnesspartner on buissnesspartner. ADDRESS_GUID =  NODE_KEY
            //$self refers to the current entity instance being defined or accessed.
            // Reverse Association

            BUILDING         : String(128);
            COUNTRY          : String(44)@(title:'{i18n>COUNTRY}');
            ADDRESS_TYPE     : String(44);
            VAL_START_DATE   : Date;
            VAL_END_DATE     : Date;
            LATITUDE         : Decimal;
            LONGITUDE        : Decimal;
            BUISSNESSPARTNER : Association to one businesspartner
                                   on BUISSNESSPARTNER.ADDRESS_GUID = $self

    };

    //cuid is coming from Aspect like Append/include structure just shiow name of Append structure name only
    entity employees : cuid {
        // key empid  : String(32);
        nameFirst     : String(256);
        nameMiddle    : String(256);
        nameLast      : String(256);
        nameInitials  : String(40);
        sex           : common.Gender;
        language      : String(1);
        phoneNumber   : common.PhoneNumber;
        email         : common.Email;
        loginName     : String(12);
        //   type          : String(10); //Perm /Tmp
        // gender        : common.Gender;
        Currency      : Currency;
        salaryAmount  : common.AmountT;
        accountNumber : String(16);
        bankId        : String(8);
        bankName      : String(64);
    };

    entity product {
        key NODE_KEY       : common.Guid;
            PRODUCT_ID     : String(28)@(TITLE:'{i18n>PRODUCT_ID}');
            TYPE_CODE      : String(2);
            CATEGORY       : localized String(32);
            DESCRIPTION    : localized String(255)@(title:'{i18n>DESCRIPTION}');
            SUPPLIER_GUID  : Association to master.businesspartner;
            TAX_TARIF_CODE : Integer;
            MEASURE_UNIT   : String(2);
            WEIGHT_MEASURE : String(2);
            WEIGHT_UNIT    : String(2);
            CURRENCY_CODE  : String(4);
            PRICE          : Decimal(15, 2);
            WIDTH          : common.Dec;
            DEPTH          : common.Dec;
            HEIGHT         : common.Dec;
            DIM_UNIT       : String(2);
    };
}

context transaction {
    entity purchaseorder : common.Amount {
        key NODE_KEY         : common.Guid;
            PO_ID            : String(32) @(title : '{i18n>PO_ID}');
            //  ,PARTNER_GUID_NODE_KEY
            PARTNER_GUID     : Association to master.businesspartner;
            // CURRENCY_CODE    : common.AmountT;
            // GROSS_AMOUNT     : common.AmountT;
            // NET_AMOUNT       : common.AmountT;
            // TAX_AMOUNT       : common.AmountT;
            LIFECYCLE_STATUS : String(1);
            OVERALL_STATUS   : String(1)@(title:'{i18n>Overall Status}');
            NOTE             : String(100)@(title:'{i18n>NOTE}');
            items            : Association to many poitems
                                   on items.PARENT_KEY = $self;
    };

    entity poitems : common.Amount {
        key NODE_KEY     : common.Guid;
            PARENT_KEY   : Association to purchaseorder;
            PO_ITEM_POS  : Integer;
            PRODUCT_GUID : Association to master.product;
    };
}
