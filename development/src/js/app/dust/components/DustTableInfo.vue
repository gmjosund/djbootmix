<template>
  <div>
    <div role="status" aria-live="polite">Total records: {{ amount }}</div>
    <table class="col-md-3 col-sm-5 summary-table">
      <tbody>
      <tr>
        <td class="text-primary table-nowrap">
          <span class="full-text">Current Value</span>
        </td>
        <td class="text-primary table-nowrap">{{ currentValue }}<span
          class="current-currency-values"> ($0.00)<span></span></span></td>
      </tr>
      <tr>
        <td class="text-dark table-nowrap">
          <span class="full-text">Difference</span>
        </td>
        <td id="pairsLogDifference" class="text-dark table-nowrap">
          <span class="percentage" :class="percentageCalc(currentValue, boughtCost) >= '0.00' ? 'text-success' : 'text-danger'"> ({{ currentValue == 0 && boughtCost == 0 ? '0.00' : percentageCalc(currentValue, boughtCost) }} %)</span>
          <span class="value">{{(currentValue - boughtCost).toFixed(8) }}<span class="current-currency-values"> ($0.00)</span></span>
        </td>
      </tr>
      <tr>
        <td class="text-success table-nowrap">
          <span class="full-text">Bought Cost</span>
        </td>
        <td class="text-success table-nowrap">{{ boughtCost }}<span
          class="current-currency-values"> ($0.00)<span></span></span></td>
      </tr>
      </tbody>
    </table>
  </div>
</template>

<script>
  export default {
    props: [
      'amount',
      'data',
    ],
    methods: {
      percentageCalc(current, bought) {
        return ((( current - bought) / bought) * 100).toFixed(2)
      }
    },
    computed: {
      currentValue() {
        let currentValue = 0
        this.data.forEach(element => {
          currentValue = currentValue + element.currentValue
        })

        return currentValue.toFixed(8)
      },
      boughtCost() {
        let boughtCost = 0
        this.data.forEach(element => {
          boughtCost = boughtCost + element.totalCost
        })

        return boughtCost.toFixed(8)
      }
    }
  }
</script>

<style scoped>

</style>
