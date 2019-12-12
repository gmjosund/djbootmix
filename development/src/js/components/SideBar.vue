<template>
      <div class="side-nav" 
        v-bind:class="[isSidebarOpen ? 'w-250' : 'w-70']"
      >
        <div class="router-menu" 
          id="sidebar-menu"
        >
          <b-navbar-nav>
            <li class="nav-item"
              v-on:click="changeTitle('monitoring')"
            >
              <router-link class="nav-link waves-effect waves-light monitoring"
                :to="{name: 'monitoring'}"
              >
                <i class="fa fa-home"></i>
                  <span v-bind:class="[isSidebarOpen ? '' : 'd-none']"
                  >
                    Monitor
                  </span>
              </router-link>
            </li>
            <li class="nav-item"
              v-on:click="changeTitle('possible-buys')"
            >
              <router-link class="nav-link"
                :to="{name: 'possible-buys'}"
              >
                <i class="fa fa-optin-monster"></i>
                <span v-bind:class="[isSidebarOpen ? '' : 'd-none']"
                >Possible Buys
                  <b-badge variant="primary"
                    class="records-count pull-right"
                  >
                    {{ possibleBuysAmount }}
                  </b-badge>
                </span>
              </router-link>
            </li>
            <li class="nav-item"
               v-on:click="changeTitle('pairs')"
              >
              <router-link class="nav-link"
                :to="{name: 'pairs'}"
              >
                <i class="fa fa-houzz"></i>
                <span v-bind:class="[isSidebarOpen ? '' : 'd-none']"
                >
                  Pairs
                  <b-badge variant="primary"
                    class="records-count pull-right"
                  >
                    {{ pairsAmount }}
                  </b-badge>
                </span>
              </router-link>
            </li>
            <li class="nav-item"
              v-on:click="changeTitle('dca')"
            >
              <router-link class="nav-link"
                :to="{name: 'dca'}"
              >
                <i class="fa fa-hand-peace-o"></i>
                <span v-bind:class="[isSidebarOpen ? '' : 'd-none']"
                > 
                DCA
                <b-badge variant="primary"
                  class="records-count pull-right"
                >
                  {{ dcaAmount }}
                </b-badge>
                </span>
              </router-link>
            </li>
            <li class="nav-item"
              v-on:click="changeTitle('pending')"
            >
              <router-link class="nav-link"
                :to="{name: 'pending'}"
              >
                <i class="fa fa-gg"></i>
                <span v-bind:class="[isSidebarOpen ? '' : 'd-none']"
                >
                Pending
                <b-badge variant="primary"
                  class="records-count pull-right"
                >
                  {{ pendingAmount }}
                </b-badge>
                </span>
              </router-link>
            </li>
            <li class="nav-item"
              v-on:click="changeTitle('buys')"
            >
              <router-link class="nav-link"
                :to="{name: 'buys'}"
              >
                <i class="fa fa-shopping-basket"></i>
                <span v-bind:class="[isSidebarOpen ? '' : 'd-none']"
                >
                  Buys
                  <b-badge variant="primary"
                    class="records-count pull-right"
                  >
                    {{ buyAmount }}
                  </b-badge>
                </span>
              </router-link>
            </li>
            <li class="nav-item"
              v-on:click="changeTitle('sales')"
            >
              <router-link class="nav-link"
                :to="{name: 'sales'}"
              >
                <i class="fa fa-balance-scale"></i>
                <span v-bind:class="[isSidebarOpen ? '' : 'd-none']"
                >
                Sales
                  <b-badge variant="primary"
                    class="records-count pull-right"
                  >
                    {{ salesAmount }}
                  </b-badge>
                </span>
              </router-link>
            </li>
            <li class="nav-item"
             v-on:click="changeTitle('dust')"
            >
              <router-link class="nav-link"
                :to="{name: 'dust'}"
              >
                <i class="fa fa-recycle"></i>
                <span v-bind:class="[isSidebarOpen ? '' : 'd-none']"
                >
                Dust
                  <b-badge variant="primary"
                    class="records-count pull-right"
                  >
                    {{ dustAmount }}
                </b-badge>
                </span>
              </router-link>
            </li>
            <li class="nav-item"
              v-on:click="changeTitle('apiLogs')"
            >
              <router-link class="nav-link"
                :to="{name: 'apiLogs'}"
              >
                <i class="fa fa-align-left"></i>
                <span v-bind:class="[isSidebarOpen ? '' : 'd-none']"
                >
                  Logs
                </span>
              </router-link>
            </li>
          </b-navbar-nav>
        </div>
      </div>
</template>

<script>
  import {mapActions, mapGetters } from 'vuex'
  export default {
    computed: {
      ...mapGetters({
        possibleBuysAmount: 'possibleBuys/possibleBuysAmount',
        pairsAmount: 'pairs/pairsAmount',
        dcaAmount: 'dca/dcaAmount',
        pendingAmount: 'pending/pendingAmount',
        buyAmount: 'buys/buyAmount',
        salesAmount: 'sales/salesAmount',
        dustAmount: 'dust/dustAmount',
        isSidebarOpen: 'monitoring/isSidebarOpen'
      })
    },
    methods: {
      changeTitle (title) {
        this.$store.commit('monitoring/currentRout', title);
      }
    }
  }
</script>

<style scoped>
.side-nav {
  position: fixed;
  z-index: 1001;
}

#sidebar-menu {
  background-color: rgb(54, 64, 74);
  margin-top: -60px !important;
  padding-bottom: 30px !important;
  padding-top: 22px !important;
  width: 100%;
  height: 100vh;
  z-index: 1001 !important;
}

.router-link-active {
  color: #ffffff !important;
  font-weight: bold !important
}

#sidebar-menu, #sidebar-menu ul, #sidebar-menu li, #sidebar-menu a {
  border: 0;
  font-weight: normal;
  font-size: 14px;
  line-height: 1;
  list-style: none;
  margin: 0;
  padding: 0;
  position: relative;
  text-decoration: none;
  color:#98a6ad
}

#sidebar-menu>ul>li>a {
  display: block;
  padding: 12px 20px;
  margin: 4px 0;
}

#sidebar-menu a {
  line-height: 1.3;
}

#sidebar-menu ul li a i {
  display: inline-block;
  font-size: 20px;
  line-height: 17px;
  margin-left: 3px;
  margin-right: 15px;
  text-align: center;
  vertical-align: middle;
  width: 20px;
}

#sidebar-menu>ul>li>a>span {
  vertical-align: middle;
}

#sidebar-menu a {
  line-height: 1.3;
}

.w-70 ul li.nav-item:hover > a{
  margin-bottom: 0;
  position: relative;
  width : 260px;
  margin-bottom: 0px;
  display: block !important;
  z-index: 20;
  background-color: #3D4853 !important;
}

.w-70 ul li.nav-item:hover > a span {
  display: inline !important;
}

.w-70 ul li.nav-item:hover > a + ul {
  margin-top: 0px;
  display: block !important;
  position: absolute;
  box-shadow: none;
  z-index: 99;
}

.w-70 ul li.nav-item:hover > a + ul>li {
  margin-left: 70px !important;
  width: 190px;
}

.w-70 ul li.nav-item:hover > a + ul li a {
  padding-left: 5px !important;
}

.w-70 ul li.nav-item:hover > a + ul li a span {
  display: block !important;
  z-index: 20;
}

.pull-right {
  float: right;
}
</style>
