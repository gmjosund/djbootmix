<template>
  <b-navbar type="dark" fixed="top"
    class="navbar-custom"
    style="background-color: #36404a;box-shadow: 0 2px 2px rgba(0, 0, 0, 0.03), 0 1px 0 rgba(0, 0, 0, 0.03); display: block;padding-top: 5px;"
  >
    <div class="container-fluid"
      style="position: relative;"
    >
      <router-link class="navbar-brand"
        :to="{name: 'monitoring'}"
      >
        <img src="images/logo.png"
          alt="ProfitTrailer Logo"
          width="35"
          style="vertical-align: middle;"
        >
          <span class="heading-text"
            style="color: #FF9900;"
          >
            Profit<span style="color: #3bafda;">Trailer</span>
          </span>
        <span class="testModeContainerRibbon"
          id="testModeContainerRibbon"
          v-if="settings.testMode"
        >
          TESTMODE
        </span>
        <span class="bot-type"
          v-if="settings.licenseType"
        >
          {{ settings.licenseType }}
        </span>
      </router-link>
      <b-navbar-nav class="list-inline mb-0 monitor-summary hide-phone ticker-list"
        style="display: block;"
      >
        <li class="list-inline-item font-16 ticker-text">
          <label title="Balance"
            class="tdbitcoin"
          >BAL</label>:
          <span id="nBalanceVal"
            class="text-white"
            v-bind:title="misc.realBalance | normalizeValueWithComma(3)"
          >
            {{ misc.realBalance | normalizeValueWithComma(3)}}
          </span>
        </li>
        <li class="list-inline-item font-16 ticker-text">
          <label title="Total Current Value"
            class="text-primary"
          >TCV</label>:
          <span id="nTotalCurrentVal"
            v-bind:title="misc.totalCurrentValue | normalizeValueWithComma(3)"
            class="text-white"
          >
            {{ misc.totalCurrentValue | normalizeValueWithComma(3) }}
          </span>
        </li>
        <li class="list-inline-item font-16 ticker-text">
          <label title="Profit">
            <span>P</span>
          </label>:</li>
        <li class="list-inline-item font-16 ticker-text">
          <span>
            <span id="nLastWeekProfit"
              class="open-brackets text-white"
              v-bind:title="stats.totalProfitWeek | normalizeValueWithComma(3)"
            >
              {{ stats.totalProfitWeek | normalizeValueWithComma(3) }}
            </span>
            <span class="close-brackets text-white"
              title="Profit Last Week"
            >
              LW
            </span>
          </span>
        </li>
        <li class="list-inline-item font-16 ticker-text">
          <span>
            <span id="nYesterdayProfit"
              class="open-brackets text-white"
              v-bind:title="stats.totalProfitYesterday | normalizeValueWithComma(3)"
            >
              {{ stats.totalProfitYesterday | normalizeValueWithComma(3) }}
            </span>
            <span class="close-brackets text-white"
              title="Profit Yesterday"
            >
              YD
            </span>
          </span>
        </li>
        <li class="list-inline-item font-16 ticker-text">
          <span>
            <span id="nTodayProfit"
              class="open-brackets text-white"
              v-bind:title="stats.totalProfitToday | normalizeValueWithComma(3)"
            >
              {{ stats.totalProfitToday | normalizeValueWithComma(3) }}
            </span>
            <span class="close-brackets text-white"
              title="Profit Today"
            >
              TD
            </span>
          </span>
         </li>
        <li class="list-inline-item font-16 ticker-text">
            <label id="nMarket"
              title="BTCUSD Price"
              class="text-success"
            >
              BTC
            </label>:
            <span id="nMarketPrice"
              class="text-white"
              v-bind:title="misc.BTCUSDTPrice | normalizeValueWithComma(2)"
            >
              {{ misc.BTCUSDTPrice | normalizeValueWithComma(2) }}
            </span>
            <span id="nMarketPercChange"
              v-bind:class="misc.BTCUSDTPrice | normalizeValueWithComma(2) | renderClassByData"
              v-bind:title="misc.BTCUSDTPercChange * 100 | normalizeValueWithComma(2)  + ' %'"
            >
              ({{misc.BTCUSDTPercChange * 100 | normalizeValueWithComma(2) + ' %)'}}
            </span>
            <span v-if="misc.hasOwnProperty('BTCUSDTCustomPercChange')"
              v-bind:class="misc.BTCUSDTCustomPercChange | normalizeValueWithComma(2) | renderClassByData"
            >
              (C - {{misc.BTCUSDTCustomPercChange * 100 | normalizeValueWithComma(2) + ' %)'}}
            </span>
          </li>
        </b-navbar-nav>

        <!-- Right aligned nav items -->
        <b-navbar-nav class="ml-auto list-inline mb-0 monitor-summary">
          <li class="list-inline-item font-16 ticker-text hide-phone data-spinner">
            <span class="spinner-border text-success"
              v-if="isAPICallInProgress"
            ></span>
          </li>
          <li class="list-inline-item font-16 ticker-text">
            <span class="active-config-name"
              v-bind:title="settings.activeConfig"
            >
              {{ settings.activeConfig }}
            </span>
          </li>
          <li class="list-inline-item notification-list hide-phone toggle-screen">
            <a class="nav-link waves-light waves-effect"
                href="#"
                v-tooltip:bottom="'Fullscreen'"
                v-on:click="toggleFullScreen"
            >
                <i class="fa fa-expand noti-icon text-primary"></i>
            </a>
        </li>
        </b-navbar-nav>
      </div>
      <div class="container-fluid router-menu">
        <b-navbar-nav>
          <li class="nav-item">
            <router-link class="nav-link"
              :to="{name: 'monitoring'}"
            >
              <i class="fa fa-home"></i> Monitor
            </router-link>
          </li>
          <li class="nav-item">
            <router-link class="nav-link"
              :to="{name: 'possible-buys'}"
            >
              <i class="fa fa-optin-monster"></i>
              Possible Buys
              <b-badge variant="primary"
                class="records-count"
              >
                {{ possibleBuysAmount }}
              </b-badge>
            </router-link>
          </li>
          <li class="nav-item">
            <router-link class="nav-link"
              :to="{name: 'pairs'}"
            >
              <i class="fa fa-houzz"></i>
              Pairs
              <b-badge variant="primary"
                class="records-count"
              >
                {{ pairsAmount }}
              </b-badge>
            </router-link>
          </li>
          <li class="nav-item">
            <router-link class="nav-link"
              :to="{name: 'dca'}"
            >
              <i class="fa fa-hand-peace-o"></i>
              DCA
              <b-badge variant="primary"
                class="records-count"
              >
                {{ dcaAmount }}
              </b-badge>
            </router-link>
          </li>
          <li class="nav-item">
            <router-link class="nav-link"
              :to="{name: 'pending'}"
            >
              <i class="fa fa-gg"></i>
              Pending
              <b-badge variant="primary"
                class="records-count"
              >
                {{ pendingAmount }}
              </b-badge>
            </router-link>
          </li>
          <li class="nav-item">
            <router-link class="nav-link"
              :to="{name: 'buys'}"
            >
              <i class="fa fa-shopping-basket"></i>
              Buys
              <b-badge variant="primary"
                class="records-count"
              >
                {{ buyAmount }}
              </b-badge>
            </router-link>
          </li>
          <li class="nav-item">
            <router-link class="nav-link"
              :to="{name: 'sales'}"
            >
              <i class="fa fa-balance-scale"></i>
              Sales
              <b-badge variant="primary"
                class="records-count"
              >
                {{ salesAmount }}
              </b-badge>
            </router-link>
          </li>
          <li class="nav-item">
            <router-link class="nav-link"
              :to="{name: 'dust'}"
            >
              <i class="fa fa-recycle"></i>
              Dust
              <b-badge variant="primary"
                class="records-count"
              >
                {{ dustAmount }}
              </b-badge>
            </router-link>
          </li>
          <li class="nav-item">
            <router-link class="nav-link"
              :to="{name: 'apiLogs'}"
            >
              <i class="fa fa-align-left"></i>
              Logs
            </router-link>
          </li>
        </b-navbar-nav>
        <b-navbar-nav class="ml-auto list-inline">
          <li id="addWidgetsContainer"
            class="dropdown d-none d-lg-block list-inline-item notification-list"
          >
            <a class="nav-link dropdown-toggle mr-0 waves-effect waves-light"
              data-toggle="dropdown"
              href="#"
              role="button"
              aria-haspopup="false"
              aria-expanded="false"
            >
              <i class="mdi mdi-library-plus noti-feed-icon feed-icon"></i>
            </a>
            <div class="dropdown-menu dropdown-menu-right animate slideIn">
              <div class="dropdown-item noti-title">
                <h5 class="m-0 font-16">
                  Cards
                </h5>
              </div>
              <div class="dropdown-item notify-item"
                   v-if="showMsg()">
                  All cards are added.
              </div>
              <div class="dropdown-item notify-item"
                v-for="item in items"
                v-bind:key="items[item]"
                v-bind:id="item.component"
                v-on:click="addComponent"
                >
                  {{item["component"].toUpperCase()}}
                </div>
            </div>
          </li>
          <li class="dropdown d-none d-lg-block list-inline-item"
            id="languageDropdown"
          >
            <a class="nav-link dropdown-toggle mr-0 waves-effect waves-light"
              data-toggle="dropdown"
              href="#"
              role="button"
              aria-haspopup="false"
              aria-expanded="false"
            >
              <span class="flag-icon language-flag flag-icon-us"></span>
              <span class="align-middle">
                English
                <i class="mdi mdi-chevron-down"></i>
              </span>
            </a>
            <div class="dropdown-menu dropdown-menu-right animate slideIn">
                <!-- item-->
                <a href="javascript:void(0);"
                  class="dropdown-item notify-item"
                >
                  <span class="flag-icon language-flag flag-icon-de"></span>
                  <span class="align-middle region-name">German</span>
                </a>
                <!-- item-->
                <a href="javascript:void(0);"
                  class="dropdown-item notify-item"
                >
                  <span class="flag-icon language-flag flag-icon-it"></span>
                  <span class="align-middle region-name">Italian</span>
                </a>
                <!-- item-->
                <a href="javascript:void(0);"
                  class="dropdown-item notify-item"
                >
                  <span class="flag-icon language-flag flag-icon-es"></span>
                  <span class="align-middle region-name">Spanish</span>
                </a>
                <!-- item-->
                <a href="javascript:void(0);"
                  class="dropdown-item notify-item"
                >
                  <span class="flag-icon language-flag flag-icon-ru"></span>
                  <span class="align-middle region-name">Russian</span>
                </a>
              </div>
            </li>
          <li id="newDropdownContainer"
            class="dropdown d-none d-lg-block list-inline-item notification-list"
          >
            <a class="nav-link dropdown-toggle mr-0 waves-effect waves-light"
              data-toggle="dropdown"
              href="#"
              role="button"
              aria-haspopup="false"
              aria-expanded="false"
            >
              <i class="mdi mdi-newspaper noti-feed-icon feed-icon"></i>
              <span class="badge badge-danger rounded-circle noti-icon-badge"
                style="display: none"
              >
                2
              </span>
            </a>
            <div class="dropdown-menu dropdown-menu-right animate slideIn">
              <div class="dropdown-item noti-title">
                <h5 class="m-0 font-16">
                  News
                </h5>
              </div>
              <a class="dropdown-item notify-item">
                <div class="align-middle text-center">
                  No News.
                </div>
              </a>
            </div>
          </li>
          <li id="appNotificationContainer"
            class="dropdown d-none d-lg-block list-inline-item notification-list"
          >
            <a class="nav-link dropdown-toggle mr-0 waves-effect waves-light"
              data-toggle="dropdown"
              href="#"
              role="button"
              aria-haspopup="false"
              aria-expanded="false"
            >
              <i class="mdi mdi-bell-outline noti-feed-icon feed-icon"></i>
              <span class="badge badge-danger rounded-circle noti-icon-badge">
                2
              </span>
            </a>
            <div class="dropdown-menu dropdown-menu-right animate slideIn">
              <div class="dropdown-item noti-title">
                <h5 class="m-0 font-16">
                  Notifications
                </h5>
              </div>
              <a class="dropdown-item notify-item">
                <div class="align-middle text-center">
                  No Notifications.
                </div>
              </a>
            </div>
          </li>
          <li id="signalFeedContainer"
            class="dropdown d-none d-lg-block list-inline-item notification-list"
          >
            <a class="nav-link dropdown-toggle mr-0 waves-effect waves-light"
              data-toggle="dropdown"
              href="#"
              role="button"
              aria-haspopup="false"
              aria-expanded="false"
            >
              <i class="mdi mdi-calendar noti-feed-icon feed-icon"></i>
              <span class="badge badge-danger rounded-circle noti-icon-badge"
                style="display: none"
              >
                2
              </span>
            </a>
            <div class="dropdown-menu dropdown-menu-right animate slideIn">
              <div class="dropdown-item noti-title">
                <h5 class="m-0 font-16">
                  Subscriptions
                </h5>
              </div>
              <a class="dropdown-item notify-item">
                <div class="align-middle text-center">
                  No Subscriptions.
                </div>
              </a>
            </div>
          </li>
          <li class="sidebar-settings"
            id="settingsContainer"
          >
            <a class="nav-link right-bar-toggle waves-light waves-effect"
              id="settingsLink"
            >
              <i class="mdi mdi-settings noti-feed-icon"></i>
            </a>
          </li>
        </b-navbar-nav>
      </div>
  </b-navbar>
</template>

<script>
  import {mapActions, mapGetters } from 'vuex'
  export default {
    data() {
      return {
        items: [],
      }
    },
    computed: {
      ...mapGetters({
        possibleBuysAmount: 'possibleBuys/possibleBuysAmount',
        pairsAmount: 'pairs/pairsAmount',
        dcaAmount: 'dca/dcaAmount',
        pendingAmount: 'pending/pendingAmount',
        buyAmount: 'buys/buyAmount',
        salesAmount: 'sales/salesAmount',
        dustAmount: 'dust/dustAmount',
        misc: 'monitoring/misc',
        stats: 'monitoring/stats',
        settings: 'monitoring/settings',
        isAPICallInProgress: 'monitoring/isAPICallInProgress'
      })
    },
    methods: {
      // To implement fullscreen functionality.
      // Thanks to http://davidwalsh.name/fullscreen.
      launchFullScreen(element) {
        if (element.requestFullscreen) {
          element.requestFullscreen();
        } else if (element.mozRequestFullScreen) {
          element.mozRequestFullScreen();
        } else if (element.webkitRequestFullscreen) {
          element.webkitRequestFullscreen();
        } else if (element.msRequestFullscreen) {
          element.msRequestFullscreen();
        }
      },
      exitFullScreen() {
        if (document.exitFullscreen) {
          document.exitFullscreen();
        } else if (document.mozCancelFullScreen) {
          document.mozCancelFullScreen();
        } else if (document.webkitExitFullscreen) {
          document.webkitExitFullscreen();
        }
      },
      toggleFullScreen() {
        const fullScreenEnable = document.fullscreenEnabled || document.mozFullScreenEnabled ||
          document.webkitFullscreenEnabled;
        if (fullScreenEnable) {
          if (!document.fullscreenElement && !document.mozFullScreenElement &&
            !document.webkitFullscreenElement && !document.msFullscreenElement) {
            this.launchFullScreen(document.documentElement);
          } else {
            this.exitFullScreen();
          }
        }
      },
      showMsg (){
        if (this.items && this.items.length === 0){
          return true;
        }else {
          return false;
        }
      },
      addComponent(event) {
        var cardToAdd = event.target.id;
        var cardIndex = null;
        for (var item in this.items){
          if (this.items[item].component === cardToAdd){
            cardIndex = item;
          }
        }
        this.items.splice(cardIndex,1);
        this.$root.$emit('addCardsTOMonitoring', cardToAdd);
      }
    },
    mounted() {
      var componentList = localStorage.getItem('component_list') ? JSON.parse(localStorage.getItem('component_list')) : '' ; 
      if(componentList){
        var removedComponents = componentList.filter(obj => {
          return obj.visibility === false;
        })
      }
      if (removedComponents){
        this.items = removedComponents;
      }
      this.$root.$on('addComponentsToDropdown',(item) => {
        this.items.push(item);
      });
    },
    beforeDestroy() {
      this.$root.$off('addComponentsToDropdown');
    }
  }
</script>

<style scoped>
.navbar-custom {
  background-color: #3bafda;
  position: fixed;
  left: 0;
  right: 0;
  padding: 0 0 0 12px;
  z-index: 100;
  display: block;
}

.navbar-brand {
  font-weight: bold;
}

.container-fluid {
  height: 100%;
}

.monitor-summary {
  padding-top: 0.3125rem;
}

.open-brackets:before {
  content: '(';
  float: left;
}

.close-brackets:after {
  content: ')';
  float: right;
}

.navbar-custom .list-inline-item label {
  font-weight: bold;
}

.active-config-name {
  cursor: pointer;
  white-space: nowrap;
  vertical-align: middle;
  line-height: normal;
  height: 100%;
}

.toggle-screen > a {
  padding-top: 0px;
}

.spinner-border {
  width: 1.5rem;
  height: 1.5rem;
}

.data-spinner {
  margin-left: 8px;
}

.ticker-list {
  margin-left: 10px;
}

.router-menu {
  padding-top: 5px;
  padding-bottom: 5px;
}

.router-link-exact-active.router-link-active {
  color: #3bafda !important;
  font-weight: bolder;
}

.hide {
  display: none;
}

.dropdown-toggle::after {
  display:none;
}

@media (min-width: 992px) {
  .animate {
    animation-duration: 0.3s;
    -webkit-animation-duration: 0.3s;
    animation-fill-mode: both;
    -webkit-animation-fill-mode: both;
  }
}

.slideIn {
  -webkit-animation-name: slideIn;
  animation-name: slideIn;
}

.dropdown-menu {
  box-shadow: 0 0 15px 0 rgba(40,48,55,.6);
  border: 1px solid #424d58;
  background-clip: padding-box;
}

.dropdown-menu .dropdown-item {
  color: #a8b5c3;
  padding: .375rem 1.2rem;
}

.dropdown-menu .dropdown-item:hover {
  color: #e1e9ee;
  text-decoration: none;
  background-color: #3a4550;
}

.dropdown-item .region-name {
  padding-left: 6px;
}

#newDropdownContainer [data-toggle="dropdown"],
#appNotificationContainer [data-toggle="dropdown"],
#signalFeedContainer [data-toggle="dropdown"],
#addWidgetsContainer [data-toggle="dropdown"],
.sidebar-settings #settingsLink {
  padding: 0px;
  cursor: pointer;
}

.noti-feed-icon.feed-icon,
.sidebar-settings i {
  font-size: 25px;
  color: rgba(255, 255, 255, 0.7);
}

#newDropdownContainer .dropdown-menu,
#appNotificationContainer .dropdown-menu,
#signalFeedContainer .dropdown-menu {
  width: 335px;
  max-width: none !important;
}

