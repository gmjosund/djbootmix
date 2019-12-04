<template>
  <div class="container-fluid">
    <div class="row">
      <div class="col-12">
        <b-card>
          <b-table
            striped
            bordered
            :items="dust"
            :fields="fields"
            show-empty
          >

            <!-- Formatted headers -->
            <template slot="emptyfiltered" slot-scope="scope">
              <h5 class="text-center">{{ scope.emptyFilteredText }}</h5>
            </template>
            <template slot="empty" slot-scope="scope">
              <h5 class="text-center">{{ scope.emptyText }}</h5>
            </template>

            <!-- First Bought Date -->
            <template slot="HEAD_firstBoughtDate" slot-scope="data">
              <span v-b-tooltip.hover title="First bought date (Time since buy)">{{ data.label }}</span>
            </template>

            <!-- Coin -->
            <template slot="HEAD_market" slot-scope="data">
              <span v-b-tooltip.hover title="Coin Pair">{{ data.label }}</span>
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

            <!-- Date -->
            <template slot="firstBoughtDate" slot-scope="data">
              {{ data.item.firstBoughtDate }}
            </template>

            <!-- Coin -->
            <template slot="market" slot-scope="data">
              <span class="market"><a href="#">{{ data.item.market }}</a></span><br>
              <span :class="data.item.percChange > 0 ? 'profit-classtext' : 'loss-classtext'">{{ (data.item.percChange * 100).toFixed(2)}} %</span>
            </template>

            <!-- Bid Price / Avg. Price -->
            <template slot="bidAvgPrice" slot-scope="data">
              <span>{{ data.item.currentPrice.toFixed(8) }}</span><br>
              <span>{{ data.item.avgPrice.toFixed(8) }}</span> - <span>{{ data.item.boughtTimes }}</span>
            </template>

            <!-- Buy Strategies -->
            <template slot="buyStrategies" slot-scope="data">
              <span v-for="limit in data.item.buyStrategies">
                {{ limit.name }}<br>
              </span>
              <div class="text-right ml-5">
                <button class="btn btn-sm btn-success">Buy</button>
              </div>
            </template>

            <!-- BSV -->
            <template slot="strategyBuyValue" slot-scope="data">
              <span v-for="limit in data.item.buyStrategies">
                {{ limit.currentValue }}<br>
              </span>
            </template>

            <!-- BST -->
            <template slot="strategyBuyTrigger" slot-scope="data">
              <span v-for="limit in data.item.buyStrategies">
                {{ limit.triggerValue }}<br>
              </span>
            </template>

            <!-- BSL -->
            <template slot="strategyBuyLimit" slot-scope="data">
              <span v-for="limit in data.item.buyStrategies">
                {{ limit.entryValueLimit }}<br>
              </span>
            </template>



            <!-- Profit -->
            <template slot="profit" slot-scope="data">
              <span class="mb-1 badge p-2" :class="data.item.profit > 0 ? 'badge-success' : 'badge-danger'">{{ data.item.profit }}</span><br>
            </template>

            <!-- Bid Price / Bought Price -->
            <template slot="bidBoughtPrice" slot-scope="data">
              <span>{{ data.item.currentPrice.toFixed(8) }}</span><br>
              <span>{{ data.item.avgPrice.toFixed(8) }}</span>
            </template>

            <!-- Current Value / Total Cost -->
            <template slot="currentBoughtCost" slot-scope="data">
              <span>{{ data.item.currentValue.toFixed(data.item.pricePrecision) }}</span><br>
              <span>{{ data.item.totalCost.toFixed(data.item.pricePrecision) }}</span>
            </template>

            <!-- Fiat -->
            <template slot="fiat" slot-scope="data">
              <span>$ {{(data.item.currentValue.toFixed(data.item.pricePrecision) * 5289.96).toFixed(2) }}</span><br>
              <span>$ {{(data.item.totalCost.toFixed(data.item.pricePrecision) * 5289.96).toFixed(2) }}</span><br>
            </template>


          </b-table>

          <TableInfo :amount="dustAmount" :data="dust"></TableInfo>

        </b-card>


      </div>
    </div>
  </div>
</template>

<script>
  import TableInfo from './DustTableInfo'
  import {mapActions, mapGetters } from 'vuex'

  export default {
    components: {TableInfo},
    data() {
      return {
        fields: [
          {key: 'firstBoughtDate', label: 'Date', sortable: true},
          {key: 'market', label: 'Coin', sortable: true},
          {key: 'profit', label: 'P%', sortable: true, class: 'text-center'},
          {key: 'bidBoughtPrice', class: 'text-right', sortable: true},
          {key: 'currentBoughtCost', class: 'text-right', sortable: true},
          {key: 'fiat', label: 'USD', sortable: true, class: 'text-right'},
          {key: 'volume', label: 'VOL', sortable: true, class: 'text-right'},
          {key: 'totalAmount', label: 'TAM', sortable: true, class: 'text-right'},
        ],
      }
    },
    computed: {
      ...mapGetters({
        dust: 'dust/dustLog',
        dustAmount: 'dust/dustAmount'
      })
    }
  }
</script>

<style scoped>

</style>
