import { DEFAULT_VALUE } from '../../../helpers/constants';

export const getPropertyLogs = (state) => {
    return state.properties
  }

export const misc = (state) => {
    return state.miscLogs;
}

export const currency = state => {
  if (typeof state.properties === 'undefined' || typeof state.properties.currency === 'undefined') {
    return DEFAULT_VALUE;
  }
  return state.properties.currency;
};

export const market = state => {
  if (typeof state.serverData !== 'undefined' && typeof state.serverData.market !== 'undefined') {
    return state.serverData.market;
  }
  return DEFAULT_VALUE;
};
