import DCA from "../components/DCA";

export default [
  {
    path: '/dca',
    component: DCA,
    name: 'dca',
    meta: {
      guest: false,
      needsAuth: true
    }
  }
]
