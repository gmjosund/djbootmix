import axios from 'axios'

axios.defaults.headers.post['Content-Type'] ='application/x-www-form-urlencoded';
axios.defaults.headers.post['Access-Control-Allow-Origin'] = '*';

export const login = ({commit}, {payload, password}) => {
  console.log(JSON.stringify(payload))
  console.log(password)

  return axios.post('/login', {'password': password}).then((response) => {

    console.log(response)
  }).catch((error) => {
    console.log(error)
  })
}
