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
          <TableInfo :amount="pairsAmount" 
            :data="pairs">
            </TableInfo>
        </b-card>
      </div>
    </div>
  </div>
</template>

<script>
  import {mapActions, mapGetters } from 'vuex'
  import dataTable from '../../../components/dataTable'
  import DOMHelper from '../../../mixins/DOMHelper'
  import DataTableHelper from '../../../mixins/DataTableHelper'
  import { percentageCalculation } from '../../../helpers'
  import TableInfo from './PairsTableInfo'
  import Store from '../../../vuex/index'

  export default {
    components: {
      dataTable,
      TableInfo  
    },
    mixins: [DOMHelper, DataTableHelper],
    beforeRouteEnter (to, from, next) {
      Promise.all([
        Store.dispatch('pairs/getPairsLog'),
        Store.dispatch('header/getMiscLogs'),
        Store.dispatch('header/getCurrencies'),
        Store.dispatch('header/getPropertyLogs')
      ]).finally(() => {
        next();
      });
    },
    data() {
      return {
        columns: [{
          title: 'Date',
          data: this.dateHandler('lastBoughtDate'),
          className: 'date ',
          responsivePriority: 1,
        }, {
          title: 'Coin',
          data: 'market',
          className: 'market',
          render: this.renderCombinedMarketCol,
          responsivePriority: 1,
        }, {
          title: '24H % Change',
          data: this.renderPercentageChange,
          className: 'hide',
        }, {
          title: 'Sell',
          data: this.renderSellStrategyWithButton('sellStrategies', true),
          className: 'sell-strategy',
          responsivePriority: 1,
        }, {
          title: 'SSV',
          data: 'sellStrategies',
          render: this.handleStratCurrentVal,
          className: 'text-right current-value ',
          responsivePriority: 1,
        }, {
          title: 'SST',
          data: 'sellStrategies',
          render: this.handleStratEntryVal,
          responsivePriority: 1,
          className: 'text-right trigger',
        }, {
          title: 'P%',
          data: this.handleOrderBookProfit,
          responsivePriority: 1,
          className: 'text-center profit',
        }, {
          title: 'Bid Price <br> Bought Price',
          data: this.handleAvgValAndCurrentPrice(),
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
          className: 'text-right blue-color current-value',
          responsivePriority: 1,
        }, {
          title: 'Current Value',
          data: this.getCurrentValue(true),
          responsivePriority: 1,
          className: 'hide',
        }, {
          title: '<span class="api-currency"></span>',
          data: this.getCurrentValue(false, true),
          responsivePriority: 1,
          className: 'text-right blue-color current-value  hide',
        }, {
          title: 'boughtCost',
          data: this.handleTotalCost(true),
          responsivePriority: 1,
          className: 'hide',
        }, {
          title: '<span class="api-currency"> </span>',
          data: this.handleTotalCost(false, true),
          responsivePriority: 1,
          className: 'text-right blue-color bought-cost  hide',
        }, {
          title: '<span class="api-currency" ></span>',
          data: this.getCurrentValAndTotalCost(false, true),
          className: 'text-right bought-cost currency-value',
          responsivePriority: 3,
        }, {
          title: 'VOL',
          data: 'volume',
          className: 'text-right volume',
          responsivePriority: 6,
          render: this.renderVolume,
        }, {
          title: 'TAM',
          data: this.handleTotalAmount,
          responsivePriority: 5,
          className: 'text-right total-amount',
        },{
          title: 'Actions',
          data: this.addActionButtons,
          className: 'text-right'
        }],
        options: {
          order: [[8, 'desc']],
          fixedColumnsLength: 5,
        },
        summaryTableData: {},
        buttonOptions: []
      };
    },
    computed: {
      ...mapGetters({
        pairs: 'pairs/pairsLog',
        pairsAmount: 'pairs/pairsAmount',
        settings: 'monitoring/settings',
        misc: 'monitoring/misc',
        pairsCalculations: 'pairs/pairsCalculations',
        currency: 'header/currency',
      })
    },
     beforeMount() {
      this.columns = this.getExportDateColumns(this.columns, 1, 'lastBoughtDate');
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
    watch: {
      pairs: function pairs() {
        this.$refs.wrapper.updateData(this.pairs);
      },
      currency: function currency() {
        this.$refs.wrapper.updateColumnHeader(this.currency, [15, 17, 18]);
      }
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
    mounted() {
      this.$refs.wrapper.updateColumnHeader(this.currency, [15, 17, 18]);
    }
  }
</script>

<style>
.hide {
  display: none !important;
}
</style>
