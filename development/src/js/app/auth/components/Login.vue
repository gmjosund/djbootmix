<template>
  <div class="container-fluid">
    <div class="row justify-content-center">
      <div class="col-md-8">
        <div class="card">
          <div class="card-header">Login</div>

          <div class="card-body">
            <div class="alert alert-danger" v-if="errors.root">
              {{ errors.root }}
            </div>
            <form @submit.prevent="submit">
              <div class="form-group row">
                <label for="password" class="col-md-4 col-form-label text-md-right">Password</label>

                <div class="col-md-6">
                  <input id="password" type="password" class="form-control" name="password" :class="errors.password ? 'is-invalid' : '' "
                         v-model="password">

                  <span class="invalid-feedback" role="alert" v-if="errors.password">
                                        <strong>{{ errors.password[0] }}</strong>
                                    </span>
                </div>
              </div>

              <div class="form-group row mb-0">
                <div class="col-md-8 offset-md-4">
                  <button type="submit" class="btn btn-primary">Login</button>
                </div>
              </div>
            </form>
          </div>
        </div>
      </div>
    </div>
  </div>
</template>

<script>
  import {mapActions} from 'vuex'
  export default {
    data() {
      return {
        password: null,
        errors: []
      }
    },
    methods: {
      ...mapActions({
        login: 'auth/login'
      }),
      submit() {
        this.login({
          payload: {
            password: this.password
          },
          password: this.password,
          context: this
        }).then(() => {

        })
      }
    }
  }
</script>

<style scoped>

</style>
