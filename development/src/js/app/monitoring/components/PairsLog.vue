<template>
    <b-card-text>
      <div class="row">
        <div class="col-md-4">
          <div class="bg-icon">
            <i class="fa fa-houzz"></i>
          </div>
        </div>
        <div class="col-md-8">
          <div class="text-right">
            <h5 class="mt-0 m-b-5 font-16 text-primary totals-text m-t-10">
              <span class="full-text">Current Value</span>
              <span class="text-primary m-l-5">{{ pairsCalculations.currentValue }}</span>
            </h5>
            <h5 class="mt-0 m-b-5 font-16 text-dark totals-text">
                <span class="text-dark m-l-5">
                  <span class="percentage" 
                    :class="percentageCalculation(pairsCalculations.currentValue, pairsCalculations.boughtCost) >= '0.00' ? 'text-success' : 'text-danger'"
                  > ({{ percentageCalculation(pairsCalculations.currentValue, pairsCalculations.boughtCost) }} %)
                  </span>
                  <span class="full-text">Difference</span>
                  <span class="value m-l-5">{{ (pairsCalculations.currentValue - pairsCalculations.boughtCost).toFixed(8) }}</span>
                </span>
            </h5>
            <h5 class="mt-0 m-b-5 font-16 text-success totals-text">
              <span class="full-text">Bought Cost</span>
              <span class="text-success m-l-5">{{ pairsCalculations.boughtCost }}</span>
            </h5>
            <small class="text-pairs mb-0 font-14 totals-title">
              <b>PAIRS LOG</b>
            </small>
            <div class="clearfix"></div>
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
        pairsCalculations: 'pairs/pairsCalculations',
      })
    },
    methods: {
      percentageCalculation
    }
  }
</script>

<style scoped>

</style>
