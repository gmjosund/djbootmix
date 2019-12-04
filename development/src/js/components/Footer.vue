<template>
  <b-navbar
    class="footer"
    type="dark"
    fixed="bottom"
    style="background-color: #36404a;box-shadow: 0 -2px 2px rgba(0, 0, 0, 0.03), 0 -1px 0 rgba(0, 0, 0, 0.03);"
  >
    <!-- Left aligned items -->
    <span
      class="version-container pull-left font-13 lr-no-float"
      data-toggle="tooltip"
      data-placement="top"
      data-i18n="[title]footer.ptVersion"
      data-original-title="ProfitTrailer Version"
      title
    >
      <label class="m-l-10">
        <span class="tdbitcoin">P</span>
        <span class="text-primary">T</span>
        <span>Ver:</span>
      </label>
      <span id="apiVersion">{{ serverData.version }}</span>
      <label class="m-l-10 hide-phone">
        GUI:
      </label>
      <span class="guiVersion hide-phone">{{app_version}}</span>
      <label class="m-l-10">
        <span>{{ `${serverData.exchange} ${serverData.market}` }}</span>
      </label>
    </span>
    <span class="time-block font-13 m-l-10 hide-phone">
      <span>{{currentTime}}</span>
      <label class="time-hdr">
        <span>Up:</span>
      </label>
      <span>{{uptime}}</span>
      <span
        class="m-l-10"
        v-html="getCurrencySymbol().symbol"
        v-bind:title="getCurrencySymbol().name"
      ></span>
    </span>
    <span class="float-left font-13 lr-no-float m-l-10 switch-block hide-phone">
        <span>
          <label v-tooltip:top="renderSOMTooltip(serverSettings)">SOM:</label>
          <span
            class="badge"
            v-bind:class="renderTrueFalseBadgeColor(serverSettings, 'sellOnlyMode')"
          >{{serverSettings | capitalizeAndGetData('sellOnlyMode')}}</span>
        </span>
        <label class="m-l-10" v-tooltip:top="'Sell Only Mode Override'">SOMO:</label>
        <span
          class="badge"
          v-bind:class="renderTrueFalseBadgeColor(serverSettings, 'sellOnlyModeOverride')"
        >{{serverSettings | capitalizeAndGetData('sellOnlyModeOverride')}}</span>
    </span>
    <span class="float-left font-13 lr-no-float m-l-10 switch-block hide-phone" v-if="serverData.pendingOrderTime">
      <label class="m-l-10" v-tooltip:top="'Pending Order Time'">POT:</label>
        <span
        >{{ serverData.pendingOrderTime | checkIf }}</span>
    </span>
    <!-- Center aligned items -->
    <span class="hide-phone">
    </span>

    <!-- Right aligned nav items -->
    <div class="pull-right text-muted font-13 lr-no-float footer-link d-sm-block hide-phone">
      <a href="https://profittrailer.com" target="_blank">Shop</a>
      <a href="https://wiki.profittrailer.com" target="_blank">Wiki</a>
      <a href="https://wiki.profittrailer.com/doku.php?id=discord" target="_blank">Discord</a>
      <a href="https://support.profittrailer.com/" target="_blank">Support</a>
    </div>
  </b-navbar>
</template>

