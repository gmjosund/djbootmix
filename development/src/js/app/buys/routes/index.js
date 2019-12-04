import Buys from "../components/Buys";

export default [
  {
    path: '/buys',
    component: Buys,
    name: 'buys',
    meta: {
      guest: false,
      needsAuth: true
    }
  }
]
