using { CDSnmsp as Alias_CDSViews } from '../db/CDSView';

service CDSService @(path: 'CDSService' ) 
{
    entity ProductSet as projection on Alias_CDSViews.CDSViews.ProductView
    {
        // virtual element - caluclation on fly 
        ProductId,
        virtual soldcount:Int16 
    };   
    entity ItemSet as projection on Alias_CDSViews.CDSViews.ItemView;
}
