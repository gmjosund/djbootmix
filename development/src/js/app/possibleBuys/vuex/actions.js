import axios from 'axios'

export const getPossibleBuysLog = ({commit}) => {
  return axios.get(THE_BASE_URL + '/api/v2/data/pbl').then((response) => {
    commit('setPossibleBuysLog', response.data)
  })
  
}
