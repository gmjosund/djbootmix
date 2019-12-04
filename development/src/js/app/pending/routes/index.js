import Pending from "../components/Pending";

export default [
  {
    path: '/pending',
    component: Pending,
    name: 'pending',
    meta: {
      guest: false,
      needsAuth: true
    }
  }
]
