import Vue from 'vue'
import Vuex from 'vuex'
import monitoring from '../app/monitoring/vuex'
import buys from '../app/buys/vuex'
import sales from '../app/sales/vuex'
import dca from '../app/dca/vuex'
import dust from '../app/dust/vuex'
import pairs from '../app/pairs/vuex'
import possibleBuys from '../app/possibleBuys/vuex'
import pending from '../app/pending/vuex'
import apiLogs from '../app/apiLogs/vuex'
import auth from '../app/auth/vuex'


Vue.use(Vuex)

export default new Vuex.Store({
  modules: {
    monitoring: monitoring,
    auth: auth,
    buys: buys,
    sales: sales,
    dca: dca,
    dust: dust,
    pending: pending,
    pairs: pairs,
    possibleBuys: possibleBuys,
    apiLogs: apiLogs

  }
})
