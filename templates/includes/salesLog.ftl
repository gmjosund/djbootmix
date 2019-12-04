    <!-- SALES LOG -->
    <div id="tmplSalesLog" class="hide">
      <div class="row">
        <div class="col-12">
          <div class="card-box table-responsive">
            <table class="table table-striped table-bordered dt-sales-log" id="dtSalesLog" cellspacing="0" width="100%">
            </table>
            <table class="col-md-3 col-sm-5 summary-table">
              <tr>
                <td class="text-primary table-nowrap">
                  <span class="full-text" data-i18n="salesLogSection.summaryTable.boughtCost"></span>
                  <span class="short-text" data-i18n="salesLogSection.summaryTable.bc"></span>
                </td>
                <td id="salesLogBoughtCost" class="text-primary table-nowrap" data-toggle="tooltip" data-placement="bottom" data-i18n="[title]salesLogSection.summaryTable.boughtCost"></td>
              </tr>
              <tr>
                <td class="text-dark table-nowrap">
                  <span class="full-text" data-i18n="salesLogSection.summaryTable.diff"></span>
                  <span class="short-text" data-i18n="salesLogSection.summaryTable.d"></span>
                </td>
                <td id="salesLogDifference" class="text-dark table-nowrap">
                  <span class="percentage"></span>
                  <span class="value" data-toggle="tooltip" data-placement="bottom" data-i18n="[title]salesLogSection.summaryTable.diff"></span>
                </td>
              </tr>
              <tr>
                <td class="text-success table-nowrap">
                  <span class="full-text" data-i18n="salesLogSection.summaryTable.soldVal"></span>
                  <span class="short-text" data-i18n="salesLogSection.summaryTable.sv"></span>
                </td>
                <td id="salesLogTotalCurrentVal" class="text-success table-nowrap" data-toggle="tooltip" data-placement="bottom" data-i18n="[title]salesLogSection.summaryTable.soldVal"></td>
              </tr>
            </table>
          </div>
        </div>
      </div>
    </div>
    <!-- end SALES LOG -->