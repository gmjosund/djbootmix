import Sales from "../components/Sales";

export default [
  {
    path: '/sales',
    component: Sales,
    name: 'sales',
    meta: {
      guest: false,
      needsAuth: true
    }
  }
]
