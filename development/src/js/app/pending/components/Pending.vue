<template>
  <div class="container-fluid">
    <div class="row">
      <div class="col-12">
        <b-card>
          <b-table
            striped
            bordered
            :items="pending"
            :fields="fields"
            :sort-by.sync="sortBy"
            :sort-desc.sync="sortDesc"
            show-empty
          >
            <!-- Formatted headers -->
            <template slot="empty" slot-scope="scope">
              <h5 class="text-center">{{ scope.emptyText }}</h5>
            </template>
            <template slot="emptyfiltered" slot-scope="scope">
              <h5 class="text-center">{{ scope.emptyFilteredText }}</h5>
            </template>

            <!-- Coin -->
            <template slot="HEAD_market" slot-scope="data">
              <span v-b-tooltip.hover title="Coin Pair">{{ data.label }}</span>
            </template>

            <!-- Sell Strategy -->
            <template slot="HEAD_sellStrategies" slot-scope="data">
              <span v-b-tooltip.hover title="Sell Strategy">{{ data.label }}</span>
            </template>

            <!-- Bid Price / Average Price -->
            <template slot="HEAD_bidAvgPrice" slot-scope="data">
              <span v-b-tooltip.hover title="Bid Price and Average Price">Bid.Pr<br>Avg.Pr</span>
            </template>

            <!-- Profit % -->
            <template slot="HEAD_profit" slot-scope="data">
              <span v-b-tooltip.hover title="Profit in %">{{ data.label }}</span>
            </template>

            <!-- Combined Profits -->
            <template slot="HEAD_combinedProfit" slot-scope="data">
                <span v-b-tooltip.hover title="Combined Profits in %">{{ data.label }}</span>
            </template>

            <!-- Total Amount -->
            <template slot="HEAD_totalAmount" slot-scope="data">
              <span v-b-tooltip.hover title="Total Amount">{{ data.label }}</span>
            </template>

            <!-- Current Value / Target Cost -->
            <template slot="HEAD_currentTargetValue" slot-scope="data">
              <span v-b-tooltip.hover title="Current Value and Target Value">Cur.Val<br>Tar.Cost</span>
            </template>

            <!-- Fiat -->
            <template slot="HEAD_fiat" slot-scope="data">
              <span v-b-tooltip.hover title="Current Value and Target Value in USD">USD</span>
            </template>


            <!-- End of Formatted headers -->

            <!-- Coin -->
            <template slot="market" slot-scope="data">
              <span class="market"><a href="#">{{ data.item.market }}</a></span><br>
              <span :class="data.item.percChange > 0 ? 'profit-classtext' : 'loss-classtext'">{{ (data.item.percChange * 100).toFixed(2)}} %</span>
            </template>

            <!-- Bid Price / Avg. Price -->
            <template slot="bidAvgPrice" slot-scope="data">
              <span class="blue-color">{{ data.item.currentPrice.toFixed(8) }}</span><br>
              <span class="blue-color">{{ data.item.avgPrice.toFixed(8) }}</span>
            </template>

            <!-- Profit -->
            <template slot="profit" slot-scope="data">
              <span class="mb-1 badge" :class="data.item.profit > 0 ? 'badge-success' : 'badge-danger'">{{ data.item.profit.toFixed(2) }}</span><br>
              <span class="badge badge-success" v-if="data.item.orderbookProfit > 0">{{ data.item.orderbookProfit.toFixed(2) }}</span>
            </template>

            <!-- Combined Profit -->
            <template slot="combinedProfit" slot-scope="data">
              <span :class="data.item.combinedProfit >= 0 ? 'profit-classtext' : 'loss-classtext'">{{ data.item.combinedProfit.toFixed(2) }}</span>
            </template>

            <!-- Sell Strategies -->
            <template slot="sellStrategies" slot-scope="data">
              <span v-for="limit in data.item.sellStrategies" class="buy-strategy">
                {{ limit.name }}<br>
              </span>
              <div class="text-right ml-5">
                <button class="btn btn-sm btn-outline-danger text-white">Cancel</button>
              </div>
            </template>

            <!-- Current Value / Total Cost -->
            <template slot="currentTargetValue" slot-scope="data">
              <span class="blue-color">{{ data.item.currentValue.toFixed(data.item.pricePrecision) }}</span><br>
              <span class="blue-color">{{ data.item.totalCost.toFixed(data.item.pricePrecision) }}</span>
            </template>

            <!-- Fiat -->
            <template slot="fiat" slot-scope="data">
              <span class="blue-color">$ {{(data.item.currentValue.toFixed(data.item.pricePrecision) * 5289.96).toFixed(2) }}</span><br>
              <span class="blue-color">$ {{(data.item.totalCost.toFixed(data.item.pricePrecision) * 5289.96).toFixed(2) }}</span><br>
            </template>


          </b-table>

          <TableInfo :amount="pendingAmount" :data="pending"></TableInfo>

        </b-card>
      </div>
    </div>
  </div>
</template>

<script>
  import {mapActions, mapGetters } from 'vuex'
  import TableInfo from './PendingTableInfo'

  export default {
    components: {TableInfo},
    data() {
      return {
        sortBy: 'profit',
        sortDesc: true,
        fields: [
          {key: 'market', label: 'Coin', sortable: true},
          {key: 'sellStrategies', label: 'Sell', sortable: true},
          {key: 'bidAvgPrice', class: 'text-right', sortable: true},
          {key: 'profit', label: 'P%', sortable: true, class: 'text-center'},
          {key: 'combinedProfit', label: 'Comb. P%', sortable: true, class: 'text-center'},
          {key: 'totalAmount', label: 'TAM', sortable: true, class: 'text-right'},
          {key: 'currentTargetValue', class: 'text-right', sortable: true},
          {key: 'fiat', label: 'USD', sortable: true, class: 'text-right'},
        ]
      }
    },
    computed: {
      ...mapGetters({
        pending: 'pending/pendingLog',
        pendingAmount: 'pending/pendingAmount'
      })
    }
  }
</script>

<style scoped>

</style>
