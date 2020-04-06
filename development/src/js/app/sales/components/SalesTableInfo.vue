<template>
  <div>
    <div class="dataTables_info" role="status" aria-live="polite">Total records: {{ amount }}</div>
    <table class="col-md-3 col-sm-5 summary-table">
      <tbody>
      <tr>
        <td class="text-primary table-nowrap">
          <span class="full-text">Bought cost</span>
        </td>
        <td class="text-primary table-nowrap">{{ salesCalculations.soldValue }}<span
          class="current-currency-values">{{`${getProperties.currencySymbol}`}}{{salesCalculations.soldValue | getValueInCurrentCurrency(getProperties,2)}}<span></span></span></td>
      </tr>
      <tr>
        <td class="text-dark table-nowrap">
          <span class="full-text">Difference</span>
        </td>
        <td id="pairsLogDifference" 
          class="text-dark table-nowrap">
          <span class="percentage" 
            :class="percentageCalculation(salesCalculations.soldValue, salesCalculations.boughtCost) >= '0.00' ? 'text-success' : 'text-danger'"> ({{ percentageCalculation(salesCalculations.soldValue, salesCalculations.boughtCost) }} %)</span>
          <span class="value">{{ (salesCalculations.soldValue - salesCalculations.boughtCost).toFixed(8) }}<span class="current-currency-values">{{`${getProperties.currencySymbol}`}}{{(salesCalculations.soldValue - salesCalculations.boughtCost).toFixed(8) | getValueInCurrentCurrency(getProperties,2)}}</span></span>
        </td>
      </tr>
      <tr>
        <td class="text-success table-nowrap">
          <span class="full-text">Sold value</span>
        </td>
        <td class="text-success table-nowrap">
          <span class="value">{{ salesCalculations.boughtCost }}<span class="current-currency-values">{{`${getProperties.currencySymbol}`}}{{salesCalculations.boughtCost | getValueInCurrentCurrency(getProperties,2)}}</span></span></td>
      </tr>
      </tbody>
    </table>
  </div>
</template>

<script>
  import {mapActions, mapGetters } from 'vuex'
  import { percentageCalculation } from '../../../helpers'

  export default {
    props: [
      'amount',
      'data',
    ],
    methods: {
      percentageCalculation
    },
    computed: {
      ...mapGetters({
        salesCalculations: 'sales/salesCalculations',
        getProperties: 'header/getPropertyLogs'
      })
    }
  }
</script>

<style scoped>

</style>
