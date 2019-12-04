    <!-- Top Bar Start -->
    <div class="topbar">
      <!-- LOGO -->
      <div class="topbar-left">
        <div>
          <span class="testModeContainerRibbon" id="testModeContainerRibbon" data-i18n="summaryItems.testMode.label"></span>
          <h1 class="main-heading">
            <a href="monitoring" class="logo">
              <img src="images/Logo.png" alt="ProfitTrailer" height="35" width="35">
              <span class="heading-text">
                <span class="trailer" data-i18n="logo.trailer"></span>
                <span class="tdbitcoin" data-i18n="logo.profit"></span>
              </span>
            </a>
          </h1>
          <span class="bot-type" id="botType"></span>
        </div>
      </div>
      <!-- Button mobile view to collapse sidebar menu -->
      <nav class="navbar-custom header-summary-container">
        <ul class="list-inline float-right mb-0">
          <li class="list-inline-item notification-feed-list">
            <span id="selectedLng"></span>
          </li>
        </ul>
        <ul class="list-inline float-right mb-0">
          <li class="list-inline-item notification-feed-list hide-phone">
            <a class="nav-link waves-light waves-effect" href="#" id="btn-fullscreen" data-toggle="tooltip" data-placement="bottom" data-i18n="[title]summaryItems.imageTitles.fullScreen">
              <i class="fa fa-expand noti-feed-icon text-primary"></i>
            </a>
          </li>
          <div class="dropdown-menu dropdown-menu-right profile-dropdown" aria-labelledby="Preview">
            <!-- item-->
            <a href="javascript:void(0);" class="dropdown-item notify-item">
              <i class="fa fa-unlock"></i>
            </a>
          </div>
        </ul>
        <ul class="list-inline float-right mb-0 text-primary">
          <li class="list-inline-item notification-feed-list">
            <a class="nav-link right-bar-toggle waves-light waves-effect" id="settingsLink">
              <i class="mdi mdi-settings noti-feed-icon"></i>
            </a>
          </li>
        </ul>
        <ul class="list-inline float-right mb-0 text-primary updated-on-container ">
          <li class="list-inline-item  text-primary">
            <div class="led-box pt-13">
              <div class="led-yellow-blink spinner"></div>
              <div class="led-green2" id="dv2LastUpdatedOn"></div>
            </div>
          </li>
        </ul>
        <ul class="list-inline float-right text-right m-t-15 mb-0 text-primary specialul selected-config-container">
          <li class="selectedConfigDiv list-inline-item   font-16 ticker-text text-primary  mr-3">
            <span id="nSelectedConfig" data-toggle="tooltip" data-placement="bottom">-</span>
          </li>
        </ul>
        <ul class="list-inline menu-left float-left mb-0">
          <li class="float-left">
            <button class="button-menu-mobile open-left waves-light waves-effect">
              <i class="fa fa-bars text-primary"></i>
            </button>
          </li>
        </ul>
        <ul class="list-inline mb-0 monitor-summary hide-phone">
          <li class="list-inline-item tdbitcoin font-16 ticker-text">
            <label data-toggle="tooltip" data-placement="bottom" data-i18n="[title]summaryItems.balance.title;summaryItems.balance.label"></label>:
            <span id="nBalanceVal">--</span>
          </li>
          <li class="list-inline-item text-primary font-16 ticker-text">
            <label data-toggle="tooltip" data-placement="bottom" data-i18n="[title]summaryItems.tcv.title;summaryItems.tcv.label"></label>:
            <span id="nTotalCurrentVal">--</span>
          </li>
          <li class="list-inline-item text-muted font-16 ticker-text">
            <label data-toggle="tooltip" data-placement="bottom" data-i18n="[title]summaryItems.profit.title">
              <span class="full-text" data-i18n="summaryItems.profit.fullText"></span>
              <span class="short-text" data-i18n="summaryItems.profit.label"></span>
            </label>:</li>
          <li class="list-inline-item text-profitlw font-16 ticker-text">
            <span>
              <span id="nLastWeekProfit" class="open-brackets">-</span>
              <span data-toggle="tooltip" data-placement="bottom" class="close-brackets" data-i18n="[title]summaryItems.lw.title;summaryItems.lw.label"></span>
            </span>
          </li>
          <li class="list-inline-item text-profityd font-16 ticker-text">
            <span>
              <span id="nYesterdayProfit" class="open-brackets">-</span>
              <span data-toggle="tooltip" data-placement="bottom" data-i18n="[title]summaryItems.yd.title;summaryItems.yd.label" class="close-brackets"></span>
            </span>
          </li>
          <li class="list-inline-item text-profittd font-16 ticker-text">
            <span>
              <span id="nTodayProfit" class="open-brackets">-</span>
              <span data-toggle="tooltip" data-placement="bottom" data-i18n="[title]summaryItems.td.title;summaryItems.td.label" class="close-brackets"></span>
            </span>
          </li>
          <li class="list-inline-item font-16 text-btctrend ticker-text">
            <label id="nMarketTrendLabel" data-toggle="tooltip" data-placement="bottom" title="">
              <span class="full-text" data-i18n="summaryItems.trend.title"></span>
              <span class="short-text" data-i18n="summaryItems.trend.label"></span>
            </label>:
            <span class="trend-val">
              <span id="nMarketTrend" class="open-brackets close-brackets">-</span>
            </span>
          </li>
          <li class="list-inline-item tdbitcoin font-16 ticker-text">
            <label id="nMarket" data-toggle="tooltip" data-placement="bottom" title="">-</label>:
            <span id="nMarketPrice">-</span>&nbsp;
            <span id="nMarketPercChange" data-i18n="summaryItems.NotAvailable.label"></span>
          </li>
        </ul>
      </nav>
    </div>
    <!-- Top Bar End -->
    <!-- ========== Left Sidebar Start ========== -->
    <div class="left side-menu">
      <div class="sidebar-inner slimscrollleft">
        <!--- Divider -->
        <div id="sidebar-menu">
          <ul>
            <li id="defaultPage">
              <a href="monitoring" class="waves-effect waves-primary monitoring">
                <i class="fa fa-home"></i>
                <span data-i18n="sidebar.monitoring"></span>
              </a>
            </li>
            <li>
              <a href="possible-buys-log" class="waves-effect waves-primary possible-buys-log">
                <i class="fa fa-optin-monster"></i>
                <span data-i18n="sidebar.possibleBuyLog"></span>
                <span class="text-dark pull-right m-t-4 records-count badge badge-primary" id="possibleBuyLogLength">--</span>
              </a>
            </li>
            <li>
              <a href="pairs-log" class="waves-effect waves-primary pairs-log">
                <i class="fa fa-houzz"></i>
                <span data-i18n="sidebar.pairsLog"></span>
                <span class="text-dark pull-right m-t-4 records-count badge badge-primary" id="pairsLogLength">--</span>
              </a>
            </li>
            <li>
              <a href="dca-log" class="waves-effect waves-primary dca-log">
                <i class="fa fa-hand-peace-o"></i>
                <span data-i18n="sidebar.dcaLog"></span>
                <span class="text-dark pull-right m-t-4 records-count badge badge-primary" id="dcLogLength">--</span>
              </a>
            </li>
            <li>
              <a href="pending-log" class="waves-effect waves-primary pending-log">
                <i class="fa fa-gg"></i>
                <span data-i18n="sidebar.pendingLog"></span>
                <span class="text-dark pull-right m-t-4 records-count badge badge-primary" id="pendingLogLength">--</span>
              </a>
            </li>
            <li>
              <a href="buy-log" class="waves-effect waves-primary buy-log">
                <i class="fa fa-shopping-basket"></i>
                <span data-i18n="sidebar.buyLog"></span>
                <span class="text-dark pull-right m-t-4 records-count badge badge-primary" id="buyLogLength">--</span>
              </a>
            </li>
            <li>
              <a href="sales-log" class="waves-effect waves-primary sales-log">
                <i class="fa fa-balance-scale"></i>
                <span data-i18n="sidebar.salesLog"></span>
                <span class="text-dark pull-right m-t-4 records-count badge badge-primary" id="salesLogLength">--</span>
              </a>
            </li>
            <li>
              <a href="dust-log" class="waves-effect waves-primary dust-log">
                <i class="fa fa-recycle"></i>
                <span data-i18n="sidebar.dustLog"></span>
                <span class="text-dark pull-right m-t-4 records-count badge badge-primary" id="dustLogLength">--</span>
              </a>
            </li>
            <!-- API logs -->
            <li id="APILogsMenuMobile">
                <a href="api-logs" class="waves-effect waves-primary api-logs">
                  <i class="fa fa-align-left"></i>
                  <span data-i18n="sidebar.apiLogs"></span>
                </a>
            </li>
            <li class="has_sub" id="configMenu">
              <a href="javascript:void(0);" class="waves-effect waves-primary config">
                <i class="fa fa-wrench"></i>
                <span data-i18n="sidebar.config"></span>
                <span class="menu-arrow"></span>
              </a>
              <ul class="pro-tools-submenu">
                <li>
                  <a href="active-config">
                    <span data-i18n='sidebar.activeConfig'></span>
                  </a>
                </li>
                <li>
                  <a href="other-configs">
                    <span data-i18n='sidebar.otherConfigs'></span>
                  </a>
                </li>
              </ul>
            </li>
            <li id="statsMobile" style="display:none;">
              <a href="stats" class="waves-effect waves-primary stats">
                <i class="fa fa-align-left"></i>
                <span data-i18n="sidebar.stats"></span>
              </a>
            </li>
              <!-- PTN -->
            <li class="has_sub" id="configMenu">
                <a href="ptn-settings" class="waves-effect waves-primary ptn-settings">
                    <i class="fa fa-wrench"></i>
                    <span data-i18n="sidebar.notifications"></span>
                    <span class="menu-arrow"></span>
                </a>
            </li>
          </ul>
          <div class="clearfix"></div>
        </div>
        <div class="clearfix"></div>
      </div>
    </div>
    <div class="row sub-header" id="subHeader">
      <div class="col-sm-12 sub-header-content">
        <div class="page-title-box font-13 second-header-container">
          <h2 class="page-title tab-heading" data-i18n="monitoringSection.heading"></h2>
          <!-- Top nav -->
          <div id="topNav">
            <ul class="navigation-menu">
              <!-- Monitoring -->
              <li class="has-submenu">
                <a href="monitoring">
                  <i class="fa fa-home"></i>
                  <p class="title">
                    <!-- We are applying font weight bold style to active menu item
                        which will increase below span width and move other other menu items.
                        To fix that we have added visibility hidden font weight bold span. -->
                    <span data-i18n="sidebar.monitoring"></span>
                    <span data-i18n="sidebar.monitoring"></span>
                  </p>
                </a>
              </li>
              <!-- Possible buy log -->
              <li class="has-submenu">
                <a href="possible-buys-log">
                  <i class="fa fa-optin-monster"></i>
                  <p class="title">
                    <span data-i18n="sidebar.possibleBuyLog"></span>
                    <span data-i18n="sidebar.possibleBuyLog"></span>
                  </p>
                  <span class="records-count badge badge-primary" id="topPossibleBuyLogLength">--</span>
                </a>
              </li>
              <!-- Pairs log -->
              <li class="has-submenu">
                <a href="pairs-log">
                  <i class="fa fa-houzz"></i>
                  <p class="title">
                    <span data-i18n="sidebar.pairsLog"></span>
                    <span data-i18n="sidebar.pairsLog"></span>
                  </p>
                  <span class="records-count badge badge-primary" id="topPairsLogLength">--</span>
                </a>
              </li>
              <!-- DCA log -->
              <li class="has-submenu">
                <a href="dca-log">
                  <i class="fa fa-hand-peace-o"></i>
                  <p class="title">
                    <span data-i18n="sidebar.dcaLog"></span>
                    <span data-i18n="sidebar.dcaLog"></span>
                  </p>

                  <span class="records-count badge badge-primary" id="topDcLogLength">--</span>
                </a>
              </li>
              <!-- Pending log -->
              <li class="has-submenu">
                <a href="pending-log">
                  <i class="fa fa-gg"></i>
                  <p class="title">
                    <span data-i18n="sidebar.pendingLog"></span>
                    <span data-i18n="sidebar.pendingLog"></span>
                  </p>
                  <span class="records-count badge badge-primary" id="topPendingLogLength">--</span>
                </a>
              </li>
              <!-- Buy log -->
              <li class="has-submenu">
                <a href="buy-log">
                  <i class="fa fa-shopping-basket"></i>
                  <p class="title">
                    <span data-i18n="sidebar.buyLog"></span>
                    <span data-i18n="sidebar.buyLog"></span>
                  </p>
                  <span class="records-count badge badge-primary" id="topBuyLogLength">--</span>
                </a>
              </li>
              <!-- Sales log -->
              <li class="has-submenu">
                <a href="sales-log">
                  <i class="fa fa-balance-scale"></i>
                  <p class="title">
                    <span data-i18n="sidebar.salesLog"></span>
                    <span data-i18n="sidebar.salesLog"></span>
                  </p>
                  <span class="records-count badge badge-primary" id="topSalesLogLength">--</span>
                </a>
              </li>
              <!-- Dust log -->
              <li class="has-submenu">
                <a href="dust-log">
                  <i class="fa fa-recycle"></i>
                  <p class="title">
                    <span data-i18n="sidebar.dustLog"></span>
                    <span data-i18n="sidebar.dustLog"></span>
                  </p>
                  <span class="records-count badge badge-primary" id="topDustLogLength">--</span>
                </a>
              </li>
              <!-- API logs -->
              <li class="has-submenu" id="APILogsMenuDesktop">
                  <a href="api-logs">
                    <i class="fa fa-align-left"></i>
                    <p class="title">
                      <span data-i18n="sidebar.apiLogs"></span>
                      <span data-i18n="sidebar.apiLogs"></span>
                    </p>
                  </a>
              </li>
              <!-- Config -->

              <li class="has-submenu" id="topConfigMenuDesktop">
                <a href="javascript:void(0);">
                  <i class="fa fa-wrench"></i>
                  <p class="title">
                    <span data-i18n="sidebar.config"></span>
                    <span data-i18n="sidebar.config"></span>
                  </p>
                </a>
                <div class="dropdown-content">
	              <a href="active-config">
	                <p class="title">
	                    <span data-i18n="sidebar.activeConfig"></span>
	                    <span data-i18n="sidebar.activeConfig"></span>
	                </p>
	              </a>
	              <a href="other-configs">
	                <p class="title">
	                    <span data-i18n="sidebar.otherConfigs"></span>
	                    <span data-i18n="sidebar.otherConfigs"></span>
	                </p>
	              </a>
	            </div>
              </li>
              <li id="StatsDesktop" style="display:none;">
                  <a href="stats">
                    <i class="fa fa-align-left"></i>
                    <p class="title">
                      <span data-i18n="sidebar.stats"></span>
                      <span data-i18n="sidebar.stats"></span>
                    </p>
                  </a>
              </li>
              <!-- PTN -->
              <li class="has-submenu">
                  <a href="ptn-settings">
                      <i class="fa fa-bell"></i>
                      <p class="title">
                          <span data-i18n="sidebar.notifications"></span>
                          <span data-i18n="sidebar.notifications"></span>
                      </p>
                  </a>
              </li>
            </ul>
          </div>
          <!-- News dropdown -->
          <div class="notification-feed-container">
          <span class="shorting-status" data-i18n="sidebar.shorting"></span>
            <ul id="newsFeedContainer" class="list-inline mb-0 notifications-feed-container navbar-custom">
              <li class="list-inline-item dropdown notification-feed-list">
                <a class="nav-link dropdown-toggle arrow-none waves-light waves-effect" data-toggle="dropdown" href="#" role="button" aria-haspopup="false"
                  aria-expanded="false" id="lnkToggleFeed">
                  <i class="mdi mdi-bullhorn noti-feed-icon feed-icon"></i>
                  <span class="badge badge-danger noti-feed-icon-badge"></span>
                </a>
                <div class="dropdown-menu dropdown-menu-right dropdown-arrow dropdown-menu-lg" aria-labelledby="Preview">
                  <!-- item-->
                  <div class="dropdown-item noti-title">
                    <h5 class="font-16" data-i18n="monitoringSection.feed"></h5>
                  </div>
                  <!-- item-->
                  <div id="appFeed">
                  </div>
                  <!-- All-->
                  <a id="lnkViewFeed" href="#" class="dropdown-item notify-item notify-all">
                  </a>
                </div>
              </li>
            </ul>
            <ul id="appNotificationContainer" class="list-inline mb-0 notifications-feed-container navbar-custom">
              <li class="list-inline-item dropdown notification-feed-list">
                <a class="nav-link dropdown-toggle arrow-none waves-light waves-effect" data-toggle="dropdown" href="#" role="button" aria-haspopup="false"
                  aria-expanded="false" id="lnkToggleNotification">
                  <i class="mdi mdi-bell noti-feed-icon"></i>
                  <span class="badge badge-danger noti-feed-icon-badge"></span>
                </a>
                <div class="dropdown-menu dropdown-menu-right dropdown-arrow dropdown-menu-lg" aria-labelledby="Preview">
                  <!-- item-->
                  <div class="dropdown-item noti-title">
                    <h5 class="font-16" data-i18n="monitoringSection.notification"></h5>
                  </div>
                  <!-- item-->
                  <div id="appNotifications">
                  </div>
                  <!-- All-->
                  <a id="lnkViewNotification" href="#" class="dropdown-item notify-item notify-all">
                  </a>
                </div>
              </li>
            </ul>
            <ul id="signalFeedContainer" class="list-inline mb-0 notifications-feed-container navbar-custom">
              <li class="list-inline-item dropdown notification-feed-list">
                <a class="nav-link dropdown-toggle arrow-none waves-light waves-effect" data-toggle="dropdown" href="#" role="button" aria-haspopup="false"
                  aria-expanded="false" id="lnkToggleSignal">
                  <i class="mdi mdi-calendar noti-feed-icon"></i>
                  <span class="badge badge-danger noti-feed-icon-badge hide"></span>
                </a>
                <div class="dropdown-menu dropdown-menu-right dropdown-arrow dropdown-menu-lg" aria-labelledby="Preview">
                  <!-- item-->
                  <div class="dropdown-item noti-title">
                    <h5 class="font-16" data-i18n="monitoringSection.signal"></h5>
                  </div>
                  <!-- item-->
                  <div id="signalNotification">
                  </div>
                  <!-- All-->
                  <a id="lnkViewSignals" class="dropdown-item notify-item notify-all">
                  </a>
                </div>
              </li>
            </ul>
          </div>
          <!-- End news dropdown -->
          <div class="clearfix"></div>
        </div>
      </div>
    </div>
    <!-- Left Sidebar End -->
