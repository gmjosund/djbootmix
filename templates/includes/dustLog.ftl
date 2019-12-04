    <!-- Dust LOG -->
    <div id="tmplDustLog" class="hide">
      <div class="row">
        <div class="col-12">
          <div class="card-box table-responsive">
            <table class="table table-striped table-bordered dt-dust-logs" id="dtDustLogs" cellspacing="0" width="100%">
            </table>
            <table class="col-md-3 col-sm-5 summary-table">
              <tr>
                <td class="text-primary table-nowrap">
                  <span class="full-text" data-i18n="dustLogSection.summaryTable.currVal"></span>
                  <span class="short-text" data-i18n="dustLogSection.summaryTable.cv"></span>
                </td>
                <td id="dustLogTotalCurrentVal" class="text-primary table-nowrap" data-toggle="tooltip" data-placement="bottom" data-i18n="[title]dustLogSection.summaryTable.currVal"></td>
              </tr>
              <tr>
                <td class="text-dark table-nowrap">
                  <span class="full-text" data-i18n="dustLogSection.summaryTable.diff"></span>
                  <span class="short-text" data-i18n="dustLogSection.summaryTable.d"></span>
                </td>
                <td id="dustLogDifference" class="text-dark table-nowrap">
                  <span class="percentage"></span>
                  <span class="value" data-toggle="tooltip" data-placement="bottom" data-i18n="[title]dustLogSection.summaryTable.diff"></span>
                </td>
              </tr>
              <tr>
                <td class="text-success table-nowrap">
                  <span class="full-text" data-i18n="dustLogSection.summaryTable.boughtCost"></span>
                  <span class="short-text" data-i18n="dustLogSection.summaryTable.bc"></span>
                </td>
                <td id="dustLogRealCost" class="text-success table-nowrap" data-toggle="tooltip" data-placement="bottom" data-i18n="[title]dustLogSection.summaryTable.boughtCost"></td>
              </tr>
            </table>
          </div>
        </div>
      </div>
    </div>
    <!-- end Dust LOG  -->