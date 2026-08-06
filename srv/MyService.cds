//defination of srvice 
//segw service
//IT TRUNCATED SERVICE NAME 
// service MyService {
// SO ADDED 
service MyService @(path: 'MyServices'){
    //Service endpoint 
    function def(name: String) returns String;
   }

