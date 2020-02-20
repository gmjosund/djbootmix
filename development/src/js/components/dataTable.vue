<template>
  <div>
    <button class='float-left btn btn-primary btn-email btn-sm'
     v-bind:class="[tableId === 'salesLogs' ? 'add-sales-record': 'add-buys-record']"
     v-if="tableId ==='salesLogs' || tableId ==='buyLogs'"
     v-bind:data-type="[tableId === 'salesLogs' ? 'sales': 'buys']">
      {{tableId ==='salesLogs'? 'Add New Sales Record' : 'Add New Buys Record'}}
     </button>
   <table class= "table table-striped table-bordered"
    style="width: 100%"
    :id="[tableId]"
   >
   </table></div>
</template>

<script>
import $ from 'jquery';
import 'datatables.net-bs4';
import 'datatables.net-responsive';
import 'datatables.net-buttons-bs4';
import 'datatables.net-buttons';
import Vue from 'vue';
import axios from 'axios'
import { mapGetters } from 'vuex';
import 'datatables.net-bs4/css/dataTables.bootstrap4.css';
import 'datatables.net-responsive-bs4/css/responsive.bootstrap4.min.css';
import 'datatables.net-buttons-bs4/css/buttons.bootstrap4.css';
import 'datatables.net-buttons/js/buttons.html5';
import DataTableHelper from '../mixins/DataTableHelper'
import DOMHelper from '../mixins/DOMHelper'

window.JSZip = require('jszip');

