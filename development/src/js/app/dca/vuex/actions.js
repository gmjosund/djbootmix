import axios from 'axios'

export const getDcaLog = ({commit}) => {
  return axios.get(THE_BASE_URL + '/api/v2/data/dca').then((response) => {
    commit('setDcaLog', response.data)
  })
  
}
