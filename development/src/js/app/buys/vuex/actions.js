import axios from 'axios'

export const getBuysLog = ({commit}) => {
  return axios.get(THE_BASE_URL + '/api/v2/data/buys').then((response) => {
    commit('setBuyLog', response.data.data)
  })
  
}
