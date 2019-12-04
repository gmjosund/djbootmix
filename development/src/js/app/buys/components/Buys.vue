<template>
  <div class="container-fluid">
    <div class="row">
      <div class="col-12">
        <b-card>
          <b-table
            striped
            bordered
            :items="buys"
            :fields="fields"
            :sort-by.sync="sortBy"
            :sort-desc.sync="sortDesc"
          >

            <!-- Formatted headers -->
            <!-- First Bought Date -->
            <template slot="HEAD_firstBoughtDate" slot-scope="data">
              <span v-b-tooltip.hover title="First bought date (Time since buy)">{{ data.label }}</span>
            </template>

            <!-- Coin -->
            <template slot="HEAD_market" slot-scope="data">
              <span v-b-tooltip.hover title="Coin Pair">{{ data.label }}</span>
            </template>

            <!-- Order Number -->
            <template slot="HEAD_orderNumber" slot-scope="data">
              <span v-b-tooltip.hover title="Order Number">{{ data.label }}</span>
            </template>

            <!-- Buy Type -->
            <template slot="HEAD_type" slot-scope="data">
              <span v-b-tooltip.hover title="Buy Type">{{ data.label }}</span>
            </template>

            <!-- Buy -->
            <template slot="HEAD_buyStrategies" slot-scope="data">
              <span v-b-tooltip.hover title="Buy">{{ data.label }}</span>
            </template>

            <!-- Bought Price -->
            <template slot="HEAD_avgPrice" slot-scope="data">
              <span v-b-tooltip.hover title="Bought Price">{{ data.label }}</span>
            </template>

            <!-- Bought Amount -->
            <template slot="HEAD_totalAmount" slot-scope="data">
              <span v-b-tooltip.hover title="Bought Amount">{{ data.label }}</span>
            </template>

            <!-- Bought Cost -->
            <template slot="HEAD_totalCost" slot-scope="data">
              <span v-b-tooltip.hover title="Bought Cost">{{ data.label }}</span>
            </template>

            <!-- Volume -->
            <template slot="HEAD_volume" slot-scope="data">
              <span v-b-tooltip.hover title="Volume">{{ data.label }}</span>
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


            <!-- End of Formatted headers -->

            <!-- Date -->
            <template slot="firstBoughtDate" slot-scope="data">
              {{ data.item.firstBoughtDate }}
            </template>

            <!-- Coin -->
            <template slot="market" slot-scope="data">
              <span class="market"><a href="#">{{ data.item.market }}</a></span>
            </template>

            <!-- Order Number -->
            <template slot="orderNumber" slot-scope="data">
              {{ data.item.orderNumber }}
            </template>

            <!-- Buy Type -->
            <template slot="type" slot-scope="data">
              <span>{{ data.item.type }}</span> <span class="badge badge-warning text-dark" v-if="data.item.boughtTimes > 0">{{ data.item.boughtTimes }}</span>
            </template>

            <!-- Buy Strategies -->
            <template slot="buyStrategies" slot-scope="data">
              <span v-for="limit in data.item.buyStrategies" class="buy-strategy">
                <span v-html="limit.name"></span><br>
              </span>
            </template>

            <!-- Bought Price -->
            <template slot="avgPrice" slot-scope="data">
              <span class="blue-color">{{ data.item.avgPrice.toFixed(8) }}</span>
            </template>

            <!-- Bought Amount -->
            <template slot="totalAmount" slot-scope="data">
              {{ data.item.totalAmount }}
            </template>

            <!-- Bought Cost -->
            <template slot="totalCost" slot-scope="data">
              {{ data.item.totalCost.toFixed(8) }}
            </template>

            <!-- BSV -->
            <template slot="strategyBuyValue" slot-scope="data">
              <span v-for="limit in data.item.buyStrategies" v-if="limit.currentValue !== 0" class="current-value">
                {{ limit.currentValue.toFixed(limit.decimals) }}<br>
              </span>
            </template>

            <!-- BST -->
            <template slot="strategyBuyTrigger" slot-scope="data">
              <span v-for="limit in data.item.buyStrategies" v-if="limit.entryValue !== 0" class="buy-value">
                {{ limit.entryValue.toFixed(limit.decimals) }}<br>
              </span>
            </template>

            <!-- BSL -->
            <template slot="strategyBuyLimit" slot-scope="data">
              <span v-for="limit in data.item.buyStrategies" v-if="limit.entryValueLimit !== 0">
                {{ limit.entryValueLimit.toFixed(limit.decimals) }}<br>
              </span>
            </template>


          </b-table>

          <div role="status" aria-live="polite">Total records: {{ buyAmount }}</div>

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
        sortBy: 'firstBoughtDate',
        sortDesc: true,
        fields: [
          {key: 'firstBoughtDate', label: 'Date', sortable: true},
          {key: 'market', label: 'Coin', sortable: true},
          {key: 'orderNumber', label: 'Order Number', sortable: true},
          {key: 'type', label: 'Buy Type', sortable: true},
          {key: 'buyStrategies', label: 'Buy', sortable: true},
          {key: 'avgPrice', label: 'Bought Price', sortable: false, class: 'text-center'},
          {key: 'totalAmount', label: 'Bought Amount', sortable: true, class: 'text-right'},
          {key: 'totalCost', label: 'Bought Cost', sortable: true, class: 'text-right'},
          {key: 'volume', label: 'VOL', sortable: true, class: 'text-right'},
          {key: 'strategyBuyValue', label: 'BSV', sortable: false, class: 'text-right'},
          {key: 'strategyBuyTrigger', label: 'BST', sortable: false, class: 'text-right'},
          {key: 'strategyBuyLimit', label: 'BSL', sortable: false, class: 'text-right'},
        ]
      }
    },
    computed: {
      ...mapGetters({
        buys: 'buys/buysLog',
        buyAmount: 'buys/buyAmount'
      })
    }
  }
</script>

<style scoped>

</style>
