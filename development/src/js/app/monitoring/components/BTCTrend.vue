<template>
   <b-card-text>
      <div class="row">
         <div class="col-md-4">
            <div class="bg-icon icon-btcusd">
               <i class="fa fa-usd"></i>
            </div>
         </div>
         <div class="col-md-8">
            <div class="text-right">
               <p class="mb-0 main-text">
                  <span class="js-exchange">{{ misc.exchange ? misc.exchange : '--' }}</span>
                  BTC USDT Price
               </p>
               <h3 class="counter m-t-10 font-bold main-text">
                  <span id="mBtcPrice">
                  <i class="mdi tcv-change"
                     v-bind:class="{'mdi-arrow-up text-success': !this.$parent.isLastBTCUSDTPriceMore, 'mdi-arrow-down text-danger': this.$parent.isLastBTCUSDTPriceMore}"
                     ></i>
                  <b class="main-text main-counter">
                  {{ misc.BTCUSDTPrice | normalizeValueWithComma(2) }}
                  </b>
                  <span class="small-text font-italic"
                     v-bind:class="getClassBasedOnNumber(misc.BTCUSDTPercChange)"
                     >
                  ({{ (misc.BTCUSDTPercChange * 100) | normalizeValueWithComma(2) }}%)
                  </span>
                  <span class="small-text font-italic"
                     v-bind:class="getClassBasedOnNumber(misc.BTCUSDTCustomPercChange)"
                     v-if="misc.hasOwnProperty('BTCUSDTCustomPercChange')"
                     >
                  (C - {{misc.BTCUSDTCustomPercChange * 100 | normalizeValueWithComma(2) + ' %)'}}
                  </span>
                  </span>
                  <div class="small-text font-bold">
                     <span class="market-trend main-text main-counter">
                     {{ misc.market }} Trend 24H {{getMarketTrendAvg(marketTrend) | normalizeValueWithComma(2)}}%
                     </span>
                  </div>
               </h3>
            </div>
         </div>
      </div>
      <!-- <peity :type="'line'" :options="{ width: '100%', height: 75 }" :data="getActiveMarketCandles()"></peity> -->
      <div id="trendSparkLine">
      </div>
   </b-card-text>
</template>

<script>
  import {mapActions, mapGetters} from 'vuex'
  import $ from 'jquery'

  export default {
    computed: {
      ...mapGetters({
        misc: 'monitoring/misc',
        settings: 'monitoring/settings',
        marketTrend: 'monitoring/marketTrend',
      })
    },
    methods: {
      getClassBasedOnNumber(number) {
        if (number) {
          if (number < 0.00) {
            return 'text-danger';
          } else {
            return 'text-success'
          }
        }
      },
      getActiveMarketCandles() {
        let validCandidates = [];
        if (this.misc.hasOwnProperty('graphData')) {
          for (let i = 0; i < this.misc.graphData.activeMarketCandles.length; i+= 24) {
            validCandidates.push((this.misc.graphData.activeMarketCandles[i]).toFixed(2));
          }
          $('#trendSparkLine').sparkline(validCandidates, {
            type: 'line',
            width: '100%',
            height: '65',
            chartRangeMax: 50,
            lineColor: '#3bafda',
            fillColor: 'transparent',
            highlightLineColor: 'transparent',
            highlightSpotColor: 'transparent',
            tooltipContainer: '.hide'
          });
        }
      },
      getMarketTrendAvg(data) {
        let marketTrend = 0;
        let marketTrendAvg = 0;
        const marketCapCurrency = this.misc.market;
        try {
          let marketRecords = 0;
          for (let key in data) {
            // Consider coins contains marketCapCurrency
            if (key.indexOf(marketCapCurrency) !== -1) {
              let value = JSON.parse(data[key]);
              marketTrend += +value.percentChange * 100;
              ++marketRecords;
            }
          }
          marketTrendAvg = marketRecords ? marketTrend / marketRecords : 0;
        } catch (e) {
          console.error('Error while processing data from market Trend API');
          console.error(e);
          return false;
        }
        return marketTrendAvg;
      }
    },
    watch: {
      misc: function misc() {
        if (this.misc && this.misc.hasOwnProperty('realBalance')) {
          this.getActiveMarketCandles()
        }
      }
    }

  }
</script>

<style scoped>

</style>
