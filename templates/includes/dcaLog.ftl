    <!-- DCA LOG -->
    <div id="tmplDcaLog" class="hide">
      <div class="row">
        <div class="col-12">
          <div class="card-box table-responsive">
            <table class="table table-striped table-bordered dt-dca-logs" id="dtDcaLogs" cellspacing="0" width="100%">
            </table>
            <table class="col-md-3 col-sm-5 summary-table">
              <tr>
                <td class="text-primary table-nowrap">
                  <span class="full-text" data-i18n="dcaLogSection.summaryTable.currVal"></span>
                  <span class="short-text" data-i18n="dcaLogSection.summaryTable.cv"></span>
                </td>
                <td id="dcLogTotalCurrentVal" class="text-primary table-nowrap" data-toggle="tooltip" data-placement="bottom" data-i18n="[title]dcaLogSection.summaryTable.currVal"></td>
              </tr>
              <tr>
                <td class="text-dark table-nowrap">
                  <span class="full-text" data-i18n="dcaLogSection.summaryTable.diff"></span>
                  <span class="short-text" data-i18n="dcaLogSection.summaryTable.d"></span>
                </td>
                <td id="dcLogDifference" class="text-dark table-nowrap">
                  <span class="percentage"></span>
                  <span class="value" data-toggle="tooltip" data-placement="bottom" data-i18n="[title]dcaLogSection.summaryTable.diff"></span>
                </td>
              </tr>
              <tr>
                <td class="text-success table-nowrap">
                  <span class="full-text" data-i18n="dcaLogSection.summaryTable.totalCost"></span>
                  <span class="short-text" data-i18n="dcaLogSection.summaryTable.tc"></span>
                </td>
                <td id="dcLogRealCost" class="text-success table-nowrap" data-toggle="tooltip" data-placement="bottom" data-i18n="[title]dcaLogSection.summaryTable.totalCost"></td>
              </tr>
            </table>
          </div>
        </div>
      </div>
    </div>
    <!-- end DCA LOG -->