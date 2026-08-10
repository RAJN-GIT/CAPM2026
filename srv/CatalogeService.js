const cds = require('@sap/cds')

module.exports = class CatalogeService extends cds.ApplicationService {
  init() {

    const { Employeset, Product, Businesspartner, Purchaseorder, Poitem } = cds.entities('CatalogeService')

    this.before(['CREATE', 'UPDATE'], Employeset, async (req) => {
      console.log('Before CREATE/UPDATE Employeset', req.data)

      let salaryAmount = parseFloat(req.data.salaryAmount);
      if (salaryAmount > 1000000) {
        req.error(500, "Salary is not looking realistic , pls check ");
      }

    })
    this.after('READ', Employeset, async (employeset, req) => {
      console.log('After READ Employeset', employeset)
    })
    this.before(['CREATE', 'UPDATE'], Product, async (req) => {
      console.log('Before CREATE/UPDATE Product', req.data)
    })
    this.after('READ', Product, async (product, req) => {
      console.log('After READ Product', product)
    })
    this.before(['CREATE', 'UPDATE'], Businesspartner, async (req) => {
      console.log('Before CREATE/UPDATE Businesspartner', req.data)
    })
    this.after('READ', Businesspartner, async (businesspartner, req) => {
      console.log('After READ Businesspartner', businesspartner)
    })
    this.before(['CREATE', 'UPDATE'], Purchaseorder, async (req) => {
      console.log('Before CREATE/UPDATE Purchaseorder', req.data)
    })
    this.after('READ', Purchaseorder, async (purchaseorder, req) => {
      console.log('After READ Purchaseorder', purchaseorder)
    })
    this.before(['CREATE', 'UPDATE'], Poitem, async (req) => {
      console.log('Before CREATE/UPDATE Poitem', req.data)
    })
    this.after('READ', Poitem, async (poitem, req) => {
      console.log('After READ Poitem', poitem)
    })

    this.on('getLargestOrder', async (req, res) => {
      try {
        //standrad way of getting transaction object - very 1st step always 
        //

        //use CDS QL to make a call to DB - SELECT * UP TO 3 ROWS FROM POs by GROSS_AMOUNT descending
        //DB agnostics call - can change any database/Postgress/hana db/sqlite . it worl on all 
        const tx = cds.tx(req);
        const reply = await tx.read(Purchaseorder).ORDERBY({
          'GROSS_AMOUNT': 'desc'
        }).limit(3);

        return reply;

      } catch (error) {
        req.error(500, "some error occured:", + error.tostring());
      } 
    }) 

    return super.init()
  }
}
