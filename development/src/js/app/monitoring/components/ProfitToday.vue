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
                  <p class="mb-0 text-profittd main-text">Profit Today</p>
                  <span class="open-brackets text-profittd" >{{ stats.totalSalesToday ? stats.totalSalesToday : '0' }}</span>
                  <span class="text-profittd close-brackets" >Trades</span>
               </div>
               <h3 class=" m-t-10 text-profittd main-text profit-text">
                  <b class="counter">{{ stats.totalProfitToday ? stats.totalProfitToday.toFixed(8) : '0.00000000'}}</b>
                  <span class="market m-l-5">{{ misc.market ? misc.market : '--' }}</span>
               </h3>
               <span class="market-price-calculations text-profittd">
               <label class="usd-value js-usd-value mb-0 monitor-smaller-fonts">
               <span class="full-text">{{ settings.currency ? settings.currency : '--'}} Estimated Value</span>
               </label>
               <span class="mb-0  main-text">-0.44</span>
               </span>
               <div class="market-volume text-profittd">
                  <label class="usd-value mb-0 monitor-smaller-fonts">
                  <span class="api-market">{{ misc.market ? misc.market : '--' }}</span>
                  <span>Volume</span>
                  </label>
                  <span class="mb-0 main-text">{{ stats.totalVolumeToday ? stats.totalVolumeToday.toFixed(8) : '0.00000000'}}</span>
               </div>
               <div class="market-price-calculations text-profittd js-estimated-gain">
                  <label class="usd-value mb-0 monitor-smaller-fonts">
                  <span class="full-text" >Estimated Gain</span>
                  </label>
                  <span class="mb-0  main-text">{{ stats.totalProfitPercToday ? stats.totalProfitPercToday.toFixed(2) : '0.00'}}</span>
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
