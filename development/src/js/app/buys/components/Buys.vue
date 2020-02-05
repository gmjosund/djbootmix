<template>
  <div class="container-fluid">
    <div class="row">
      <div class="col-12">
        <b-card class="table-responsive">
          <dataTable class="table"
            :tableId="'buyLogs'"
            v-bind:columns="columns"
            v-bind:table-data="buys"
            ref="wrapper"
          ></dataTable>
        </b-card>
      </div>
    </div>
  </div>
</template>

<script>
  import {mapActions, mapGetters } from 'vuex'
  import dataTable from '../../../components/dataTable'
  import DataTableHelper from '../../../mixins/DataTableHelper'
  import DOMHelper from '../../../mixins/DOMHelper'
  import Store from '../../../vuex/index'

  export default {
    components: {
      dataTable,  
    },
    mixins: [DOMHelper, DataTableHelper],
    beforeRouteEnter (to, from, next) { 
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
            title: 'Date',
            tooltip: 'buyLogSection.date.colTitle',
            data: this.dateHandler('lastBoughtDate'),
            responsivePriority: 1,
            className: 'date'
          },
          {
            title: 'Coin',
            tooltip: 'buyLogSection.coin.colTitle',
            data: 'market',
            className: 'market',
            render: this.renderMarketCol,
            responsivePriority: 1
          },
          {
            title: 'Order Number',
            tooltip: 'buyLogSection.order.colTitle',
            data: 'orderNumber',
            responsivePriority: 1,
            render: this.renderDataIfPresent,
            className: 'order-number'
          },
          {
            title: 'Buy Type',
            tooltip: 'buyLogSection.buyType.colTitle',
            data: 'type',
            className: 'buy-type',
            responsivePriority: 3,
            render: this.renderDataIfPresent
          },
          {
            title: 'Buy',
            tooltip: 'buyLogSection.buy.colTitle',
            data: 'buyStrategies',
            responsivePriority: 2,
            render: this.renderStrategyForBuyLog,
            className: 'buy-strategy text-right'
          },
          {
            title: 'Bought Price',
            tooltip: 'buyLogSection.boughtPrice.colTitle',
            data: this.handleBoughtPrice(),
            responsivePriority: 1,
            className: 'bought-price text-right blue-color'
          },
          {
            title: 'Bought Cost',
            tooltip: 'buyLogSection.boughtCost.colTitle',
            data: this.handleTotalCost(true),
            responsivePriority: 1,
            className: 'text-right'
          },
          {
            title: 'Bought Amount',
            tooltip: 'buyLogSection.boughtAmount.colTitle',
            data: this.handleBuyLogBoughtAmnt,
            responsivePriority: 1,
            className: 'text-right'
          },
          {
            title: 'VOL',
            tooltip: 'buyLogSection.volume.colTitle',
            data: 'volume',
            className: 'text-right volume',
            responsivePriority: 4,
            render: this.renderVolume
          },
          {
            title: 'BSV',
            tooltip: 'buyLogSection.buyStratValue.colTitle',
            data: 'buyStrategies',
            responsivePriority: 1,
            className: 'text-right blue-color current-value',
            render: this.checkAllValAndHandleStratCurVal
          },
          {
            title: 'BST',
            tooltip: 'buyLogSection.buyStratTrigger.colTitle',
            data: 'buyStrategies',
            responsivePriority: 1,
            className: 'text-right buy-value',
            render: this.checkAllValAndHandleStratEntryVal
          },
          {
            title: 'BSL',
            tooltip: 'buyLogSection.buyStrategyLimit.colTitle',
            data: 'buyStrategies',
            className: 'text-right',
            responsivePriority: 1,
            render: this.handlePBEntryLimit
          }
        ],
        options: {
          order: [[0, 'desc']],
          fixedColumnsLength: 5,
          paging: true,
          searching: true,
          dom: 'lfrtipB'
        },
        buttonOptions: [],
        datatableReference: {},
      };
    },
    computed: {
      ...mapGetters({
        buys: 'buys/buysLog',
        buyAmount: 'buys/buyAmount'
      })
    },
     beforeMount() {
      this.columns = this.getExportDateColumns(this.columns, 1, 'buyDate');
      this.buttonOptions = [{
        extend: 'excel',
        exportOptions: {
          columns: this.getExcelColumns(15, [0]),
          orthogonal: 'export',
        },
        className: 'btn btn-dark',
        title: 'buyLog',
        filename: 'buy-log-',
        text: 'Excel',
      }];
    },
    methods: {
      getDataTableOptions() {
        const isResponsive = this.isResponsive();
        const fixedColumn = !isResponsive && this.options.fixedColumnsLength ?
          this.options.fixedColumnsLength : 0;
        this.options.responsive = isResponsive;
        this.options.scrollX = !isResponsive;
        this.options.fixedColumns = {
          leftColumns: fixedColumn,
        };
        this.options.buttons = this.buttonOptions;
        this.options.lengthMenu = [[10, 25, 50, 100, -1], [10, 25, 50, 100, 'all']];
        return this.options;
      },
    }
  }
</script>

<style>
.dataTables_length {
  float: right;
}
div.dataTables_wrapper div.dataTables_filter {
  text-align: right;
  display: inline;
  float: right;
}
</style>
