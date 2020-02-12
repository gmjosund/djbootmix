<template>
  <div class="container-fluid">
    <div class="row">
      <div class="col-12 table-responsive">
        <b-card>
          <dataTable class="table"
            :tableId="'dtDCALog'"
            v-bind:columns="columns"
            v-bind:table-data="dca"
            ref="wrapper"
          ></dataTable>
          <TableInfo :amount="dcaAmount" :data="dca"></TableInfo>
        </b-card>
      </div>
    </div>
  </div>
</template>

<script>
  import {mapActions, mapGetters } from 'vuex'
  import dataTable from '../../../components/dataTable'
  import Store from '../../../vuex/index'
  import DOMHelper from '../../../mixins/DOMHelper'
  import DataTableHelper from '../../../mixins/DataTableHelper'
  import { percentageCalculation } from '../../../helpers'
  import TableInfo from './DCATableInfo'

  export default {
    components: {
      dataTable,
      TableInfo  
    },
    mixins: [DOMHelper, DataTableHelper],
    beforeRouteEnter (to, from, next) { 
      Store.dispatch('dca/getDcaLog');
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
            data: this.renderDateForDCA(),
            tooltip: 'dcaLogSection.date.colTitle',
            responsivePriority: 1,
            className: 'date'
          },
          {
            title: 'Coin',
            data: 'market',
            tooltip: 'dcaLogSection.coin.colTitle',
            className: 'coinpair',
            responsivePriority: 1,
            render: this.renderCombinedMarketCol
          },
          {
            title: '24H',
            data: 'market',
            className: 'hide',
            render: this.renderPercentageChange
          },
          {
            title: 'Bid. Price <br> Avg. Price',
            data: this.handleAvgPriceDcaLog(),
            tooltip: '.colTitle',
            responsivePriority: 2,
            className: 'text-right blue-color avg-price current-price'
          },
          {
            title: 'Cur.Price',
            data: this.handleAvgPriceDcaLog(true),
            visible: false
          },
          {
            title: 'Avg.Price',
            data: this.handleAvgPriceDcaLog(false, true),
            visible: false
          },
          {
            title: 'Buy',
            data: this.renderBuyStrategy('buyStrategies', true),
            responsivePriority: 1,
            tooltip: 'dcaLogSection.buyStrat.colName',
            className: 'buy-strategy'
          },
          {
            title: 'BST',
            data: 'buyStrategies',
            responsivePriority: 1,
            tooltip: 'dcaLogSection.buyStratVal.colTitle',
            render: this.checkAllValAndHandleStratCurVal,
            className: 'text-right current-value strat-current-val '
          },
          {
            title: 'BSV',
            data: 'buyStrategies',
            tooltip: 'dcaLogSection.buyEntryVal.colTitle',
            render: this.checkAllValAndHandleStratEntryVal,
            responsivePriority: 4,
            className: 'text-right strat-entry-val'
          },
          {
            title: 'Sell',
            data: 'sellStrategies',
            tooltip: 'dcaLogSection.sellStrat.colTitle',
            render: this.renderStrategy,
            responsivePriority: 1,
            className: 'sell-strategy'
          },
          {
            title: 'SSV',
            data: 'sellStrategies',
            tooltip: 'dcaLogSection.sellStratVal.colTitle',
            render: this.checkAllValAndHandleStratCurVal,
            responsivePriority: 1,
            className: 'text-right current-value strat-current-val '
          },
          {
            title: 'SST',
            data: 'sellStrategies',
            tooltip: 'dcaLogSection.sellEntryVal.colTitle',
            render: this.checkAllValAndHandleStratEntryVal,
            rresponsivePriority: 3,
            className: 'text-right strat-entry-val'
          },
          {
            title: 'P%',
            data: this.handleOrderBookProfit,
            tooltip: 'dcaLogSection.profit.colTitle',
            responsivePriority: 1,
            className: 'text-center profit'
          },
          {
            title: 'VOL',
            data: 'volume',
            tooltip: 'dcaLogSection.vol.colTitle',
            className: 'text-right volume',
            responsivePriority: 8,
            render: this.renderVolume
          },
          {
            title: 'TAM',
            data: this.handleTotalCost(true),
            tooltip: 'dcaLogSection.totalAmount.colTitle',
            responsivePriority: 7,
            className: 'text-right total-amount'
          },
          {
            title: 'Cur.Val<br>Tot.Cost',
            data: this.getCurrentValAndTotalCost(true),
            tooltip: 'dcaLogSection.currVal.colTitle',
            responsivePriority: 6,
            className: 'text-right blue-color current-value'
          },
          {
            title: 'Cur.Val<br>Tot.Cost',
            data: this.getCurrentValue(true),
            visible: false
          },
          {
            title: '<span class="api-currency"> </span>',
            tooltip: 'dcaLogSection.currentTotalCstValCurrency.colTitle',
            data: this.getCurrentValAndTotalCost(false, true),
            responsivePriority: 5,
            className: 'text-right blue-color current-value currency-value'
          },
          {
            title: '<span class="api-currency"> </span>',
            data: this.getCurrentValue(false, true),
            class: 'hide'
          },
          {
            title: 'TAM',
            data: this.handleTotalCost(true),
            tooltip: 'dcaLogSection.totalCost.colTitle',
            className: 'text-right total-cost hide'
          },
          {
            title: '<span class="api-currency"> </span>',
            data: this.handleTotalCost(false, true),
            class: 'hide'
          },
          {
            title: 'Actions',
            tooltip: 'actions',
            data: this.addActionButtons,
            className: 'text-right'
          }
        ],
        options: {
          order: [[19, 'desc']],
          fixedColumnsLength: 8,
        },
        summaryTableData: {},
        buttonOptions: [],
        datatableReference: {},
      };
    },
    computed: {
      ...mapGetters({
        dca: 'dca/dcaLog',
        dcaAmount: 'dca/dcaAmount',
        currency: 'header/currency',
      })
    },
     beforeMount() {
      this.columns = this.getExportDateColumnsForDCA(this.columns, 1);
      this.buttonOptions = [{
        extend: 'excel',
        exportOptions: {
          columns: this.getExcelColumns(27, [0, 9, 21, 23], [12, 24, 26]),
          orthogonal: 'export',
        },
        className: 'btn btn-dark',
        title: 'dcaLog',
        filename: 'dca-log-',
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
        return this.options;
      },
      renderDateForDCA(parentProperty, onlyLastDate, onlyFirstDate, onlyDate, onlyTime, onlyDiff) {
        const that = this;
        return function cbDateHandler(row, type) {
          if (onlyLastDate) {
            return that.dateHandler('lastBoughtDate', parentProperty, onlyDate, onlyTime, onlyDiff)(row, type);
          } else if (onlyFirstDate) {
            return that.dateHandler('firstBoughtDate', parentProperty, onlyDate, onlyTime, onlyDiff)(row, type);
          }
          let date1 = that.dateHandler('lastBoughtDate', parentProperty, onlyDate, onlyTime, onlyDiff)(row, type);
          let date2 = that.dateHandler('firstBoughtDate', parentProperty, onlyDate, onlyTime, onlyDiff)(row, type);
          let combinedDate = `${date1}<br><div class="secondary-date-text">${date2}</div>`;
          return combinedDate;
        };
      },
      getExportDateColumnsForDCA(columns, index, parentProperty) {
        let exportDateColumns = [
          {
            title: 'firstDate',
            data: this.renderDateForDCA(parentProperty, false, true, true),
            visible: false
          },
          {
            title: 'firstTime',
            data: this.renderDateForDCA(parentProperty, false, true, false, true),
            visible: false
          }, {
            title: 'firstTimeSince',
            data: this.renderDateForDCA(parentProperty, false, true, false, false, true),
            visible: false
          },
          {
            title: 'lastDate',
            data: this.renderDateForDCA(parentProperty, true, false, true),
            visible: false
          },
          {
            title: 'lastTime',
            data: this.renderDateForDCA(parentProperty, true, false, false, true),
            visible: false
          }, {
            title: 'lastTimeSince',
            data: this.renderDateForDCA(parentProperty, true, false, false, false, true),
            visible: false
          }
        ];

        for (let i = 0; i < exportDateColumns.length; i += 1) {
          columns.splice(index + i, 0, exportDateColumns[i]);
        }

        return columns;
      },
    },
    mounted() {
      this.$refs.wrapper.updateColumnHeader(this.currency, [22, 23, 25]);
    }
  }
</script>

<style scoped>

</style>
