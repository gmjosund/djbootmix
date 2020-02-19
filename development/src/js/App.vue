<template>
  <div id="app">
    <app-header id="topnav"></app-header>

    <router-view></router-view>

    <app-footer></app-footer>
  </div>

</template>

<script>
import Header from './components/Header/Header'
import Footer from './components/Footer'
import { TIMERS, PT_LINKS } from './helpers/constants';
import $ from 'jquery'
import axios from 'axios'
import './helpers/sparkline.js'
import './helpers/jquery.knob.js'
import {mapActions, mapGetters } from 'vuex'

export default {

  components: {
    'app-header': Header,
    'app-footer': Footer
  },
  data() {
    return {
      serverDataTimeout: null,
      marketCapTimeout: null,
    };
  },
  computed: {
    ...mapGetters({
      settings: 'monitoring/settings',
      misc: 'monitoring/misc'
    })
  },
  methods: {
    ...mapActions({
      getData: 'monitoring/getData',
      getApiLogs: 'monitoring/getApiLogs',
      getMarketTrends: 'monitoring/getMarketTrends',
      getDcaData: 'dca/getDcaLog',
      getPairsData: 'pairs/getPairsLog',
      getPendingData: 'pending/getPendingLog',
      getPblData: 'possibleBuys/getPossibleBuysLog',
      getBuysData: 'buys/getBuysLog',
      getSalesData: 'sales/getSalesLog',
      getDustData: 'dust/getDustLog',
      // getBuyLog: 'buys/getBuyLog',
      // getSalesLog: 'sales/getSalesLog',
    }),
    getCoinMarketData() {
      let that = this;
      if (this.settings.hasOwnProperty('currency')) {
          return axios.get(`https://api.coingecko.com/api/v3/coins/markets?vs_currency=${this.settings.currency }&price_change_percentage=1h,24h,7d&&per_page=21`).then((response) => {
          that.$store.commit('monitoring/setMarketCapData', response.data);
        });
      }
    },
    getGlobalMarketCapData() {
      return axios.get(`https://api.coingecko.com/api/v3/global`).then((response) => {
        let serverMarket = this.misc.hasOwnProperty('market') ? this.misc.market.toLowerCase() : 'btc';
        $('.dial#globalMarketChangePercentage').val(response.data.data.market_cap_percentage[serverMarket].toFixed(2)).change();
        this.$store.commit('monitoring/setGlobalMarketCapPercentage', response.data.data.market_cap_percentage[serverMarket].toFixed(2));
        this.$store.commit('monitoring/setGlobalMarketCapData', response.data.data);
      })
    },
    callDataFromServerAPI() {
      this.$store.commit('monitoring/APICallStarted')
      this.getData()
      this.getDcaData()
      this.getPairsData()
      this.getPendingData()
      this.getPblData()
      this.getBuysData()
      this.getSalesData()
      this.getDustData()
      //this.getApiLogs();
      this.getMarketTrends();
      if (!this.marketCapTimeout) {
        this.callMarketCapAPIForData();
      }
      this.serverDataTimeout = setTimeout(() => this.callDataFromServerAPI(),
        TIMERS.REFRESH_TIMER);
    },
    callMarketCapAPIForData() {
      this.getCoinMarketData();
      this.getGlobalMarketCapData();
      if (this.settings.hasOwnProperty('currency')) {
        this.marketCapTimeout = setTimeout(() => this.callMarketCapAPIForData(), 45 * 60 * 1000);
      }
    },
  },
  mounted() {
    this.callDataFromServerAPI()
  },
}
</script>
