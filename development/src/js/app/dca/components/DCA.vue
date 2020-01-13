<template>
  <div class="container-fluid">
    <div class="row">
      <div class="col-12">
        <b-card>
          <b-table
            striped
            bordered
            :items="dca"
            :fields="fields"
            show-empty
            :busy.sync="isBusy"
            :sort-by.sync="sortBy"
            :sort-desc.sync="sortDesc"
          >
            <template slot="emptyfiltered" slot-scope="scope">
              <h5 class="text-center">{{ scope.emptyFilteredText }}</h5>
            </template>
            <template slot="empty" slot-scope="scope">
              <h5 class="text-center">{{ scope.emptyText }}</h5>
            </template>

            <!-- Formatted headers -->
            <!-- First Bought Date -->
            <template slot="HEAD_firstBoughtDate" slot-scope="data">
              <span v-b-tooltip.hover title="First bought date (Time since buy)">{{ data.label }}</span>
            </template>

            <!-- Coin -->
            <template slot="HEAD_market" slot-scope="data">
              <span v-b-tooltip.hover title="Coin Pair">{{ data.label }}</span>
            </template>

            <!-- Bid Price / Average Price -->
            <template slot="HEAD_bidAvgPrice" slot-scope="data">
              <span v-b-tooltip.hover title="Bid Price and Average Price">Bid.Pr<br>Avg.Pr</span>
            </template>

            <!-- Buy Strategy -->
            <template slot="HEAD_buyStrategies" slot-scope="data">
              <span v-b-tooltip.hover title="Buy Strategy">{{ data.label }}</span>
            </template>

            <!-- Buy Strategy Value -->
            <template slot="HEAD_strategyBuyValue" slot-scope="data">
              <span v-b-tooltip.hover title="Buy Strategy Value">{{ data.label }}</span>
            </template>

            <!-- Buy Strategy Trigger -->
            <template slot="HEAD_strategyBuyTrigger" slot-scope="data">
              <span v-b-tooltip.hover title="Buy Strategy Trigger">{{ data.label }}</span>
            </template>

            <!-- Buy Strategy Limit -->
            <template slot="HEAD_strategyBuyLimit" slot-scope="data">
              <span v-b-tooltip.hover title="Buy Strategy Limit">{{ data.label }}</span>
            </template>

            <!-- Buy Trigger % -->
            <template slot="HEAD_buyTrigger" slot-scope="data">
              <span v-b-tooltip.hover title="Buy Trigger">{{ data.label }}</span>
            </template>

            <!-- Sell Strategy -->
            <template slot="HEAD_sellStrategies" slot-scope="data">
              <span v-b-tooltip.hover title="Sell Strategy">{{ data.label }}</span>
            </template>

            <!-- Sell Strategy Value -->
            <template slot="HEAD_strategySellValue" slot-scope="data">
              <span v-b-tooltip.hover title="Sell Strategy Value">{{ data.label }}</span>
            </template>

            <!-- Sell Strategy Trigger -->
            <template slot="HEAD_strategySellTrigger" slot-scope="data">
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
              <span v-b-tooltip.hover title="Current Value and Total Cost in USD">USD</span>
            </template>

            <!-- Volume -->
            <template slot="HEAD_volume" slot-scope="data">
              <span v-b-tooltip.hover title="Volume">{{ data.label }}</span>
            </template>

            <!-- Total Amount -->
            <template slot="HEAD_totalAmount" slot-scope="data">
              <span v-b-tooltip.hover title="Total Amount">{{ data.label }}</span>
            </template>

            <!-- Current Value / Total Cost -->
            <template slot="HEAD_currentTotalCost" slot-scope="data">
              <span v-b-tooltip.hover title="Current Value and Total Cost">Cur.Val<br>Tot.Cost</span>
            </template>
            <!-- End of Formatted headers -->

            <!-- Date -->
            <template slot="firstBoughtDate" slot-scope="data">
              {{ data.item.firstBoughtDate }}<br>
              {{ data.item.lastBoughtDate }}
            </template>

            <!-- Coin -->
            <template slot="market" slot-scope="data">
              <span class="market"><a href="#">{{ data.item.market }}</a></span><br>
              <span :class="data.item.percChange > 0 ? 'profit-classtext' : 'loss-classtext'">{{ (data.item.percChange * 100).toFixed(2)}} %</span>
            </template>

            <!-- Bid Price / Avg. Price -->
            <template slot="bidAvgPrice" slot-scope="data">
              <span>{{ data.item.currentPrice.toFixed(8) }}</span><br>
              <span>{{ data.item.avgPrice.toFixed(8) }}</span><br>
              <span class="badge badge-warning text-dark">{{ data.item.boughtTimes }}</span>
            </template>

            <!-- Buy Strategies -->
            <template slot="buyStrategies" slot-scope="data">
              <span v-for="limit in data.item.buyStrategies" class="buy-strategy">
                <span v-html="limit.name"></span> <span v-if="limit.positive !== 'false' && limit.positive !== ''" class="tdgreen">({{ limit.positive  }})</span><br>
              </span>
              <div class="text-right ml-5">
                <button class="btn btn-sm btn-outline-success text-white">Buy</button>
              </div>
            </template>

            <!-- BSV -->
            <template slot="strategyBuyValue" slot-scope="data">
              <span v-for="limit in data.item.buyStrategies">
                {{ limit.currentValue.toFixed(8) }}<br>
              </span>
            </template>

            <!-- BST -->
            <template slot="strategyBuyTrigger" slot-scope="data">
              <span v-for="limit in data.item.buyStrategies">
                {{ limit.entryValueLimit.toFixed(8) }}<br>
              </span>
            </template>

            <!-- BSTV -->
            <template slot="strategyTriggerValue" slot-scope="data">
              <span v-for="limit in data.item.buyStrategies">
                {{ limit.triggerValue }}<br>
              </span>
            </template>

            <!-- BT% -->
            <template slot="buyTrigger" slot-scope="data">
              {{ data.item.buyProfit.toFixed(2) }}
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
            <template slot="strategySellValue" slot-scope="data">
              <span v-for="limit in data.item.sellStrategies">
                {{ limit.currentValue.toFixed(2) }}<br>
              </span>
            </template>

            <!-- SST -->
            <template slot="strategySellTrigger" slot-scope="data">
              <span v-for="limit in data.item.sellStrategies">
                {{ limit.entryValue.toFixed(2) }}<br>
              </span>
            </template>

            <!-- Profit -->
            <template slot="profit" slot-scope="data">
              <span class="mb-1 badge p-2" :class="data.item.profit > 0 ? 'badge-success' : 'badge-danger'">{{ data.item.profit }}</span><br>
              <span class="badge badge-success p-2" v-if="data.item.orderbookProfit > 0">{{ data.item.orderbookProfit }}</span>
            </template>

            <!-- Current Value / Total Cost -->
            <template slot="currentTotalCost" slot-scope="data">
              <span>{{ data.item.currentValue.toFixed(data.item.pricePrecision) }}</span><br>
              <span>{{ data.item.totalCost.toFixed(data.item.pricePrecision) }}</span>
            </template>

            <!-- Fiat -->
            <template slot="fiat" slot-scope="data">
              <span>$ {{(data.item.currentValue.toFixed(data.item.pricePrecision) * 5289.96).toFixed(2) }}</span><br>
              <span>$ {{(data.item.totalCost.toFixed(data.item.pricePrecision) * 5289.96).toFixed(2) }}</span><br>
            </template>


          </b-table>

          <TableInfo :amount="dcaAmount" :data="dca"></TableInfo>

        </b-card>

        
      </div>
    </div>
  </div>
