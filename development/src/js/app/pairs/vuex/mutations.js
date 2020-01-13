export const setPairsLog = (state, data) => {
  state.pairs = data
  state.pairsAmount = data.length

  let currentValue = 0
  let boughtCost = 0

  data.forEach(element => {
    currentValue = (parseFloat(currentValue) + (parseFloat(element.currentValue) - (parseFloat(element.currentValue) * (element.fee / 100)))).toFixed(element.pricePrecision)
    boughtCost = (parseFloat(boughtCost) + (parseFloat(element.totalCost))).toFixed(element.pricePrecision)
  })

  state.calculations.currentValue = currentValue
  state.calculations.boughtCost = boughtCost
}

export const setServerData = (state, data) => {
  state.serverData = data;
}
