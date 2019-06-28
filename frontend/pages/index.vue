<template>
<div id="main">
  <TheNavbar type="marketing" />
  <div class="header">
    <div class="header__heading-wrapper">
      <h1>Easy video meetings for your business</h1>
    </div>
    <div class="uk-container">
      <div class="uk-grid">
        <div class="uk-width-1-2">
          <img src="~/assets/img/mockup.png" width="660">
        </div>
        <div class="uk-width-1-2" style="padding-top:55px">
          <p>Start bringing your team and clients together with <strong>flexible video meetings</strong>.</p>
          <nuxt-link to="/register"><span class="uk-button uk-button-primary">Get started</span></nuxt-link>
        </div>
      </div>
    </div>
  </div>
</div>
</template>

<script>
import TheNavbar from "../components/TheNavbar";

export default {
  components: {
    TheNavbar
  }
}
</script>

<style scoped>

h1 {
  text-align: center;
}

.header__heading-wrapper {
  width: 660px;
  margin: auto;
  padding-top: 45px;
}

.home__proof {
  text-align: center;
}
</style>