</template>

<script>
  import {mapActions, mapGetters } from 'vuex'
  import TableInfo from './DCATableInfo'

  export default {
    components: {TableInfo},
    data() {
      return {
        sortBy: 'profit',
        sortDesc: true,
        isBusy: false,
        fields: [
          {key: 'firstBoughtDate', label: 'Date', sortable: true},
          {key: 'market', label: 'Coin', sortable: true},
          {key: 'bidAvgPrice', class: 'text-right', sortable: true},
          {key: 'buyStrategies', label: 'Buy', sortable: true},
          {key: 'strategyBuyValue', label: 'BSV', sortable: true, class: 'text-right'},
          {key: 'strategyBuyTrigger', label: 'BST', sortable: true, class: 'text-right'},
          {key: 'strategyTriggerValue', label: 'BSTV', sortable: true, class: 'text-right'},
          {key: 'buyTrigger', label: 'BT%', sortable: true, class: 'text-center'},
          {key: 'sellStrategies', label: 'Sell', sortable: true},
          {key: 'strategySellValue', label: 'SSV', sortable: true, class: 'text-right'},
          {key: 'strategySellTrigger', label: 'SST', sortable: true, class: 'text-right'},
          {key: 'profit', label: 'P%', sortable: true, class: 'text-center'},
          {key: 'volume', label: 'VOL', sortable: true, class: 'text-right'},
          {key: 'totalAmount', label: 'TAM', sortable: true, class: 'text-right'},
          {key: 'currentTotalCost', class: 'text-right', sortable: true},
          {key: 'fiat', label: 'USD', sortable: true, class: 'text-right'},
        ],
      }
    },
    computed: {
      ...mapGetters({
        dca: 'dca/dcaLog',
        dcaAmount: 'dca/dcaAmount'
      })
    }
  }
</script>

<style scoped>

</style>
