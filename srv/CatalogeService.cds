//consume refrence of my DB table
using {
    mycap1.db.master,
    mycap1.db.transaction
} from '../db/database';

service CatalogeService @(path: 'CatalogeService') {
    // entity Employeset as projection on master.employees
    entity Employeset      as projection on master.employees;
    entity Product         as projection on master.product;
    entity Businesspartner as projection on master.businesspartner;
    entity Purchaseorder   as projection on transaction.purchaseorder;
    entity Poitem          as projection on transaction.poitems;

}
