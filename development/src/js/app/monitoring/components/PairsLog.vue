<template>
  <b-card>
    <b-card-text>
      <div class="row">
        <div class="col-md-4">
          <div class="bg-icon text-dark">
            <i class="fa fa-houzz"></i>
          </div>
        </div>
        <div class="col-md-8">
          <div class="text-right">
            <h5 class="mt-0 m-b-5 font-16 totals-text m-t-10">
              <span class="full-text">Current Value</span>
              <span class="text-dark m-l-5">{{ pairsCalculations.currentValue | normalizeValueWithComma(8) }}</span>
            </h5>
            <h5 class="mt-0 m-b-5 font-16 totals-text">
                <span class="m-l-5">
                  <span class="percentage" 
                    :class="percentageCalculation(pairsCalculations.currentValue, pairsCalculations.boughtCost) >= '0.00' ? 'badge-light-success' : 'badge-light-danger'"
                  > 
                    {{ percentageCalculation(pairsCalculations.currentValue, pairsCalculations.boughtCost) }}%
                  </span>
                  <span class="full-text">Difference</span>
                  <span class="text-dark value m-l-5">{{ (pairsCalculations.currentValue - pairsCalculations.boughtCost).toFixed(8) }}</span>
                </span>
            </h5>
            <h5 class="mt-0 m-b-5 font-16 totals-text">
              <span class="full-text">Bought Cost</span>
              <span class="text-dark m-l-5">{{ pairsCalculations.boughtCost | normalizeValueWithComma(8) }}</span>
            </h5>
            <small class="text-pairs mb-0 font-14 totals-title">
              <b>Pairs Log</b>
            </small>
            <div class="clearfix"></div>
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
