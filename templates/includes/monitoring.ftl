<!-- MONITORING -->
    <div id="tmplMonitoring" class="hide">
      <!-- MONITORING 1st ROW -->
      <div class="row monitoring-row">
        <div class="col-lg-3 col-md-6">
          <div class="widget-bg-color-icon card-box fadeInDown animated" data-toggle="tooltip" data-placement="bottom" data-i18n="[title]monitoringSection.balance.title">
            <div class="bg-icon bg-icon-tdbitcoin pull-left">
              <i class="fa fa-btc text-info market-icon"></i>
            </div>
            <div class="text-right">
              <h3 class="m-t-10 tdbitcoin main-text">
                <b class="counter" id="mBalanceVal">--</b>
                <span class="market m-l-5">--</span>
              </h3>
              <p class="mb-0 tdbitcoin main-text" data-i18n="[append]monitoringSection.balance.mainText">
                <span class="js-exchange">--</span>
              </p>
              <span class="market-price-calculations">
                <label class="text-warning usd-value js-usd-value">
                  <span class="full-text"></span>
                  <span class="short-text"></span>
                </label>
                <span class="mb-0 text-warning main-text" id="mBalUSDValue">--</span>
              </span>
              <!-- Pairs balance -->
              <p class="mb-0 monitor-smaller-fonts text-warning">
                <span data-i18n="monitoringSection.pairsBal.label">
                </span>
                <span id="mPairsBalanceVal">
                  --
                </span>
              </p>
              <!-- DCA balance -->
              <p class="mb-0 monitor-smaller-fonts text-warning">
                <span data-i18n="monitoringSection.dcaBal.label">
                </span>
                <span id="mDCABalanceVal">
                  --
                </span>
              </p>
            </div>
            <div class="clearfix"></div>
          </div>
        </div>
        <div class="col-lg-3 col-md-6">
          <div class="widget-bg-color-icon card-box fadeInDown animated" data-toggle="tooltip" data-placement="bottom" data-i18n="[title]monitoringSection.tcv.title">
            <div class="bg-icon bg-icon-primary pull-left">
              <i class="fa fa-btc text-info market-icon"></i>
            </div>
            <div class="text-right">
              <h3 class=" m-t-10 text-primary main-text">
                <b class="counter" id="mTotalCurrentVal">--</b>
                <span class="market m-l-5">--</span>
              </h3>
              <p class="mb-0 text-primary main-text" data-i18n="monitoringSection.tcv.mainText"></p>
              <span class="market-price-calculations">
                <label class="text-primary usd-value js-usd-value">
                  <span class="full-text"></span>
                  <span class="short-text"></span>
                </label>
                <span class="mb-0 text-primary main-text" id="mTCVUSDValue">--</span>
              </span>
              <p class="monitor-smaller-fonts text-primary main-text mb-0 js-dust-values" data-toggle="tooltip" data-placement="bottom"
                data-i18n="[title]monitoringSection.tcvDust.title">
                <label class="mb-0" data-i18n="monitoringSection.tcvDust.label">
                </label>
                <span id="mTCVDustValue">
                  --
                </span>
                <span class="market">--</span>
              </p>
            </div>
            <div class="clearfix"></div>
          </div>
        </div>
        <div class="col-lg-3 col-md-6">
          <div class="widget-bg-color-icon card-box fadeInDown animated" data-toggle="tooltip" data-placement="bottom" data-i18n="[title]monitoringSection.sb.title">
            <div class="bg-icon bg-icon-success pull-left">
              <i class="fa fa-btc text-info  market-icon"></i>
            </div>
            <div class="text-right">
              <h3 class=" m-t-10 text-success main-text">
                <b class="counter" id="mStartBalance">--</b>
                <span class="market m-l-5">--</span>
              </h3>
              <p class="mb-0 text-success main-text" data-i18n="monitoringSection.sb.mainText"></p>
              <span class="market-price-calculations">
                <label class="text-success usd-value js-usd-value">
                  <span class="full-text"></span>
                  <span class="short-text"></span>
                </label>
                <span class="mb-0 text-success main-text" id="mTPVUSDValue">--</span>
              </span>
            </div>
            <div class="clearfix"></div>
          </div>
        </div>
        <div class="col-lg-3 col-md-6">
          <div class="widget-bg-color-icon card-box fadeInDown animated" id="mMarketTrendContainer" data-toggle="tooltip" data-placement="bottom"
            title="">
            <div class="bg-icon bg-icon-btctrend pull-left">
              <i class="fa fa-btc text-info  market-icon"></i>
            </div>
            <div class="text-right">
              <h3 class="counter m-t-10 percentage-text">
                <b class="counter" id="mMarketTrend">--</b>
              </h3>
              <p id="mMarketTrendLabel" class="mb-0 text-btctrend main-text"></p>
            </div>
            <div class="clearfix"></div>
          </div>
        </div>
      </div>
      <!-- MONITORING 2nd ROW -->
      <div class="row monitoring-row">
        <div class="col-lg-3 col-md-6" data-toggle="tooltip" data-placement="bottom" data-i18n="[title]monitoringSection.btcUsd.title">
          <div class="widget-bg-color-icon card-box fadeInDown animated">
            <div class="bg-icon bg-icon-btcusd pull-left">
              <i class="fa fa-usd text-info"></i>
            </div>
            <div class="text-right">
              <h3 class="tdbitcoin counter m-t-10 font-bold main-text">
                <span id="mBtcPrice">--</span>&nbsp;
                <span title="BTC trend last 24h" id="mBtc24h"></span>
              </h3>
              <p class="mb-0 text-btcusd main-text" data-i18n="[append]monitoringSection.btcUsd.mainText">
                <span class="js-exchange">--</span>
              </p>
            </div>
            <div class="clearfix"></div>
          </div>
        </div>
        <div class="col-lg-3 col-md-6 top-market" data-toggle="tooltip" data-placement="bottom" data-i18n="[title]monitoringSection.coinTopMarket.title">
          <div class="widget-bg-color-icon card-box fadeInDown animated">
            <div class="bg-icon bg-icon-trend1h pull-left">
              <i class="fa fa-space-shuttle text-info"></i>
            </div>
            <div class="text-right">

              <!-- Top market prices -->
              <div class="top-market-prices top-market">
                <span class="counter" id="mTrendPrice0">--</span>
                <span class="counter" id="mTrendPrice1">--</span>
                <span class="counter" id="mTrendPrice2">--</span>
                <span class="counter" id="mTrendPrice3">--</span>
                <span class="counter" id="mTrendPrice4">--</span>
              </div>

              <!-- Top market percentage changes -->
              <div class="top-market-perc top-market">
                <span class="counter m-l-0" id="mTrendPerChnge0">--</span>
                <span class="counter m-l-5" id="mTrendPerChnge1">--</span>
                <span class="counter m-l-5" id="mTrendPerChnge2">--</span>
                <span class="counter m-l-5" id="mTrendPerChnge3">--</span>
                <span class="counter m-l-5" id="mTrendPerChnge4">--</span>
              </div>

              <!-- Top market labels -->
              <div class="top-market-labels top-market">
                <span class="market-label coin-market-text" id="mTrendMarket0">--</span>
                <span class="market-label coin-market-text" id="mTrendMarket1">--</span>
                <span class="market-label coin-market-text" id="mTrendMarket2">--</span>
                <span class="market-label coin-market-text" id="mTrendMarket3">--</span>
                <span class="market-label coin-market-text" id="mTrendMarket4">--</span>
              </div>

            </div>
            <div class="clearfix"></div>
          </div>
        </div>
        <div class="col-lg-3 col-md-6 global-market" data-toggle="tooltip" data-placement="bottom" data-i18n="[title]monitoringSection.globalMarket.title">
          <div class="widget-bg-color-icon card-box fadeInDown animated">
            <div class="bg-icon bg-icon-trend24h pull-left">
              <i class="fa fa-moon-o text-info"></i>
            </div>
            <div class="text-right">

              <!-- Total Market Cap -->
              <p class="mb-0  m-t-5 main-text coin-market-text">
                <span class="market-label" data-i18n="[prepend]monitoringSection.globalMarket.totalMarketCap"></span>
                <span class="counter" id="mTrendtotalMarketCap">--</span>
              </p>

              <!-- Total 24 Hour Volume -->
              <p class="mb-0 main-text  m-t-5 coin-market-text">
                <span class="market-label" data-i18n="[prepend]monitoringSection.globalMarket.total24HrsVol"></span>
                <span class="counter" id="mTrendtotal24HrsVol">--</span>
              </p>

              <!-- Bitcoin % of Market Cap -->
              <p class="mb-0 main-text  m-t-5 coin-market-text">
                <span class="market-label" data-i18n="[prepend]monitoringSection.globalMarket.bitcoinMarketCap"></span>
                <span class="counter" id="mTrendbitcoinMarketCap">--</span>
              </p>
            </div>
            <div class="clearfix"></div>
          </div>
        </div>
        <div class="col-lg-3 col-md-6" data-toggle="tooltip" data-placement="bottom" data-i18n="[title]monitoringSection.trendUsdTill7D.title">
          <div class="widget-bg-color-icon card-box fadeInDown animated">
            <div class="bg-icon bg-icon-trend7d pull-left">
              <i class="fa fa-usd text-info"></i>
            </div>
            <div class="text-right">
              <div class="trend-market">
                <p class="mb-0 m-t-10 text-trend1h main-text">
                  <span data-i18n="monitoringSection.trendUsd1H.mainText"></span>
                  <span class="m-l-10 counter" id="mTrend1h">--</span>
                </p>
                <p class="mb-0  m-t-5 text-trend24h main-text">
                  <span data-i18n="monitoringSection.trendUsd24H.mainText"></span>
                  <span class="m-l-10 counter" id="mTrend24h">--</span>
                </p>
                <p class="mb-0 text-trend7d main-text  m-t-5">
                  <span data-i18n="monitoringSection.trendUsd7D.mainText"></span>
                  <span class="m-l-10 counter" id="mTrend7d">--</span>
                </p>
              </div>
            </div>
            <div class="clearfix"></div>
          </div>
        </div>
      </div>
      <!-- MONITORING 3rd Row-->
      <div class="row monitoring-row">
        <div class="col-lg-3 col-md-6">
          <div class="widget-bg-color-icon card-box fadeInDown animated" data-toggle="tooltip" data-placement="bottom" data-i18n="[title]monitoringSection.profitLW.title">
            <div class="bg-icon bg-icon-profitlw pull-left">
              <i class="fa fa-line-chart text-info"></i>
            </div>
            <div class="text-right">
              <div class="profit-heading main-text">
                <p class="mb-0 text-profitlw main-text" data-i18n="monitoringSection.profitLW.mainText"></p>
                <span class="open-brackets text-profitlw" id="mLastWeekProfitSales">--</span>
                <span class="text-profitlw close-brackets" data-i18n="monitoringSection.trade.label"></span>
              </div>
              <h3 class=" m-t-10 text-profitlw main-text profit-text">
                <b class="counter" id="mLastWeekProfit">--</b>
                <span class="market m-l-5">--</span>
              </h3>
              <span class="market-price-calculations text-profitlw">
                <label class="usd-value js-usd-value">
                  <span class="full-text"></span>
                  <span class="short-text"></span>
                </label>
                <span class="mb-0 main-text" id="mLastWeekProfitUSDValue">--</span>
              </span>
              <div class="market-volume text-profitlw">
                <label class="usd-value">
                  <span class="api-market"></span>
                  <span data-i18n="monitoringSection.volume.label"></span>
                </label>
                <span class="mb-0 main-text" id="mLastWeekMarketVolume">--</span>
              </div>
              <div class="market-price-calculations text-profitlw js-estimated-gain">
                <label class="usd-value">
                  <span class="full-text" data-i18n="monitoringSection.gainFullText"></span>
                  <span class="short-text" data-i18n="monitoringSection.gainShortText"></span>
                </label>
                <span class="mb-0 main-text" id="mLastWeekProfitPercent">--</span>
                <span> %</span>
              </div>
            </div>
            <div class="clearfix"></div>
          </div>
        </div>
        <div class="col-lg-3 col-md-6">
          <div class="widget-bg-color-icon card-box fadeInDown animated" data-toggle="tooltip" data-placement="bottom" data-i18n="[title]monitoringSection.profitYday.title">
            <div class="bg-icon bg-icon-profityd pull-left">
              <i class="fa fa-line-chart text-info"></i>
            </div>
            <div class="text-right">
              <div class="profit-heading main-text">
                <p class="mb-0 text-profityd main-text" data-i18n="monitoringSection.profitYday.mainText"></p>
                <span class="open-brackets text-profityd" id="mYesterdayProfitSales">--</span>
                <span class="text-profityd close-brackets" data-i18n="monitoringSection.trade.label"></span>
              </div>
              <h3 class=" m-t-10 text-profityd main-text profit-text">
                <b class="counter" id="mYesterdayProfit">--</b>
                <span class="market m-l-5">--</span>
              </h3>
              <span class="market-price-calculations text-profityd">
                <label class="usd-value js-usd-value">
                  <span class="full-text"></span>
                  <span class="short-text"></span>
                </label>
                <span class="mb-0 main-text" id="mYesterdayProfitUSDValue">--</span>
              </span>
              <div class="market-volume text-profityd">
                <label class="usd-value">
                  <span class="api-market"></span>
                  <span data-i18n="monitoringSection.volume.label"></span>
                </label>
                <span class="mb-0 main-text" id="mYesterdayMarketVolume">--</span>
              </div>
              <div class="market-price-calculations text-profityd js-estimated-gain">
                <label class="usd-value">
                  <span class="full-text" data-i18n="monitoringSection.gainFullText"></span>
                  <span class="short-text" data-i18n="monitoringSection.gainShortText"></span>
                </label>
                <span class="mb-0 main-text" id="mYesterdayProfitPercent">--</span>
                <span> %</span>
              </div>
            </div>
            <div class="clearfix"></div>
          </div>
        </div>
        <div class="col-lg-3 col-md-6">
          <div class="widget-bg-color-icon card-box fadeInDown animated" data-toggle="tooltip" data-placement="bottom" data-i18n="[title]monitoringSection.profitToday.title">
            <div class="bg-icon bg-icon-profittd pull-left">
              <i class="fa fa-line-chart text-info"></i>
            </div>
            <div class="text-right">
              <div class="profit-heading main-text">
                <p class="mb-0 text-profittd main-text" data-i18n="monitoringSection.profitToday.mainText"></p>
                <span class="open-brackets text-profittd" id="mTodayProfitSales">--</span>
                <span class="text-profittd close-brackets" data-i18n="monitoringSection.trade.label"></span>
              </div>
              <h3 class=" m-t-10 text-profittd main-text profit-text">
                <b class="counter" id="mTodayProfit">--</b>
                <span class="market m-l-5">--</span>
              </h3>
              <span class="market-price-calculations text-profittd">
                <label class="usd-value js-usd-value">
                  <span class="full-text"></span>
                  <span class="short-text"></span>
                </label>
                <span class="mb-0  main-text" id="mTodayProfitUSDValue">--</span>
              </span>
              <div class="market-volume text-profittd">
                <label class="usd-value">
                  <span class="api-market"></span>
                  <span data-i18n="monitoringSection.volume.label"></span>
                </label>
                <span class="mb-0 main-text" id="mTodayMarketVolume">--</span>
              </div>
              <div class="market-price-calculations text-profittd js-estimated-gain">
                <label class="usd-value">
                  <span class="full-text" data-i18n="monitoringSection.gainFullText"></span>
                  <span class="short-text" data-i18n="monitoringSection.gainShortText"></span>
                </label>
                <span class="mb-0  main-text" id="mTodayProfitPercent">--</span>
                <span> %</span>
              </div>
            </div>
            <div class="clearfix"></div>
          </div>
        </div>
        <div class="col-lg-3 col-md-6">
          <div class="widget-bg-color-icon card-box fadeInDown animated">
            <div class="bg-icon bg-icon-inverse pull-left">
              <i class="fa fa-cog text-info"></i>
            </div>
            <div class="text-right">
              <p class="mb-0 text-muted font-13 settings-text m-t-10" data-toggle="tooltip" data-placement="bottom" data-i18n="[title]monitoringSection.pot.title;[prepend]monitoringSection.pot.label">
                <span class="m-l-5 text-strange text-strange" id="mPendingOrderTime">--</span>
              </p>
              <p class="m-b-5 m-t-5 text-muted font-13 settings-text">
                <!-- Monitoring password set -->
                <span data-i18n="[title]monitoringSection.pot.pwTitle;monitoringSection.pot.pwText" data-toggle="tooltip" data-placement="bottom"></span>
                <span class="m-l-5 text-strange badge" id="mPasswordSet">--</span>
                <!-- Monitoring config enabled -->
                <span class="m-l-5" data-i18n="[title]monitoringSection.pot.pwTitle;monitoringSection.pot.conText" data-toggle="tooltip"
                  data-placement="bottom"></span>
                <span class="m-l-5 text-strange badge" id="mConfigEnabled">--</span>
              </p>
              <p class="m-b-5 m-t-10 text-muted font-13 settings-text">
                <span id="mSOMContainer">
                  <span data-toggle="tooltip" data-placement="bottom" id="mSellOnlyModeLabel" data-i18n="monitoringSection.pot.somText"></span>
                  <span class="m-l-5 text-strange badge" id="mSellOnlyMode">--</span>
                </span>
                <span class="m-l-5 red-tooltip" data-i18n="[title]monitoringSection.pot.somoTitle;monitoringSection.pot.somoText" data-toggle="tooltip"
                  data-placement="bottom"></span>
                <span class="m-l-5 text-strange badge" id="mSellOnlyModeOverride">--</span>
              </p>
              <p class="mb-0 text-muted font-13 settings-text" data-toggle="tooltip" data-placement="bottom" data-i18n="[title]monitoringSection.pot.ptvTitle">
                <span class="tdbitcoin" data-i18n="monitoringSection.pot.pLetter"></span>
                <span class="text-primary" data-i18n="monitoringSection.pot.tLetter"></span>
                <span data-i18n="monitoringSection.pot.ver"></span>
                <span class="m-l-5 text-strange" id="mVersion">--</span>
              </p>
              <p class="mb-0 text-muted font-13 settings-text" data-toggle="tooltip" data-placement="bottom" data-i18n="[title]monitoringSection.pot.guiVerTitle">
                <span data-i18n="monitoringSection.pot.guiVer"></span>
                <span class="m-l-5 text-strange">${version}</span>
              </p>
              <p class="mb-0 text-muted font-13 settings-text" data-toggle="tooltip" data-placement="bottom" data-i18n="[title]monitoringSection.pot.marketTitle;[prepend]monitoringSection.pot.marketLabel">
                <span class="m-l-5 text-strange js-exchange">--</span>
                <span class="m-l-5 text-strange" id="mMarket">--</span>
              </p>
            </div>
            <div class="clearfix"></div>
          </div>
        </div>
      </div>
      <!-- MONITORING 4th Row-->
      <div class="row monitoring-row">
        <div class="col-lg-3 col-md-6">
          <div class="widget-bg-color-icon card-box fadeInDown animated">
            <div class="bg-icon bg-icon-pairs pull-left">
              <i class="fa fa-houzz text-info"></i>
            </div>
            <div class="text-right">
              <h5 class="mt-0 m-b-5 font-16 text-primary totals-text m-t-10" data-toggle="tooltip" data-placement="bottom" data-i18n="[title]monitoringSection.pairsLog.title">
                <span class="full-text" data-i18n="monitoringSection.pairsLog.fullText"></span>
                <span class="short-text" data-i18n="monitoringSection.pairsLog.shortText"></span>
                <span class="text-primary m-l-5" id="mPairsLogCurrentValue">--</span>
              </h5>
              <h5 class="mt-0 m-b-5 font-16 text-dark totals-text" data-toggle="tooltip" data-placement="bottom" data-i18n="[title]monitoringSection.pairsLog.diffTitle">
                <span class="text-dark m-l-5" id="mPairsLogDifference">
                  <span class="percentage">--</span>
                  <span class="full-text" data-i18n="monitoringSection.pairsLog.diffFullText"></span>
                  <span class="short-text"> </span>
                  <span class="value m-l-5">--</span>
                </span>
              </h5>
              <h5 class="mt-0 m-b-5 font-16 text-success totals-text" data-toggle="tooltip" data-placement="bottom" data-i18n="[title]monitoringSection.pairsLog.boughtCostTitle">
                <span class="full-text" data-i18n="monitoringSection.pairsLog.bcFullText"></span>
                <span class="short-text" data-i18n="monitoringSection.pairsLog.bcShortText"></span>
                <span class="text-success m-l-5" id="mPairsLogBoughtCost">--</span>
              </h5>
              <small class="text-pairs mb-0 font-14 totals-title">
                <b data-i18n="monitoringSection.pairsLog.label"></b>
              </small>
              <div class="clearfix"></div>
            </div>
          </div>
        </div>
        <div class="col-lg-3 col-md-6">
          <div class="widget-bg-color-icon card-box fadeInDown animated">
            <div class="bg-icon bg-icon-dca pull-left">
              <i class="fa fa-hand-peace-o text-info"></i>
            </div>
            <div class="text-right">
              <h5 class="mt-0 m-b-5 font-16 m-t-10 text-primary totals-text" data-toggle="tooltip" data-placement="bottom" data-i18n="[title]monitoringSection.dcaLog.title">
                <span class="full-text" data-i18n="monitoringSection.dcaLog.fullText"></span>
                <span class="short-text" data-i18n="monitoringSection.dcaLog.shortText"></span>
                <span class="text-primary m-l-5" id="mDcLogCurrentValue">--</span>
              </h5>
              <h5 class="mt-0 m-b-5 font-16 text-dark totals-text" data-toggle="tooltip" data-placement="bottom" data-i18n="[title]monitoringSection.dcaLog.diffTitle">
                <span class="text-dark m-l-5" id="mDcLogDifference">
                  <span class="percentage">--</span>
                  <span class="full-text" data-i18n="monitoringSection.dcaLog.diffFullText"></span>
                  <span class="short-text"> </span>
                  <span class="value m-l-5">--</span>
                </span>
              </h5>
              <h5 class="mt-0 m-b-5 font-16 text-success totals-text" data-toggle="tooltip" data-placement="bottom" data-i18n="[title]monitoringSection.dcaLog.totalCostTitle">
                <span class="full-text" data-i18n="monitoringSection.dcaLog.tcFullText"></span>
                <span class="short-text" data-i18n="monitoringSection.dcaLog.tcShortText"></span>
                <span class="text-success m-l-5" id="mDcLogBoughtCost">--</span>
              </h5>
              <small class="text-dca mb-0 font-14 totals-title">
                <b data-i18n="monitoringSection.dcaLog.label"></b>
              </small>
            </div>
            <div class="clearfix"></div>
          </div>
        </div>
        <div class="col-lg-3 col-md-6">
          <div class="widget-bg-color-icon card-box fadeInDown animated">
            <div class="bg-icon bg-icon-pending pull-left">
              <i class="fa fa-gg text-info"></i>
            </div>
            <div class="text-right">
              <h5 class="mt-0 m-b-5 font-16 m-t-10 text-primary totals-text" data-toggle="tooltip" data-placement="bottom" data-i18n="[title]monitoringSection.pendingLog.title">
                <span class="full-text" data-i18n="monitoringSection.pendingLog.fullText"></span>
                <span class="short-text" data-i18n="monitoringSection.pendingLog.shortText"></span>
                <span class="text-primary m-l-5" id="mPendingLogCurrentValue">--</span>
              </h5>
              <h5 class="mt-0 m-b-5 font-16 text-dark totals-text" data-toggle="tooltip" data-placement="bottom" data-i18n="[title]monitoringSection.pendingLog.diffTitle">
                <span class="text-dark m-l-5" id="mPendingLogDifference">
                  <span class="percentage">--</span>
                  <span class="full-text" data-i18n="monitoringSection.pendingLog.diffFullText"></span>
                  <span class="short-text"> </span>
                  <span class="value m-l-5">--</span>
                </span>
              </h5>
              <h5 class="mt-0 m-b-5 font-16 text-success totals-text" data-toggle="tooltip" data-placement="bottom" data-i18n="[title]monitoringSection.pendingLog.targetValueTitle">
                <span class="full-text" data-i18n="monitoringSection.pendingLog.tvFullText"></span>
                <span class="short-text" data-i18n="monitoringSection.pendingLog.tvShortText"></span>
                <span class="text-success m-l-5" id="mPendingLogBoughtCost">--</span>
              </h5>
              <small class="text-pending mb-0 font-14 totals-title">
                <b data-i18n="monitoringSection.pendingLog.label"></b>
              </small>
            </div>
            <div class="clearfix"></div>
          </div>
        </div>
        <div class="col-lg-3 col-md-6">
          <div class="widget-bg-color-icon card-box fadeInDown animated">
            <div class="bg-icon bg-icon-sales pull-left">
              <i class="fa fa-balance-scale text-info"></i>
            </div>
            <div class="text-right">
              <h5 class="mt-0 m-b-5 font-16 m-t-10 text-primary totals-text" data-toggle="tooltip" data-placement="bottom" data-i18n="[title]monitoringSection.salesLog.title">
                <span class="full-text" data-i18n="monitoringSection.salesLog.fullText"></span>
                <span class="short-text" data-i18n="monitoringSection.salesLog.shortText"></span>
                <span class="text-primary m-l-5" id="mSalesLogBoughtCost">--</span>
              </h5>
              <h5 class="mt-0 m-b-5 font-16 text-dark totals-text" data-toggle="tooltip" data-placement="bottom" data-i18n="[title]monitoringSection.salesLog.diffTitle">
                <span class="text-dark m-l-5" id="mSalesLogDifference">
                  <span class="percentage">--</span>
                  <span class="full-text" data-i18n="monitoringSection.salesLog.diffFullText"></span>
                  <span class="short-text"> </span>
                  <span class="value m-l-5">--</span>
                </span>
              </h5>
              <h5 class="mt-0 m-b-5 font-16 text-success totals-text" data-toggle="tooltip" data-placement="bottom" data-i18n="[title]monitoringSection.salesLog.soldValueTitle">
                <span class="full-text" data-i18n="monitoringSection.salesLog.svFullText"></span>
                <span class="short-text" data-i18n="monitoringSection.salesLog.svShortText"></span>
                <span class="text-success m-l-5" id="mSalesLogCurrentValue">--</span>
              </h5>
              <small class="text-sales mb-0 font-14 totals-title">
                <b data-i18n="monitoringSection.salesLog.label"></b>
              </small>
            </div>
            <div class="clearfix"></div>
          </div>
        </div>
      </div>
    </div>
    <!-- end MONITORING -->