<template>
<div id="main-wrapper">
  <TheNavbar type="dashboard" activeLink="meetings" />
  <div class="uk-container">
    <div style="text-align:right;padding-top:45px">
      <a @click="createShorturl" class="uk-button uk-button-primary">Meet now</a>
    </div>
  </div>
</div>
</template>

<style scoped>
h1 {
  text-align: center;
}

.header__heading-wrapper {
  width: 660px;
  margin: auto;
}
</style>

<script>
import TheNavbar from "../components/TheNavbar";
export default {
  middleware: ['auth'],
  components: {
    TheNavbar
  },
  data() {
    return {
      shorturl: ''
    }
  },
  methods: {
    createShorturl() {
      this.$axios.post('/shorturls').then((res) => {
        if (res.data) {
          this.shorturl = res.data.shorturl;
          window.open(this.shorturl, '_blank');
        }
      })
    }
  }
}
</script>

<style scoped>
  #main-wrapper {
    background-color: #f6f7fb;
    min-height: 100vh;
    background-size: 50%;
  }
  .uk-button-secondary{
    border: 1px solid #333;
    background: white;
    margin-left: 10px;
  }
  .uk-button-secondary:hover{
    color:#0049ff;
    border-color: #6e8cab;
    background: #ebefff;
  }
</style>
