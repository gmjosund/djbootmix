<template>
  <div class="container-fluid">
    <div class="row">
      <div class="col-12 table-responsive">
        <b-card>
          <dataTable class="table"
            :tableId="'dtPairsLog'"
            v-bind:columns="columns"
            v-bind:table-data="pairs"
            ref="wrapper"
          ></dataTable>
           <summary-table :firstValueFullText="'currVal'"
              :firstValueShortText="'cv'"
              :firstValue="pairsCalculations.currentValue"
              :differenceFullText="'difference'"
              :differenceShortText="'diff'"
              :differencePerc="percentageCalculation(pairsCalculations.currentValue, pairsCalculations.boughtCost)"
              :differenceValue="(pairsCalculations.currentValue - pairsCalculations.boughtCost).toFixed(8)"
              :secondValueFullText="'boughtCost'"
              :secondValueShortText="'bc'"
              :secondValue="pairsCalculations.boughtCost"
            ></summary-table>
        </b-card>
      </div>
    </div>
  </div>
</template>

<script>
  import {mapActions, mapGetters } from 'vuex'
  import dataTable from '../../../components/dataTable'
  import SummaryTable from '../../../components/SummaryTable'
  import DOMHelper from '../../../mixins/DOMHelper'
  import DataTableHelper from '../../../mixins/DataTableHelper'
  import { percentageCalculation } from '../../../helpers'
  import axios from 'axios'
  import state from '../vuex/state'

  export default {
    components: {
      dataTable,
      SummaryTable  
    },
    mixins: [DOMHelper, DataTableHelper],
    beforeRouteEnter (to, from, next) {
      axios.get(THE_BASE_URL + '/api/v2/data/misc').then((response) => {
        state.serverData = response.data;
      }).catch((error) => {
        }).finally((response) => {
       next();
      })
    },
    data() {
      return {
        columns: [{
          title: 'date',
          data: this.dateHandler('lastBoughtDate', 'averageCalculator'),
          tooltip: 'date.colTitle',
          className: 'date ',
          responsivePriority: 1,
        }, {
          title: 'coin',
          data: 'market',
          tooltip: 'coin.colTitle',
          className: 'market',
          render: this.renderCombinedMarketCol,
          responsivePriority: 1,
        }, {
          title: 'sellStrat',
          data: this.renderSellStrategyWithButton('sellStrategies', true),
          tooltip: 'sellStrat.colTitle',
          className: 'sell-strategy',
          responsivePriority: 1,
        }, {
          title: 'stratVal',
          data: 'sellStrategies',
          tooltip: 'dataTableSection.stratVal.colTitle',
          render: this.handleStratCurrentVal,
          className: 'text-right current-value ',
          responsivePriority: 1,
        }, {
          title: 'stratTrigger',
          data: 'sellStrategies',
          tooltip: 'dataTableSection.stratTrigger.colTitle',
          render: this.handleStratEntryVal,
          responsivePriority: 1,
          className: 'text-right trigger',
        }, {
          title: 'P%',
          data: this.handleOrderBookProfit,
          tooltip: 'pairsLogSection.profit.colTitle',
          responsivePriority: 1,
          className: 'text-center profit',
        }, {
          title: 'Bid Price <br> Bought Price',
          data: this.handleAvgValAndCurrentPrice(),
          tooltip: 'pairsLogSection.currPriceBoughtPrice.colTitle',
          className: 'text-right blue-color current-price',
          responsivePriority: 1,
        }, {
          title: 'currPrice',
          data: this.handleAvgValAndCurrentPrice(true, false),
          responsivePriority: 1,
          className: 'hide',
        }, {
          title: 'boughtPrice',
          data: this.handleAvgValAndCurrentPrice(false, true),
          responsivePriority: 1,
          className: 'hide',
        }, {
          title: 'Current Value <br> Bought Cost',
          data: this.getCurrentValAndTotalCost(true),
          tooltip: 'pairsLogSection.currValBoughtCost.colTitle',
          className: 'text-right blue-color current-value',
          responsivePriority: 1,
        }, {
          title: 'Current Value',
          data: this.getCurrentValue(true),
          responsivePriority: 1,
          className: 'hide',
        }, {
          title: '<span class="api-currency"> </span>',
          tooltip: 'dataTableSection.currValCurrency.colTitle',
          data: this.getCurrentValue(false, true),
          responsivePriority: 1,
          className: 'text-right blue-color current-value  hide',
        }, {
          title: 'boughtCost.colName',
          data: this.handleTotalCost(true),
          responsivePriority: 1,
          className: 'hide',
        }, {
          title: '<span class="api-currency"> </span>',
          tooltip: 'boughtCostCurrency',
          data: this.handleTotalCost(false, true),
          responsivePriority: 1,
          className: 'text-right blue-color bought-cost  hide',
        }, {
          title: '<span class="api-currency"></span>',
          tooltip: 'boughtCostCurrency.colTitle',
          data: this.getCurrentValAndTotalCost(false, true),
          className: 'text-right bought-cost currency-value',
          responsivePriority: 3,
        }, {
          title: 'vol.colName',
          data: 'volume',
          tooltip: 'vol.colTitle',
          className: 'text-right volume',
          responsivePriority: 6,
          render: this.renderVolume,
        }, {
          title: 'totalAmount.colName',
          data: this.handleTotalAmount,
          tooltip: 'totalAmount',
          responsivePriority: 5,
          className: 'text-right total-amount',
        }],
        options: {
          order: [[8, 'desc']],
          fixedColumnsLength: 5,
        },
        summaryTableData: {},
        buttonOptions: [],
        datatableReference: {},
      };
    },
    computed: {
      ...mapGetters({
        pairs: 'pairs/pairsLog',
        pairsAmount: 'pairs/pairsAmount',
        settings: 'monitoring/settings',
        misc: 'monitoring/misc',
        pairsCalculations: 'pairs/pairsCalculations',
      })
    },
     beforeMount() {
      this.columns = this.getExportDateColumns(this.columns, 1, 'lastBoughtDate', 'averageCalculator');
      this.buttonOptions = [{
        extend: 'excel',
        exportOptions: {
          columns: this.getExcelColumns(19, [0, 9, 12, 17], [14, 16]),
          orthogonal: 'export',
        },
        className: 'btn btn-dark',
        title: 'pairsLog',
        filename: 'pairs-log',
        text: 'Excel',
      }];
    },
    methods: {
      percentageCalculation,
       getDataTableOptions() {
        // To return options after rendering them.
        const isResponsive = true;
        const fixedColumn = !isResponsive && this.options.fixedColumnsLength ?
          this.options.fixedColumnsLength : 0;
        this.options.responsive = isResponsive;
        this.options.scrollX = !isResponsive;
        this.options.fixedColumns = {
          leftColumns: fixedColumn,
        };
        this.options.buttons = this.buttonOptions;
        this.options.searching = false;
        return this.options;
      },
    },
    watch: {
      pairs: function pairs() {
    
      },
    },
    mounted() {
    
    }
  }
</script>

<style>
.hide {
  display: none !important;
}
</style>
