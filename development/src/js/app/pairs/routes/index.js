import Pairs from "../components/Pairs";

export default [
  {
    path: '/pairs',
    component: Pairs,
    name: 'pairs',
    meta: {
      guest: false,
      needsAuth: true
    }
  }
]
