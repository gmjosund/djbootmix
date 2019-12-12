export const setSettings = (state, data) => {
  state.settings = data
}

export const setStats = (state, data) => {
  state.stats = data
}

export const setProStats = (state, data) => {
  state.proStats = data
}

export const setNotifications = (state, data) => {
  state.notifications = data
}

export const setHeartbeats = (state, data) => {
  state.heartbeats = data
}

export const setCmc = (state, data) => {
  state.cmc = data
}

export const setMiscData = (state, data) => {
  if (data.hasOwnProperty('realBalance')) {
    data.totalCurrentValue = data.totalPairsCurrentValue +
    data.totalDCACurrentValue + data.totalPendingCurrentValue +
    data.realBalance;
  }
  state.misc = data
}

export const setVersion = (state, data) => {
  state.version = data
}

export const APICallStarted = (state) => {
  state.isAPICallInProgress = true;
}

export const APICallEnded = (state) => {
  state.isAPICallInProgress = false;
}

export const setMarketTrend = (state, data) => {
  state.marketTrend = data;
}

export const setMarketCapData = (state, data) => {
  state.marketCap = data
}

export const setGlobalMarketCapData = (state, data) => {
  state.globalMarketCap = data
}

export const setGlobalMarketCapPercentage = (state, data) => {
  state.globalMarketCapPercentage = data
}

export const isSidebarOpen = (state) => {
  state.isSidebarOpen = !state.isSidebarOpen
}

export const currentRout = (state, data) => {
  state.currentRout = data;
}