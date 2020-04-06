import Vue from 'vue'
import router from './router'
import store from './vuex'
import App from './App.vue'
import BootstrapVue from 'bootstrap-vue'
import VueSweetalert2 from 'vue-sweetalert2'
import 'sweetalert2/dist/sweetalert2.min.css';
import PortalVue from 'portal-vue'

import './filters'
import './directives'


Vue.use(BootstrapVue)
Vue.use(PortalVue)
Vue.use(VueSweetalert2)


const app = new Vue({
    el: '#app',
    store: store,
    router: router,
    components: { App },
    template: '<App/>'
});
