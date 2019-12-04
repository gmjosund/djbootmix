import Vue from 'vue';
import $ from 'jquery';
import 'timeago';

import { DEFAULT_PRECISION, DEFAULT_VALUE,
  POSITIVE_CLASS_TEXT, NEGATIVE_CLASS_TEXT } from './helpers/constants';

Vue.filter('normalizeValueWithComma', (valToFormat, precision) => {
  // To normalize numerical data by adding commas and precision based on parameters.
  if (typeof valToFormat === 'undefined') {
    return DEFAULT_VALUE;
  }
  let value;
  if (precision) {
    const precisionToUse = precision;
    const precisionTemp = isNaN(precisionToUse) ? DEFAULT_PRECISION : precisionToUse;
    value = isNaN(parseInt(valToFormat, 10)) ? '' :
      parseFloat(valToFormat).toFixed(precisionTemp);
  } else {
    value = valToFormat;
  }
  let valueString = value.toString();
  const valArr = valueString.split('.');
  if (valArr[1]) {
    valArr[0] = valArr[0].replace(/(\d)(?=(\d\d\d)+(?!\d))/g, '$1,');
    valueString = valArr.join('.');
  } else {
    valueString = valueString.replace(/(\d)(?=(\d\d\d)+(?!\d))/g, '$1,');
  }
  return valueString;
});

Vue.filter('getGainPercent', (gainPercent, precision) => {
  // To get Estimated gain percentage.
  if (typeof gainPercent === 'undefined') {
    return DEFAULT_VALUE;
  }
  let returnVal = parseFloat(gainPercent.toFixed(precision)).toFixed(precision);
  return returnVal;
});

Vue.filter('getValueInCurrentCurrency', (valToFormat, data, precision) => {
  if (!data || typeof valToFormat === 'undefined') {
    return DEFAULT_VALUE;
  }
  let valueStr = valToFormat.toString();
  let returnVal = valToFormat;
  const marketTemp = data.market;
  const marketPrice = data[`${marketTemp}USDTPrice`] ?
    data[`${marketTemp}USDTPrice`] : 1;
  returnVal = valToFormat * marketPrice * data.currencyValue;
  if (precision) {
    const precisionToUse = precision || DEFAULT_PRECISION;
    const precisionTemp = isNaN(precisionToUse) ? DEFAULT_PRECISION : precisionToUse;
    returnVal = isNaN(parseInt(returnVal, 10)) ? '' :
      parseFloat(returnVal.toFixed(precisionTemp)).toFixed(precisionTemp);
    valueStr = returnVal.toString();
    const valArr = valueStr.split('.');
    if (valArr[1]) {
      valArr[0] = valArr[0].replace(/(\d)(?=(\d\d\d)+(?!\d))/g, '$1,');
      valueStr = valArr.join('.');
    } else {
      valueStr = valueStr.replace(/(\d)(?=(\d\d\d)+(?!\d))/g, '$1,');
    }
  }
  return valueStr;
});

Vue.filter('checkAndAddPrecision', (data, precision) => {
  if (typeof data === 'undefined') {
    return DEFAULT_VALUE;
  }
  const precisionToUse = parseInt(precision, 10);
  const precisionTemp = isNaN(precisionToUse) ? DEFAULT_PRECISION : precisionToUse;
  const returnVal = isNaN(parseInt(data, 10)) ? '' :
    parseFloat(data.toFixed(precisionTemp)).toFixed(precisionTemp);
  return returnVal;
});


Vue.filter('renderTimeAgo', (dateTime, timeZoneOffset) => {
  if (typeof dateTime === 'undefined') {
    return DEFAULT_VALUE;
  }
  const date = dateTime.split('T');
  const timeSplit = date[1].split(':');
  const timeZoneArr = timeZoneOffset.split(':');
  timeSplit[0] = parseInt(timeSplit[0], 10) + parseInt(timeZoneArr[0], 10);
  timeSplit[1] = parseInt(timeSplit[1], 10) + parseInt(timeZoneArr[1], 10);
  timeSplit[0] = timeSplit[0].toString();
  timeSplit[1] = timeSplit[1].toString();
  let realTime = timeSplit.join(':');
  realTime = `${date[0]}T${realTime}`;
  realTime += timeZoneOffset;
  return $.timeago(realTime);
});

Vue.filter('capitalizeAndGetData', (data, prop) => {
  if (typeof data === 'undefined' || typeof data[prop] === 'undefined') {
    return DEFAULT_VALUE;
  }
  const dataStr = data[prop].toString();
  return dataStr.charAt(0).toUpperCase() + dataStr.slice(1);
});

Vue.filter('renderClassByData', (data) => {
  if (typeof data === 'undefined' || data === DEFAULT_VALUE || data === '') {
    return DEFAULT_VALUE;
  }
  return parseFloat(data) >= 0 ? POSITIVE_CLASS_TEXT : NEGATIVE_CLASS_TEXT;
});

Vue.filter('renderOnOff', (data, prop) => {
  // To render on off text based on API boolean data.
  if (typeof data === 'undefined') {
    return DEFAULT_VALUE;
  }
  if (data[prop] === true) {
    return 'On';
  } else if (data[prop] === false) {
    return 'Off';
  }
  return DEFAULT_VALUE;
});

Vue.filter('isEmpty', (data) => {
  // To return data only when it is present or else return default value.
  if (typeof data === 'undefined' || data === '') {
    return DEFAULT_VALUE;
  }
  return data;
});

Vue.filter('hasData', (object, property) => {
  // Render element only when data is present.
  if (typeof object !== 'undefined' && typeof object[property] !== 'undefined') {
    return false;
  }
  return true;
});

Vue.filter('addPercent', (data) => {
  // To render percentage sign only when data is present.
  if (typeof data === 'undefined' || data === '' || data === DEFAULT_VALUE) {
    return '';
  }
  return `${data} %`;
});

Vue.filter('renderOnOffForConfig', (data) => {
  // To render on off text based on API boolean data for config.
  if (typeof data === 'undefined') {
    return DEFAULT_VALUE;
  }
  if (data.passwordSet === false || data.enableConfig === false) {
    return 'Off';
  }
  if (data.enableConfig === true) {
    return 'On';
  }
  return DEFAULT_VALUE;
});
