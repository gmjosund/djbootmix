<template>
  <div>
    <div class="dataTables_info" role="status" aria-live="polite">Total records: {{ amount }}</div>
    <table class="col-md-3 col-sm-5 summary-table">
      <tbody>
      <tr>
        <td class="text-primary table-nowrap">
          <span class="full-text">Current Value</span>
        </td>
        <td class="text-primary table-nowrap">{{ pendingCalculations.currentValue }}<span
          class="current-currency-values">{{`${getProperties.currencySymbol}`}}{{pendingCalculations.currentValue | getValueInCurrentCurrency(getProperties,2)}}<span></span></span></td>
      </tr>
      <tr>
        <td class="text-dark table-nowrap">
          <span class="full-text">Difference</span>
        </td>
        <td id="pairsLogDifference" 
          class="text-dark table-nowrap">
          <span class="percentage" 
            :class="percentageCalculation(pendingCalculations.currentValue, pendingCalculations.targetValue) >= '0.00' ? 'text-success' : 'text-danger'"> ({{ percentageCalculation(pendingCalculations.currentValue, pendingCalculations.targetValue) }} %)</span>
          <span class="value">{{ (pendingCalculations.currentValue - pendingCalculations.targetValue).toFixed(8) }}<span class="current-currency-values">{{`${getProperties.currencySymbol}`}}{{(pendingCalculations.currentValue - pendingCalculations.targetValue).toFixed(8) | getValueInCurrentCurrency(getProperties,2)}}</span></span>
        </td>
      </tr>
      <tr>
        <td class="text-success table-nowrap">
          <span class="full-text">Target Value</span>
        </td>
        <td class="text-success table-nowrap">
          <span class="value">{{ pendingCalculations.targetValue }}<span class="current-currency-values">{{`${getProperties.currencySymbol}`}}{{pendingCalculations.targetValue | getValueInCurrentCurrency(getProperties,2)}}</span></span></td>
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
        pendingCalculations: 'pending/pendingCalculations',
        getProperties: 'header/getPropertyLogs',
      })
    }
  }
</script>

<style scoped>

</style>
