<template>
   <b-card-text>
      <div class="row">
         <div class="col-md-3">
            <!-- v-bind:value="globalMarketCap | checkForProp('market_cap_percentage')| checkForProp(serverMarket) | normalizeValueWithComma(2)" -->
            <input type="text" class="dial" id="globalMarketChangePercentage">
            <div class="bg-icon">
            </div>
         </div>
         <div class="col-md-9">
            <div class="text-right">
               <!-- Top market percentage changes -->
               <div class="top-market-perc top-market">
                  <span class="counter m-l-0"
                     v-bind:class="getBadgeBasedOnNumber(0, 'market_cap_change_percentage_24h')"
                     >{{ marketCap | checkAndReturnData(0,'market_cap_change_percentage_24h') | normalizeValueWithComma(2) }} %</span>
                  <span class="counter m-l-5"
                     v-bind:class="getBadgeBasedOnNumber(1, 'market_cap_change_percentage_24h')"
                     >{{ marketCap | checkAndReturnData(1,'market_cap_change_percentage_24h') | normalizeValueWithComma(2) }} %</span>
                  <span class="counter m-l-5"
                     v-bind:class="getBadgeBasedOnNumber(2, 'market_cap_change_percentage_24h')"
                     >{{ marketCap | checkAndReturnData(2,'market_cap_change_percentage_24h') | normalizeValueWithComma(2) }} %</span>
                  <span class="counter m-l-5"
                     v-bind:class="getBadgeBasedOnNumber(3, 'market_cap_change_percentage_24h')"
                     >{{ marketCap | checkAndReturnData(3,'market_cap_change_percentage_24h') | normalizeValueWithComma(2) }} %</span>
                  <span class="counter m-l-5"
                     v-bind:class="getBadgeBasedOnNumber(4, 'market_cap_change_percentage_24h')"
                     >{{ marketCap | checkAndReturnData(4,'market_cap_change_percentage_24h') | normalizeValueWithComma(2) }} %</span>
               </div>
               <!-- Top market labels -->
               <div class="top-market-labels top-market">
                  <span class="market-label">{{ marketCap | checkAndReturnData(0, 'symbol').toUpperCase() }}</span>
                  <span class="market-label">{{ marketCap | checkAndReturnData(1, 'symbol').toUpperCase() }}</span>
                  <span class="market-label">{{ marketCap | checkAndReturnData(2, 'symbol').toUpperCase() }}</span>
                  <span class="market-label">{{ marketCap | checkAndReturnData(3, 'symbol').toUpperCase() }}</span>
                  <span class="market-label">{{ marketCap | checkAndReturnData(4, 'symbol').toUpperCase() }}</span>
               </div>
               <!-- Top market prices -->
               <div class="top-market-prices top-market">
                  <span class="counter">{{ marketCap | checkAndReturnData(0,'current_price') | normalizeValueWithComma(2) }} {{ settings.currency }}</span>
                  <span class="counter">{{ marketCap | checkAndReturnData(1,'current_price') | normalizeValueWithComma(2) }} {{ settings.currency }}</span>
                  <span class="counter">{{ marketCap | checkAndReturnData(2,'current_price') | normalizeValueWithComma(2) }} {{ settings.currency }}</span>
                  <span class="counter">{{ marketCap | checkAndReturnData(3,'current_price') | normalizeValueWithComma(2) }} {{ settings.currency }}</span>
                  <span class="counter">{{ marketCap | checkAndReturnData(4,'current_price') | normalizeValueWithComma(2) }} {{ settings.currency }}</span>
               </div>
               <div class="total-market-cap monitor-smaller-fonts">
                  <span>Total Market Cap</span>
                  <span class="main-text main-counter">
                  {{ globalMarketCap | checkForProp('total_market_cap') | checkForProp(serverMarket) | normalizeValueWithComma(2) }} {{ settings | checkForProp('currency') }}
                  </span>
               </div>
            </div>
         </div>
      </div>
   </b-card-text>
</template>

<script>
  import {mapActions, mapGetters} from 'vuex'
  import $ from 'jquery';

  export default {
    data() {
      return {
        serverMarket: '',
        marketCapPercentage: ''
      }
    },
    computed: {
      ...mapGetters({
        misc: 'monitoring/misc',
        settings: 'monitoring/settings',
        marketCap: 'monitoring/marketCap',
        globalMarketCap: 'monitoring/globalMarketCap',
        globalMarketCapPercentage: 'monitoring/globalMarketCapPercentage'
      })
    },
    filters: {
      checkAndReturnData: function(obj, index, prop) {
        if (obj && typeof obj[index] !== 'undefined' &&obj[index].hasOwnProperty(prop)) {
          return obj[index][prop];
        }
        return '--';
      },
      checkForProp: function (obj, prop) {
        if (obj && obj.hasOwnProperty(prop)) {
          return obj[prop];
        }
        return '--';
      }
    },
    methods: {
      getBadgeBasedOnNumber(index, prop) {
        if (this.marketCap && typeof this.marketCap[index] !== 'undefined' && this.marketCap[index].hasOwnProperty(prop)) {
          if (this.marketCap[index][prop] < 0) {
            return 'badge badge-light-danger';
          }
          return 'badge badge-light-success';
        }
      },
      upatePercentageValue() {
        $('.dial#globalMarketChangePercentage').val(Math.round(this.globalMarketCapPercentage)).change();
      }
    },
    watch: {
      misc: function misc() {
        if (this.misc && this.misc.hasOwnProperty('realBalance')) {
          this.serverMarket = this.misc.market.toLowerCase();
          $('.dial#globalMarketChangePercentage').knob({
            readOnly: true,
            width: '82%',
            height: '82%',
            thickness: '.2',
            fgColor: '#f1556c',
            inputColor: '#f1556c',
            bgColor: '#48525e'
          });
        }
      }
    },
    mounted() {
     this.upatePercentageValue();
    }
  }
</script>
