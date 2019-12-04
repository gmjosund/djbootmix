import axios from 'axios'

export const getPairsLog = ({commit}) => {
  return axios.get(THE_BASE_URL + '/api/v2/data/pairs').then((response) => {
    commit('setPairsLog', response.data)
  })
  
}
