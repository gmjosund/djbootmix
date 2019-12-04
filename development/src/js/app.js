import Vue from 'vue'
import router from './router'
import store from './vuex'
import App from './App.vue'
import BootstrapVue from 'bootstrap-vue'
import PortalVue from 'portal-vue'

import './filters'
import './directives'


Vue.use(BootstrapVue)
Vue.use(PortalVue)


const app = new Vue({
    el: '#app',
    store: store,
    router: router,
    components: { App },
    template: '<App/>'
});
