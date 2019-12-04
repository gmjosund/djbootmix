export const setPossibleBuysLog = (state, data) => {
  state.possibleBuys = data
  state.possibleBuysAmount = data.length
}
