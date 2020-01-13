import axios from 'axios'

export const getPairsLog = ({commit}) => {
  return axios.get(THE_BASE_URL + '/api/v2/data/pairs').then((response) => {
    commit('setPairsLog', response.data)
  })
  
}

export const getServerData = ({commit}) => {
  return axios.get(THE_BASE_URL + '/monitoring/data').then((response) => {
    commit('setServerData', response.data)
  })
  
}
