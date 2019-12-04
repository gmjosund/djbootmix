export const setBuyLog = (state, data) => {
  state.buys = data
  state.buyAmount = data.length
}
