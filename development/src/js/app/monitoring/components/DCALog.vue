<template>
  <b-card>
    <b-card-text>
      <div class="row">
        <div class="col-md-4">
          <div class="bg-icon text-dark">
            <i class="fa fa-hand-peace-o"></i>
          </div>
        </div>
        <div class="col-md-8">
          <div class="text-right">
            <h5 class="mt-0 m-b-5 font-16 m-t-10 totals-text">
              <span class="full-text" >Current Value</span>
              <span class="text-dark m-l-5">{{ dcaCalculations.currentValue | normalizeValueWithComma(8) }}</span>
            </h5>
            <h5 class="mt-0 m-b-5 font-16 totals-text">
                <span class="m-l-5" >
                  <span class="percentage" 
                    :class="percentageCalculation(dcaCalculations.currentValue, dcaCalculations.totalCost) >= '0.00' ? 'badge-light-success' : 'badge-light-danger'"
                  >
                    {{ percentageCalculation(dcaCalculations.currentValue, dcaCalculations.totalCost) }}%
                  </span>
                  <span class="full-text">Difference</span>
                  <span class="text-dark value m-l-5">{{ (dcaCalculations.currentValue - dcaCalculations.totalCost).toFixed(8) }}</span>
                </span>
            </h5>
            <h5 class="mt-0 m-b-5 font-16 totals-text">
              <span class="full-text">Total Cost</span>
              <span class="text-dark m-l-5">{{ dcaCalculations.totalCost | normalizeValueWithComma(8) }}</span>
            </h5>
            <small class="text-dca mb-0 font-14 totals-title">
              <b>DCA Log</b>
            </small>
          </div>
        </div>
      </div>
    </b-card-text>

  </b-card>
</template>

<script>
  import {mapActions, mapGetters} from 'vuex'
  import { percentageCalculation } from '../../../helpers'

  export default {
    computed: {
      ...mapGetters({
        dcaCalculations: 'dca/dcaCalculations',
      })
    },
    methods: {
      percentageCalculation
    }
  }
</script>

<style scoped>

</style>
