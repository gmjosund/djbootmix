import Login from "../components/Login";

export default [
  {
    path: '/login',
    component: Login,
    name: 'login',
    meta: {
      guest: true,
      needsAuth: false
    }
  }
]
