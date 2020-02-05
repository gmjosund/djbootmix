<template>
  <div>
    <div role="status" aria-live="polite">Total records: {{ amount }}</div>
    <table class="col-md-3 col-sm-5 summary-table">
      <tbody>
      <tr>
        <td class="text-primary table-nowrap">
          <span class="full-text">Current Value</span>
        </td>
        <td class="text-primary table-nowrap">{{ pairsCalculations.currentValue }}<span
          class="current-currency-values">{{`${getProperties.currencySymbol}`}}{{pairsCalculations.currentValue | getValueInCurrentCurrency(getProperties,2)}}<span></span></span></td>
      </tr>
      <tr>
        <td class="text-dark table-nowrap">
          <span class="full-text">Difference</span>
        </td>
        <td id="pairsLogDifference" class="text-dark table-nowrap">
          <span class="percentage" :class="percentageCalculation(pairsCalculations.currentValue, pairsCalculations.boughtCost) >= '0.00' ? 'text-success' : 'text-danger'"> ({{ percentageCalculation(pairsCalculations.currentValue, pairsCalculations.boughtCost) }} %)</span>
          <span class="value">{{ (pairsCalculations.currentValue - pairsCalculations.boughtCost).toFixed(8) }}<span class="current-currency-values">{{`${getProperties.currencySymbol}`}}{{(pairsCalculations.currentValue - pairsCalculations.boughtCost).toFixed(8) | getValueInCurrentCurrency(getProperties,2)}}</span></span>
        </td>
      </tr>
      <tr>
        <td class="text-success table-nowrap">
          <span class="full-text">Bought Cost</span>
        </td>
        <td class="text-success table-nowrap">{{ pairsCalculations.boughtCost }}<span
          class="current-currency-values">{{pairsCalculations.boughtCost | getValueInCurrentCurrency(getProperties,2) }}<span></span></span></td>
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
        pairsCalculations: 'pairs/pairsCalculations',
        getProperties: 'header/getPropertyLogs',
      })
    }
  }
</script>

<style scoped>

</style>
