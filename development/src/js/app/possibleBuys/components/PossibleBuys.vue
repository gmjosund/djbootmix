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
  import dataTable from '../../../components/dataTable'
  import DataTableHelper from '../../../mixins/DataTableHelper'
  import DOMHelper from '../../../mixins/DOMHelper'
  import axios from 'axios'
  import state from '../vuex/state'
  import SummaryTable from '../../../components/SummaryTable'

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
        columns: [
          {
            title: 'coin',
            data: 'market',
            tooltip: 'psbSection.coin.colTitle',
            className: 'market',
            render: this.renderCombinedMarketCol,
          },
          {
            title: 'currPrice',
            data: 'currentPrice',
            tooltip: 'psbSection.currPrice.colTitle',
            className: 'text-right blue-color current-price',
            render: this.currentMarketPrecision,
          },
          {
            title: 'vol',
            data: 'volume',
            tooltip: 'psbSection.vol.colTitle',
            className: 'text-right volume',
            responsivePriority: 2,
            render: this.renderVolume,
          },
          {
            title: 'buyStrat',
            data: this.renderBuyStrategy('buyStrategies', true),
            tooltip: 'psbSection.buyStrat.colTitle',
            className: 'buy-strategy'
          },
          {
            title: 'currVal',
            data: 'buyStrategies',
            tooltip: 'psbSection.currVal.colTitle',
            className: 'text-right blue-color current-value',
            render: this.checkAllValAndHandleStratCurVal,
          },
          {
            title: 'buyValue',
            data: 'buyStrategies',
            tooltip: 'psbSection.buyValue.colTitle',
            className: 'text-right buy-value',
            render: this.checkAllValAndHandleStratEntryVal,
          },
          {
            title: 'buyLimit',
            data: 'buyStrategies',
            tooltip: 'psbSection.buyLimit.colTitle',
            className: 'text-right',
            responsivePriority: 1,
            render: this.handlePBEntryLimit,
          },
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

    },
    watch : {
      possibleBuys: function () {
        this.$refs.wrapper.addButtons(this.buttonOptions);
      }
    }
  }
</script>

<style scoped>
.dt-buttons {
  float: right !important;
}
</style>
