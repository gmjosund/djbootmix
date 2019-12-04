<template>
  <div class="container-fluid">
    <div class="row">
      <div class="col-12">
        <b-card>
          <b-table
            striped
            bordered
            :items="pairs"
            :fields="fields"
            :sort-by.sync="sortBy"
            :sort-desc.sync="sortDesc"
          >

            <!-- Formatted headers -->
            <template slot="emptyfiltered" slot-scope="scope">
              <p>{{ scope.emptyFilteredText }}</p>
            </template>
            <template slot="empty" slot-scope="scope">
              <p class="text-center">{{ scope.emptyText }}</p>
            </template>

            <!-- First Bought Date -->
            <template slot="HEAD_firstBoughtDate" slot-scope="data">
              <span v-b-tooltip.hover title="First bought date (Time since buy)">{{ data.label }}</span>
            </template>

            <!-- Coin -->
            <template slot="HEAD_market" slot-scope="data">
              <span v-b-tooltip.hover title="Coin Pair">{{ data.label }}</span>
            </template>

            <!-- Sell Strategy -->
            <template slot="HEAD_sellStrategies" slot-scope="data">
              <span v-b-tooltip.hover title="Sell Strategy">{{ data.label }}</span>
            </template>

            <!-- Sell Strategy Value -->
            <template slot="HEAD_strategyValue" slot-scope="data">
              <span v-b-tooltip.hover title="Sell Strategy Value">{{ data.label }}</span>
            </template>

            <!-- Sell Strategy Trigger -->
            <template slot="HEAD_strategyTrigger" slot-scope="data">
              <span v-b-tooltip.hover title="Sell Strategy Trigger">{{ data.label }}</span>
            </template>

            <!-- Profit Percentage -->
            <template slot="HEAD_profit" slot-scope="data">
              <span v-b-tooltip.hover title="Profit and Order Book Profit in %">{{ data.label }}</span>
            </template>

            <!-- Bid Price / Bought Price -->
            <template slot="HEAD_bidBoughtPrice" slot-scope="data">
              <span v-b-tooltip.hover title="Bid Price and Bought Price">Bid Price<br>Bought Price</span>
            </template>

            <!-- Current Value / Bought Cost -->
            <template slot="HEAD_currentBoughtCost" slot-scope="data">
              <span v-b-tooltip.hover title="Current Value and Bought Cost">Current Value<br>Bought Cost</span>
            </template>

            <!-- Fiat -->
            <template slot="HEAD_fiat" slot-scope="data">
              <span v-b-tooltip.hover title="Current Value and Bought Cost in USD">USD</span>
            </template>

            <!-- Volume -->
            <template slot="HEAD_volume" slot-scope="data">
              <span v-b-tooltip.hover title="Volume">{{ data.label }}</span>
            </template>

            <!-- Total Amount -->
            <template slot="HEAD_totalAmount" slot-scope="data">
              <span v-b-tooltip.hover title="Total Amount">{{ data.label }}</span>
            </template>
            <!-- End of Formatted headers -->

            <!-- First Bought Date -->
            <template slot="firstBoughtDate" slot-scope="data">
              {{ data.item.firstBoughtDate }}
            </template>

            <!-- Coin -->
            <template slot="market" slot-scope="data">
              <span class="market"><a href="#">{{ data.item.market }}</a></span><br>
              <span :class="data.item.percChange > 0 ? 'profit-classtext' : 'loss-classtext'">{{ (data.item.percChange * 100).toFixed(2)}} %</span>
            </template>

            <!-- Sell Strategies -->
            <template slot="sellStrategies" slot-scope="data">
              <span v-for="limit in data.item.sellStrategies" class="sell-strategy">
                <span v-html="limit.name"></span> <span v-if="limit.positive !== 'false' && limit.positive !== ''" class="tdgreen">({{ limit.positive  }})</span><br>
              </span>
              <div class="text-right ml-5">
                <button class="btn btn-sm btn-outline-danger text-white">Sell</button>
              </div>
            </template>

            <!-- SSV -->
            <template slot="strategyValue" slot-scope="data">
              <span v-for="limit in data.item.sellStrategies" class="current-value"
                    v-if="limit.name !== 'MIN/MAX CHANGE PERC' && limit.name !== 'TOO NEW' && limit.name !== 'MAX SPREAD' && limit.name !== 'ORDERBOOK LOW' && limit.name !== 'SOM ENABLED'">
                {{ limit.currentValue.toFixed(limit.decimals) }}<br>
              </span>
            </template>

            <!-- SST -->
            <template slot="strategyTrigger" slot-scope="data">
              <span v-for="limit in data.item.sellStrategies" class="trigger"
                    v-if="limit.name !== 'MIN/MAX CHANGE PERC' && limit.name !== 'TOO NEW' && limit.name !== 'MAX SPREAD' && limit.name !== 'ORDERBOOK LOW' && limit.name !== 'SOM ENABLED'">
                {{ limit.entryValue.toFixed(limit.decimals) }}<br>
              </span>
            </template>

            <!-- Profit -->
            <template slot="profit" slot-scope="data">
              <span class="mb-1 badge" :class="data.item.profit > 0 ? 'badge-success' : 'badge-danger'">{{ data.item.profit.toFixed(2) }}</span><br>
              <span class="badge badge-success" v-if="data.item.orderbookProfit > 0">{{ data.item.orderbookProfit.toFixed(2) }}</span>
            </template>

            <!-- Bid Price / Bought Price -->
            <template slot="bidBoughtPrice" slot-scope="data">
              <span class="blue-color">{{ data.item.currentPrice.toFixed(data.item.pricePrecision) }}</span><br>
              <span class="blue-color">{{ data.item.avgPrice.toFixed(data.item.pricePrecision) }}</span>
            </template>

            <!-- Current Value / Bought Cost -->
            <template slot="currentBoughtCost" slot-scope="data">
              <span class="blue-color">{{ currentValue(data.item.currentValue, data.item.pricePrecision, data.item.fee) }}</span><br>
              <span class="blue-color">{{ data.item.totalCost.toFixed(data.item.pricePrecision) }}</span>
            </template>

            <!-- Fiat -->
            <template slot="fiat" slot-scope="data">
              <span class="blue-color">$ {{(data.item.currentValue.toFixed(data.item.pricePrecision) * 5289.96).toFixed(2) }}</span><br>
              <span class="blue-color">$ {{(data.item.totalCost.toFixed(data.item.pricePrecision) * 5289.96).toFixed(2) }}</span><br>
            </template>

          </b-table>

          <TableInfo :amount="pairsAmount" :data="pairs"></TableInfo>
        </b-card>
      </div>
    </div>
  </div>
