
//IMPLIMENATTION FILE - JS WITH SAME NAME 
//COMPARE WITH DPC_Exteniosn class
const cds = require('@sap/cds')

module.exports = class MyService extends cds.ApplicationService {
  init() {

    this.on('def', async (req) => {
      console.log('On def', req.data)
      let myName = req.data.name;

      return `welcome to CAP srvice , hello ${req.data.name}!! how are you today`
      // return `welcome to CAP srvice , hello ${myName}!! how are you today`
    })
    //calling parent class constructor here 
    return super.init()
  }
}
