import { DEFAULT_VALUE, HIDE_MARKET_PRICE_ROW_COMPARISION, BASE_CURRENCY } from '../helpers/constants';

export default {
  methods: {
    renderOnOffBadgeColor(data, prop) {
      // Rendering badge color based on password and config state.
      if (typeof data === 'undefined') {
        return DEFAULT_VALUE;
      }
      if (data[prop] === false) {
        return 'badge-danger';
      } else if (data[prop] === true) {
        return 'badge-success';
      }
      return DEFAULT_VALUE;
    },
    renderBadgeColorForConfig(data) {
      // Rendering badge color based enableConfig and passwordSet boolean.
      if (typeof data === 'undefined') {
        return DEFAULT_VALUE;
      }
      if (data.passwordSet === false || data.enableConfig === false) {
        return 'badge-light-danger';
      } else if (data.enableConfig === true) {
        return 'badge-light-success';
      }
      return DEFAULT_VALUE;
    },
    renderTrueFalseBadgeColor(data, prop) {
      // Rendering badge color based on SOM and SOMO state.
      if (typeof data === 'undefined') {
        return DEFAULT_VALUE;
      }
      if (data[prop] === false) {
        return 'badge-light-success';
      } else if (data[prop] === true) {
        return 'badge-light-danger';
      }
      return DEFAULT_VALUE;
    },
    renderSOMTooltip(data) {
      // Returns empty string if sellOnlyMode is false or sellOnlyModeTrigger is not defined.
      // Returns sellOnlyModeTrigger value as tooltip when sellOnlyMode is true
      // and sellOnlyModeTrigger is defined.
      if (typeof data === 'undefined') {
        return '';
      }
      return data.sellOnlyMode && data.sellOnlyModeTrigger ? data.sellOnlyModeTrigger : '';
    },
    getCurrentValue(prop) {
      // To get current value of respective summary table based on prop.
      if (typeof this.summaryTableData[prop] === 'undefined') {
        return DEFAULT_VALUE;
      }
      return this.$options.filters.checkAndAddPrecision(
        this.summaryTableData[prop].currentValue, this.serverData.currentMarketPrecision);
    },
    getBoughtCost(prop) {
      // To get bought cost of respective summary table based on prop.
      if (typeof this.summaryTableData[prop] === 'undefined') {
        return DEFAULT_VALUE;
      }
      return this.$options.filters.checkAndAddPrecision(
        this.summaryTableData[prop].boughtCost, this.serverData.currentMarketPrecision);
    },
    getDifference(prop) {
      // To get difference percentage and difference between current value and bought cost
      // of respective summary table based on prop.
      if (typeof this.summaryTableData[prop] === 'undefined') {
        return {
          diffValue: DEFAULT_VALUE,
          diffPer: DEFAULT_VALUE,
        };
      }
      let difference = this.addDifference(this.summaryTableData[prop].currentValue,
        this.summaryTableData[prop].boughtCost, false);
      if (typeof difference.diffValue === 'undefined') {
        difference.diffValue = DEFAULT_VALUE;
      }
      if (typeof difference.diffPer === 'undefined') {
        difference.diffPer = DEFAULT_VALUE;
      }
      return difference;
    },
    getTablesInfo(data) {
      // To get summary table info as object.
      if (!data.settings) {
        return false;
      }
      const summaryTables = {
        'pairs-log': ['gainLogData', 'watchModeLogData'],
        'pending-log': 'pendingLogData',
        'dca-log': 'dcaLogData',
        'sales-log': 'sellLogData',
      };
      let returnObj = {};
      // Loop over the tables to get summary values.
      const summaryTableKeys = Object.keys(summaryTables);
      for (let i = 0; i !== summaryTableKeys.length; i += 1) {
        const summaryItem = summaryTableKeys[i];
        let summaryTableProp = summaryTables[summaryItem];
        // Some routes have two json properties, we have to concat both properties data.
        let summaryTableData = Array.isArray(summaryTableProp)
          && Array.isArray(data[summaryTableProp[1]])
          ? data[summaryTableProp[0]].concat(data[summaryTableProp[1]]) : data[summaryTableProp];
        summaryTableData = summaryTableData || [];
        let currentValue = 0;
        let boughtCost = 0;
        let currentValueTmp;
        if (summaryItem === 'sales-log') {
          for (let j = 0; j < summaryTableData.length; j += 1) {
            let currentObjSalesLog = summaryTableData[j];
            currentValueTmp = (currentObjSalesLog.soldAmount * currentObjSalesLog.currentPrice);
            currentValue += this.getCurrentValueBsdOnfee(currentObjSalesLog, currentValueTmp);
            boughtCost += currentObjSalesLog.soldAmount *
              currentObjSalesLog.averageCalculator.avgPrice;
          }
        } else {
          for (let k = 0; k < summaryTableData.length; k += 1) {
            let currentObj = summaryTableData[k];
            currentValueTmp = (currentObj.averageCalculator.totalAmount *
              currentObj.currentPrice);
            currentValue += this.getCurrentValueBsdOnfee(currentObj, currentValueTmp);
            boughtCost += currentObj.averageCalculator.totalCost;
          }
        }
        returnObj[summaryItem] = {
          currentValueConvertedValue: this.normalizeValueWithCommas(currentValue, 'display', '', '', '', this.dtCache.currentMarketPrecision),
          boughtCostConvertedValue: this.normalizeValueWithCommas(boughtCost, 'display', '', '', '', this.dtCache.currentMarketPrecision),
          currentValue,
          boughtCost,
        };
      }
      return returnObj;
    },
    renderAlertBox(title, text, icon, cancelBtnText, confirmBtnText) {
      // To return swal method which will render alert box when called with proper parameters.
      return swal({
        title,
        text,
        icon,
        buttons: {
          cancel: {
            text: cancelBtnText,
            visible: true,
            value: null
          },
          confirm: {
            text: confirmBtnText,
            visible: true,
            value: true
          }
        }
      });
    }
  },
};
