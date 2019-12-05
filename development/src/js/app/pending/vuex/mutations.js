export const setPendingLog = (state, data) => {
  state.pending = data
  state.pendingAmount = data.length

  let currentValue = 0
  let targetValue = 0

  data.forEach(element => {
    targetValue = (parseFloat(targetValue) + parseFloat(element.totalCost)).toFixed(element.pricePrecision)
    currentValue = (parseFloat(currentValue) + (parseFloat(element.currentValue))).toFixed(element.pricePrecision)
  })

  state.calculations.currentValue = currentValue
  state.calculations.targetValue = targetValue
}
