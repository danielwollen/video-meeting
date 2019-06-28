<template>
  <div style="background:#f9f9f9;width:100%;height:100%">
    <div class="uk-grid">
      <div style="height:100vh;background:white;width:430px;">
        <div style="padding-top:70px;padding-left:40px;padding-right:40px">
          <img src="~/assets/img/logo.svg" width="155">
          <div type="error" :value="error">{{error}}</div>
          <form method="post" @submit.prevent="register">
            <label>Email<input class="uk-input" v-model="email" label="Email" type="email" required /></label>
            <label>First Name<input class="uk-input" v-model="firstname" label="First Name" type="text" required /></label>
            <label>Last Name<input class="uk-input" v-model="lastname" label="Last Name" type="text" required /></label>
            <label>Password<input class="uk-input" v-model="password" label="Password" type="password" required /></label>
            <button class="uk-button uk-button-primary" type="submit">Sign up</button>
          </form>
        </div>
      </div>
      <div class="uk-width-expand login__background">
      </div>
    </div>
  </div>
</template>

<script>
export default {
  middleware: ['guest'],
  data () {
    return {
      email: '',
      firstname: '',
      lastname: '',
      password: '',
      error: null
    }
  },
  methods: {
    register: function () {
      this.$axios.post('users', {
        user: {
            email: this.email,
            name: `${this.firstname} ${this.lastname}`,
            password: this.password
        }
      }).then(response => {
        this.$auth.login({
          data: {
            user: {
              email: this.email,
              password: this.password
            }
          }
        })
      }).then( ()=> this.$router.replace({ path: '/manage' }))
    }
  }
}
</script>

<style scoped>
  .login__background{
    background: url("~/assets/img/auth_background.png") no-repeat 50%;
    background-size: 60%;
  }
  .uk-input{
    border-radius:4px;
    border-color:#868e96;
    margin-top:14px;
  }
  label{
    display:block;
    margin-top:30px;
    color:#333;
    font-weight:300;
    font-size:14px;
  }
  .uk-button{
    margin-top:30px;
  }
</style>
