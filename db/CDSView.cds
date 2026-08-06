namespace CDSnmsp;

using {
// table.db.master      as master,
mycap1.db.transaction as Trans} from './database';

context CDSViews {
    define view POWorklist as
        select from Trans.purchaseorder {
            key PO_ID                          as PoId, 
            key items.PO_ITEM_POS              as Purchaseitems,
                PARTNER_GUID.BP_ID             as PurcahseFrom,
                PARTNER_GUID.PHONE_NUMBER      as PhoneNumber,
                PARTNER_GUID.COMPANY_NAME      as CompanyName,
                Gross_AMount                   as GrossAmount,
                NET_AMOUNT                     as Netamount,
                TAX_AMOUNT                     as TaxAmount,
                OVERALL_STATUS                 as OveralAllStatus,
                // items.PRODUCT_GUID.PRODUCT_ID  as ProductId,
                items.PRODUCT_GUID.DESCRIPTION as Item,
        }

    // define view ProductValueHelp as
    //     select from master.product {
    //         @EndUserText.label: [
    //             {
    //                 language: 'EN',
    //                 text    : 'Product id'

    //             },
    //             {
    //                 language: 'DE',
    //                 text    : 'Prodkt id'
    //             }
    //         ]
    //         PRODUCT_ID  as Product,
    //         @EndUserText.Label: [{
    //             language: 'EN',
    //             text    : 'Product Id'
    //         }]
    //         DESCRIPTION as ProductDes
    //     }

    define view ItemView as
        select from Trans.poitems {
            // PARENT_KEY.NODE_KEY       as PO_Order,
            // PRODUCT_GUID.PRODUCT_ID   as ProductId,
            // PRODUCT_GUID.NODE_KEY     as NodeKey,
            CURRENCY                  as Currency,
            Gross_AMount              as Gross_Amount,
            NET_AMOUNT                as NetAmount,
            PARENT_KEY.OVERALL_STATUS as StatusOrder,
        }

// define view Product as
//     select from master.product
//     //mixin to define loose coupling
//     //which will never load the data from profuct & item table togther
//     // it will first load product data and the late Loda item Datat ON DEMAND
//     mixin {
//         // View on View
//         PO_ORDER : Association to many ItemView
//                        on PO_ORDER.ProductId = $projection.ProductId
//     }
//     into {
//         NODE_KEY                           as NODEkEY,
//         PRODUCT_ID                         as ProductId,
//         DESCRIPTION                        as Description,
//         CATEGORY                           as Category,
//         PRICE                              as Price,
//         SUPPLIER_GUID.COMPANY_NAME         as Supplier,
//         SUPPLIER_GUID.ADDRESS_GUID.COUNTRY as SupplerAddres,
//         //Expose assocotion at Run time
//         PO_ORDER                           as ToItem
//     }

// define view CProductView as
//     select from Product {
//         ProductId       as productId,
//         // Product         as Product,
//         Price           as Price,
//         // ToItem.Gross_Amount,
//         round(
//             sum(ToItem.Gross_Amount), 2
//         )               as TotalAmount,
//         ToItem.Currency as currencyCode
//     }
//     group by
//         ProductId,
//         // Product,
//         ToItem.Currency

}
