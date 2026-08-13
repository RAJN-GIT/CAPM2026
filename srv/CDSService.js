const cds = require('@sap/cds')
const { columns, where } = require('@sap/cds/lib/ql/cds-ql')
const { elements } = require('@sap/cds/lib/ql/cds.ql-infer')

module.exports = class CDSService extends cds.ApplicationService {
  init() {

    const { ProductSet, ItemSet } = cds.entities('CDSService')

    this.before(['CREATE', 'UPDATE'], ProductSet, async (req) => {
      console.log('Before CREATE/UPDATE ProductSet', req.data)
    })
    this.after('READ', ProductSet, async (productSet, req) => {
      let ids = productSet.map(p => p.products)

      // const products = await SELECT.from('CDSService.ProductSet')
      //   .columns('productId')
      //   .distinct();
      // const ProductCount = await SELECT.FROM(ItemSet).
      //   columns('ProductID', { func: 'count', as: 'A_count' }).
      //   where({ 'ProductID': { in: ids } }).
      //   groupby('ProductID');

      // console.log('After READ ProductSet', productSet)
      for (const wa of productSet) {
        wa.soldcount = 22;
        // const element = productSet[index];
        // const foundrecord = orderCount.find(pc => pc.ProductID === wa.ProductId);
        //       wa.soldCount = foundrecord ? foundrecord.count : 0;
  }
})
this.before(['CREATE', 'UPDATE'], ItemSet, async (req) => {
  console.log('Before CREATE/UPDATE ItemSet', req.data)
})
this.after('READ', ItemSet, async (itemSet, req) => {
  console.log('After READ ItemSet', itemSet)
})
return super.init()
  }
}
