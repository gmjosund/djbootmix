import axios from 'axios'

export const getPendingLog = ({commit}) => {
  return axios.get(THE_BASE_URL + '/api/v2/data/pending').then((response) => {
    commit('setPendingLog', response.data)
  })
  
}
