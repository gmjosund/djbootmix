<template>
  <div class="container-fluid">
    <div class="row">
      <div class="col-12">
        <b-card>
          <b-table
            striped
            bordered
            :items="possibleBuys"
            :fields="fields"
          >

            <!-- Formatted headers -->
            <template slot="emptyfiltered" slot-scope="scope">
              <p>{{ scope.emptyFilteredText }}</p>
            </template>
            <template slot="empty" slot-scope="scope">
              <p class="text-center">{{ scope.emptyText }}</p>
            </template>

            <!-- Coin -->
            <template slot="HEAD_market" slot-scope="data">
              <span v-b-tooltip.hover title="Coin Pair">{{ data.label }}</span>
            </template>

            <!-- Ask Price -->
            <template slot="HEAD_currentPrice" slot-scope="data">
              <span v-b-tooltip.hover title="Ask Price">{{ data.label }}</span>
            </template>

            <!-- Volume -->
            <template slot="HEAD_volume" slot-scope="data">
              <span v-b-tooltip.hover title="Volume">{{ data.label }}</span>
            </template>

            <!-- Buy Strategy -->
            <template slot="HEAD_buyStrategies" slot-scope="data">
              <span v-b-tooltip.hover title="Buy Strategy">{{ data.label }}</span>
            </template>

            <!-- Buy Strategy Value -->
            <template slot="HEAD_strategyValue" slot-scope="data">
              <span v-b-tooltip.hover title="Buy Strategy Value">{{ data.label }}</span>
            </template>

            <!-- Buy Strategy Trigger -->
            <template slot="HEAD_strategyTrigger" slot-scope="data">
              <span v-b-tooltip.hover title="Buy Strategy Trigger">{{ data.label }}</span>
            </template>

            <!-- Buy Strategy Limit -->
            <template slot="HEAD_strategyLimit" slot-scope="data">
              <span v-b-tooltip.hover title="Buy Strategy Limit">{{ data.label }}</span>
            </template>
            <!-- End of Formatted headers -->

            <!-- Rows -->

            <!-- Coin -->
            <template slot="market" slot-scope="data">
              <span class="market"><a href="#">{{ data.item.market }}</a></span><br>
              <span :class="data.item.percChange > 0 ? 'profit-classtext' : 'loss-classtext'">{{ (data.item.percChange * 100).toFixed(2)}} %</span>
            </template>

            <!-- Ask Price -->
            <template slot="currentPrice" slot-scope="data">
              <span class="blue-color">{{ data.item.currentPrice.toFixed(8) }}</span>
            </template>

            <!-- Buy Strategies -->
            <template slot="buyStrategies" slot-scope="data">
              <span v-for="limit in data.item.buyStrategies" class="buy-strategy">
                <span v-html="limit.name"></span> <span v-if="limit.positive !== 'false' && limit.positive !== ''" class="tdgreen">({{ limit.positive  }})</span><br>
              </span>
              <div class="text-right mr-2">
                <button class="btn btn-sm btn-outline-success text-white">Buy</button>
              </div>
            </template>

            <!-- BSV -->
            <template slot="strategyValue" slot-scope="data">
              <span v-for="limit in data.item.buyStrategies" class="current-value"
                    v-if="limit.name !== 'MIN/MAX CHANGE PERC' && limit.name !== 'TOO NEW' && limit.name !== 'MAX SPREAD' && limit.name !== 'ORDERBOOK LOW' && limit.name !== 'SOM ENABLED'">
                {{ limit.currentValue.toFixed(limit.decimals) }}<br>
              </span>
            </template>

            <!-- BST -->
            <template slot="strategyTrigger" slot-scope="data">
              <span v-for="limit in data.item.buyStrategies" class="buy-value"
                    v-if="limit.name !== 'MIN/MAX CHANGE PERC' && limit.name !== 'TOO NEW' && limit.name !== 'MAX SPREAD' && limit.name !== 'ORDERBOOK LOW' && limit.name !== 'SOM ENABLED'">
                {{ limit.entryValue.toFixed(limit.decimals) }}<br>
              </span>
            </template>

            <!-- BSL -->
            <template slot="strategyLimit" slot-scope="data">
              <span v-for="limit in data.item.buyStrategies"
                    v-if="limit.name !== 'MIN/MAX CHANGE PERC' && limit.name !== 'TOO NEW' && limit.name !== 'MAX SPREAD' && limit.name !== 'ORDERBOOK LOW' && limit.name !== 'SOM ENABLED'">
                {{ limit.entryValueLimit.toFixed(limit.decimals) }}<br>
              </span>
            </template>

            <!-- End of Rows -->
          </b-table>

          <div role="status" aria-live="polite">Total records: {{ possibleBuysAmount }}</div>

        </b-card>


      </div>
    </div>
  </div>
</template>

<script>
  import {mapActions, mapGetters } from 'vuex'
  export default {
    data() {
      return {
        fields: [
          {key: 'market', label: 'Coin', sortable: true},
          {key: 'currentPrice', label: 'Ask Price', sortable: true, class: 'text-right'},
          {key: 'volume', label: 'Vol', sortable: true, class: 'text-right'},
          {key: 'buyStrategies', label: 'Buy', sortable: true},
          {key: 'strategyValue', label: 'BSV', sortable: true, class: 'text-right'},
          {key: 'strategyTrigger', label: 'BST', sortable: true, class: 'text-right'},
          {key: 'strategyLimit', label: 'BSL', sortable: true, class: 'text-right'},
        ]
      }
    },
    computed: {
      ...mapGetters({
        possibleBuys: 'possibleBuys/possibleBuysLog',
        possibleBuysAmount: 'possibleBuys/possibleBuysAmount'
      })
    }
  }
</script>

<style scoped>

</style>
