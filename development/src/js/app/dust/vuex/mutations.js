export const setDustLog = (state, data) => {
  state.dust = data
  state.dustAmount = data.length
}
