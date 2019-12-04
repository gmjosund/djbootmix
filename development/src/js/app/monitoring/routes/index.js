import Monitoring from "../components/Monitoring";

export default [
  {
    path: '/',
    redirect: '/monitoring'
  },
  {
    path: '/monitoring',
    component: Monitoring,
    name: 'monitoring',
    meta: {
      guest: false,
      needsAuth: true
    }
  }

]
