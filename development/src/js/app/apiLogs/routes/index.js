import ApiLogs from "../components/ApiLogs";

export default [
  {
    path: '/api-logs',
    component: ApiLogs,
    name: 'apiLogs',
    meta: {
      guest: false,
      needsAuth: true
    }
  }
]
