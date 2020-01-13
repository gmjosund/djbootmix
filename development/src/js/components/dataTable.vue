<template>
   <table class= "table table-striped table-bordered"
    style="width: 100%"
    :id="[tableId]"
   >
   </table>
</template>

<script>
import $ from 'jquery';
import 'datatables.net-bs4';
import 'datatables.net-responsive';
import 'datatables.net-buttons-bs4';
import 'datatables.net-buttons';
import Vue from 'vue';

// import 'bootstrap/dist/css/bootstrap.min.css';
import 'datatables.net-bs4/css/dataTables.bootstrap4.css';
import 'datatables.net-responsive-bs4/css/responsive.bootstrap4.min.css';
import 'datatables.net-buttons-bs4/css/buttons.bootstrap4.css';
import 'datatables.net-buttons/js/buttons.html5';

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
      }
   },
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
      setDTPagination() {
        if (this.currentPagination && this.finalOpts.paging) {
          this.dtInstance.page(this.currentPagination).draw(false);
        }
      },
   },
   mounted() {
     try {
      if (this.opts === null) {
        this.options = this.$parent.getDataTableOptions();
      } else {
        this.options = this.opts;
        }
      } catch (err) {
        throw new Error('Please pass options for DataTable either as a property, or via a `getDataTableOptions` method.');
      }
      this.finalOptions = Vue.util.extend(
      {
        dom: 'frtipB',
				paging: false,
        pageLength: 25,
        order: [[0, 'desc']],
        searching: false,
        stateSave: true,
        scrollCollapse: true,
      },
      this.options
    );
    this.updateData(this.tableData);
   },
   beforeDestroy() {

     if (this.excelButton){
       this.dtInstance.buttons().destroy();
     }
     this.dtInstance.destroy(true);

     this.dtInstance = null;
     this.options = {};
   }
}
</script>

<style>
.dt-buttons {
  float: right !important;
}
.blue-color, 
.buy-strategy,
.sell-strategy,
.current-value,
.buy-value,
.trigger {
  color: #98a6ad !important;
}
</style>
