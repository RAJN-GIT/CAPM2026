using CatalogeService as service from '../../srv/CatalogeService';

annotate service.Purchaseorder with @(
    //Add fields to the screens for filtering the data
    UI.SelectionFields         : [
        PO_ID,
        PARTNER_GUID.COMPANY_NAME,
        PARTNER_GUID.ADDRESS_GUID.COUNTRY,
        Gross_AMount,
        OVERALL_STATUS
    ],

    UI.LineItem                : [
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
            $Type : 'UI.DataFieldForAction',
            Action: 'CatalogueService.boost',
            Label : 'boost',
            Inline: true,
        },
        {
            $Type: 'UI.DataField',
            Value: OVERALL_STATUS,
        }
    ],
//Object page header 
    UI.HeaderInfo              : {
        Type          : 'Purchase order Type ',
        TypeName      : 'Purcahse Order Type name ',
        TypeNamePlural: 'Purcahse Order Type name',
        Title         : {Value: PO_ID},
        Description   : {Value: PARTNER_GUID.COMPANY_NAME},
        ImageUrl      : '//encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTVpTvFcccP6fQq4xOjjAZ33oTURuJlfzW4ppvga1o5tA&s'
    },

    UI.Facets                  : [
        {
            $Type : 'UI.ReferenceFacet',
            Label : 'General Information1',
            Target: '@UI.FieldGroup#GeneralInfo2'
        },
        {
            $Type : 'UI.CollectionFacet',
            Label : 'General Informati on 1 ',
            Facets: [{
                $Type : 'UI.ReferenceFacet',
                Target: '@UI.Identification', 
            }, ],
        },
        {
            $Type : 'UI.ReferenceFacet',
            Label : 'Purchase Order Items',
            Target: '@UI.LineItem'
        }
    ],

    // UI.Identification         : [
    //     {
    //         $Type: 'UI.DataField',
    //         Value: PO_ID,
    //     },
    //     {
    //         $Type: 'UI.DataField',
    //         Value: LIFECYCLE_STATUS,
    //     },
    //     {
    //         $Type: 'UI.DataField',
    //         Value: PARTNER_GUID,
    //     },
    // ],

    UI.FieldGroup #GeneralInfo2: {Data: [
        {
            $Type: 'UI.DataField',
            Value: PO_ID
        },
        {
            $Type: 'UI.DataField',
            Value: PARTNER_GUID_NODE_KEY
        },
        {
            $Type: 'UI.DataField',
            Value: NOTE
        },
        {
            $Type: 'UI.DataField',
            Value: Gross_AMount
        }
    ]}
);

annotate service.Poitem with @(UI.LineItem: [
    {
        $Type: 'UI.DataField',
        Value: PO_ITEM_POS
    },
    {
        $Type: 'UI.DataField',
        Value: DESCRIPTION
    },
    {
        $Type: 'UI.DataField',
        Value: QUANTITY
    },
    {
        $Type: 'UI.DataField',
        Value: NET_AMOUNT
    }
]);
