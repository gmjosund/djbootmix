<!-- Stats -->
<div id="tmplStats" class="hide">

    <div class="row">
        <div class="col-md-12">
            <div class="row">
                <div class="col-md-3">
                    <div class="widget-bg-color-icon text-center card-box fadeInDown animated" style="min-height:310px;">
                        <h4 class="card-box-title" data-i18n="statsPage.DailyProfits"></h4>
                        <div style="min-height:230px;margin-top: 15px;"><canvas id="dailyProfitsChart"></canvas></div>
                    </div>
                </div>
                <div class="col-md-3">
                    <div class="widget-bg-color-icon text-center card-box fadeInDown animated" style="min-height:310px;">
                        <h4 class="card-box-title" data-i18n="statsPage.MonthlyProfits"></h4>
                        <div style="min-height:230px;margin-top: 15px;"><canvas id="monthlyProfitsChart"></canvas></div>
                    </div>
                </div>
                <div class="col-md-3">
                    <div class="widget-bg-color-icon text-center card-box fadeInDown animated" style="min-height:310px;">
                        <i class="fa fa-question-circle pull-right" onClick="swalSaleDistribution()"></i>
                        <h4 class="card-box-title" data-i18n="statsPage.SalesDistribution"></h4>
                        <div style="min-height:230px;margin-top: 15px;"><canvas id="saleDistribution"></canvas></div>
                    </div>
                </div>
                <div class="col-md-3">
                    <div class="widget-bg-color-icon text-center card-box fadeInDown animated" style="min-height:310px;">
                        <h4 class="card-box-title" data-i18n="statsPage.TotalCurrentValue"></h4>
                        <div style="min-height:230px;margin-top: 15px;"><canvas id="TCVChart"></canvas></div>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <div class="row">
        <div class="col-md-12">
            <div class="row">
                <div class="col-md-3">
                    <div class="widget-bg-color-icon text-center card-box fadeInDown animated" style="min-height:310px;">
                        <h4 class="card-box-title" data-i18n="statsPage.DSpentVsEarned"></h4>
                        <div style="min-height:230px;margin-top: 15px;"><canvas id="dailySpentEarnedChart"></canvas></div>
                    </div>
                </div>
                <div class="col-md-3">
                    <div class="widget-bg-color-icon text-center card-box fadeInDown animated" style="min-height:310px;">
                        <h4 class="card-box-title" data-i18n="statsPage.MSpentVsEarned"></h4>
                        <div style="min-height:230px;margin-top: 15px;"><canvas id="monthlySpentEarnedChart"></canvas></div>
                    </div>
                </div>
				<div class="col-md-3">
                    <div class="widget-bg-color-icon text-center card-box fadeInDown animated" style="min-height:310px;">
                        <h4 class="card-box-title" data-i18n="statsPage.DBuysVsSells"></h4>
                        <div style="min-height:230px;margin-top: 15px;"><canvas id="dailyBuySalesChart"></canvas></div>
                    </div>
                </div>

                <div class="col-md-3">
                    <div class="widget-bg-color-icon text-center card-box fadeInDown animated" style="min-height:310px;">
                        <h4 class="card-box-title" data-i18n="statsPage.MBuysVsSells"></h4>
                        <div style="min-height:230px;margin-top: 15px;"><canvas id="monthlyBuySalesChart"></canvas></div>
                    </div>
                </div>
            </div>
        </div>
    </div>

</div>
<!-- end Stats-->
