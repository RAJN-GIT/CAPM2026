//consume refrence of my DB table
using {
    mycap1.db.master,
    mycap1.db.transaction
} from '../db/database';

service CatalogeService @(path: 'CatalogeService', requires: 'authenticated-user') {
    // entity Employeset as projection on master.employees
    entity Employeset      as projection on master.employees;
    entity Product         as projection on master.product;
    entity Businesspartner as projection on master.businesspartner;
    entity Purchaseorder @(
        restrict: [
            { grant: ['Read'], to: 'Viewer' } ,
            { grant: ['Write','DELETE'], to: 'Editor' } 
        ],      
        odata.draft.enabled: true ) as projection on transaction.purchaseorder
        actions {
            action boost() returns Purchaseorder

        };

    entity Poitem          as projection on transaction.poitems;

    function getLargestOrder() returns array of Purchaseorder;

}
