using CatalogeService as service from '../../srv/CatalogeService';

annotate service.Purchaseorder with @(
    //Add fields to the screens for filtering the data
    UI.SelectionFields: [
        PO_ID,
        PARTNER_GUID.COMPANY_NAME,
        PARTNER_GUID.ADDRESS_GUID.COUNTRY,
        Gross_AMount,
        OVERALL_STATUS
    ],
    UI.LineItem       : [

        {
            $Type: 'UI.DataField',
            Value: PO_ID,
        },
        {
            $Type: 'UI.DataField',
            Value: PARTNER_GUID.COMPANY_NAME,
        },
        {
            $Type: 'UI.DataField',
            Value: PARTNER_GUID.ADDRESS_GUID.COUNTRY,
        },
        {
            $Type: 'UI.DataField',
            Value: Gross_AMount,
        },
        {
            $Type: 'UI.DataField',
            Value: OVERALL_STATUS,
        }


    ]

);