</template>

<script>
  import {mapActions, mapGetters } from 'vuex'
  import TableInfo from './PairsTableInfo'
  export default {
    components: {TableInfo},
    data() {
      return {
        sortBy: 'profit',
        sortDesc: true,
        fields: [
          {key: 'firstBoughtDate', label: 'Date', sortable: true},
          {key: 'market', label: 'Coin', sortable: true},
          {key: 'sellStrategies', label: 'Sell', sortable: true},
          {key: 'strategyValue', label: 'SSV', sortable: true, class: 'text-right'},
          {key: 'strategyTrigger', label: 'SST', sortable: true, class: 'text-right'},
          {key: 'profit', label: 'P%', class: 'text-center', sortable: true},
          {key: 'bidBoughtPrice', class: 'text-right', sortable: true},
          {key: 'currentBoughtCost', class: 'text-right', sortable: true},
          {key: 'fiat', label: 'USD', class: 'text-right', sortable: true},
          {key: 'volume', label: 'VOL', class: 'text-right', sortable: true},
          {key: 'totalAmount', label: 'TAM', class: 'text-right', sortable: true},
        ],
      }
    },
    computed: {
      ...mapGetters({
        pairs: 'pairs/pairsLog',
        pairsAmount: 'pairs/pairsAmount'
      })
    },
    methods: {
      currentValue(value, precision, fee) {
        return (value - (value * (fee / 100))).toFixed(precision)
      }
    }
  }
</script>

<style scoped>

</style>
