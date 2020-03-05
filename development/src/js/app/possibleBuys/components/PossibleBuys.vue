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
  import Store from '../../../vuex/index'

  export default {
    components: {
      dataTable 
    },
    mixins: [DOMHelper, DataTableHelper],
    data() {
      return {
        columns: [
          {
            title: 'Coin',
            data: 'market',
            className: 'market',
            render: this.renderCombinedMarketCol,
          },
          {
            title: '24H % Change',
            data: this.renderPercentageChange,
            className: 'hide',
          },
          {
            title: 'Ask Price',
            data: 'currentPrice',
            className: 'text-right blue-color current-price',
            render: this.currentMarketPrecision,
          },
          {
            title: 'VOL',
            data: 'volume',
            className: 'text-right volume',
            responsivePriority: 2,
            render: this.renderVolume,
          },
          {
            title: 'Buy',
            data: this.renderBuyStrategy('buyStrategies', true),
            className: 'buy-strategy'
          },
          {
            title: 'BSV',
            data: 'buyStrategies',
            className: 'text-right blue-color current-value',
            render: this.checkAllValAndHandleStratCurVal,
          },
          {
            title: 'BST',
            data: 'buyStrategies',
            className: 'text-right buy-value',
            render: this.checkAllValAndHandleStratEntryVal,
          },
          {
            title: 'BSL',
            data: 'buyStrategies',
            className: 'text-right',
            responsivePriority: 1,
            render: this.handlePBEntryLimit,
          },
          {
            title: 'Actions',
            data: this.addActionButtons,
            className: 'text-right'
          }
        ],
        options: {
          order: [[3, 'desc']],
          fixedColumnsLength: 1,
        },
        buttonOptions: []
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
     watch: {
        possibleBuys: function possibleBuys() {
          this.$refs.wrapper.updateData(this.possibleBuys);
        }
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
    }
  }
</script>

<style scoped>
.dt-buttons {
  float: right !important;
}
</style>
