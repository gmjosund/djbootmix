import axios from 'axios'

export const getSalesLog = ({commit}) => {
  return axios.get(THE_BASE_URL + '/api/v2/data/sales').then((response) => {
    commit('setSalesLog', response.data.data)
  })
  
}
