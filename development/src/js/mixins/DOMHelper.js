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
    getSwalContent(event) {
      let buyOrSell = event.target.dataset.type;
      let html = '';
      if(buyOrSell === 'buys') {
          html =
              '<div class="form-group text-left">' +
                  '<label for="buyLogCurrencyPair">Coin</label>' +
                  '<input type="text" class="form-control" id="buyLogCurrencyPair" name="buyLogCurrencyPair" placeholder="BTC" required>' +
                  '<small class="form-text text-muted" data-i18n="">Coin needs to follow the same format, as the other coins you see in the different log areas, such as the Possible Buy Log, Pairs log, etc.</small>' +
              '</div>' +
              '<div class="form-group text-left">' +
                  '<label for="buyLogAmount">BoughtAmount</label>' +
                  '<input type="number" class="form-control" id="buyLogAmount" name="buyLogAmount" placeholder="1000" required>' +
              '</div>' +
              '<div class="form-group text-left">' +
                  '<label for="buyLogAvgPrice">BoughtPrice</label>' +
                  '<input type="number" class="form-control" id="buyLogAvgPrice" name="buyLogAvgPrice" placeholder="0.00000400" required>' +
              '</div>';
      } else {
          html =
              '<div class="form-group text-left">' +
                  '<label for="salesLogCurrencyPair">Coin</label>' +
                  '<input type="text" id="salesLogCurrencyPair" name="salesLogCurrencyPair" class="form-control" placeholder="BTC">' +
                  '<small>Coin needs to follow the same format, as the other coins you see in the different logs, such as Possible Buy Log, Pairs Log, etc.</small>' +
              '</div>' +
              '<div class="form-group text-left">' +
                  '<label for="salesLogAmount">SoldAmount</label>' +
                  '<input type="text" id="salesLogAmount" name="salesLogAmount" placeholder="1000" class="form-control">' +
              '</div>' +
              '<div class="form-group text-left">' +
                  '<label for="salesLogSoldPrice">SoldPrice</label>' +
                  '<input type="text" id="salesLogSoldPrice" name="salesLogSoldPrice" placeholder="0.00000400" class="form-control">' +
              '</div>' +
              '<div class="form-group text-left">' +
                  '<label for="salesLogAvgPrice">BoughtPrice.colName</label>' +
                  '<input type="text" id="salesLogAvgPrice" name="salesLogAvgPrice" placeholder="0.00000400" class="form-control">' +
              '</div>';
      }
      return html;
    },
    renderAlertBox(title, text, icon, cancelBtnText, confirmBtnText, inputType, value) {
      // To return swal method which will render alert box when called with proper parameters.
      var swalObject = {
        title: title,
        text: text,
        icon: icon,
        cancelButtonText: cancelBtnText,
        showCancelButton: true,
      };
      if (inputType && value) {
          swalObject.input = inputType;
          swalObject.inputValue = value;
          swalObject.inputValidator =  (value) => {
            if (!value) {
                return '<b>please insert a value</b>';
            }
          }
        };

      if (inputType === 'select') {
        swalObject.input = 'select',
        swalObject.inputOptions = {
          IOC: 'IOC',
          MARKET: 'MARKET'
        };
      };
      return this.$swal(swalObject);
    },
    renderBuyorSellModal(title, html){
      return this.$swal({
        title: `Add new ${title} Record`,
        icon: "warning",
        html: html,
        showCancelButton: true,
        cancelButtonText: 'Cancel',
        confirmButtonColor: '#DD6B55',
        confirmButtonText: 'AddRecord',
        reverseButtons: true,
        preConfirm: () => {
          if(title === 'buys') {
            if (document.getElementById('buyLogCurrencyPair').value && document.getElementById('buyLogAmount').value && document.getElementById('buyLogAvgPrice').value) {
                var formData= {
                  'buyLogCurrencyPair': document.getElementById('buyLogCurrencyPair').value,
                  'buyLogAmount': document.getElementById('buyLogAmount').value,
                  'buyLogAvgPrice': document.getElementById('buyLogAvgPrice').value
                };
                axios.post(THE_BASE_URL + '/action/logBuy?currencyPair=' + formData.buyLogCurrencyPair + '&boughtAmount=' + formData.buyLogAmount + '&boughtPrice=' + formData.buyLogAvgPrice).then(response => { 
                  this.$swal.fire('Record is Added Sucessfully');
                })
                .catch(error => {
                  if(error.response.status === 304){
                    this.$swal.fire({
                      title: 'Something went wrong',
                      text: error.response.statusText
                    });
                  }
                });
            } else {
              this.$swal.showValidationMessage('filledProperties');
            }
        } else {
            if(document.getElementById('salesLogCurrencyPair').value && document.getElementById('salesLogAmount').value && document.getElementById('salesLogSoldPrice').value && document.getElementById('salesLogAvgPrice').value) {
              var formData= {
                'salesLogCurrencyPair': document.getElementById('salesLogCurrencyPair').value,
                'salesLogAmount': document.getElementById('salesLogAmount').value,
                'salesLogSoldPrice': document.getElementById('salesLogSoldPrice').value,
                'salesLogAvgPrice': document.getElementById('salesLogAvgPrice').value
              };
              axios.post(THE_BASE_URL + '/action/logSell?currencyPair=' + formData.salesLogCurrencyPair + '&soldAmount=' + formData.salesLogAmount + '&soldPrice=' + formData.salesLogSoldPrice + '&boughtPrice=' + formData.salesLogAvgPrice).then(response => { 
                this.$swal.fire('Record is Added Sucessfully');
              })
              .catch(error => {
                this.$swal.fire({
                  title: 'Something went wrong',
                  text: error.response.statusText
                });
              });
            } else {
              this.$swal.showValidationMessage('filledProperties');
            }
          }
        }
      });
    }, 
    addActionButtons(data) {
      let isBitmex = false;
      let buildButtons = '';
      var stringOpen = 'buy';
      var stringClose = 'sell';
  
      if(this.dtCache.exchange.toLowerCase() === 'bitmex') {
          isBitmex = true;
          stringOpen = 'open';
          stringClose = 'close';
        }
  
      if(data.logType === 'PBL') {
        buildButtons += `<span class="badge badge-outline badge badge-light-success buy-or-sell-btn" data-name=${data.logType} data-pair=${data.market} data-buy-or-sell=${stringOpen} style="cursor: pointer;font-size: 12px!important;width: auto;">${stringOpen.toUpperCase()}</span>`;
        return buildButtons;
      }
      if(data.logType === 'PAIRSBACKUP') {
        if(!isBitmex) {
          buildButtons += '<span class="badge badge-outline badge badge-light-success pending-btn" data-name="'+data.logType+'" data-pair="'+data.market+'" data-avg-price="'+data.avgPrice+'" data-pending="pending" style="cursor: pointer;font-size: 12px!important;width: auto;">PENDING</span>';
        }
        buildButtons += '<span class="badge badge-outline badge-light-danger buy-or-sell-btn" data-name="'+data.logType+'" data-pair="'+data.market+'" data-buy-or-sell="'+ stringClose +'" style="cursor: pointer;font-size: 12px!important;width: auto;">'+ stringClose.toUpperCase() +'</span><br>';
        buildButtons += '<span class="badge badge-outline badge-info boughtCost-btn" data-name="'+data.logType+'" data-pair="'+data.currency+'" data-avg-price="'+data.avgPrice+'" data-boughtCost="boughtCost" style="cursor: pointer;font-size: 12px!important;width:100px;width: auto;">BOUGHT COST</span>';
        buildButtons += '<span class="badge badge-outline badge-info reserve-btn" data-name="'+data.logType+'" data-pair="'+data.market+'" data-amount="'+data.totalAmount+'" style="cursor: pointer;font-size: 12px!important;width: auto;">RESERVE</span>';
        return buildButtons;
      }
      if(data.logType === 'DCABACKUP') {
        buildButtons += '<span class="badge badge-outline badge badge-light-success buy-or-sell-btn" data-name="'+data.logType+'" data-pair="'+data.market+'" data-buy-or-sell="'+ stringOpen +'" style="cursor: pointer;font-size: 12px!important;width: auto;">'+ stringOpen.toUpperCase() +'</span>';
  
        if(!isBitmex) {
          buildButtons += '<span class="badge badge-outline badge badge-light-success pending-btn" data-name="'+data.logType+'" data-pair="'+data.market+'" data-avg-price="'+data.avgPrice+'" data-pending="pending" style="cursor: pointer;font-size: 12px!important;width: auto;">PENDING</span>';
        }
        buildButtons += '<span class="badge badge-outline badge-light-danger buy-or-sell-btn" data-name="'+data.logType+'" data-pair="'+data.market+'" data-buy-or-sell="'+ stringClose +'" style="cursor: pointer;font-size: 12px!important;width: auto;">'+ stringClose.toUpperCase() +'</span><br>';
        buildButtons += '<span class="badge badge-outline badge-info boughtCost-btn" data-name="'+data.logType+'" data-pair="'+data.currency+'" data-avg-price="'+data.avgPrice+'" data-boughtCost="boughtCost" style="cursor: pointer;font-size: 12px!important; width: auto;;">BOUGHT COST</span>';
        buildButtons += '<span class="badge badge-outline badge-info reserve-btn" data-name="'+data.logType+'" data-pair="'+data.market+'" data-amount="'+data.totalAmount+'" style="cursor: pointer;font-size: 12px!important;width: auto;">RESERVE</span>';
        return buildButtons;
  
      }
      if(data.logType === 'PENDING') {
        buildButtons += '<span class="badge badge-outline badge-light-danger buy-or-sell-btn cancel-pending" data-name="'+data.logType+'" data-pair="'+data.market+'" data-order-number="'+data.orderNumber+'" data-buy-or-sell="cancel" style="cursor: pointer;font-size: 12px!important;width: auto;">CANCEL</span>';
        return buildButtons;
      }
      if(data.logType === 'RESERVED') {
        buildButtons += '<span class="badge badge-outline badge-info release-btn" data-name="'+data.logType+'" data-pair="'+data.market+'" data-amount="'+data.totalAmount+'" style="cursor: pointer;font-size: 12px!important;width: auto;">RELEASE</span>';
        return buildButtons;
      }
      if(data.logType === 'DUST') {
        buildButtons += '<span class="badge badge-outline badge badge-light-success buy-or-sell-btn" data-name="'+data.logType+'" data-pair="'+data.market+'" data-buy-or-sell="'+ stringOpen +'" style="cursor: pointer;font-size: 12px!important;width: auto;">'+ stringOpen.toUpperCase() +'</span>';
        return buildButtons;
      }
      if(data.logType === 'REVERSAL') {
        buildButtons += '<span class="badge badge-outline badge badge-light-success cancel-reversal" data-name="'+data.logType+'" data-pair="'+data.market+'" data-position="'+data.id+'" style="cursor: pointer;font-size: 12px!important;width: auto;">CANCEL REVERSAL</span>';
        return buildButtons;
      }
      return '';
    }
  }
};
