import {BASE_CURRENCY, CURRENCY_SYMBOLS, BASE_CURRENCY_NAME, BASE_CURRENCY_SYMBOL} from '../../../helpers/constants';

export const setCurrencies = (state, data) => {
    state.currencies = data
}

export const normalizeAndSetProperties = (state, data) => {
	var currencies = state.currencies;
	var currentCurrency = data.currency;
	var isBaseCurrency =
	  currentCurrency && currencies && currencies.hasOwnProperty(currentCurrency)
		? false
		: true;
	data.currency = isBaseCurrency ? BASE_CURRENCY : currentCurrency;
	data.currencyValue = isBaseCurrency ? 1 : currencies[currentCurrency];
	if (!isBaseCurrency && CURRENCY_SYMBOLS.hasOwnProperty(currentCurrency)) {
	  data.currencySymbol = CURRENCY_SYMBOLS[currentCurrency].symbol;
	  // Add transalations
	  data.currencyName = CURRENCY_SYMBOLS[currentCurrency].name;
	} else {
	  data.currencySymbol = BASE_CURRENCY_SYMBOL;
	  // Add translations
	  data.currencyName = BASE_CURRENCY_NAME;
	}
	var combineData = { ...data, ...state.miscLogs };
	state.properties = combineData;
  };
  

export const setMicLogs = (state, data) => {
	state.miscLogs = data
}
