<!-- PAIRS LOG -->
    <div id="tmplPairsLog" class="hide">
      <div class="row">
        <div class="col-12">
          <div class="card-box table-responsive">
            <table class="table table-striped table-bordered dt-pairs-logs" id="dtPairsLogs" cellspacing="0" width="100%">
            </table>
            <table class="col-md-3 col-sm-5 summary-table">
              <tr>
                <td class="text-primary table-nowrap">
                  <span class="full-text" data-i18n="pairsLogSection.summaryTable.currVal"></span>
                  <span class="short-text" data-i18n="pairsLogSection.summaryTable.cv"></span>
                </td>
                <td id="pairsLogTotalCurrentVal" class="text-primary table-nowrap" data-toggle="tooltip" data-placement="bottom" data-i18n="[title]pairsLogSection.summaryTable.currVal"></td>
              </tr>
              <tr>
                <td class="text-dark table-nowrap">
                  <span class="full-text" data-i18n="pairsLogSection.summaryTable.diff"></span>
                  <span class="short-text" data-i18n="pairsLogSection.summaryTable.d"></span>
                </td>
                <td id="pairsLogDifference" class="text-dark table-nowrap">
                  <span class="percentage"></span>
                  <span class="value" data-toggle="tooltip" data-placement="bottom" data-i18n="[title]pairsLogSection.summaryTable.diff"></span>
                </td>
              </tr>
              <tr>
                <td class="text-success table-nowrap">
                  <span class="full-text" data-i18n="pairsLogSection.summaryTable.boughtCost"></span>
                  <span class="short-text" data-i18n="pairsLogSection.summaryTable.bc"></span>
                </td>
                <td id="pairsLogRealCost" class="text-success table-nowrap" data-toggle="tooltip" data-placement="bottom" data-i18n="pairsLogSection.summaryTable.boughtCost"></td>
              </tr>
            </table>
          </div>
        </div>
      </div>
    </div>
    <!-- end PAIRS LOG  -->