export default {
   name: "dataTable",
   props: {
    opts: {
      default: () => null,
      type: Object,
    },
    columns: {
      type: Array,
    },
    tableData: {
      type: Array,
    },
    tableClass: {
      type: String,
    },
    tableId: {
      type: String,
    }
   },
   data() {
      return {
        isLoaded: false,
        dtInstance: null,
        finalOptions: {},
        options: {},
        excelButton: {},
        buttonOptions: {}
      };
    },
   computed: {
    ...mapGetters({
      properties: 'header/getPropertyLogs'
    })
  },
   mixins: [DOMHelper, DataTableHelper],
   methods : {
      getColumnSum(colNum) {
        return this.dtInstance.column(colNum).data().sum();
      },
      updateData(tableData) {
      	let finalData = tableData;
      	if (!finalData) {
         	finalData = [];
        }
        if (this.isLoaded) {
         this.dtInstance.clear().rows.add(finalData);
         this.dtInstance.draw(false);
         this.dtInstance.columns.adjust();
         this.setDTPagination();
         return;
				}
        this.finalOptions.data = finalData;
        // get current pagingation
        // We should select datatable by id for datatable state save functionality.
        this.dtInstance = $(`#${this.tableId}`).DataTable(
        	Vue.util.extend(
          	{
            	columns: this.columns,
          	},
          this.finalOptions,
        	)
        );
         this.isLoaded = true;
      },
      addButtons(button) {
        this.excelButton = new $.fn.dataTable.Buttons(this.dtInstance, {
          buttons: button
        });
        // Removing button with old sheets.
        $('div').remove('.dt-buttons');
        // Appending button to export updated sheets.
        this.dtInstance.buttons(0, null).container().last().appendTo(
          $(this.dtInstance.table().container())
        );
      },
      updateColumnHeader(headerText, columnIndex) {
        $(this.dtInstance.columns(columnIndex).header()).text(headerText);
      },
      setDTPagination() {
        if (this.currentPagination && this.finalOpts.paging) {
          this.dtInstance.page(this.currentPagination).draw(false);
        }
      },
      renderBuySellAlert() {
        const vm = this;
        // To render alert when we click on buy/sell button in datatable.
        // add transalations for text
        $('body').on(
          'click',
          '.buy-or-sell-btn, span[data-pair], .add-buys-record, .add-sales-record',
          event => {
            if (
                event.target.classList.contains("add-sales-record") ||
                event.target.classList.contains("add-buys-record")
              ) {
                var html = this.getSwalContent(event);
                this.renderBuyorSellModal(event.target.dataset.type, html);
              }

            if (event.target.classList.contains("cancel-pending")) {
              this.renderAlertBox(
                `Cancle ${event.target.dataset.pair}`,
                `Are you sure you want to cancel the open order#${event.target.dataset.orderNumber}${event.target.dataset.pair}`,
                'warning',
                `Cancel order #${event.target.dataset.orderNumber}`,
                `Exit`
              ).then(value => {
                var request = {
                  vm: vm,
                  pairName: event.target.dataset.pair,
                  orderNumber: event.target.dataset.orderNumber
                };

                if (result.value) {
                  vm.$store.dispatch("header/cancelPending", request);
                }
              });
              return;
            }

            if (event.target.classList.contains('pending-btn')) {
              this.renderAlertBox(
                `Send ${event.target.dataset.pair} To Pending?`,
                `Enter a target price for the pair`,
                'warning',
                `Cancel`,
                `Cancel`,
                `text`,
                `${event.target.dataset.avgPrice}`
              ).then(result => {
                var request = {
                  vm: vm,
                  pairName: event.target.dataset.pair,
                  targetPrice: result.value
                };

                if (result.value) {
                  vm.$store.dispatch('header/enterPending', request);
                }
              });
            }

            if (event.target.classList.contains('buy-or-sell-btn')) {
              let isMarketOrderSupported =
                typeof this.serverSettings === 'undefined'
                  ? true
                  : this.serverSettings.isMarketOrderSupported;
              let buyOrSell = event.target.dataset.buyOrSell;
              let testMode =
                typeof this.serverSettings === 'undefined'
                  ? true
                  : this.serverSettings.testMode;

              if (isMarketOrderSupported && !testMode) {
                this.renderAlertBox(
                  `${event.target.dataset.buyOrSell.toUpperCase()} ${
                    event.target.dataset.pair
                  }?`,
                  `Are you sure you want to ${event.target.dataset.buyOrSell} ${event.target.dataset.pair}?`,
                  'warning',
                  `Cancel ${event.target.dataset.pair}`,
                  `${event.target.dataset.buyOrSell.toUpperCase()}`,
                  'select'
                ).then(result => {
                  var request = {
                    vm: vm,
                    pair: event.target.dataset.pair,
                    buyOrSell: event.target.dataset.buyOrSell,
                    executionType: result.value
                  }

                  if (result.value) {
                    vm.$store.dispatch('header/buyOrSellPair', request);
                  }
                });
              } else {
                this.renderAlertBox(
                  `${event.target.dataset.buyOrSell.toUpperCase()} ${
                    event.target.dataset.pair
                  }?`,
                  `Are you sure you want to ${event.target.dataset.buyOrSell} ${event.target.dataset.pair}?`,
                  'warning',
                  `Cancel ${event.target.dataset.pair}`,
                  `${event.target.dataset.buyOrSell.toUpperCase()}`
                ).then(result => {
                  var request = {
                    vm: vm,
                    pair: event.target.dataset.pair,
                    buyOrSell: event.target.dataset.buyOrSell,
                    executionType: 'IOC'
                  }

                  if(result.value){
                    vm.$store.dispatch('header/buyOrSellPair', request);
                  }
                });
              }
            }
            if (event.target.classList.contains('boughtCost-btn')) {
              this.renderAlertBox(
                `${event.target.dataset.boughtcost.toUpperCase()} ${
                  event.target.dataset.pair
                }`,
                `You can find the formatting of the bought cost command in our wiki. Check the link in the footer.`,
                'warning',
                `Cancel ${event.target.dataset.pair}`,
                `${event.target.dataset.boughtcost.toUpperCase()}`,
                `text`,
                `${event.target.dataset.avgPrice}`
              ).then(result => {
                var boughtCost = event.target.dataset.pair + '_bought_price='+result.value
                var request = {
                  vm: vm,
                  filename: 'HOTCONFIG',
                  fileData: boughtCost,
                  configName: this.properties.activeConfig
                }

                if (result.value) {
                  vm.$store.dispatch('header/boughtCost', request);
                }
              });
            }
            if (event.target.classList.contains("reserve-btn")) {
              this.renderAlertBox(
                `Reserve an amount of ${event.target.dataset.pair}`,
                `Reserve an amount of`,
                'warning',
                `Cancel ${event.target.dataset.pair}`,
                `Reserve`,
                `text`,
                `${event.target.dataset.amount}`
              ).then(result => {
                var request = {
                  vm: vm,
                  pair: event.target.dataset.pair,
                  amount: result.value
                }

                if (result.value) {
                  vm.$store.dispatch('header/reserveAmount', request);
                }
              });
            }
            return;
          }
        );
      }
   },
   mounted() {
    try {
      if (this.opts === null) {
        this.options = this.$parent.getDataTableOptions();
      } else {
        this.options = this.opts;
      }
    } catch (err) {
      throw new Error(
        'Please pass options for DataTable either as a property, or via a `getDataTableOptions` method.'
      );
    }
    this.finalOptions = Vue.util.extend(
      {
        dom: 'frtipB',
        paging: false,
        pageLength: 25,
        order: [[0, 'desc']],
        searching: false,
        stateSave: true,
        scrollCollapse: true
      },
      this.options
    );
    this.updateData(this.tableData);
    this.renderBuySellAlert();
  },

   beforeDestroy() {

     if (this.excelButton){
       this.dtInstance.buttons().destroy();
     }
     this.dtInstance.destroy(true);

     this.dtInstance = null;
     this.options = {};
     $('body').off('click', '.buy-or-sell-btn, span[data-pair], .add-buys-record, .add-sales-record');
   }
}
</script>

<style>
.dt-buttons {
  float: right !important;
}

#dtDcaLogs td.strat-current-val,
#dtPossibleBuysLog td.current-value,
#dtPairsLogs td.current-value,
#dtSalesLog td.current-value,
#dtBuyLog td.current-value {
  color: rgba(255, 215, 0, 0.75);
}

.dataTables_filter,
.dataTables_length {
  color: #98a6ad;
}
</style>
