<template>
  <div class="container-fluid">
    <div class="row monitoring">
      <!-- First -->
      <div class="col-lg-4 col-md-6 mb-2">
        <b-card>
          <b-card-text>
            <div class="row">
              <div class="col-md-4">
                <div class="bg-icon">
                  <i class="market-icon fa fa-btc icon-tdbitcoin"></i>
                </div>
              </div>
              <div class="col-md-8">
                <div class="text-right">
                  <h3 class="m-t-10 main-text main-counter">
                    <b class="counter">
                      <i class="mdi real-balance-change"
                        v-bind:class="{'mdi-arrow-up text-success': !isLastRealBalanceMore, 'mdi-arrow-down text-danger': isLastRealBalanceMore}"
                      ></i>
                    </b>
                    <b class="counter">{{ misc.realBalance ? misc.realBalance : '0.00000000' }}</b>
                    <span class="market m-l-5">{{ misc.market ? misc.market : 'BTC' }}</span>
                  </h3>
                  <p class="mb-0 main-text">
                    <span class="js-exchange">{{ misc.exchange ? misc.exchange : '--' }}</span>
                    Balance
                  </p>
                  <span class="market-price-calculations">
                    <label class="usd-value js-usd-value">
                      <span class="full-text">{{ settings.currency ? settings.currency : '--' }} Estimated Value</span>
                    </label>
                    <span class="mb-0 main-text">2,302.35</span>
                  </span>
                  <!-- Pairs balance -->
                  <p class="mb-0 monitor-smaller-fonts">
                    <span>Pairs Balance</span>
                    <span>{{ misc.pairsBalance ? misc.pairsBalance : '0.00000000' }}</span>
                  </p>
                  <!-- DCA balance -->
                  <p class="mb-0 monitor-smaller-fonts">
                    <span>DCA Balance</span>
                    <span>{{ misc.DCABalance ? misc.DCABalance : '0.00000000'}}</span>
                  </p>
                </div>
              </div>
            </div>
          </b-card-text>

        </b-card>
      </div>
      <div class="col-lg-4 col-md-6 mb-2">
        <b-card>
          <b-card-text>
            <div class="row">
              <div class="col-md-4">
                <div class="bg-icon">
                  <i class="market-icon fa fa-btc icon-primary"></i>
                </div>
              </div>
              <div class="col-md-8">
                <div class="text-right">
                  <h3 class=" m-t-10 main-text main-counter">
                    <b class="counter">
                      <i class="mdi tcv-change"
                        v-bind:class="{'mdi-arrow-up text-success': !isLastTCVBalanceMore, 'mdi-arrow-down text-danger': isLastTCVBalanceMore}"
                      ></i>
                    </b>
                    <b class="counter">{{ calculateTCV(misc) }}</b>
                    <span class="market m-l-5">{{ misc.market ? misc.market : '--'}}</span>
                  </h3>
                  <p class="mb-0 main-text">Total Current Value</p>
                  <span class="market-price-calculations">
                    <label class="usd-value js-usd-value">
                      <span class="full-text">{{ settings.currency ? settings.currency : '--' }} Estimated Value</span>
                    </label>
                    <span class="mb-0 main-text">3,372.29</span>
                  </span>
                  <p class="monitor-smaller-fonts main-text mb-0 js-dust-values">
                    <label class="mb-0">TCV with Dust</label>
                    <span>{{ calculateTCV(misc, true) }}</span>
                    <span class="market">{{ misc.market ? misc.market : '--'}}</span>
                  </p>
                </div>
              </div>
            </div>
          </b-card-text>

        </b-card>
      </div>
      <div class="col-lg-4 col-md-6 mb-2">
        <b-card>
          <b-card-text>
            <div class="row">
              <div class="col-md-4">
                <div class="bg-icon">
                  <i class="market-icon fa fa-btc icon-success"></i>
                </div>
              </div>
              <div class="col-md-8">
                <div class="text-right">
                  <h3 class=" m-t-10 main-text main-counter">
                    <b class="counter">
                      <i class="mdi start-balance-change"
                        v-bind:class="{'mdi-arrow-up text-success': !isLastStartBalanceMore, 'mdi-arrow-down text-danger': isLastStartBalanceMore}"
                      ></i>
                    </b>
                    <b class="counter">{{ misc.startBalance ? misc.startBalance.toFixed(8) : '0.00000000'}}</b>
                    <span class="market m-l-5">{{ misc.market ? misc.market : 'BTC' }}</span>
                  </h3>
                  <p class="mb-0 main-text">Start Balance</p>
                  <span class="market-price-calculations">
                    <label class="usd-value js-usd-value">
                      <span class="full-text">{{ settings.currency ? settings.currency : '--' }} Estimated Value</span>
                    </label>
                    <span class="mb-0 main-text">3,389.95</span>
                  </span>
                </div>
              </div>
            </div>
          </b-card-text>

        </b-card>
      </div>

      <!-- Second -->
      <div class="col-lg-6 col-md-6 mb-2">
        <b-card>
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
                        v-bind:class="{'mdi-arrow-up text-success': !isLastBTCUSDTPriceMore, 'mdi-arrow-down text-danger': isLastBTCUSDTPriceMore}"
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

        </b-card>
      </div>
      <div class="col-lg-6 col-md-6 mb-2" id="marketDataContainer">
        <b-card>
          <b-card-text>
            <div class="row">
              <div class="col-md-4">
                <!-- v-bind:value="globalMarketCap | checkForProp('market_cap_percentage')| checkForProp(serverMarket) | normalizeValueWithComma(2)" -->
                <input type="text" class="dial" id="globalMarketChangePercentage">
                <div class="bg-icon">
                </div>
              </div>
              <div class="col-md-8">
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
                  <div class="total-market-cap">
                    <span>Total Market Cap</span>
                    <span class="main-text main-counter">
                      {{ globalMarketCap | checkForProp('total_market_cap') | checkForProp(serverMarket) | normalizeValueWithComma(2) }} {{ settings | checkForProp('currency') }}
                    </span>
                  </div>
                </div>
              </div>
            </div>
          </b-card-text>

        </b-card>
      </div>

      <!-- Third -->
      <div class="col-lg-3 col-md-6 mb-2">
        <b-card>
          <b-card-text>
            <div class="row">
              <div class="col-md-2">
                <div class="bg-icon">
                  <i class="fa fa-line-chart profitlw"></i>
                </div>
              </div>
              <div class="col-md-10">
                <div class="text-right">
                  <div class="profit-heading main-text">
                    <p class="mb-0 main-text monitor-smaller-fonts">Profit Last 7 Days</p>
                    <span class="open-brackets">({{ stats.totalSalesWeek ? stats.totalSalesWeek : '0' }}</span>
                    <span class="close-brackets">Trades)</span>
                  </div>
                  <h3 class="m-t-10 text-dark main-text profit-text">
                      <i class="mdi tcv-change"
                          v-bind:class="{'mdi-arrow-up text-success': !isLastweekProfitMore, 'mdi-arrow-down text-danger': isLastweekProfitMore}"
                        ></i>
                    <b class="counter main-text main-counter">{{ stats.totalProfitWeek ? stats.totalProfitWeek.toFixed(8) : '0.00000000' }}</b>
                    <span class="market m-l-5">{{ misc.market ? misc.market : '--' }}</span>
                  </h3>
                  <span class="market-price-calculations text-dark monitor-smaller-fonts">
                    <label class="usd-value js-usd-value">
                      <span class="full-text">{{ settings.currency ? settings.currency : '--'}} Estimated Value</span>
                    </label>
                    <span class="mb-0 main-text">{{stats.totalProfitWeek | getValueInCurrentCurrency(normalizeSettingsData(misc, currencies),8)}}</span>
                  </span>
                  <div class="market-volume text-dark">
                    <label class="usd-value">
                      <span class="api-market monitor-smaller-fonts">{{ misc.market ? misc.market : '--' }}</span>
                      <span>Volume</span>
                    </label>
                    <span class="mb-0 main-text monitor-smaller-fonts">{{ stats.totalVolumeWeek ? stats.totalVolumeWeek.toFixed(8) : '0.00000000'}}</span>
                  </div>
                  <div class="market-price-calculations text-dark js-estimated-gain monitor-smaller-fonts">
                    <label class="usd-value">
                      <span class="full-text">Estimated Gain</span>
                    </label>
                    <span class="mb-0 main-text">{{ stats.totalProfitPercWeek ? stats.totalProfitPercWeek : '0.00' }}</span>
                    <span> %</span>
                  </div>
                </div>
              </div>
            </div>
          </b-card-text>

        </b-card>
      </div>
      <div class="col-lg-3 col-md-6 mb-2">
        <b-card>
          <b-card-text>
            <div class="row">
              <div class="col-md-2">
                <div class="bg-icon">
                  <i class="fa fa-line-chart profitytd"></i>
                </div>
              </div>
              <div class="col-md-10">
                <div class="text-right">
                  <div class="profit-heading main-text">
                    <p class="mb-0 main-text">Profit Yesterday</p>
                    <span class="open-brackets" >{{ stats.totalSalesYesterday ? stats.totalSalesYesterday : '0'}}</span>
                    <span class="close-brackets">Trades</span>
                  </div>
                  <h3 class=" m-t-10 text-dark main-text profit-text">
                    <i class="mdi tcv-change"
                          v-bind:class="{'mdi-arrow-up text-success': !isYesterdaysProfitMore, 'mdi-arrow-down text-danger': isYesterdaysProfitMore}"
                        ></i>
                    <b class="counter">{{ stats.totalProfitYesterday ? stats.totalProfitYesterday.toFixed(8) : '0.00000000'}}</b>
                    <span class="market m-l-5">{{ misc.market ? misc.market : '--' }}</span>
                  </h3>
                  <span class="market-price-calculations text-dark monitor-smaller-fonts">
                <label class="usd-value js-usd-value">
                  <span class="full-text">{{ settings.currency ? settings.currency : '--'}} Estimated Value</span>
                </label>
                <span class="mb-0 main-text">{{stats.totalProfitYesterday | getValueInCurrentCurrency(normalizeSettingsData(misc, currencies),8)}}</span>
              </span>
                  <div class="market-volume text-dark">
                    <label class="usd-value">
                      <span class="api-market">{{ misc.market ? misc.market : '--' }}</span>
                      <span>Volume</span>
                    </label>
                    <span class="mb-0 main-text">{{ stats.totalVolumeYesterday ? stats.totalVolumeYesterday.toFixed(8) : '0.00000000' }}</span>
                  </div>
                  <div class="market-price-calculations text-dark js-estimated-gain">
                    <label class="usd-value">
                      <span class="full-text">Estimated Gain</span>
                    </label>
                    <span class="mb-0 main-text">{{ stats.totalProfitPercYesterday ? stats.totalProfitPercYesterday.toFixed(2) : '0.00' }}</span>
                    <span> %</span>
                  </div>
                </div>
              </div>
            </div>
          </b-card-text>

        </b-card>
      </div>
      <div class="col-lg-3 col-md-6 mb-2">
        <b-card>
          <b-card-text>
            <div class="row">
              <div class="col-md-2">
                <div class="bg-icon">
                  <i class="fa fa-line-chart profittd"></i>
                </div>
              </div>
              <div class="col-md-10">
                <div class="text-right">
                  <div class="profit-heading main-text">
                    <p class="mb-0 main-text">Profit Today</p>
                    <span class="open-brackets" >{{ stats.totalSalesToday ? stats.totalSalesToday : '0' }}</span>
                    <span class="close-brackets" >Trades</span>
                  </div>
                  <h3 class="m-t-10 text-dark main-text profit-text">
                    <i class="mdi tcv-change"
                          v-bind:class="{'mdi-arrow-up text-success': !isTodaysProfitMore, 'mdi-arrow-down text-danger': isTodaysProfitMore}"
                        ></i>
                    <b class="counter">{{ stats.totalProfitToday ? stats.totalProfitToday.toFixed(8) : '0.00000000'}}</b>
                    <span class="market m-l-5">{{ misc.market ? misc.market : '--' }}</span>
                  </h3>
                  <span class="market-price-calculations text-dark monitor-smaller-fonts">
                <label class="usd-value js-usd-value">
                  <span class="full-text">{{ settings.currency ? settings.currency : '--'}} Estimated Value</span>
                </label>
                <span class="mb-0 main-text">{{stats.totalProfitToday | getValueInCurrentCurrency(normalizeSettingsData(misc, currencies),8)}}</span>
              </span>
                  <div class="market-volume text-dark">
                    <label class="usd-value">
                      <span class="api-market">{{ misc.market ? misc.market : '--' }}</span>
                      <span>Volume</span>
                    </label>
                    <span class="mb-0 main-text">{{ stats.totalVolumeToday ? stats.totalVolumeToday.toFixed(8) : '0.00000000'}}</span>
                  </div>
                  <div class="market-price-calculations text-dark js-estimated-gain">
                    <label class="usd-value">
                      <span class="full-text" >Estimated Gain</span>
                    </label>
                    <span class="mb-0 main-text">{{ stats.totalProfitPercToday ? stats.totalProfitPercToday.toFixed(2) : '0.00'}}</span>
                    <span> %</span>
                  </div>
                </div>
              </div>
            </div>
          </b-card-text>

        </b-card>
      </div>
      <div class="col-lg-3 col-md-6 mb-2">
        <b-card>
          <b-card-text>
            <div class="row">
              <div class="col-md-4">
                <div class="bg-icon">
                  <i class="fa fa-cog"></i>
                </div>
              </div>
              <div class="col-md-8">
                <div class="text-right">
                  <p class="mb-0 text-muted font-13 settings-text m-t-10">POT:
                    <span class="m-l-5 text-strange text-strange">{{ misc.pendingOrderTime | checkIf }}</span>
                  </p>
                  <p class="m-b-5 m-t-5 text-muted font-13 settings-text">
                    <!-- Monitoring password set -->
                    <span>PW:</span>
                    <span class="m-l-5 text-strange badge" :class="settings.passwordSet ? 'badge-success' : 'badge-danger'">{{ settings.passwordSet ? 'On' : 'Off'}}</span>
                    <!-- Monitoring config enabled -->
                    <span class="m-l-5">CON:</span>
                    <span class="m-l-5 text-strange badge" :class="settings.enableConfig ? 'badge-success' : 'badge-danger'">{{ settings.enableConfig ? 'On' : 'Off'}}</span>
                  </p>
                  <p class="m-b-5 m-t-10 text-muted font-13 settings-text">
                  <span>
                    <span>SOM:</span>
                    <span class="m-l-5 text-strange badge" :class="!settings.sellOnlyMode ? 'badge-success' : 'badge-danger'">{{ settings.sellOnlyMode ? 'true' : 'false'}}</span>
                  </span>
                    <span class="m-l-5 red-tooltip">SOMO:</span>
                    <span class="m-l-5 text-strange badge" :class="!settings.sellOnlyModeOverride ? 'badge-success' : 'badge-danger'">{{ settings.sellOnlyModeOverride ? 'active' : 'inactive'}}</span>
                  </p>
                  <p class="mb-0 text-muted font-13 settings-text">
                    <span class="tdbitcoin">P</span><span class="text-primary">T</span>
                    <span>Ver:</span>
                    <span class="m-l-5 text-strange">{{ misc.version }}</span>
                  </p>
                  <p class="mb-0 text-muted font-13 settings-text">
                    <span>GUI Ver: </span>
                    <span class="m-l-5 text-strange">{{ app_version }}</span>
                  </p>
                  <p class="mb-0 text-muted font-13 settings-text">Market:
                    <span class="m-l-5 text-strange js-exchange">{{ misc.exchange }}</span>
                    <span class="m-l-5 text-strange">{{ misc.market }}</span>
                  </p>
                </div>
              </div>
            </div>
          </b-card-text>

        </b-card>
      </div>

      <!-- Fourth -->
      <div class="col-lg-3 col-md-6 mb-2">
        <pairs-log></pairs-log>
      </div>
      <div class="col-lg-3 col-md-6 mb-2">
        <dca-log></dca-log>
      </div>
      <div class="col-lg-3 col-md-6 mb-2">
        <pending-log></pending-log>
      </div>
      <div class="col-lg-3 col-md-6 mb-2">
        <sales-log></sales-log>
      </div>

    </div>
  </div>
