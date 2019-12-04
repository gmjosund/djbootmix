<template>
   <b-card-text>
      <div class="row">
         <div class="col-md-2">
            <div class="bg-icon">
               <i class="market-icon fa fa-btc icon-success"></i>
            </div>
         </div>
         <div class="col-md-10">
            <div class="text-right">
               <h3 class=" m-t-10 main-text main-counter">
                  <b class="counter">
                  <i class="mdi start-balance-change"
                     v-bind:class="{'mdi-arrow-up text-success': !this.$parent.isLastStartBalanceMore, 'mdi-arrow-down text-danger': this.$parent.isLastStartBalanceMore}"
                     ></i>
                  </b>
                  <b class="counter">{{ misc.startBalance ? misc.startBalance.toFixed(8) : '0.00000000'}}</b>
                  <span class="market m-l-5">{{ misc.market ? misc.market : 'BTC' }}</span>
               </h3>
               <p class="mb-0 main-text">Start Balance</p>
               <span class="market-price-calculations">
               <label class="usd-value js-usd-value mb-0">
               <span class="full-text">{{ settings.currency ? settings.currency : '--' }} Estimated Value</span>
               </label>
               <span class="mb-0 main-text">3,389.95</span>
               </span>
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
    }
  }
</script>

<style scoped>

</style>
