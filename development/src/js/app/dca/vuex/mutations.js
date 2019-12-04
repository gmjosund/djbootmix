export const setDcaLog = (state, data) => {
  state.dca = data
  state.dcaAmount = data.length

  let currentValue = 0
  let totalCost = 0

  data.forEach(element => {
    currentValue = (parseFloat(currentValue) + (parseFloat(element.currentValue) - (parseFloat(element.currentValue) * (element.fee / 100)))).toFixed(element.pricePrecision)
    totalCost = (parseFloat(totalCost) + (parseFloat(element.totalCost))).toFixed(element.pricePrecision)
  })

  state.calculations.currentValue = currentValue
  state.calculations.totalCost = totalCost
}
