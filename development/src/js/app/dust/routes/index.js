import Dust from "../components/Dust";

export default [
  {
    path: '/dust',
    component: Dust,
    name: 'dust',
    meta: {
      guest: false,
      needsAuth: true
    }
  }
]
