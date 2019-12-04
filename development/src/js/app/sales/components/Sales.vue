<template>
  <div class="container-fluid">
    <div class="row">
      <div class="col-12">
        <b-card>
          <b-table
            striped
            bordered
            :items="sales"
            :fields="fields"
            :sort-by.sync="sortBy"
            :sort-desc.sync="sortDesc"
          >
            <!-- Formatted headers -->
            <!-- Date -->
            <template slot="HEAD_soldDate" slot-scope="data">
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

            <!-- Profit Percentage -->
            <template slot="HEAD_profit" slot-scope="data">
              <span v-b-tooltip.hover title="Profit in %">{{ data.label }}</span>
            </template>

            <!-- Profit Percentage -->
            <template slot="HEAD_profitCurrency" slot-scope="data">
              <span v-b-tooltip.hover title="Profit BTC">{{ data.label }}</span>
            </template>

            <!-- Fiat -->
            <template slot="HEAD_profitFiat" slot-scope="data">
              <span v-b-tooltip.hover title="Fiat value">{{ data.label }}</span>
            </template>

            <!-- Sold Amount -->
            <template slot="HEAD_soldAmount" slot-scope="data">
              <span v-b-tooltip.hover title="Sold Amount">{{ data.label }}</span>
            </template>

            <!-- Bought Price / Sold Price -->
            <template slot="HEAD_boughtSoldPrice" slot-scope="data">
              <span v-b-tooltip.hover title="Bought Price and Sold Price">Bought Price<br>Sold Price</span>
            </template>

            <!-- Bought Cost / Sold Value -->
            <template slot="HEAD_boughtSoldValue" slot-scope="data">
              <span v-b-tooltip.hover title="Bought Cost and Sold Value">Bought Cost<br>Sold Value</span>
            </template>

            <!-- Bought Cost / Sold Value -->
            <template slot="HEAD_fiat" slot-scope="data">
              <span v-b-tooltip.hover title="Bought Cost and Sold Value in USD">USD</span>
            </template>


            <!-- End of Formatted headers -->

            <!-- Coin -->
            <template slot="market" slot-scope="data">
              <span class="market"><a href="#">{{ data.item.market }}</a></span>
            </template>

            <!-- Sell Strategies -->
            <template slot="sellStrategies" slot-scope="data">
              <span v-for="limit in data.item.sellStrategies" class="sell-strategy">
                <span v-html="limit.name"></span> <span v-if="limit.positive !== 'false' && limit.positive !== ''" class="tdgreen">({{ limit.positive  }})</span><br>
              </span>
            </template>

            <!-- Profit -->
            <template slot="profit" slot-scope="data">
              <span class="mb-1 badge p-2" :class="data.item.profit >= 0 ? 'badge-success' : 'badge-danger'">{{ data.item.profit.toFixed(2) }}</span>
            </template>

            <!-- Profit Crypto -->
            <template slot="profitCurrency" slot-scope="data">
              <span :class="data.item.profitCurrency >= 0 ? 'profit-classtext' : 'loss-classtext'">{{ data.item.profitCurrency.toFixed(8) }}</span>
            </template>

            <!-- Profit -->
            <template slot="profitFiat" slot-scope="data">
              <span :class="data.item.profitCurrency >= 0 ? 'profit-classtext' : 'loss-classtext'">$ {{(data.item.profitCurrency.toFixed(data.item.pricePrecision) * 5289.96).toFixed(2) }}</span><br>
            </template>

            <!-- Sold Amount -->
            <template slot="soldAmount" slot-scope="data">
              <span class="sold-amount">{{ data.item.soldAmount }}</span>
            </template>

            <!-- Bought Price / Sold Price -->
            <template slot="boughtSoldPrice" slot-scope="data">
              <span class="sold-price">{{ data.item.avgPrice.toFixed(8) }}</span><br>
              <span class="sold-price">{{ data.item.currentPrice.toFixed(8) }}</span>
            </template>

            <!-- Bought Cost / Sold Value -->
            <template slot="boughtSoldValue" slot-scope="data">
              <span class="sold-value">{{ data.item.totalCost.toFixed(8) }}</span><br>
              <span class="sold-value">{{ soldValue(data.item.soldValue, data.item.pricePrecision, data.item.fee) }}</span>
            </template>

            <!-- Bought Cost / Sold Value -->
            <template slot="fiat" slot-scope="data">
              <span class="blue-color">$ {{(data.item.totalCost.toFixed(data.item.pricePrecision) * 5289.96).toFixed(2) }}</span><br>
              <span class="blue-color">$ {{(data.item.soldValue.toFixed(data.item.pricePrecision) * 5289.96).toFixed(2) }}</span>
            </template>

          </b-table>

          <div role="status" aria-live="polite">Total records: {{ salesAmount }}</div>

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
        sortBy: 'soldDate',
        sortDesc: true,
        fields: [
          {key: 'soldDate', label: 'Date', sortable: true},
          {key: 'market', label: 'Coin', sortable: true},
          {key: 'sellStrategies', label: 'Sell', sortable: true},
          {key: 'profit', label: 'P%', sortable: true, class: 'text-center'},
          {key: 'profitCurrency', label: 'Profit BTC', sortable: true, class: 'text-right'},
          {key: 'profitFiat', label: 'USD', sortable: true, class: 'text-right'},
          {key: 'soldAmount', label: 'SAM', sortable: true, class: 'text-right'},
          {key: 'boughtSoldPrice', class: 'text-right', sortable: true},
          {key: 'boughtSoldValue', class: 'text-right', sortable: true},
          {key: 'fiat', label: 'USD', sortable: false, class: 'text-right'},
        ],
      }
    },
    computed: {
      ...mapGetters({
        sales: 'sales/salesLog',
        salesAmount: 'sales/salesAmount'
      })
    },
    methods: {
      soldValue(value, precision, fee) {
        return (value - (value * (fee / 100))).toFixed(precision)
      }
    }
  }
</script>

<style scoped>

</style>
