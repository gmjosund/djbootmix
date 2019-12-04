<template>
   <b-card-text>
      <div class="row">
         <div class="col-md-2">
            <div class="bg-icon">
               <i class="market-icon fa fa-btc icon-primary"></i>
            </div>
         </div>
         <div class="col-md-10">
            <div class="text-right">
               <h3 class=" m-t-10 main-text main-counter">
                  <b class="counter">
                  <i class="mdi tcv-change"
                     v-bind:class="{'mdi-arrow-up text-success': !this.$parent.isLastTCVBalanceMore, 'mdi-arrow-down text-danger': this.$parent.isLastTCVBalanceMore}"
                     ></i>
                  </b>
                  <b class="counter">{{ calculateTCV(misc) }}</b>
                  <span class="market m-l-5">{{ misc.market ? misc.market : '--'}}</span>
               </h3>
               <p class="mb-0 main-text">Total Current Value</p>
               <span class="market-price-calculations">
               <label class="usd-value js-usd-value mb-0">
               <span class="full-text">{{ settings.currency ? settings.currency : '--' }} Estimated Value</span>
               </label>
               <span class="mb-0 main-text">3,372.29</span>
               </span>
               <p class="main-text mb-0 js-dust-values">
                  <label class="mb-0">TCV with Dust</label>
                  <span>{{ calculateTCV(misc, true) }}</span>
                  <span class="market">{{ misc.market ? misc.market : '--'}}</span>
               </p>
            </div>
         </div>
      </div>
   </b-card-text>
</template>

<script>
  import {mapActions, mapGetters} from 'vuex'
  export default {
    computed: {
      ...mapGetters({
        misc: 'monitoring/misc',
        settings: 'monitoring/settings',
      })
    },
    methods: {
      calculateTCV(data, dust = false) {

        // Calculating total current value for rendering in monitoring dashboard.
        if(dust) {
          return (data.pairsBalance + data.totalPairsCurrentValue  + data.totalDCACurrentValue + data.totalPendingCurrentValue + data.totalDustCurrentValue).toFixed(8)
        }
        return (data.pairsBalance + data.totalPairsCurrentValue  + data.totalDCACurrentValue + data.totalPendingCurrentValue).toFixed(8)
      },
    }
  }
</script>
