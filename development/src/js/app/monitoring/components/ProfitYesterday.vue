<template>
   <b-card-text>
      <div class="row">
         <div class="col-md-4">
            <div class="bg-icon">
               <i class="fa fa-line-chart"></i>
            </div>
         </div>
         <div class="col-md-8">
            <div class="text-right">
               <div class="profit-heading main-text">
                  <p class="mb-0 text-profityd main-text">Profit Yesterday</p>
                  <span class="open-brackets text-profityd" >{{ stats.totalSalesYesterday ? stats.totalSalesYesterday : '0'}}</span>
                  <span class="text-profityd close-brackets">Trades</span>
               </div>
               <h3 class=" m-t-10 text-profityd main-text profit-text">
                  <b class="counter">{{ stats.totalProfitYesterday ? stats.totalProfitYesterday.toFixed(8) : '0.00000000'}}</b>
                  <span class="market m-l-5">{{ misc.market ? misc.market : '--' }}</span>
               </h3>
               <span class="market-price-calculations text-profityd">
               <label class="usd-value js-usd-value mb-0 monitor-smaller-fonts">
               <span class="full-text">{{ settings.currency ? settings.currency : '--'}} Estimated Value</span>
               </label>
               <span class="mb-0 main-text">0.00</span>
               </span>
               <div class="market-volume text-profityd">
                  <label class="usd-value mb-0 monitor-smaller-fonts">
                  <span class="api-market">{{ misc.market ? misc.market : '--' }}</span>
                  <span>Volume</span>
                  </label>
                  <span class="mb-0 main-text">{{ stats.totalVolumeYesterday ? stats.totalVolumeYesterday.toFixed(8) : '0.00000000' }}</span>
               </div>
               <div class="market-price-calculations text-profityd js-estimated-gain">
                  <label class="usd-value mb-0 monitor-smaller-fonts">
                  <span class="full-text">Estimated Gain</span>
                  </label>
                  <span class="mb-0 main-text">{{ stats.totalProfitPercYesterday ? stats.totalProfitPercYesterday.toFixed(2) : '0.00' }}</span>
                  <span> %</span>
               </div>
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
        stats: 'monitoring/stats',
      })
    }
  }
</script>