<script>
import { mapActions, mapGetters } from "vuex";
import { FLAGS, DEFAULT_VALUE, CURRENCY_SYMBOLS } from "../helpers/constants";
import DateTimeHelper from "../mixins/DateTimeHelper.js";
import DOMHelper from "../mixins/DOMHelper";
export default {
  computed: {
    ...mapGetters({
      serverData: "monitoring/misc",
      serverSettings: "monitoring/settings"
    })
  },
  filters: {
    checkIf: function (data) {
      if (data) {
        return data;
      }
      return '--';
    }
  },
  data() {
    return {
      currentUTCTime: "",
      currentTime: "",
      uptime: "",
      app_version: APP_VERSION
    };
  },
  mixins: [DateTimeHelper, DOMHelper],
  methods: {
    getCurrencySymbol() {
      let currency = "USD";
      if (
        typeof this.serverData !== "undefined" &&
        typeof this.serverSettings !== "undefined"
      ) {
        if (this.serverSettings.hasOwnProperty("currency")) {
          currency = this.serverSettings.currency;
        }
        return CURRENCY_SYMBOLS[currency];
      }
      return CURRENCY_SYMBOLS["USD"];
    },
    renderLanguageFlagClass() {
      let currentLanguage = "ENUS";
      if (
        typeof this.serverData !== "undefined" &&
        typeof this.serverSettings !== "undefined"
      ) {
        if (this.serverSettings.hasOwnProperty("language")) {
          currentLanguage = this.serverSettings.language;
        }
        return `flag-icon-${FLAGS[currentLanguage.toLowerCase()].class}`;
      }
      return DEFAULT_VALUE;
    },
    renderLanguageFlagTitle() {
      let currentLanguage = "ENUS";
      if (
        typeof this.serverData !== "undefined" &&
        typeof this.serverSettings !== "undefined"
      ) {
        if (this.serverSettings.hasOwnProperty("language")) {
          currentLanguage = this.serverSettings.language;
        }
        return `${FLAGS[currentLanguage.toLowerCase()].title}`;
      }
      return DEFAULT_VALUE;
    },
    getUptimeForBot() {
      // To render time difference between current UTC time and up time for bot.
      if (
        typeof this.serverData === "undefined" ||
        typeof this.serverSettings === "undefined"
      ) {
        return DEFAULT_VALUE;
      }
      const currentUTCTime = this.getUTCDateObj();
      const upTime = new Date(this.serverSettings.upTime);
      // To get time difference in hours, we are dividing the difference by 36e5 (3600000).
      const timeDiff = Math.abs(currentUTCTime - upTime) / 36e5;
      return this.renderTimeDifference(timeDiff);
    },
    renderTimeForFooter() {
      // Refresh timer in footer component every 500ms.
      this.currentUTCTime = this.getUTCTimeOnly();
      this.currentTime = this.getCurrentTimeZoneTime(
        this.serverData.timeZoneOffset
      );
      this.uptime = this.getUptimeForBot();
      /* this.upTime = this.getUptimeForBot(); */
      setTimeout(this.renderTimeForFooter, 500);
    }
  },
  mounted() {
    // Render time in footer component when it is loaded.
    this.renderTimeForFooter();
    this.getUptimeForBot();
  }
};
</script>

<style scoped>
nav.navbar-dark.fixed-bottom {
  display: inline;
  text-align: center;
}
.footer {
  left: 0px !important;
  bottom: 0;
  right: 0;
  display: block;
  text-align: center;
  padding: 10px 20px;
  position: absolute;
}

.footer label {
  margin-bottom: 0px;
}

.m-l-10 {
  margin-left: 10px !important;
}

label {
  display: inline-block;
}

span.version-container label span.tdbitcoin {
  margin-right: -4px;
}

.font-13 {
  font-size: 13px;
}

.pull-left {
  float: left;
}

.pull-right {
  float: right;
}

.time-hdr {
  margin-left: 10px;
}

.footer-link a {
  text-decoration: none;
  color: #ced4da !important;
  padding: 0px 5px 0px 5px;
}

.footer-link a:hover {
  color: #7bc9e6;
}

.badge {
  display: inline-block;
  line-height: 1;
  text-align: center;
  font-weight: 600;
  padding: 3px 5px;
  font-size: 12px;
  margin-top: 1px;
  border-radius: 0.25rem;
  color: #ffffff;
}

.badge-success {
  color: #ffffff;
  background-color: #00b19d;
}

.badge-danger {
  color: #ffffff;
  background-color: #ef5350;
}

.footer .time-block {
  float: left;
}

@media screen and (max-width: 1250px) and (min-width: 420px) {
  .footer-link {
    /* display: block; */
    margin: 5px 0;
    margin-right: 0px;
  }

}

@media screen and (min-width: 1024px) {
  .footer {
    position: fixed;
  }
}

@media screen and (max-width: 1250px) and (min-width: 420px) {
  .footer .lr-no-float {
    float: none !important;
  }
}

@media screen and (max-width: 768px) and (orientation: landscape) {
  .hide-phone {
    display: none !important;
  }
}

@media screen and (max-width: 420px) {
  .hide-phone {
    display: none !important;
  }
}

@media screen and (max-width: 420px) {
  .version-container {
    float: none !important;
  }
}

@media screen and (max-width: 1440px) {
  .short-text {
    display: inline-block;
  }
  .full-text {
    display: none;
  }
}

@media screen and (max-width: 1250px) and (min-width: 420px) {
  .footer-link {
    display: block;
    margin: 5px 0;
    margin-right: 0;
  }
  .footer .lr-no-float {
    float: none !important;
  }
}

@media (max-width: 419px) {
  .footer {
    bottom: 0;
    padding: 10px 20px;
    position: unset !important;
    right: 0;
    left: 240px;
    text-align: center;
    display: block !important;
  }
  .footer .pull-right {
    float: unset;
  }
  .footer .time-block {
    display: inline-block;
    float: unset !important;
  }
  .footer .m-l-10 {
    margin-left: 0px !important;
  }
  .footer .switch-block {
    display: inline-block;
    float: unset !important;
  }
  .footer {
    text-align: center!important;
  }
}

.short-text {
  display: none;
}
</style>
