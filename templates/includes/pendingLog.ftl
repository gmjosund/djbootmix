    <!-- PENDING LOG -->
    <div id="tmplPendingLog" class="hide">
      <div class="row">
        <div class="col-12">
          <div class="card-box table-responsive">
            <table class="table table-striped table-bordered dt-pending-logs" id="dtPendingLogs" cellspacing="0" width="100%">
            </table>
            <table class="col-md-3 col-sm-5 summary-table">
              <tr>
                <td class="text-primary table-nowrap">
                  <span class="full-text" data-i18n="pendingLogSection.summaryTable.currVal"></span>
                  <span class="short-text" data-i18n="pendingLogSection.summaryTable.cv"></span>
                </td>
                <td id="pendingLogTotalCurrentVal" class="text-primary table-nowrap" data-toggle="tooltip" data-placement="bottom" data-i18n="[title]pendingLogSection.summaryTable.currVal"></td>
              </tr>
              <tr>
                <td class="text-dark table-nowrap">
                  <span class="full-text" data-i18n="pendingLogSection.summaryTable.diff"></span>
                  <span class="short-text" data-i18n="pendingLogSection.summaryTable.d"></span>
                </td>
                <td id="pendingLogDifference" class="text-dark table-nowrap">
                  <span class="percentage"></span>
                  <span class="value" data-toggle="tooltip" data-placement="bottom" data-i18n="[title]pendingLogSection.summaryTable.diff"></span>
                </td>
              </tr>
              <tr>
                <td class="text-success table-nowrap">
                  <span class="full-text" data-i18n="pendingLogSection.summaryTable.targetVal"></span>
                  <span class="short-text" data-i18n="pendingLogSection.summaryTable.tv"></span>
                </td>
                <td id="pendingLogRealCost" class="text-success table-nowrap" data-toggle="tooltip" data-placement="bottom" data-i18n="[title]pendingLogSection.summaryTable.targetVal"></td>
              </tr>
            </table>
          </div>
        </div>
      </div>
    </div>
    <!-- end PENDING LOG -->