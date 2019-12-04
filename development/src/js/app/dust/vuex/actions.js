import axios from 'axios'

export const getDustLog = ({commit}) => {
  return axios.get(THE_BASE_URL + '/api/v2/data/dust').then((response) => {
    commit('setDustLog', response.data)
  })
  
}