.notification-list .noti-icon-badge {
  display: inline-block;
  position: absolute;
  top: 0px;
  right: 0px;
}

.dropdown {
  position: relative;
}

.notification-list .noti-title {
  margin-bottom: 0;
  width: auto;
  padding: 12px 20px;
}

.notification-list .notify-item {
  padding: 10px 20px;
}

.testModeContainerRibbon {
  display: inline;
  position: absolute;
  bottom: 0px;
  left: 70px;
  font-size: 10px !important;
  color: #8a929a;
}

.navbar-brand {
  margin-right: 1.5rem;
}

.bot-type {
  font-weight: bold;
  vertical-align: top;
  line-height: 55px;
  font-size: 10px;
  top: -6px;
  left: 155px;
  position: absolute;
  color: #8a929a;
}

@keyframes slideIn {
  0% {
    transform: translateY(1rem);
    opacity: 0;
  }
  100% {
    transform:translateY(0rem);
    opacity: 1;
  }
  0% {
    transform: translateY(1rem);
    opacity: 0;
  }
}

@-webkit-keyframes slideIn {
  0% {
    -webkit-transform: transform;
    -webkit-opacity: 0;
  }
  100% {
    -webkit-transform: translateY(0);
    -webkit-opacity: 1;
  }
  0% {
    -webkit-transform: translateY(1rem);
    -webkit-opacity: 0;
  }
}
</style>
