// API URLS
export const API_URLS = {
  BASE_URL: 'http://localhost:8080',
  DATA_URL: '/monitoring/data',
  API_LOGS_URL: '/monitoring/log',
  GLOBAL_MARKET_URL: 'https://api.coinmarketcap.com/v1/global/?convert=',
  MARKET_CAP_API_URL: 'https://api.coinmarketcap.com/v1/ticker/?convert=',
  CURRENCIES_API_URL: 'https://min-api.cryptocompare.com/data/price?fsym=USD&tsyms=AUD,BGN,BRL,CAD,CHF,CNY,CZK,' +
  'DKK,EUR,GBP,HKD,HRK,HUF,IDR,ILS,INR,ISK,JPY,KRW,MXN,MYR,NOK,NZD,PHP,PLN,RON,RUB,SEK,SGD,THB,TRY,ZAR',
  CONFIG_GET_URL: '/settings/load?fileName=',
  CONFIG_SAVE_URL: '/settings/save?fileName=',
  BOT_RESET_URL: '/settings/test/reset',
  SAVE_SOMO_URL: '/settings/overrideSellOnlyMode'
};
API_URLS.MARKET_TREND_URL = `${API_URLS.BASE_URL}/private?command=returnTicker`;

// Axios options.
export const AXIOS_OPTIONS = {
  timeout: 5000,
};
// Timers
export const TIMERS = {
  REFRESH_TIMER: 5000, // 5 seconds
  COIN_MARKET_REFRESH: (20 * 60 * 1000), // 20 minutes
  CURRENCY_API_CALL_FREQUENCY: (24 * 60 * 60 * 1000), // 24 hours
};

export const DEFAULT_VALUE = '--';
export const SUCCESS_STATUS_CODE = 200;
export const DEFAULT_PRECISION = 8;
export const MARKET_CAP_CURRENCY = 'BTC';
export const DEFAULT_MARKET = 'BTC';
export const POSITIVE_CLASS_TEXT = 'text-success';
export const NEGATIVE_CLASS_TEXT = 'text-danger';
export const POSITIVE_BADGE = 'badge-success';
export const NEGATIVE_BADGE = 'badge-danger';
export const HIDE_MARKET_PRICE_ROW_COMPARISION = 'USDT';
export const HIDE_PROFIT_MARKET_AND_ESTIMATED_USD = 'USDT';
export const BASE_CURRENCY = 'USD';
export const BASE_CURRENCY_SYMBOL = '$';
export const BASE_CURRENCY_NAME = 'United States Dollar';
export const BADGE_SUCCESS = 'badge badge-light-success';
export const BADGE_DANGER = 'badge-light-danger'

// DT helper constants
export const PROFIT_GREEN = 0;
export const POSITIVE_CLASS = 'tdgreen';
export const NEGATIVE_CLASS = 'tdred';
export const FEE_LESS_THAN_ONE = 0.005;
export const FEE_GREATER_THAN_ONE = 0.0025;
export const ENABLE_CHNGE_PSWRD_ROLE = 'A';

// Currency symbols codes
export const CURRENCY_SYMBOLS = {
  USD: {
    symbol: '$',
    name: 'United States Dollar'
  },
  AUD: {
    symbol: '&#36;',
    name: 'Australian Dollar'
  },
  BGN: {
    symbol: '&#1083;&#1074;',
    name: 'Bulgarian Lev'
  },
  BRL: {
    symbol: '&#82;&#36;',
    name: 'Brazilian Real'
  },
  CAD: {
    symbol: '&#36;',
    name: 'Canadian Dollar'
  },
  CHF: {
    symbol: '&#67;&#72;&#70;',
    name: 'Swiss Franc'
  },
  CNY: {
    symbol: '&#165;',
    name: 'Chinese Yuan'
  },
  CZK: {
    symbol: '&#75;&#269;',
    name: 'Czech Koruna'
  },
  DKK: {
    symbol: '&#107;&#114;',
    name: 'Danish Krone'
  },
  GBP: {
    symbol: '&#163;',
    name: 'Pound Sterling'
  },
  HKD: {
    symbol: '&#36;',
    name: 'Hong Kong Dollar'
  },
  HRK: {
    symbol: '&#107;&#110;',
    name: 'Croatian Kuna'
  },
  HUF: {
    symbol: '&#70;&#116;',
    name: 'Hungarian Forint'
  },
  IDR: {
    symbol: '&#82;&#112;',
    name: 'Indonesia Rupiah'
  },
  ILS: {
    symbol: '&#8362;',
    name: 'Israeli New Shekel'
  },
  INR: {
    symbol: '&#x20B9;',
    name: 'Indian Rupee'
  },
  JPY: {
    symbol: '&#165;',
    name: 'Japanese Yen'
  },
  KRW: {
    symbol: '&#8361;',
    name: 'Korean Won'
  },
  MXN: {
    symbol: '&#36;',
    name: 'Mexican Peso'
  },
  MYR: {
    symbol: '&#82;&#77;',
    name: 'Malaysian Ringgit'
  },
  NOK: {
    symbol: '&#107;&#114;',
    name: 'Norwegian Krone'
  },
  NZD: {
    symbol: '&#36;',
    name: 'New Zealand Dollar'
  },
  PHP: {
    symbol: '&#8369;',
    name: 'Philippine peso'
  },
  PLN: {
    symbol: '&#122;&#322;',
    name: 'Polish Zloty'
  },
  RON: {
    symbol: '&#108;&#101;&#105;',
    name: 'Romanian Leu'
  },
  RUB: {
    symbol: '&#8381;',
    name: 'Russia Ruble'
  },
  SEK: {
    symbol: '&#107;&#114;',
    name: 'Swedish Krona'
  },
  SGD: {
    symbol: '&#36;',
    name: 'Singapore Dollar'
  },
  THB: {
    symbol: '&#3647;',
    name: 'Thailand Baht'
  },
  TRY: {
    symbol: '&#x20BA;',
    name: 'Turkish Lira'
  },
  ZAR: {
    symbol: '&#82;',
    name: 'South African Rand'
  },
  EUR: {
    symbol: '&#8364;',
    name: 'Euro'
  }
};

