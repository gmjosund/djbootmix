<template>
  <div class="container-fluid">
    <div class="row">
      <div class="col-12">
        <span v-for="log in apiLogs" v-if="apiLogs.length">{{ log }}<br></span>
      </div>
    </div>
  </div>
</template>

<script>
  import {mapActions, mapGetters } from 'vuex'
  export default {
    data() {
      return {

      }
    },
    computed: {
      ...mapGetters({
        apiLogs: 'apiLogs/apiLogs'
      })
    }
  }
</script>

<style scoped>

</style>
