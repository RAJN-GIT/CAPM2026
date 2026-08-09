const cds = require('@sap/cds')

module.exports = class CatalogeService extends cds.ApplicationService { init() {

  const { Employeset, Purchaseorder, Poitem } = cds.entities('CatalogeService')

  this.before (['CREATE', 'UPDATE'], Employeset, async (req) => {
    console.log('Before CREATE/UPDATE Employeset', req.data)
  })
  this.after ('READ', Employeset, async (employeset, req) => {
    console.log('After READ Employeset', employeset)
  })
  this.before (['CREATE', 'UPDATE'], Purchaseorder, async (req) => {
    console.log('Before CREATE/UPDATE Purchaseorder', req.data)
  })
  this.after ('READ', Purchaseorder, async (purchaseorder, req) => {
    console.log('After READ Purchaseorder', purchaseorder)
  })
  this.before (['CREATE', 'UPDATE'], Poitem, async (req) => {
    console.log('Before CREATE/UPDATE Poitem', req.data)
  })
  this.after ('READ', Poitem, async (poitem, req) => {
    console.log('After READ Poitem', poitem)
  })


  return super.init()
}}
