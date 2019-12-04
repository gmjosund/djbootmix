import axios from 'axios'

export const getData = ({commit, dispatch}, context) => {
  return axios.get(THE_BASE_URL + '/monitoring/data').then((response) => {
    //dispatch('possibleBuys/getPossibleBuysLog', response.data.bbBuyLogData, {root:true})
    //dispatch('pairs/getPairsLog', response.data.gainLogData, {root:true})
    //dispatch('dca/getDcaLog', response.data.dcaLogData, {root:true})
    //dispatch('pending/getPendingLog', response.data.pendingLogData, {root:true})
    //dispatch('buys/getBuysLog', response.data.buyLogData, {root:true})
    //dispatch('sales/getSalesLog', response.data.sellLogData, {root:true})
    //dispatch('dust/getDustLog', response.data.dustLogData, {root:true})

    commit('setSettings', response.data.settings)
    commit('setStats', response.data.stats)
    commit('setProStats', response.data.proStats)
    commit('setNotifications', response.data.notifications)
    commit('setCmc', response.data.cmc)
    commit('setHeartbeats', response.data.heartbeats)
    commit('setVersion', response.data.version)

    delete response.data.bbBuyLogData
    delete response.data.gainLogData
    delete response.data.watchModeLogData
    delete response.data.dcaLogData
    delete response.data.pendingLogData
    delete response.data.buyLogData
    delete response.data.sellLogData
    delete response.data.dustLogData

    delete response.data.settings
    delete response.data.stats
    delete response.data.proStats
    delete response.data.notifications
    delete response.data.cmc
    delete response.data.heartbeats

    commit('setMiscData', response.data)
  }).catch((error) => {
  }).finally(() => {
  })

}
export const getApiLogs = ({dispatch}) => {
  return axios.get('/api/errors/log?token=1234').then((response) => {
    dispatch('apiLogs/getApiLogs', response.data, {root:true})
  })
}

export const getMarketTrends = ({commit, dispatch}) => {
  return axios.get(THE_BASE_URL + '/private?command=returnTicker').then((response) => {
    commit('setMarketTrend', response.data);
  }).catch((error) => {
  }).finally(() => {
    commit('APICallEnded');
  });
}
