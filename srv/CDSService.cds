using { CDSnmsp as Alias_CDSViews } from '../db/CDSView';

service CDSService @(path: CDSService ) {

    entity ProductSet as projection on Alias_CDSViews.CDSViews.ProductView{

        // virtual 
    };

    
    entity ItemSet as projection on Alias_CDSViews.CDSViews.ItemView;

}
