export const setPendingLog = (state, data) => {
  state.pending = data
  state.pendingAmount = data.length

  let currentValue = 0
  let targetValue = 0

  data.forEach(element => {
    targetValue = (parseFloat(targetValue) + parseFloat(element.totalCost))
    currentValue = (parseFloat(currentValue) + (parseFloat(element.currentValue)))
  })

  state.calculations.currentValue = currentValue
  state.calculations.targetValue = targetValue
}
