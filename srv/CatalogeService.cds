//consume refrence of my DB table
using {mycap1.db.master} from '../db/database';
service CatalogeService @(path: 'CatalogeService')
{
    // entity Employeset as projection on master.employees
    entity Employeset as projection on master.employees
    
}
git