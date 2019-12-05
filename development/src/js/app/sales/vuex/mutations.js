export const setSalesLog = (state, data) => {
  state.sales = data
  state.salesAmount = data.length

  let boughtCost = 0
  let soldValue = 0

  data.forEach(element => {
    boughtCost = (parseFloat(boughtCost) + parseFloat(element.totalCost)).toFixed(element.pricePrecision)
    soldValue = (parseFloat(soldValue) + (parseFloat(element.soldValue) - (parseFloat(element.soldValue) * (element.fee / 100)))).toFixed(element.pricePrecision)
  })


  state.calculations.boughtCost = parseFloat(boughtCost)
  state.calculations.soldValue = parseFloat(soldValue)
}
