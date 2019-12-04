<template>
   <b-card-text>
      <div class="row">
         <div class="col-md-4">
            <div class="bg-icon">
               <i class="fa fa-cog"></i>
            </div>
         </div>
         <div class="col-md-8">
            <div class="text-right">
               <p class="mb-0 text-muted font-13 settings-text m-t-10">POT:
                  <span class="m-l-5 text-strange text-strange">{{ misc.pendingOrderTime | checkIf }}</span>
               </p>
               <p class="m-b-5 m-t-5 text-muted font-13 settings-text">
                  <!-- Monitoring password set -->
                  <span>PW:</span>
                  <span class="m-l-5 text-strange badge" 
                     :class="settings.passwordSet ? 'badge-success' : 'badge-danger'"
                  >
                     {{ settings.passwordSet ? 'On' : 'Off'}}
                  </span>
                  <!-- Monitoring config enabled -->
                  <span class="m-l-5">CON:</span>
                  <span class="m-l-5 text-strange badge" 
                     :class="settings.enableConfig ? 'badge-success' : 'badge-danger'"
                  >
                     {{ settings.enableConfig ? 'On' : 'Off'}}
                  </span>
               </p>
               <p class="m-b-5 m-t-10 text-muted font-13 settings-text">
                  <span>
                  <span>SOM:</span>
                  <span class="m-l-5 text-strange badge" 
                     :class="!settings.sellOnlyMode ? 'badge-success' : 'badge-danger'"
                  >
                     {{ settings.sellOnlyMode ? 'true' : 'false'}}
                  </span>
                  </span>
                  <span class="m-l-5 red-tooltip">SOMO:</span>
                  <span class="m-l-5 text-strange badge" 
                     :class="!settings.sellOnlyModeOverride ? 'badge-success' : 'badge-danger'"
                  >
                     {{ settings.sellOnlyModeOverride ? 'active' : 'inactive'}}
                  </span>
               </p>
               <p class="mb-0 text-muted font-13 settings-text">
                  <span class="tdbitcoin">P</span><span class="text-primary">T</span>
                  <span>Ver:</span>
                  <span class="m-l-5 text-strange">{{ misc.version }}</span>
               </p>
               <p class="mb-0 text-muted font-13 settings-text">
                  <span>GUI Ver: </span>
                  <span class="m-l-5 text-strange">{{ app_version }}</span>
               </p>
               <p class="mb-0 text-muted font-13 settings-text">Market:
                  <span class="m-l-5 text-strange js-exchange">{{ misc.exchange }}</span>
                  <span class="m-l-5 text-strange">{{ misc.market }}</span>
               </p>
            </div>
         </div>
      </div>
   </b-card-text>
</template>

<script>
  import {mapActions, mapGetters} from 'vuex'

  export default {
    data() {
      return {
        app_version: APP_VERSION,
      }
    },
    computed: {
      ...mapGetters({
        misc: 'monitoring/misc',
        settings: 'monitoring/settings',
      })
    },
    filters: {
      checkIf: function (data) {
        if (data) {
          return data;
        }
        return '--';
      }
    }
  }
</script>

<style scoped>

</style>
