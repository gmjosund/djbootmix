<template>
    <b-card-text>
      <div class="row">
        <div class="col-md-4">
          <div class="bg-icon">
            <i class="fa fa-balance-scale"></i>
          </div>
        </div>
        <div class="col-md-8">
          <div class="text-right">
            <h5 class="mt-0 m-b-5 font-16 m-t-10 text-primary totals-text">
              <span class="full-text">Bought Cost</span>
              <span class="text-primary m-l-5">{{ salesCalculations.boughtCost }}</span>
            </h5>
            <h5 class="mt-0 m-b-5 font-16 text-dark totals-text">
                <span class="text-dark m-l-5">
                  <span class="percentage" 
                    :class="percentageCalculation(salesCalculations.soldValue, salesCalculations.boughtCost) >= '0.00' ? 'text-success' : 'text-danger'"
                  > 
                    ({{ percentageCalculation(salesCalculations.soldValue, salesCalculations.boughtCost) }} %)
                  </span>
                  <span class="full-text">Difference</span>
                  <span class="value m-l-5">{{ (salesCalculations.soldValue - salesCalculations.boughtCost).toFixed(8) }}</span>
                </span>
            </h5>
            <h5 class="mt-0 m-b-5 font-16 text-success totals-text">
              <span class="full-text">Sold Value</span>
              <span class="text-success m-l-5">{{ salesCalculations.soldValue }}</span>
            </h5>
            <small class="text-sales mb-0 font-14 totals-title">
              <b>SALES LOG</b>
            </small>
          </div>
        </div>
      </div>
    </b-card-text>
</template>

<script>
  import {mapActions, mapGetters} from 'vuex'
  import { percentageCalculation } from '../../../helpers'

  export default {
    computed: {
      ...mapGetters({
        salesCalculations: 'sales/salesCalculations',
      })
    },
    methods: {
      percentageCalculation
    }
  }
</script>

<style scoped>

</style>
