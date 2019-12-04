export const setSalesLog = (state, data) => {
  state.sales = data
  state.salesAmount = data.length

  let boughtCost = 0
  let soldValue = 0

  data.forEach(element => {
    boughtCost = (parseFloat(boughtCost) + parseFloat(element.totalCost)) 
    soldValue = (parseFloat(soldValue) + (parseFloat(element.soldValue) - (parseFloat(element.soldValue) * (element.fee / 100))))
  })


  state.calculations.boughtCost = parseFloat(boughtCost)
  state.calculations.soldValue = parseFloat(soldValue)
}
