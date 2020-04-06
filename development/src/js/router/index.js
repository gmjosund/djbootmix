import Vue from 'vue'
import Router from 'vue-router'
import { routes as routes } from '../app/index'
import Store from '../vuex/index'
import { TABLES_ACTION } from '../helpers/constants'

Vue.use(Router)

const router = new Router({
  routes: routes
})

// Register beforeEach

router.beforeEach((to, from, next) => {
  if (
    TABLES_ACTION[to.name] &&
    !Store.state.header.properties.hasOwnProperty("currency")
  ) {
    Promise.all([
      Store.dispatch(`${TABLES_ACTION[to.name]}`),
      Store.dispatch("header/getMiscLogs"),
      Store.dispatch("header/getCurrencies"),
      Store.dispatch("header/getPropertyLogs")
    ]).finally(() => {
      next();
    });
  } else {
    next();
  }  
});

export default router
