<template>
  <div class="container-fluid" v-bind:style = styles>
     <grid-layout
            :layout.sync="layout"
            :row-height="20"
            :col-num="this.colNum"
            :is-draggable="true"
            :is-resizable="false"
            :vertical-compact="true"
            :margin="[10, 10]"
            :use-css-transforms="true"
        >
        <div class="row monitoring">
        <grid-item class="grid-cell" v-for="item in layout"
                   v-bind:key="item.i"
                   v-bind:x="item.x"
                   v-bind:y="item.y"
                   v-bind:w="item.w"
                   v-bind:h="item.h"
                   v-bind:i="item.i"
                   v-bind:id="item.i"
                   >
                    <b-card>
                        <i
                        v-bind:data-index="item.i"
                        v-bind:id="item.component"
                        class="mdi mdi-close-circle close-icon" 
                        v-on:click="cardRemoved"
                        >
                        </i>
                          <component :is="item.component"></component>
                    </b-card>
    </grid-item>
    </div>
    </grid-layout>
  </div>
</template>

<script>
  import { DEFAULT_COMPONENTS_LIST } from '../../../helpers/constants'
  import VueGridLayout from 'vue-grid-layout'
  import {mapActions, mapGetters } from 'vuex'
  import pairsLog from './PairsLog'
  import dcaLog from './DCALog'
  import pendingLog from './PendingLog'
  import salesLog from './SalesLog'
  import balance from './Balance'
  import btcTrend from './BTCTrend'
  import profitLastWeek from './ProfitLastWeek'
  import profitToday from './ProfitToday'
  import profitYesterday from './ProfitYesterday'
  import startBalance from './StartBalance'
  import tcv from './TCV'
  import somo from './SOMO'
  import totalMarketCap from './TotalMarketCap'
  import $ from 'jquery';
  import sparkline from 'sparkline';

  export default {
    data() {
      return {
        styles: {},
        layout: [],
        colNum: 12,
        components: [],
        app_version: APP_VERSION,
        lastRealBalance: 0,
        lastTCVBalance: 0,
        lastStartBalance: 0,
        lastBTCUSDTPrice: 0,
        isLastRealBalanceMore: true,
        isLastTCVBalanceMore: true,
        isLastStartBalanceMore: true,
        isLastBTCUSDTPriceMore: true
      }
    },
    computed: {
      ...mapGetters({
        misc: 'monitoring/misc',
        stats: 'monitoring/stats',
        settings: 'monitoring/settings',
        marketTrend: 'monitoring/marketTrend',
        marketCap: 'monitoring/marketCap',
        globalMarketCap: 'monitoring/globalMarketCap',
      })
    },
    methods: {
      getVisibleComponents() {

        // Check if the data is available in local storage if not take the default one.
        return this.components.filter(obj => {
          return obj.visibility === true
        })
      },
      getMarginTop() {
       var style = {
         'margin-top': this.$parent.$children[0].$el.offsetHeight ? this.$parent.$children[0].$el.offsetHeight+'px' : "101px",
         'padding-top': 0 
       }
       this.styles = style;
      },
      updateLayout() {
       this.colNum = this.getColumns(window.innerWidth);
       this.generateLayout();
       this.getMarginTop();
      },
      generateLayout() {
        var x = 0;
        var y = 0;
        var w = 4;
        var h = 8;
        var rowHeight = 3; 
        var layoutArray = [];
        var filteredArray = this.getVisibleComponents();
        for (var i = 0; i <= filteredArray.length - 1; i++) {
          if (x > this.colNum-w) {
            x = 0;
            y = y + rowHeight;
          }
          layoutArray.push({
            x: x,
            y: y,
            w: w,
            h: h,
            i: i,
            component: filteredArray[i].component
          });
          x = x + w;
        }
        this.layout = layoutArray;
      },
      cardRemoved(event) {
        var elementIndex = event.target.attributes['data-index'].value;
        var cardToRemove = null;
        var removedComponent = null;
        this.layout.filter(obj => {
          if (obj.i === Number(elementIndex)){
            cardToRemove = this.layout.indexOf(obj);
           }
        })
        this.layout.splice(cardToRemove, 1);
        this.components.find(element =>{
          if (element.component === event.target.id){
            removedComponent = element;
            element.visibility = false;
          }
        }); 
        this.$root.$emit('addComponentsToDropdown', removedComponent);
        localStorage.setItem('component_list', JSON.stringify(this.components));
      },
      getColumns(screenWidth) {

        // medium screen Resolution
        if (screenWidth > 1024 && screenWidth <= 1800){
          return 16;
        }

        // small screen Resolution
        if (screenWidth <= 1024){
          return 12;
        }
        
        // large screen Resolution
        if (screenWidth > 1800){
          return 20;
        }
      },
      addCardToLayout() {
        var x = 0;
        var y = 0;
        var w = 4;
        var rowHeight = 3;
        this.$root.$on('addCardsTOMonitoring', (component, length) => {
          if (length === DEFAULT_COMPONENTS_LIST.length - 1) {
            x = 0;
            y = 0;
          }
          var lastIndex = this.layout[this.layout.length - 1]
            ? this.layout[this.layout.length - 1].i
            : '0';
          this.layout.push({
            x: x,
            y: y,
            w: w,
            h: 8,
            i: ++lastIndex,
            component: component
          });
          x = x + w;
          if (x > this.colNum - w) {
            x = 0;
            y = y + rowHeight;
          }
          this.components.find(element => {
            if (element.component === component) {
              element.visibility = true;
            }
          });
          localStorage.setItem('component_list', JSON.stringify(this.components));
        });
      }
    },
    created() {
      window.addEventListener('resize', this.updateLayout);
    },
    components: {
      GridLayout: VueGridLayout.GridLayout,
      GridItem: VueGridLayout.GridItem,
      balance,
      btcTrend,
      profitLastWeek,
      profitToday,
      profitYesterday,
      startBalance,
      tcv,
      somo,
      totalMarketCap,
      pairsLog,
      dcaLog,
      salesLog,
      pendingLog
    },
    watch: {
      misc: function misc() {

        // To watch whenever misc change and update the boolean for rendering arrow in row 1 of monitoring section.
        if (this.misc && this.misc.hasOwnProperty('realBalance')) {

          // Checking change in real balance.
          if (this.misc.realBalance !== this.lastRealBalance) {

            // Only changing boolean for rendering arrow only when data is not same.
              if (this.misc.realBalance < this.lastRealBalance) {
              this.isLastRealBalanceMore = true;
            } else {
              this.isLastRealBalanceMore = false;
            }
            this.lastRealBalance = this.misc.realBalance;
          }

          // Checking change in TCV balance.
          let totalCurrentValue = this.misc.pairsBalance
            + this.misc.totalPairsCurrentValue
            + this.misc.totalDCACurrentValue
            + this.misc.totalPendingCurrentValue;
          if (totalCurrentValue !== this.lastTCVBalance) {

            // Only changing boolean for rendering arrow only when data is not same.
            if (totalCurrentValue < this.lastTCVBalance) {
              this.isLastTCVBalanceMore = true;
            } else {
              this.isLastTCVBalanceMore = false;
            }
            this.lastTCVBalance = totalCurrentValue;
          }

          // Checking change in Start balance.
          if (this.misc.startBalance !== this.lastStartBalance) {

            // Only changing boolean for rendering arrow only when data is not same.
            if (this.misc.startBalance < this.lastStartBalance) {
              this.isLastStartBalanceMore = true;
            } else {
              this.isLastStartBalanceMore = false;
            }
            this.lastStartBalance = this.misc.startBalance;
          }

          // Checking change in real balance.
          if (this.misc.BTCUSDTPrice !== this.lastBTCUSDTPrice) {

            // Only changing boolean for rendering arrow only when data is not same.
              if (this.misc.BTCUSDTPrice < this.lastBTCUSDTPrice) {
              this.isLastBTCUSDTPriceMore = true;
            } else {
              this.isLastBTCUSDTPriceMore = false;
            }
            this.lastBTCUSDTPrice = this.misc.BTCUSDTPrice;
          }
        }
      },
    },
    mounted() {
      this.getMarginTop();
      this.colNum = this.getColumns(window.innerWidth);
      this.components = localStorage.getItem('component_list')
        ? JSON.parse(localStorage.getItem('component_list'))
        : DEFAULT_COMPONENTS;
      this.generateLayout();
      this.addCardToLayout();
    },
    beforeDestroy() {
      window.removeEventListener('resize', this.updateLayout);
      this.$root.$off('addCardsTOMonitoring');
    }
  }
</script>

<style scoped>
.card-body label.usd-value {
  margin-bottom: 0px;
}
.main-text.main-counter {
  color: rgba(255, 255, 255, 0.891);
}
.close-icon {
   display: none;
   cursor: pointer;
   position: absolute;
   right: 0;
   top: 0;
}
.card:hover .close-icon  {
   display: inline;
}
</style>
