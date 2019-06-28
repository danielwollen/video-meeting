<template lang="html">
  <div>
    <nav class="uk-navbar-container uk-navbar">
      <div class="uk-navbar-left">
        <ul class="uk-navbar-nav">
          <li class="uk-item meetings">
            <nuxt-link to="/manage">Meetings</nuxt-link>
          </li>
        </ul>
      </div>
      <div class="uk-navbar-right">
        <ul class="uk-navbar-nav">
          <li>
            <nuxt-link to="/manage">Hello, {{ name }}!</nuxt-link>
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
  name: 'NavbarDashboard',
  data() {
    return {
      name: '',
      error: null
    }
  },
  props: ['activeLink'],
  created(){
    this.$axios.get('/users/current').then((res) => {
      this.name = res.data.user.name;
    }).catch(e => { console.log(e) })
  },
  mounted(){
    this.underscoreActiveItem();
  },
  methods: {
    logout: function () {
      this.$auth.logout().catch(e => {this.error = e + ''})
    },
    underscoreActiveItem(){
      document.querySelector(`.${this.activeLink}`).style.borderBottom = "4px solid #0049ff"
    }
  }
}
</script>
<style scoped>
  .uk-navbar-container{
    background:white;
    padding-left: 40px;
    padding-right: 40px;
  }
  .uk-navbar-container{
    box-shadow: 0 4px 16px -13px black;
  }
  .uk-navbar-item, .uk-navbar-nav>li>a, .uk-navbar-toggle{
    min-height:70px;
  }
  .logo__wrapper{
    width:150px;
  }
  .uk-navbar-container li a{
    text-transform: none;
  }
</style>
