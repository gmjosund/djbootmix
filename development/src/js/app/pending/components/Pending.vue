<template>
  <div class="container-fluid">
    <div class="row">
      <div class="col-12">
        <b-card class="table-responsive">
          <dataTable class="table"
            :tableId="'pendingLogs'"
            v-bind:columns="columns"
            v-bind:table-data="pending"
            ref="wrapper"
          ></dataTable>
           <TableInfo :amount="pendingAmount"
            :data="pending"></TableInfo>
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
  import TableInfo from './PendingTableInfo'
  

  export default {
    components: {
      dataTable,
      TableInfo  
    },
    mixins: [DOMHelper, DataTableHelper],
    beforeRouteEnter (to, from, next) { 
      Promise.all([
        Store.dispatch('pending/getPendingLog'),
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
            title: 'Coin',
            className: 'market',
            data: 'market',
            responsivePriority: 1,
            render: this.renderCombinedMarketCol,
          },
          {
            title: '24H % Change',
            data: this.renderPercentageChange,
            className: 'hide'
          },
          {
            title: 'Sell',
            data: 'sellStrategies',
            render: this.renderStrategy,
            responsivePriority: 1,
            className: 'sell-strategy',
          },
          {
            title: 'Cur.Value <br> Average Price <br> Target Price',
            data: this.handleAvgValAndCurrentPrice(false, false, true),
            responsivePriority: 1,
            className: 'text-right target-price',
          },
          {
            title: 'Cur.Price',
            data: this.handleAvgValAndCurrentPrice(true),
            className: 'hide',
            visible: false,
          },
          {
            title: 'Target Price',
            data: this.handleAvgValAndCurrentPrice(false, true),
            className: 'hide',
            visible: false,
          },
          {
            title: 'P%',
            data: 'profit',
            className: 'text-center profit',
            responsivePriority: 1,
            render: this.handleProfit,
          },
          {
            title: 'CP%',
            data: 'combinedProfit',
            className: 'text-center profit',
            render: this.handleMoney,
            responsivePriority: 1,
          },
          {
            title: 'TAM',
            data: this.handleTotalAmount,
            responsivePriority: 3,
            className: 'text-right total-amount',
          },
          {
            title: 'Cur.Value <br> Average Price <br> Target Price',
            data: this.getCurrentValAndTotalCost(true),
            responsivePriority: 2,
            className: 'text-right blue-color current-value',
          },
          {
            title: 'Cur.Value',
            data: this.getCurrentValue(true),
            className: 'hide',
            visible: false,
          },
          {
            title: '<span class="api-currency"> </span>',
            data: this.getCurrentValue(false, true),
            className: 'hide',
          },
          {
            title: 'Tar.val',
            data: this.handleTotalCost(true),
            responsivePriority: 1,
            className: 'text-right hide',
          },
          {
            title: '<span class="api-currency"> </span>',
            data: this.handleTotalCost(false, true),
            className: 'hide',
          },
          {
            title: '<span class="api-currency"> </span>',
            data: this.getCurrentValAndTotalCost(false, true),
            responsivePriority: 1,
            className: 'text-right blue-color current-value currency-value',
          },
          {
            title: 'Actions',
            data: this.addActionButtons,
            className: 'text-right'
          }
        ],
        options: {
          order: [[5, 'desc']],
          fixedColumnsLength: 1,
        },
        buttonOptions: []
      };
    },
    computed: {
      ...mapGetters({
        pending: 'pending/pendingLog',
        pendingAmount: 'pending/pendingAmount',
        currency: 'header/currency',
      })
    },
    beforeMount() {
      this.buttonOptions = [{
        extend: 'excel',
        exportOptions: {
          columns: this.getExcelColumns(15, [3, 9, 15], [13, 11]),
          orthogonal: 'export',
        },
        className: 'btn btn-dark',
        title: 'pendingLog',
        filename: 'pending-log-',
        text: 'Excel',
      }];
    },
    watch: {
      pending: function pending() {
        this.$refs.wrapper.updateData(this.pending);
      },
      currency: function currency() {
        this.$refs.wrapper.updateColumnHeader(this.currency, [14, 11, 13]);
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
        return this.options;
      },
    },
    mounted() {
      this.$refs.wrapper.updateColumnHeader(this.currency, [14, 11, 13]);
    }
  }
</script>

<style scoped>

</style>
