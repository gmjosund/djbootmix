<template>
  <div class="container-fluid">
    <div class="row">
      <div class="col-12">
        <b-card class="table-responsive">
          <dataTable class="table"
            :tableId="'salesLogs'"
            v-bind:columns="columns"
            v-bind:table-data="sales"
            ref="wrapper"
          ></dataTable>
          <TableInfo :amount="salesAmount"
           :data="sales"></TableInfo>
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
  import axios from 'axios'
  import state from '../vuex/state'
  import TableInfo from './SalesTableInfo'
  import $ from 'jquery';
  import Store from '../../../vuex/index'
  

  export default {
    components: {
      dataTable,
      TableInfo    
    },
    mixins: [DOMHelper, DataTableHelper],
    beforeRouteEnter (to, from, next) { 
      Promise.all([
        Store.dispatch('sales/getSalesLog'),
        Store.dispatch('header/getMiscLogs'),
        Store.dispatch('header/getCurrencies'),
        Store.dispatch('header/getPropertyLogs')
      ]).finally(() => {
        next();
      })
    },
    data() {
      return {
        columns: [
          {
            title: 'Date',
            data: this.dateHandler('soldDate'),
            responsivePriority: 1,
            className: 'date',
          },
          {
            title: 'Coin',
            data: 'market',
            className: 'market',
            render: this.renderMarketCol,
            responsivePriority: 1,
          },
          {
            title: 'Sell',
            data: 'sellStrategies',
            responsivePriority: 1,
            render: this.renderSellStrategy,
            className: 'sell-strategy',
          },
          {
            title: 'P%',
            data: 'profit',
            responsivePriority: 1,
            className: 'text-center profit',
            render: this.handleProfit,
          },
          {
            title: 'Profit BTC',
            data: this.getProfitBTCForSalesLog,
            className: 'text-right profit-btc',
            responsivePriority: 1,
          },
          {
            title: '<span class="api-currency"> </span>',
            data: this.getCurrentTrendprofit,
            responsivePriority: 1,
            className: 'text-right profit-btc currency-value',
          },
          {
            title: 'SAM',
            data: 'soldAmount',
            responsivePriority: 5,
            className: 'text-right sold-amount',
          },
          {
            title: 'Bought Price <br> Sold Price',
            data: this.handleAvgPriceBoughtTimes(),
            responsivePriority: 4,
            className: 'text-right bought-price blue-color',
          },
          {
            title: 'Bought Price',
            data: this.handleAvgPriceBoughtTimes(true),
            visible: false,
          },
          {
            title: 'Sold Price',
            data: this.handleAvgPriceBoughtTimes(false, true),
            visible: false,
          },
          {
            title: 'Bought Cost <br> Sold Value',
            data: this.handleBoughtSoldCostForSalesLog,
            responsivePriority: 3,
            className: 'text-right sold-value',
          },
          {
            title: 'Bought Cost',
            data: this.handleTotalCostForSalesLog(true),
            className: 'hide',
          },
          {
            title: '<span class="api-currency"> </span>',
            data: this.handleTotalCostForSalesLog(false, true),
            class: 'hide',
          },
          {
            title: 'Sold Value',
            data: this.getCurrentValueForSalesLog(true),
            visible: false,
          },
          {
            title: '<span class="api-currency"> </span>',
            data: this.handleBoughtSoldCostCurrency,
            responsivePriority: 2,
            className: 'sold-value text-right currency-value',
          },
          {
            title: '<span class="api-currency"> </span>',
            data: this.getCurrentValueForSalesLog(false, true),
            class: 'hide',
          },
        ],
        options: {
          order: [[0, 'desc']],
          fixedColumnsLength: 5,
          paging: true,
          searching: true,
          dom: 'lfrtipB',
        },
        buttonOptions: []
      };
    },
    computed: {
      ...mapGetters({
        sales: 'sales/salesLog',
        salesAmount: 'sales/salesAmount',
        currency: 'header/currency',
        market: 'header/market'
      })
    },
    beforeMount() {
      this.columns = this.getExportDateColumns(this.columns, 1, 'soldDate');
      this.buttonOptions = [{
        extend: 'excel',
        exportOptions: {
          columns: this.getExcelColumns(18, [0, 10, 13, 17], [14, 18]),
          orthogonal: 'export',
        },
        className: 'btn btn-dark',
        title: 'salesLog',
        filename: 'sales-log-',
        text: 'Excel',
      }];
    },
    watch: {
      sales: function sales() {
        this.$refs.wrapper.updateData(this.sales);
      },
      currency: function currency() {
        this.$refs.wrapper.updateColumnHeader(this.currency, [8, 17, 15, 18]);
      }
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
      }
    },
    mounted() {
      this.$refs.wrapper.updateColumnHeader(this.currency, [8, 17, 15, 18]);
    }
  }
</script>

<style scoped>

</style>
