import chroma from 'chroma-js';
import $ from 'jquery';
import DateTimeHelper from '../mixins/DateTimeHelper';
import { DEFAULT_PRECISION, PROFIT_GREEN, POSITIVE_CLASS, NEGATIVE_CLASS,
  BASE_CURRENCY, HIDE_PROFIT_MARKET_AND_ESTIMATED_USD, DEFAULT_VALUE,
  POSITIVE_CLASS_TEXT, NEGATIVE_CLASS_TEXT, POSITIVE_BADGE, NEGATIVE_BADGE
} from '../helpers/constants';
import dataTable from '../components/dataTable';
import Store from '../vuex/index'


export default {
  components: {
    dataTable,
  },  
  mixins: [DateTimeHelper],
  computed: {
    dtCache() {
      var serverData = Store.state.header.properties;
      const tmpData = {
        exchange: serverData.exchange,
        marketingSite: serverData.exchangeUrl,
        timeZoneOffset: serverData.timeZoneOffset,
        market: serverData.market,
        marketPrice: serverData[`${serverData.market}USDTPrice`]
          ? serverData[`${serverData.market}USDTPrice`] : 1,
        currency: serverData.currency,
        currencyValue: serverData.currencyValue,
        currencySymbol: serverData.currencySymbol,
        currentMarketPrecision: serverData.currentMarketPrecision,
        getOnlyCurrentValueForSalesLog: this.getCurrentValueForSalesLog(true),
        handleOnlyAvgPrice: this.handleAvgPriceBoughtTimes(true),
        handleOnlyTotalCstFrSalesLog: this.handleTotalCostForSalesLog(true),
        handleOnlyTotalCstCurrencyValFrSalesLog: this.handleTotalCostForSalesLog(false, true),
        getOnlyCurrCurrencyValForSalesLog: this.getCurrentValueForSalesLog(false, true),
      };

      tmpData[`${serverData.market}USDTPrice`] = Store.state.header.properties[`${serverData.market}USDTPrice`];
      return tmpData;
    },
  },
  data: () => ({
    DISPLAY_TYPES: ['filter', 'display', 'export', 'sort'],
    MAX_TAM_PRECISION: 4,
    MAX_BUY_BOUGHT_AMNT_PRECISION: 8,
    SORT_OP: 'sort',
    POSITIVE_TRUE_VALUE: 1,
    POSITIVE_TRUE_TRAILING_VALUE: 1.1,
    MAX_BOUGHT_TIMES: 200,
    FIXED_COLUMN_MAX_RESOLUTION: 767,
    SELL: 'SELL'
  }),
  methods: {
    replaceBreakTag(string, type) {
      if (type === 'export') {
        return string.replace(/<br>/ig, '\r');
      }
      return string;
    },
    checkAndAddPrecision(data, type, precision) {
      if (type === 'display' || type === 'export' || type === 'sales' || type === 'filter') {
        // If precision is not a number then consider default precision.
        const tmpPrecision = parseInt(precision, 10);
        const finalPrecision = isNaN(tmpPrecision) ? DEFAULT_PRECISION : tmpPrecision;
        // Determining the return value based on the data's type as toFixed()
        // only works with number type.
        const returnValue = isNaN(parseInt(data, 10)) ? '' :
          parseFloat(data.toFixed(finalPrecision)).toFixed(finalPrecision);
        return returnValue;
      }
      return data;
    },
    getClassBasedOnValue(value) {
      const valueClass = +value < PROFIT_GREEN ? 'loss-classtext' : 'profit-classtext';
      return valueClass;
    },
    renderPercentageChange(data) {
      const percChange = data.percChange * 100;
      // Determining the return value based on the data's type as toFixed() only
      // works with number type.
      const returnValue = isNaN(parseInt(percChange, 10)) ? '' : parseFloat(percChange.toFixed(2)).toFixed(2);
      return returnValue;
    },
    /**
     * Renders coin market link based on exchangeURL.
     * If exchangeURL doesnot have %c or %b it will return plain text as the link will be of no use.
     * If exchangeURL has %c and %b then it replaces %c with currency and %b with base, based on the
     * current market and returns the market link.
     * Example:
     * 1. exchangeURL --> https://www.binance.com/tradeDetail.html?symbol=%c_%b
     *    returnData --> <a href="https://www.binance.com/tradeDetail.html?symbol={market_currency}_{market_base}">Market</a>
     * 2. exchangeURL --> https://www.binance.com/tradeDetail.html?symbol=%c_
     *    returnData --> Market
     */
    renderMarketCol(data, type, row) {
      // Renders only coin market.
      if (type === 'display' || type === 'export') {
        if (!this.dtCache.marketingSite.indexOf('%c') || !this.dtCache.marketingSite.indexOf('%b')) {
          return data;
        }
        let normalizedMarketSite = this.dtCache.marketingSite.replace('%c', row.currency);
        normalizedMarketSite = normalizedMarketSite.replace('%b', row.base);
        return `<a href="${normalizedMarketSite}" target="_blank">${data}</a>`;
      }
      return data;
    },
    renderCombinedMarketCol(data, type, row) {
      // Render coin market with profit percentage.
      const percentageValue = this.renderPercentageChange(row);
      const percentageClass = this.getClassBasedOnValue(percentageValue);
      let marketAndPercString = `${this.renderMarketCol(data, type, row)}<br><span class="${percentageClass}">${percentageValue} %</span>`;
      marketAndPercString = this.replaceBreakTag(marketAndPercString, type);
      return marketAndPercString;
    },
    checkAnyValueExists(strat) {
      const tmpStrat = strat;
      if (strat.currentValue || strat.triggerValue || strat.entryValue || strat.entryValueLimit) {
        tmpStrat.anyValueExists = true;
      }
      return tmpStrat;
    },
    currentMarketPrecision(value, type, row) {
      return this.normalizeValueWithCommas(value, type, row, '', '',
        this.dtCache.currentMarketPrecision);
    },
    /**
   * This will add comma after three digits to the passed value parameter
   * and doesn't add comma number after decimals.
   * @param {*} value - Value to be converted.
   * @param {*} type  - It adds precision and comma only if type is 'display' or 'filter'.
   * @param {*} row
   * @param {*} set
   * @param {*} noPrecision - It will add precision to the given value if noPrecision parameter
   * value is false value or undefined.
   * @param {*} precision - It will add passed parameter precision(if precision parameter is
   * not passed then it adds default precision).
   */
    normalizeValueWithCommas(value, type, row, set, noPrecision, precision) {
      const finalPrecision = precision || DEFAULT_PRECISION;
      let tmpValue = value;
      if (!noPrecision) {
        tmpValue = this.checkAndAddPrecision(tmpValue, type, finalPrecision);
      }
      // Comma should be added only for type display and filter.
      if (this.DISPLAY_TYPES.indexOf(type) === -1) {
        return tmpValue;
      }

      tmpValue = tmpValue.toString();
      const valueArr = tmpValue.split('.');
      // Don't add comma for number after decimal.
      if (valueArr[1]) {
        valueArr[0] = valueArr[0].replace(/(\d)(?=(\d\d\d)+(?!\d))/g, '$1,');
        tmpValue = valueArr.join('.');
      } else {
        tmpValue = tmpValue.replace(/(\d)(?=(\d\d\d)+(?!\d))/g, '$1,');
      }
      return tmpValue;
    },
    renderVolume(data) {
      return Math.round(data);
    },
    dateHandler(propName, parentProperty, onlyDate, onlyTime, onlyDiff) {
      // return the actual render function
      const that = this;
      return function cbDateHandler(row, type) {
        // To return -- when we are receiving parentProperty but the row doesnot
        // contain parentProperty.
        if (typeof parentProperty !== 'undefined' && typeof row[parentProperty] === 'undefined') {
          return DEFAULT_VALUE;
        }
        var colData = parentProperty ? row[parentProperty][propName] : row[propName];
        colData = typeof colData === 'object' ? colData : new Date(colData * 1000);
        // TODO: Have to add '+00:00' to date to specify it is in UTC timezone.
        const dt = that.getDateObj(colData, that.dtCache.timeZoneOffset, true);
        if (!dt) {
          return DEFAULT_VALUE;
        }
        if (type === 'set') {
          return dt.getTime();
        } else if (type === 'display' || type === 'export' || type === 'export') {
          const date = that.formatDate(dt);
          const dateAndTimeArr = date.split(' ');
          // Add time period(AM or PM) if exists.
          const timePeriod = dateAndTimeArr[2] ? ` ${dateAndTimeArr[2]}` : '';
          const diffDays = that.getDaysDifferenceFromToday(dt);
          const diffDaysString = `${diffDays}D`;
          if (onlyDate) {
            return dateAndTimeArr[0];
          }
          if (onlyTime) {
            return dateAndTimeArr[1] + timePeriod;
          }
          if (onlyDiff) {
            return diffDaysString;
          }
          let dateAndDaysDiff = `<span>${dateAndTimeArr[0]}</span><br><span class="dt-time">${dateAndTimeArr[1]}${timePeriod} (${diffDaysString})</span>`;
          dateAndDaysDiff = that.replaceBreakTag(dateAndDaysDiff, type);
          return dateAndDaysDiff;
        } else if (type === 'filter') {
          return that.formatDate(dt);
        }
        // 'sort', 'type' and undefined all just use the integer
        return dt.getTime();
      };
    },
    getDaysDifferenceFromToday(date) {
      const currentDate = this.getUTCDateWithOffset(this.dtCache.timeZoneOffset);
      const timeDiff = date.getTime() - currentDate.getTime();
      const diffDaysTmp = timeDiff / (1000 * 3600 * 24);
      const diffDays = diffDaysTmp < 0 ? Math.ceil(diffDaysTmp) : Math.floor(diffDaysTmp);
      return diffDays;
    },
    renderBuyStrategy(property, showBtn) {
      let vm = this;
      return function cbRenderBuyStrategy(data, type) {
        let strategy = 0;
        let weightage = 0;
        let currentPositiveValue = '';
        // We have to sort on positive value for buy strategies column.
        if (type === vm.SORT_OP) {
          // Loop over strategies array.
          for (let i = 0; i < data[property].length; i += 1) {
            const currentStrategy = data[property][i];
            currentPositiveValue = currentStrategy.positive.toString().toLowerCase();
            // Adding weightage based on positive value we are receiving from API.
            if (currentPositiveValue !== 'false') {
              // Implementing sorting based on the sum for each row value we get from this function.
              weightage = currentPositiveValue === 'true' ? vm.POSITIVE_TRUE_VALUE : vm.POSITIVE_TRUE_TRAILING_VALUE;
              strategy += weightage;
            }
          }
          return strategy;
        }
        // Flow of control moves to renderStrategy function if the type of operation is not sort.
        return vm.renderStrategy(data[property], type, '', '', showBtn, 'buy', data);
      };
    },
    renderSellStrategyWithButton(property, showBtn) {
      // To render sell strategy for pairs log.
      let vm = this;
      return function cbRenderSellStrategy(data, type) {
        return vm.renderStrategy(data[property], type, '', '', showBtn, 'sell', data);
      };
    },
    renderStrategy(data, type, row, meta, showBtn, buyOrSell, rowData) {
      let strategy = '';
      let positiveCls = '';
      const tempData = data;

      // Loop over strategies array.
      for (let i = 0; i < tempData.length; i += 1) {
        const currentStrategy = tempData[i];
        tempData[i] = this.checkAnyValueExists(tempData[i]);
        strategy += currentStrategy.name;
        if (currentStrategy.positive && currentStrategy.positive !== 'false') {
          positiveCls = POSITIVE_CLASS;
          strategy += `<span class="${positiveCls}"> (${currentStrategy.positive.toString()
          })</span><br>`;
        } else {
          positiveCls = NEGATIVE_CLASS;
          strategy += '<br>';
        }
      }
      if (showBtn) {
        strategy = this.renderBuySellButton(buyOrSell, strategy, rowData);
      }
      strategy = this.replaceBreakTag(strategy, type);
      return strategy;
    },
    checkAllValAndHandleStratCurVal(data, type) {
      return this.handleStratCurrentVal(data, type, '', '', true);
    },
    handleStratCurrentVal(data, type, row, set, checkAnyValueExists) {
      let currentValString = '';
      // TODO: Check why we are receiving type as a type.
      if (type === this.SORT_OP || type === 'type') {
        return this.checkAndAddPrecision(data[0] ? data[0].currentValue : '', type, data[0] ? data[0].decimals : '');
      }
      // Loop over strategies array.
      for (let i = 0; i < data.length; i += 1) {
        let currentVal = this.checkAndAddPrecision(data[i].currentValue, type, data[i].decimals);
        // In DCA table we have to render strategy data if atleast one value is not zero.
        if (checkAnyValueExists) {
          currentVal = data[i].anyValueExists ? currentVal : '';
        }
        currentValString += `${currentVal}<br>`;
      }
      currentValString = this.replaceBreakTag(currentValString, type);
      return currentValString;
    },
    handleAvgPriceBoughtTimes(onlyBoughtPrice, onlySoldPrice) {
      const that = this;
      return function cbHandleAvgPriceBoughtTimes(data, type) {
        // Returns the first value in the column's row if the type of opertaion is sorting.
        if (type === that.SORT_OP) {
          return data.avgPrice;
        }
        if (that.DISPLAY_TYPES.indexOf(type) !== -1) {
          const avgPriceBroughtTimes = that.normalizeValueWithCommas(data.avgPrice, type, '',
            '', '', that.dtCache.currentMarketPrecision);
          const currentPrice = that.normalizeValueWithCommas(data.currentPrice, type, '',
            '', '', that.dtCache.currentMarketPrecision);
          let avgPriceBroughtTimesCount = '';
          // Rendering data when user exports excel.
          if (type === 'export') {
            if (onlyBoughtPrice) {
              avgPriceBroughtTimesCount = `(${data.boughtTimes})`;
              return avgPriceBroughtTimes + avgPriceBroughtTimesCount;
            }
            if (onlySoldPrice) {
              return currentPrice;
            }
          }
          avgPriceBroughtTimesCount = that.renderBoughtTimesBasedOnValue(data.boughtTimes);
          if (onlyBoughtPrice) {
            return avgPriceBroughtTimes + avgPriceBroughtTimesCount;
          }
          if (onlySoldPrice) {
            return currentPrice;
          }
          return `${avgPriceBroughtTimes + avgPriceBroughtTimesCount}<br><span class="sold-price">${
            currentPrice}</span>${that.getBoughtTimesHTML(data.boughtTimes, false)}`;
        }
        return data.avgPrice;
      };
    },
    getBoughtTimesHTML(boughtTimes, withoutInvisibleBlock) {
      const scale = chroma.scale(['#FF9900', '#3bafda']);
      const ColorIndex = boughtTimes * 0.005;
      const BGColor = boughtTimes <= this.MAX_BOUGHT_TIMES ? scale(ColorIndex).hex() : '#ffffff';
      const styleString = `style="background-color:${BGColor}"`;
      // Maximum bought times number count can be 2.
      // so to make one length and two length bought times aligned properly,
      // adding invisible number before one length bought times.
      const invisibleText = boughtTimes.toString().length === 1
        ? '<span class="invisible">0</span>' : '';

      let contentString = boughtTimes;
      if (withoutInvisibleBlock) {
        contentString = `${invisibleText}<span class="bought-badge-number" ${styleString}>${boughtTimes}</span>`;
      } else {
        contentString = `${invisibleText}<span class="bought-badge-number invisible" ${styleString}>${boughtTimes}</span>`;
      }
      return contentString;
    },
    checkAllValAndHandleStratEntryVal(data, type) {
      return this.handleStratEntryVal(data, type, '', '', true);
    },
    handleStratEntryVal(data, type, row, set, checkAnyValueExists) {
      let entryValString = '';
      // TODO: Check why we are receiving type as a type.
      if (type === this.SORT_OP || type === 'type') {
        return this.checkAndAddPrecision(data.length ? data[0].entryValue : '', type, data.length ? data[0].decimals : '');
      }
      // Loop over strategies array.
      for (let i = 0; i < data.length; i += 1) {
        const currentStrat = data[i];
        let money = this.checkAndAddPrecision(currentStrat.entryValue, type, currentStrat.decimals);
        // In DCA table we have to render strategy data if atleast one value is not zero.
        if (checkAnyValueExists) {
          money = currentStrat.anyValueExists ? money : '';
        }
        entryValString += `${money}<br>`;
      }
      entryValString = this.replaceBreakTag(entryValString, type);
      return entryValString;
    },
    handlePBEntryLimit(data, type) {
      let pbEntryLimitString = '';
      // TODO: Check why we are receiving type as a type.
      if (type === this.SORT_OP || type === 'type') {
        return data[0].entryValueLimit;
      }
      // Loop over strategies array.
      for (let i = 0; i < data.length; i += 1) {
        const entryValLimit = data[i].anyValueExists ? data[i].entryValueLimit : '';
        pbEntryLimitString += `${entryValLimit}<br>`;
      }
      pbEntryLimitString = this.replaceBreakTag(pbEntryLimitString, type);
      return pbEntryLimitString;
    },
    handleProfit(data, type) {
      const profit = this.handleMoney(data, type);
      const profitClass = +profit < PROFIT_GREEN ? 'light-danger' : 'light-success';
      const profitString = `<span class="badge badge-${profitClass}">${profit}</span>`;
      return profitString;
    },
    handleMoney(data, type) {
      if (type === 'display' || type === 'export') {
        // Determining the return value based on the data's type as
        // toFixed() only works with number type.
        return isNaN(parseInt(data, 10)) ? '' : parseFloat(data.toFixed(2)).toFixed(2);
      }
      return data;
    },
    handleAvgValAndCurrentPrice(onlyCurrentPrice, onlyAvgPrice, displayTargetPrice) {
      const that = this;
      return function cbhandleAvgValAndCurrentPrice(data, type, row) {
        const avgPrice = that.handleAvgPrice(data, type, row);
        if (type === 'display' || type === 'export') {
          const currentPrice = that.normalizeValueWithCommas(data.currentPrice, type, '', '', '', that.dtCache.currentMarketPrecision);
          if (onlyCurrentPrice) {
            return currentPrice;
          }
          if (onlyAvgPrice) {
            return avgPrice;
          }
          if (displayTargetPrice){
            var targetPrice = that.normalizeValueWithCommas(
              data.targetPrice,
              type,
              '',
              '',
              '',
              that.dtCache.currentMarketPrecision
            );
            var returnValue ='<span class="boughtCost">' + avgPrice + '</span>';
            returnValue =  returnValue + '<br><span class="boughtCost">' + currentPrice + '</span>';
            return returnValue + '<br><span class="targetPrice">' + targetPrice + '</span>';
          }
          return `${currentPrice}<br>${avgPrice}`;
        }
        return avgPrice;
      };
    },
    handleAvgPrice(data, type) {
      return this.currentMarketPrecision(data.avgPrice, type, '', '', '', this.dtCache.currentMarketPrecision);
    },
    getCurrentValAndTotalCost(onlyValue, onlyConvertedValue) {
      const that = this;
      return function cbGetCurrentValAndTotalCost(data, type, row) {
        const currentValue = that.getCurrentValue(onlyValue, onlyConvertedValue)(data, type, row);
        if (type === 'display' || type === 'export') {
          const totalCost = that.handleTotalCost(onlyValue, onlyConvertedValue)(data, type, row);
          var targetValue = that.handleTargetValue(onlyValue, onlyConvertedValue)(data, type, row);
          if (targetValue) {
            return (
              `<span class="bought-cost blue-color">${totalCost}</span><br><span class="current-value blue-color">${currentValue}</span><br><span class="tager-value blue-color">${targetValue}</span>`
            );
          }
          return `<span class="current-value blue-color">${currentValue}</span><br><span class="bought-cost blue-color">${totalCost}</span>`;
        }
        return currentValue;
      };
    },
    handleAvgPriceDcaLog(onlyBid, onlyAvg) {
      const that = this;
      return function cbhandleAvgPriceDcaLog(data, type) {
        if (type === 'display' || type === 'export') {
          const currentPrice = that.normalizeValueWithCommas(data.currentPrice, type, '', '', '', that.dtCache.currentMarketPrecision);
          const avgPrice = that.normalizeValueWithCommas(data.avgPrice, type, '', '', '', that.dtCache.currentMarketPrecision);
          if (onlyBid) {
            return currentPrice;
          }
          if (onlyAvg) {
            return `${avgPrice}<span class="dca-bought-times-container">(${data.boughtTimes})</span></span>`;
          }
          const avgPriceContent = avgPrice + that.renderBoughtTimesBasedOnValue(data.boughtTimes);
          return `<span class="dca-avg-current-price">${currentPrice}${that.getBoughtTimesHTML(data.boughtTimes, false)
          }</br>${avgPriceContent}</span>`;
        } else if (type === 'sort') {
          return data.boughtTimes;
        }
        return data.avgPrice;
      };
    },
    renderDCAEntryAndEntryLimit(data, type) {
      let entryLimitString = '';
      // TODO: Check why we are receiving type as a type.
      if (type === 'sort' || type === 'type') {
        return data[0].triggerValue;
      }
      for (let i = 0; i < data.length; i += 1) {
        const currentStrat = data[i];
        entryLimitString += currentStrat.anyValueExists ? `<span class="strat-trigger-value">${
          currentStrat.triggerValue}</span>` : '';
        entryLimitString += '<br>';
      }
      entryLimitString = this.replaceBreakTag(entryLimitString, type);
      return entryLimitString;
    },
    handleOrderBookProfit(data, type) {
      // TODO: Check why we are receiving type as a type.
      if (type === 'sort' || type === 'type') {
        return this.handleMoney(data.profit, type);
      }
      const profit = this.handleMoney(data.profit, type);
      let orderbookProfit = +data.orderbookProfit > 0 ? data.orderbookProfit : '';
      orderbookProfit = this.handleMoney(orderbookProfit, type);
      const profitClass = +profit < PROFIT_GREEN ? 'danger' : 'success';
      let profitString = `<span class="badge badge-light-${profitClass}">${
        profit}</span><br><span class="badge badge-light-success order-profit">${orderbookProfit}</span>`;
      profitString = this.replaceBreakTag(profitString, type);
      return profitString;
    },
    handleTotalAmount(data, type) {
      return this.checkMaxDecimalsAndAddPrecision(data.totalAmount,
        type, this.MAX_TAM_PRECISION);
    },
    checkMaxDecimalsAndAddPrecision(value, type, maxPrecision) {
      if (typeof value === 'undefined') {
        return '';
      }
      let tempVal = value;
      const valueArr = value.toString().split('.');
      if (valueArr[1] && valueArr[1].length > maxPrecision) {
        tempVal = this.checkAndAddPrecision(value, type, maxPrecision);
      }
      return tempVal;
    },
    getCurrentValue(onlyCurrentValue, onlyConvertedCurrentValue) {
      const that = this;
      return function cbGetCurrentValue(data, type) {
        const currentValue = data.totalAmount * data.currentPrice;
        const nrmlsdCurrentValue = that.getCurrentValueBsdOnfee(data, currentValue);
        return that.getValueBasedOnParams(nrmlsdCurrentValue, type, onlyCurrentValue,
          onlyConvertedCurrentValue);
      };
    },
    getCurrentValueBsdOnfee(data, currentValue) {
      let tempCurrVal = currentValue;
      const fee = data.fee;
      tempCurrVal *= (1 - (fee / 100));
      return tempCurrVal;
    },
    getValueBasedOnParams(value, type, onlyCurrentValue, onlyConvertedCurrentValue) {
      const onlyValue = this.normalizeValueWithCommas(value, type, '', '', '', this.dtCache.currentMarketPrecision);
      if (onlyCurrentValue) {
        return onlyValue;
      }
      if (onlyConvertedCurrentValue) {
        return this.convertToCurrentCurrency(value, type);
      }
      return onlyValue + this.convertToCurrentCurrency(value, type);
    },
    convertToCurrentCurrency(value, type) {
      // Converted value should be added only for type display and filter.
      let tempVal = value;
      if (this.DISPLAY_TYPES.indexOf(type) === -1) {
        return 0;
      }
      // If market is USDT and currency is USD then converted value should not be shown.
      if ((this.dtCache.market === this.HIDE_PROFIT_MARKET_AND_ESTIMATED_USD &&
        this.dtCache.currency === this.BASE_CURRENCY)) {
        return '';
      }
      tempVal = this.normalizeValueWithCommas(value * this.dtCache.marketPrice * this.dtCache.currencyValue, type, '', '', '', 2);
      // Returns the value directly if the type of operation is sorting.
      if (type === this.SORT_OP) {
        return tempVal;
      }
      // Returns the value with prefixed currency symbol if the type of operation is not sorting.
      tempVal = `${this.dtCache.currencySymbol} ${tempVal}`;
      return tempVal;
    },
    handleTotalCost(onlyCurrentValue, onlyConvertedCurrentValue) {
      const that = this;
      return function cbHandleTotalCost(data, type) {
        const totalCst = data ? data.totalCost : undefined;
        // If total cost is not set then show empty column.
        if (typeof totalCst === 'undefined') {
          return '';
        }

        return that.getValueBasedOnParams(totalCst, type, onlyCurrentValue,
          onlyConvertedCurrentValue);
      };
    },
    renderSellStrategy(data, type) {
      let sellStrategy = '';

      // Loop over sell strategy array.
      for (let j = 0; j < data.length; j += 1) {
        const currentSellStrategy = data[j];
        sellStrategy += `${currentSellStrategy.name}<br>`;
      }
      sellStrategy = this.replaceBreakTag(sellStrategy, type);
      return sellStrategy;
    },
    getProfitBTCForSalesLog(row, type) {
      const profitValueTmp = this.dtCache.getOnlyCurrentValueForSalesLog(row, '') - (this.dtCache.handleOnlyAvgPrice(row, '') * row.soldAmount);
      const profitValue = this.normalizeValueWithCommas(profitValueTmp, type);
      if (type === 'display' || type === 'export' || type === 'filter') {
        const profitClass = this.getClassBasedOnValue(profitValueTmp);
        const profitString = `<span class="${profitClass}">${profitValue}</span>`;
        return profitString;
      }
      return profitValue;
    },
    getCurrentValueForSalesLog(onlyCurrentValue, onlyConvertedCurrentValue) {
      const that = this;
      return function cbgetCurrentValueForSalesLog(data, type) {
        let currentValue = data.soldAmount * data.currentPrice;
        currentValue = that.getCurrentValueBsdOnfee(data, currentValue);
        return that.getValueBasedOnParams(currentValue, type, onlyCurrentValue,
          onlyConvertedCurrentValue);
      };
    },
    getCurrentTrendprofit(row, type) {
      // If market is USDT then don't show the market profit value.
      if (this.dtCache.market === HIDE_PROFIT_MARKET_AND_ESTIMATED_USD &&
          this.dtCache.currency === BASE_CURRENCY) {
        return '';
      }
      const currentValue = this.dtCache.getOnlyCurrentValueForSalesLog(row, '');
      const profitValue = currentValue - (this.dtCache.handleOnlyAvgPrice(row, '') * row.soldAmount);
      const currentTrendProfitTmp = (this.dtCache.marketPrice *
        this.dtCache.currencyValue * profitValue);
      const currentTrendProfit = this.normalizeValueWithCommas(currentTrendProfitTmp, type, '', '', '', 2);
      const currentTrendProfitClass = this.getClassBasedOnValue(currentTrendProfitTmp);
      return `<span class="sales-market-profit ${currentTrendProfitClass}"> ${this.dtCache.currencySymbol} ${currentTrendProfit}<span>`;
    },
    handleBoughtSoldCostForSalesLog(data, type) {
      const totalCst = this.dtCache.handleOnlyTotalCstFrSalesLog(data, type);
      // Returns totalCst if the type of operation is sorting.
      if (type === this.SORT_OP) {
        return totalCst;
      }
      if (this.DISPLAY_TYPES.indexOf(type) !== -1) {
        return `${totalCst}<br>${
          this.dtCache.getOnlyCurrentValueForSalesLog(data, type)}`;
      }
      return totalCst;
    },
    handleTotalCostForSalesLog(onlyCurrentValue, onlyConvertedCurrentValue) {
      const that = this;
      return function cbHandleTotalCstFrSalesLog(data, type) {
        const totalCost = data.soldAmount * data.avgPrice;
        return that.getValueBasedOnParams(totalCost, type, onlyCurrentValue,
          onlyConvertedCurrentValue);
      };
    },
    handleBuyLogBoughtAmnt(data, type) {
      let totalAmnt = data ? data.totalAmount : undefined;
      return this.checkMaxDecimalsAndAddPrecision(
        totalAmnt,
        type,
        this.MAX_BUY_BOUGHT_AMNT_PRECISION
      );
    },
    handleBoughtSoldCostCurrency(data, type) {
      // Returns the first value directly if the operation is sort.
      if (type === this.SORT_OP) {
        return this.dtCache.handleOnlyTotalCstCurrencyValFrSalesLog(data, type);
      }
      return `${this.dtCache.handleOnlyTotalCstCurrencyValFrSalesLog(data, type)
      }<br><span class="sold-value">${
        this.dtCache.getOnlyCurrCurrencyValForSalesLog(data, type)}</span>`;
    },
    /* To render sum of the each column which is sent as parameter (dataset)
    *  This will be used for computaion of summary table.
    * */
    colTotals(dataset, datatableReference) {
      // Returns empty object if dataset is undefined.
      if (typeof dataset === 'undefined') {
        return {};
      }
      let response = {};
      let currentMarketPrecision = ((this.dtCache && this.dtCache.hasOwnProperty('currentMarketPrecision'))
        && this.dtCache.currentMarketPrecision) || DEFAULT_PRECISION;
      const dataSetKeys = Object.keys(dataset);
      // Render each data from dataset if dataset is defined.
      if (typeof dataset !== 'undefined') {
        // Looping over each data in dataset to render sum of each column.
        for (let i = 0; i !== dataSetKeys.length; i += 1) {
          const currentDataKey = dataSetKeys[i];
          let colNum = +dataset[currentDataKey];
          // If column index in not a number then sum for that columns is zero.
          if (isNaN(colNum)) {
            response[currentDataKey] = 0;
          } else {
            response[currentDataKey] = datatableReference.getColumnSum(colNum);
            let currentCurrencyValue = this.getInCurrencyValue(response[currentDataKey],
              this.dtCache, 2, true);
            currentCurrencyValue = this.hideCurrencyRow() ? `<span class="current-currency-values"> (${this.dtCache.currencySymbol}${currentCurrencyValue})<span>` : '';
            response[`${currentDataKey}ConvertedValue`] = this.normalizeValueWithCommas(response[currentDataKey], 'display', '', '', '', currentMarketPrecision) + currentCurrencyValue;
          }
        }
      }
      const difference = this.addDifference(response[dataSetKeys[0]],
        response[dataSetKeys[1]], true);
      response.diffValue = difference.diffValue;
      response.diffPerc = difference.diffPer;
      return response;
    },
    // To get the value in current currency which we are receiving from API.
    getInCurrencyValue(value, data, precision, checkCondition) {
      // Check if data is present or not before performing any operation.
      if ((checkCondition && !this.showInCurrentCurrency(data)) || !data || $.isEmptyObject(data)) {
        return '';
      }
      let tempValue = value;
      let marketPrice = data.marketPrice ? data.marketPrice : 1;
      tempValue = tempValue * marketPrice * data.currencyValue;
      // If we receive precision as parameter then return the normalized data.
      if (precision) {
        tempValue = this.normalizeValueWithCommas(tempValue, 'display', '', '', '', precision);
      }
      return tempValue;
    },
    showInCurrentCurrency(data) {
      // If market is USDT and currency is USD then we should not show the current currency value.
      if ((data && data.market === this.HIDE_PROFIT_MARKET_AND_ESTIMATED_USD)
        && data.currency === this.BASE_CURRENCY) {
        return false;
      }
      return true;
    },
    // To render difference between two value to display in summary table.
    addDifference(firstValue, secondValue, addCurrencyValue) {
      let difference = firstValue - secondValue;
      let diffPerTmp = +secondValue ? (difference / secondValue) * 100 : 0;
      let diffValue = this.normalizeValueWithCommas(difference, 'display', '', '', '', this.dtCache.currentMarketPrecision);
      let currentCurrencyValue = '';
      // Appends currency value after computing it with the difference.
      if (addCurrencyValue) {
        currentCurrencyValue = this.getInCurrencyValue(diffValue, this.dtCache, 2, true);
        currentCurrencyValue = this.hideCurrencyRow() ? `<span class="current-currency-values"> (${this.dtCache.currencySymbol}${currentCurrencyValue})</span>` : '';
      }
      let differencePerClass = diffPerTmp < 0 ? NEGATIVE_CLASS_TEXT : POSITIVE_CLASS_TEXT;
      let differencePer = `<span class="${differencePerClass} difference-percent"> (${parseFloat((diffPerTmp).toFixed(2)).toFixed(2)} %) </span>`;
      return {
        diffValue: diffValue + currentCurrencyValue,
        diffPer: differencePer,
        diffPerClass: differencePerClass,
      };
    },
    isResponsive() {
      // Using responsive datatable in higher resolution and fixed column in lower reoslution.
      const presentResolution = window.innerWidth;
      if (presentResolution >= this.FIXED_COLUMN_MAX_RESOLUTION) {
        return true;
      }
      return false;
    },
    getCurrentDateForFileName(initialString) {
      const currentDate = new Date();
      return `${initialString}${String(currentDate.getFullYear()) + String(this.makeTwoDigits(
        currentDate.getMonth() + 1)) + String(this.makeTwoDigits(currentDate.getDate()))
      }-${String(this.makeTwoDigits(currentDate.getHours()))}${String(this.makeTwoDigits(
        currentDate.getMinutes()))}${String(this.makeTwoDigits(currentDate.getSeconds()))}`;
    },
    getExcelColumns(totalColumns, excludeInExcel, excludeOnCondition) {
      // Generate excel columns
      let columnsArrTmp = [];
      for (let i = 0; i <= totalColumns; i += 1) {
        // In excel we shouldn't show combined values
        if (excludeInExcel.indexOf(i) === -1) {
          columnsArrTmp.push(i);
        }
      }
      let columnsArr = columnsArrTmp;
      // If market is USDT and currency is USD then hide values in current currency.
      if (excludeOnCondition && excludeOnCondition.length > 0 &&
        this.dtCache.market === HIDE_PROFIT_MARKET_AND_ESTIMATED_USD &&
        this.dtCache.currency === BASE_CURRENCY) {
        for (let j = 0; j < excludeOnCondition.length; j += 1) {
          columnsArr.splice(columnsArr.indexOf(excludeOnCondition[j]), 1);
        }
      }
      return columnsArr;
    },
    getExportDateColumns(columns, index, property, parentProperty) {
      /* To create seperate columns for date, time since and time which
      will be displayed in excel sheet. */
      let exportDateColumns = [
        {
          title: 'date',
          data: this.dateHandler(property, parentProperty, true),
          visible: false
        },
        {
          title: 'time',
          data: this.dateHandler(property, parentProperty, false, true),
          visible: false
        }, {
          title: 'timeSince',
          data: this.dateHandler(property, parentProperty, false, false, true),
          visible: false
        }
      ];

      for (let i = 0; i < exportDateColumns.length; i += 1) {
        columns.splice(index + i, 0, exportDateColumns[i]);
      }

      return columns;
    },
    handleTargetValue(onlyCurrentValue, onlyConvertedCurrentValue) {
      const that = this;
      return function(data, type) {
        var targetValue = data.targetValue ? data.targetValue : '';
        // If total cost is not set then show empty column.
        if (typeof targetValue === 'undefined' || targetValue === '') {
          return '';
        }
  
        return that.getValueBasedOnParams(
          targetValue,
          type,
          onlyCurrentValue,
          onlyConvertedCurrentValue
        );
      };
    },
    hideCurrencyValues(dataTable, hideColumnsArr) {
      let showCurrencyColumns = true;
      // If market is USDT and currency is USD then hide the currency columns.
      if (this.dtCache.market === HIDE_PROFIT_MARKET_AND_ESTIMATED_USD
        && this.dtCache.currency === BASE_CURRENCY) {
        showCurrencyColumns = false;
      }
      for (let i = 0; i < hideColumnsArr.length; i += 1) {
        dataTable.column(hideColumnsArr[i]).visible(showCurrencyColumns);
      }
    },
    handleProfitText(td, cellData) {
      // To add custom formatting to the cell based on the value.
      // https://datatables.net/reference/option/columns.createdCell
      if (cellData < PROFIT_GREEN) {
        $(td).addClass('loss-classtext').removeClass('profit-classtext');
      } else {
        $(td).addClass('profit-classtext').removeClass('loss-classtext');
      }
    },
    hideCurrencyRow() {
      // We should not show currency values in summary table when market is USDT
      // and currency is USD.
      if (typeof this.dtCache.market === 'undefined') {
        // To not show currency value when we are not receiving any data from API.
        return false;
      }
      if (this.dtCache.market === HIDE_PROFIT_MARKET_AND_ESTIMATED_USD
        && this.dtCache.currency === BASE_CURRENCY) {
        return false;
      }
      return true;
    },
    updateCollapsedColumnTitle() {
      // To update header of collapsed column in responsive datatable.
      const vm = this;
      $('.page-content').on('click', '.collapsed tbody tr td:first-child', () => {
        $('.api-currency').html(vm.dtCache.currency);
      });
    },
    renderDataIfPresent(data) {
      // To return data only when it is defined or else returns default value.
      if (typeof data === 'undefined') {
        return DEFAULT_VALUE;
      }
      return data;
    },
    handleBoughtPrice() {
      // To return function which renders normalized bought price.
      const that = this;
      return function cbHandleBoughtPrice(data, type) {
        let currentPrice = that.normalizeValueWithCommas(data.currentPrice, type, '',
          '', '', that.dtCache.currentMarketPrecision);
        let contentString;
        if (type === 'export') {
          // Showing bought times in bracket in excel sheet.
          contentString = `<span>(${data.boughtTimes})</span>`;
        } else if (type === 'display') {
          // We are not displaying bought times when bought times is zero.
          contentString = that.renderBoughtTimesBasedOnValue(data.boughtTimes);
        }
        currentPrice += contentString;
        return currentPrice;
      };
    },
    showBuySellButtons() {
      // To get data from local storage based on which buy/sell button is displayes.
      return localStorage.getItem('showBuySellButtons');
    },
    renderStrategyForBuyLog(data, type) {
      let strategy = '';
      // Loop over strategies array.
      for (let i = 0; i < data.length; i += 1) {
        let currentStrategy = data[i];
        currentStrategy = this.checkAnyValueExists(data[i]);
        strategy += `${currentStrategy.name}<br>`;
      }
      strategy = this.replaceBreakTag(strategy, type);
      return strategy;
    },
    renderBuySellButton(buyOrSell, contentString, data) {
      // To render buy/sell button for datatable based on buy and sell column.
      let btnVisibilityClass = '';
      // While rendering, checks if boolean for button visibility is true or not.
      if (this.showBuySellButtons() !== 'true') {
        btnVisibilityClass = 'hide';
      }
      // To render badge class based on buy/sell column.
      const badgeClass = buyOrSell.toUpperCase() === this.SELL ? NEGATIVE_BADGE : POSITIVE_BADGE;
      return `${contentString}<p></p><div class="buy-sell-button-container">
      <span class="badge buy-sell-button ${badgeClass} buy-or-sell-btn ${btnVisibilityClass}" data-buy-sell="${buyOrSell.toUpperCase()}"
      data-market="${data.market}">${buyOrSell.toUpperCase()}</span></div>`;
    },
    renderBoughtTimesBasedOnValue(boughtTimes) {
      let contentString;
      // Dont show bought times if it is zero.
      // To keep the alignment properly, we need to get invisible values
      // if the boughttimes is equal to zero.
      if (+boughtTimes !== 0) {
        contentString = this.getBoughtTimesHTML(boughtTimes, true);
      } else {
        contentString = this.getBoughtTimesHTML(boughtTimes, false);
      }
      return contentString;
    }
  },
};