</template>

<script>
  import {mapActions, mapGetters } from 'vuex'
  import pairsLog from './PairsLog'
  import dcaLog from './DCALog'
  import pendingLog from './PendingLog'
  import salesLog from './SalesLog'
  import $ from 'jquery';
  import sparkline from 'sparkline';

  export default {
    data() {
      return {
        app_version: APP_VERSION,
        lastRealBalance: 0,
        lastTCVBalance: 0,
        lastStartBalance: 0,
        lastBTCUSDTPrice: 0,
        lastWeekProfit: 0,
        todayProfit: 0,
        yesterdaysProfit: 0,
        isLastRealBalanceMore: true,
        isLastTCVBalanceMore: true,
        isLastStartBalanceMore: true,
        isLastBTCUSDTPriceMore: true,
        isLastweekProfitMore: true,
        isTodaysProfitMore: true,
        isYesterdaysProfitMore: true,
        serverMarket: ''
      }
    },
    computed: {
      ...mapGetters({
        misc: 'monitoring/misc',
        stats: 'monitoring/stats',
        settings: 'monitoring/settings',
        marketTrend: 'monitoring/marketTrend',
        marketCap: 'monitoring/marketCap',
        globalMarketCap: 'monitoring/globalMarketCap',
        currencies: 'monitoring/currencies'
      })
    },
    filters: {
      checkIf: function (data) {
        if (data) {
          return data;
        }
        return '--';
      },
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
      calculateTCV(data, dust = false) {

        // Calculating total current value for rendering in monitoring dashboard.
        if(dust) {
          return (data.pairsBalance + data.totalPairsCurrentValue  + data.totalDCACurrentValue + data.totalPendingCurrentValue + data.totalDustCurrentValue).toFixed(8)
        }
        return (data.pairsBalance + data.totalPairsCurrentValue  + data.totalDCACurrentValue + data.totalPendingCurrentValue).toFixed(8)
      },
      getClassBasedOnNumber(number) {
        if (number) {
          if (number < 0.00) {
            return 'text-danger';
          } else {
            return 'text-success'
          }
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
      getBadgeBasedOnNumber(index, prop) {
        if (this.marketCap && typeof this.marketCap[index] !== 'undefined' && this.marketCap[index].hasOwnProperty(prop)) {
          if (this.marketCap[index][prop] < 0) {
            return 'badge badge-light-danger';
          }
          return 'badge badge-light-success';
        }
      },
      normalizeSettingsData(settings, currencies) {
        var newSettings = this.$options.filters.normalizeCurrencies(settings, currencies);
        return newSettings;
      }
    },
    components: {
      pairsLog,
      dcaLog,
      salesLog,
      pendingLog
    },
    watch: {
      misc: function misc() {

        // To watch whenever misc change and update the boolean for rendering arrow in row 1 of monitoring section.
        if (this.misc && this.misc.hasOwnProperty('realBalance')) {
          this.serverMarket = this.misc.market.toLowerCase();
          this.getActiveMarketCandles()
          $('.dial#globalMarketChangePercentage').knob({
            readOnly: true,
            width: '42%',
            height: '42%',
            thickness: '.2',
            fgColor: '#f1556c',
            inputColor: '#f1556c',
            bgColor: '#48525e'
          });

          // Checking change in real balance.
          if (this.misc.realBalance !== this.lastRealBalance) {

            // Only changing boolean for rendering arrow only when data is not same.
              if (this.misc.realBalance < this.lastRealBalance) {
              this.isLastRealBalanceMore = true;
            } else {
              this.isLastRealBalanceMore = false;
            }
            this.lastRealBalance = this.misc.realBalance;
          }

          // Checking change in TCV balance.
          let totalCurrentValue = this.misc.pairsBalance
            + this.misc.totalPairsCurrentValue
            + this.misc.totalDCACurrentValue
            + this.misc.totalPendingCurrentValue;
          if (totalCurrentValue !== this.lastTCVBalance) {

            // Only changing boolean for rendering arrow only when data is not same.
            if (totalCurrentValue < this.lastTCVBalance) {
              this.isLastTCVBalanceMore = true;
            } else {
              this.isLastTCVBalanceMore = false;
            }
            this.lastTCVBalance = totalCurrentValue;
          }

          // Checking change in Start balance.
          if (this.misc.startBalance !== this.lastStartBalance) {

            // Only changing boolean for rendering arrow only when data is not same.
            if (this.misc.startBalance < this.lastStartBalance) {
              this.isLastStartBalanceMore = true;
            } else {
              this.isLastStartBalanceMore = false;
            }
            this.lastStartBalance = this.misc.startBalance;
          }

          // Checking change in real balance.
          if (this.misc.BTCUSDTPrice !== this.lastBTCUSDTPrice) {

            // Only changing boolean for rendering arrow only when data is not same.
              if (this.misc.BTCUSDTPrice < this.lastBTCUSDTPrice) {
              this.isLastBTCUSDTPriceMore = true;
            } else {
              this.isLastBTCUSDTPriceMore = false;
            }
            this.lastBTCUSDTPrice = this.misc.BTCUSDTPrice;
          }
        }
      },
      stats: function stats(){
        if (this.stats.totalProfitWeek !== this.lastWeekProfit) {

            // Only changing boolean for rendering arrow only when data is not same.
            if (this.stats.totalProfitWeek < this.lastWeekProfit) {
              this.isLastweekProfitMore = true;
            } else {
              this.isLastweekProfitMore = false;
            }
            this.lastWeekProfit = this.stats.totalProfitWeek;
          }

        if (this.stats.totalProfitToday !== this.todayProfit) {

            // Only changing boolean for rendering arrow only when data is not same.
            if (this.stats.totalProfitToday < this.todayProfit) {
              this.isTodaysProfitMore = true;
            } else {
              this.isTodaysProfitMore = false;
            }
            this.todayProfit = this.stats.totalProfitToday;
          }
        if (this.stats.totalProfitYesterday !== this.yesterdaysProfit) {

            // Only changing boolean for rendering arrow only when data is not same.
            if (this.stats.totalProfitYesterday < this.yesterdaysProfit) {
              this.isYesterdaysProfitMore = true;
            } else {
              this.isYesterdaysProfitMore = false;
            }
            this.todayProfit = this.stats.totalProfitYesterday;
          }
      },
    },
  }
</script>

<style scoped>
.card-body label.usd-value {
  margin-bottom: 0px;
}
.main-text.main-counter {
  color: rgba(255, 255, 255, 0.891);
}
.profittd{
  color: rgba(223, 92, 78, 1);
}
.profitytd{
  color: rgba(176, 196, 222, 1)
}
.profitlw{
  color: rgba(254, 231, 21, 1);
}
</style>
