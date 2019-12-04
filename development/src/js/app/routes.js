import login from './auth/routes'
import monitoring from './monitoring/routes'
import possibleBuys from './possibleBuys/routes'
import pairs from './pairs/routes'
import dca from './dca/routes'
import pending from './pending/routes'
import buys from './buys/routes'
import sales from './sales/routes'
import dust from './dust/routes'
import apiLogs from './apiLogs/routes'

export default [
  ...login,
  ...monitoring,
  ...possibleBuys,
  ...pairs,
  ...dca,
  ...pending,
  ...buys,
  ...sales,
  ...dust,
  ...apiLogs,
]
