import { DEFAULT_VALUE } from '../../../helpers/constants';

export const currentDateFormat = state => state.currentDateFormat;
export const misc = (state) => {
  return state.misc
}
export const stats = (state) => {
  return state.stats
}
export const settings = (state) => {
  return state.settings
}

export const proStats = (state) => {
  return state.proStats
}

export const cmc = (state) => {
  return state.cmc
}

export const heartbeats = (state) => {
  return state.heartbeats
}

export const notifications = (state) => {
  return state.notifications
}

export const version = (state) => {
  return state.version
}

export const isAPICallInProgress = (state) => {
  return state.isAPICallInProgress
}

export const marketTrend = (state) => {
  return state.marketTrend
}

export const marketCap = (state) => {
  return state.marketCap
}

export const globalMarketCap = (state) => {
  return state.globalMarketCap
}

export const globalMarketCapPercentage = (state) => {
  return state.globalMarketCapPercentage
}

export const getProperties = (state) => {
  return state.properties
}

export const currency = state => {
  if (typeof state.properties === 'undefined' || typeof state.properties.currency === 'undefined') {
    return DEFAULT_VALUE;
  }
  return state.properties.currency;
};