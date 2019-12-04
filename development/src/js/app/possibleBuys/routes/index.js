import PossibleBuys from "../components/PossibleBuys";

export default [
  {
    path: '/possible-buys',
    component: PossibleBuys,
    name: 'possible-buys',
    meta: {
      guest: false,
      needsAuth: true
    }
  }
]