// NOTIFICATION
export const NOTIFICATIONS = {
  MAX: 20,
  DEFAULT: 5,
  NOTIFICATIONS_CUT_OFF: 1500,
};

// THEME
export const DEFAULT_THEME = 'dark';
export const THEMES = ['light', 'dark'];

// Language
export const DEFAULT_LANG = 'engb';

export const FLAGS = {
  enus: {
    class: 'us',
    title: 'American English - US',
    dateFormat: 'm/d/yyyy',
    is12HourFormat: true
  },
  engb: {
    class: 'gb',
    title: 'European English - UK',
    dateFormat: 'dd/mm/yyyy'
  },
  fr: {
    class: 'fr',
    title: 'French - France',
    dateFormat: 'dd/mm/yyyy'
  },
  br: {
    class: 'br',
    title: 'Brazilian Portuguese  - Brazil',
    dateFormat: 'dd/mm/yyyy'
  },
  ja: {
    class: 'jp',
    title: 'Japanese - Japan',
    dateFormat: 'yyyy/mm/dd'
  },
  es: {
    class: 'es',
    title: 'Spanish - Spain',
    dateFormat: 'd/mm/yyyy'
  },
  ru: {
    class: 'ru',
    title: 'Russian - Russia',
    dateFormat: 'dd.mm.yyyy'
  },
  vi: {
    class: 'vn',
    title: 'Vietnamese - Vietnam',
    dateFormat: 'dd/mm/yyyy'
  },
  chs: {
    class: 'cn',
    title: 'Simplified Chinese - China',
    dateFormat: 'yyyy-m-d'
  },
  cht: {
    class: 'tw',
    title: 'Traditional Chinese - Taiwan',
    dateFormat: 'yyyy/m/d'
  },
  el: {
    class: 'gr',
    title: 'Greek - Greece',
    dateFormat: 'd/m/yyyy'
  },
  tr: {
    class: 'tr',
    title: 'Turkish - Turkey',
    dateFormat: 'dd.mm.yyyy'
  },
  it: {
    class: 'it',
    title: 'Italian - Italy',
    dateFormat: 'dd/mm/yyyy'
  },
  de: {
    class: 'de',
    title: 'German - Germany',
    dateFormat: 'dd.mm.yyyy'
  },
  no: {
    class: 'no',
    title: 'Norwegian - Norway',
    dateFormat: 'dd.mm.yyyy'
  },
  nl: {
    class: 'nl',
    title: 'Dutch - Netherlands',
    dateFormat: 'd-m-yyyy'
  },
  pt: {
    class: 'pt',
    title: 'Portuguese - Portugal',
    dateFormat: 'dd-mm-yyyy'
  },
  ar: {
    class: 'il',
    title: 'Arabic - Israel',
    dateFormat: 'dd/mm/yyyy'
  },
  ko: {
    class: 'kr',
    title: 'Korean - South Korea',
    dateFormat: 'yyyy.m.d'
  }
};

export const DEFAULT_DATE_FORMAT = FLAGS[DEFAULT_LANG];

export const PT_LINKS = {
  monitoring: {
    link: '/monitoring',
    text: 'sidebar.monitoring'
  },
  possibleBuy: {
    link: '/possible-buys-log',
    text: 'sidebar.possibleBuyLog'
  },
  pairs: {
    link: '/pairs-log',
    text: 'sidebar.pairsLog'
  },
  dca: {
    link: '/dca-log',
    text: 'sidebar.dcaLog'
  },
  pending: {
    link: '/pending-log',
    text: 'sidebar.pendingLog'
  },
  buy: {
    link: '/buy-log',
    text: 'sidebar.buyLog'
  },
  sales: {
    link: '/sales-log',
    text: 'sidebar.salesLog'
  },
  dust: {
    link: '/dust-log',
    text: 'sidebar.dustLog'
  },
  APILogs: {
    link: '/api-logs',
    text: 'sidebar.APILogs'
  },
  config: {
    link: '/config',
    text: 'sidebar.config'
  },
};

export const DEFAULT_COMPONENTS_LIST = [
  {
    component: 'balance',
    visibility: true
  },
  {
    component: 'tcv',
    visibility: true
  },
  {
    component: 'startBalance',
    visibility: true
  },
  {
    component: 'btcTrend',
    visibility: true
  },
  {
    component: 'totalMarketCap',
    visibility: true
  },
  {
    component: 'profitLastWeek',
    visibility: true
  },
  {
    component: 'profitToday',
    visibility: true
  },
  {
    component: 'profitYesterday',
    visibility: true
  },
  {
    component: 'somo',
    visibility: true
  },
  {
    component: 'pairsLog',
    visibility: true
  },
  {
    component: 'dcaLog',
    visibility: true
  },
  {
    component: 'pendingLog',
    visibility: true
  },
  {
    component: 'salesLog',
    visibility: true
  }
];
