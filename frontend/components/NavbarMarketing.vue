<template lang="html">
  <div>
    <nav class="uk-navbar-container uk-navbar">
      <div class="uk-navbar-left">
        <a class="uk-navbar-item uk-logo logo__wrapper">
          <img src="~/assets/img/logo.svg">
        </a>
      </div>
      <div class="uk-navbar-right">
        <ul class="uk-navbar-nav">
          <li><nuxt-link to="/login">Login</nuxt-link></li>
          <li><nuxt-link to="/register"><span class="uk-button uk-button-cta">Try for free</span></nuxt-link></li>
          <li>
            <nuxt-link to="/manage">{{ name }}</nuxt-link>
            <div class="uk-navbar-dropdown">
              <ul class="uk-nav uk-navbar-dropdown-nav">
                <li class="uk-parent"><a @click="logout">Log out</a></li>
              </ul>
            </div>
          </li>
        </ul>
      </div>
    </nav>
  </div>
</template>

<script>
export default {
  name: 'NavbarMarketing',
  data() {
    return {
      name: '',
      error: null,
      isLoggedIn: false,
    }
  },
  created() {
    this.isLoggedIn = !(this.$auth.token===null);
    if(!this.isLoggedIn){
      return;
    }
    this.$axios.get('/users/current').then((res) => {
      if (res.data.user) {
        this.name = res.data.user.name;
      }
    }).catch(e => {
      console.log(e)
    })

  },
  methods: {
    logout: function() {
      this.$auth.logout().catch(e => {
        this.error = e + '';
      })
    },
  }
}
</script>
<style scoped>
.uk-navbar-container {
  background: white;
  padding-left: 40px;
  padding-right: 40px;
}

.uk-sticky-below .uk-navbar-container {
  box-shadow: 0 2px 12px -6px black;
}

.uk-navbar-item,
.uk-navbar-nav>li>a,
.uk-navbar-toggle {
  min-height: 60px;
}

.logo__wrapper {
  width: 150px;
}

.uk-navbar-container li a {
  text-transform: none;
}

.uk-button-cta {
  background: #0049ff;
  font-weight: 400;
  color: white;
  border-radius: 2px;
  padding-right: 20px;
  padding-left: 20px;
}

.uk-button-cta:hover {
  background: #1b46b1;
}

.uk-navbar-container a {
  color: #757575;
}
</style>
