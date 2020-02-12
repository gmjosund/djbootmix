<template>
  <div class="container-fluid">
    <div class="row">
      <div class="col-12">
        <b-card class="table-responsive">
          <dataTable class="table"
            :tableId="'possibleBuyLogs'"
            v-bind:columns="columns"
            v-bind:table-data="possibleBuys"
            ref="wrapper"
          ></dataTable>
        </b-card>
      </div>
    </div>
  </div>
</template>

<script>
  import {mapActions, mapGetters } from 'vuex'
  import $ from 'jquery';
  import dataTable from '../../../components/dataTable'
  import DataTableHelper from '../../../mixins/DataTableHelper'
  import DOMHelper from '../../../mixins/DOMHelper'
  import axios from 'axios'
  import state from '../vuex/state'
  import Store from '../../../vuex/index'

  export default {
    components: {
      dataTable 
    },
    mixins: [DOMHelper, DataTableHelper],
    beforeRouteEnter (to, from, next) { 
      Store.dispatch('possibleBuys/getPossibleBuysLog');
      Store.dispatch('header/getMiscLogs');
      Store.dispatch('header/getCurrencies');
      Store.dispatch('header/getPropertyLogs').finally((response) => {
        next();
      });
    },
    data() {
      return {
        columns: [
          {
            title: 'Coin',
            data: 'market',
            tooltip: 'psbSection.coin.colTitle',
            className: 'market',
            render: this.renderCombinedMarketCol,
          },
          {
            title: 'Ask Price',
            data: 'currentPrice',
            tooltip: 'psbSection.currPrice.colTitle',
            className: 'text-right blue-color current-price',
            render: this.currentMarketPrecision,
          },
          {
            title: 'VOL',
            data: 'volume',
            tooltip: 'psbSection.vol.colTitle',
            className: 'text-right volume',
            responsivePriority: 2,
            render: this.renderVolume,
          },
          {
            title: 'Buy',
            data: this.renderBuyStrategy('buyStrategies', true),
            tooltip: 'psbSection.buyStrat.colTitle',
            className: 'buy-strategy'
          },
          {
            title: 'BSV',
            data: 'buyStrategies',
            tooltip: 'psbSection.currVal.colTitle',
            className: 'text-right blue-color current-value',
            render: this.checkAllValAndHandleStratCurVal,
          },
          {
            title: 'BST',
            data: 'buyStrategies',
            tooltip: 'psbSection.buyValue.colTitle',
            className: 'text-right buy-value',
            render: this.checkAllValAndHandleStratEntryVal,
          },
          {
            title: 'BSL',
            data: 'buyStrategies',
            tooltip: 'psbSection.buyLimit.colTitle',
            className: 'text-right',
            responsivePriority: 1,
            render: this.handlePBEntryLimit,
          },
          {
            title: 'Actions',
            tooltip: 'Actions',
            data: this.addActionButtons,
            className: 'text-right'
          }
        ],
        options: {
          order: [[3, 'desc']],
          fixedColumnsLength: 1,
        },
        buttonOptions: [],
        datatableReference: {},
      };
    },
    components: {
      dataTable
    },
    mixins: [DOMHelper, DataTableHelper],
    methods: {
      getDataTableOptions() {
        const isResponsive = true;
        const fixedColumn = !isResponsive && this.options.fixedColumnsLength ?
          this.options.fixedColumnsLength : 0;
        this.options.responsive = isResponsive;
        this.options.scrollX = !isResponsive;
        this.options.fixedColumns = {
          leftColumns: fixedColumn,
        };
        this.options.buttons = this.buttonOptions;
        return this.options;
      },
    },
    computed: {
      ...mapGetters({
        possibleBuys: 'possibleBuys/possibleBuysLog',
        possibleBuysAmount: 'possibleBuys/possibleBuysAmount'
      })
    },
     beforeMount() {
      this.buttonOptions = [{
        extend: 'excel',
        exportOptions: {
          orthogonal: 'export',
        },
        className: 'btn btn-dark',
        title: 'buyLog',
        filename: 'possible-buy-log',
        text: 'Excel'
      }];
    },
    mounted () {
      
    }
  }
</script>

<style scoped>
.dt-buttons {
  float: right !important;
}
</style>
