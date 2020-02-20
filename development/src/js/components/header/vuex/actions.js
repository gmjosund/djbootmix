import axios from 'axios'
import { TIMERS} from '../../../helpers/constants';


export const getCurrencies = ({ commit, dispatch }) => {
  const currenciesLocalStorageKey = 'currencies';
  const currenciesAPICalledTimeLocalStorageKey = 'currenciesAPICalledTime';
  var currenciesTmp = localStorage.getItem(currenciesLocalStorageKey);
  var currenciesAPICalledTime = +localStorage.getItem(
    currenciesAPICalledTimeLocalStorageKey
  );
  var currentEpochTime = new Date().getTime();
  if (currenciesTmp && currenciesAPICalledTime) {
    if (
      currentEpochTime - currenciesAPICalledTime <
      TIMERS.CURRENCY_API_CALL_FREQUENCY
    ) {
      commit('setCurrencies', JSON.parse(currenciesTmp));
      return;
    }
  } else {
    dispatch('getCurrencyData', currentEpochTime, currenciesAPICalledTimeLocalStorageKey);
  }
};

export const getCurrencyData = ({commit}, currentEpochTime) => {
  const currenciesLocalStorageKey = 'currencies';
  const currenciesAPICalledTimeLocalStorageKey = 'currenciesAPICalledTime';
  return axios.get(API_URLS.CURRENCIES_API_URL).then((response) => {
    if (response.data) {
      localStorage.setItem(currenciesLocalStorageKey,JSON.stringify(response.data));
      localStorage.setItem(currenciesAPICalledTimeLocalStorageKey,currentEpochTime);
			commit('setCurrencies', response.data);
    }
  });
}

export const getPropertyLogs = ({commit}) => {
  return axios.get(THE_BASE_URL + '/api/v2/data/properties').then((response) => {
    commit('normalizeAndSetProperties', response.data);
  });
}

export const getMiscLogs = ({commit}) => {
	return axios.get(THE_BASE_URL + '/api/v2/data/misc').then((response) => {
		commit('setMicLogs', response.data)
	})
}

export const buyOrSellPair = ({ commit }, data) => {
  return axios
    .post(
      THE_BASE_URL +
        '/action/' +
        data.buyOrSell +
        '?currencyPair=' +
        data.pair +
        '&executionType=' +
        data.executionType
    )
    .then(response => {
      data.vm.$swal.fire('Submitted order');
    })
    .catch(error => {
      if (error.response.status === 304) {
        data.vm.$swal.fire({
          title: 'Something went wrong',
          text: error.response.statusText
        });
      }
    });
};

export const enterPending = ({ commit }, data) => {
  return axios
    .post(
      THE_BASE_URL +
        '/action/pending?currencyPair=' +
        data.pairName +
        '&targetPrice=' +
        data.targetPrice
    )
    .then(response => {
      data.vm.$swal.fire('Submitted order');
    })
    .catch(error => {
      if (error.response.status === 404) {
        data.vm.$swal.fire({
          title: 'ENDPOINT NOT YET IMPLEMENTED: ',
          text: error.response.statusText
        });
      }
    });
};

export const reserveAmount = ({ commit }, data) => {
  return axios
    .post(
      THE_BASE_URL +
        '/api/v2/balance/reserve?amount=' +
        data.amount +
        '&currencyPair=' +
        data.pair
    )
    .then(response => {
      data.vm.$swal.fire('Record is Added Sucessfully');
    })
    .catch(error => {
      if (error.response.status === 304) {
        data.vm.$swal.fire({
          title: 'Something went wrong',
          text: error.response.statusText
        });
      }
    });
};

export const cancelPending = ({ commit }, data) => {
  return axios
    .post(
      THE_BASE_URL +
        '/action/cancel?currencyPair=' +
        data.pairName +
        '&orderNumber=' +
        data.orderNumber
    )
    .then(response => {
      data.vm.$swal.fire('Record is Added Sucessfully');
    })
    .catch(error => {
      if (error.response.status === 304) {
        data.vm.$swal.fire({
          title: 'Something went wrong',
          text: error.response.statusText
        });
      }
    });
};

export const boughtCost = ({commit}, data) => {
  return axios({
    method: 'post',
    url: THE_BASE_URL + '/settings/save?fileName='+ data.filename + '&configName=' + data.configName,
    data: data.fileData,
  }).then(response => { 
    data.vm.$swal.fire('You have successfully saved the data');
  })
  .catch(error => {
    if(error.response.status === 304){
      data.vm.$swal.fire({
        title: 'Something went wrong',
        text: error.response.statusText
      });
    }
  });
}
