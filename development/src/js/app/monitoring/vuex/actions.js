import axios from 'axios'
import { TIMERS, API_URLS } from '../../../helpers/constants';

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

export const getCurrencies = ({ commit, dispatch }) => {
  var currenciesLocalStorageKey = 'currencies';
  var currenciesAPICalledTimeLocalStorageKey = 'currenciesAPICalledTime';
  var currenciesTmp = localStorage.getItem(currenciesLocalStorageKey);
  var currenciesAPICalledTime = +localStorage.getItem(
    currenciesAPICalledTimeLocalStorageKey
  );
  var currentEpochTime = new Date().getTime();

  // Check local storage has currencies value and currencies API called time,
  // if above two values are there and currencies API called time didn't cross 24 hours then consider local storages values.
  if (currenciesTmp && currenciesAPICalledTime) {
    if (
      currentEpochTime - currenciesAPICalledTime <
      TIMERS.CURRENCY_API_CALL_FREQUENCY
    ) {
      commit('setCurrencies', currenciesTmp);
      return;
    }
  }
  return axios
    .get(API_URLS.CURRENCIES_API_URL)
    .then(response => {
      localStorage.setItem(
        currenciesLocalStorageKey,
        JSON.stringify(response.data)
      );
      localStorage.setItem(
        currenciesAPICalledTimeLocalStorageKey,
        currentEpochTime
      );
      commit('setCurrencies', response.data);
    })
    .catch(error => {})
    .finally(() => {
    });
};

export const getMarketTrends = ({commit, dispatch}) => {
  return axios.get(THE_BASE_URL + '/private?command=returnTicker').then((response) => {
    commit('setMarketTrend', response.data);
  }).catch((error) => {
  }).finally(() => {
    commit('APICallEnded');
  });
}
