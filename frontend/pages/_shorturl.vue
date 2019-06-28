<template>
  <div id="main">
    <div v-if="authenticated">
      <VideoChat :username="username" :roomname="roomname"/>
    </div>
    <div v-else>
      <div class="username shorturl__enter-username">
        <form class="uk-form" @submit.prevent="submitUsername(username)">
          <div v-if="!isLoggedIn" class="form-group mb-2">
            <label>Your name:<input type="text" class="uk-input" v-model="username" required></label>
          </div>
          <button type="submit" class="uk-button uk-button-secondary">
            <span v-if="!isLoggedIn">Join meeting room</span>
            <span v-else>Start session now</span>
          </button>
        </form>
      </div>
    </div>
  </div>
</template>

<script>
import VideoChat from '../components/VideoChat'

export default {
  data() {
    return {
      username: "host",
      roomname: "dummy-room",
      authenticated: false,
      isLoggedIn: false
    }
  },
  components: {
    VideoChat
   },
   methods: {
     submitUsername(username) {
        if(!username) {
          return alert('please provide a username');
        }

        this.authenticated = true;
     },
   },
  beforeCreate() {
    // because path is '/12345678'
    const param = this.$route.path.substr(1);
    if(param.length != 8){
      this.$router.replace({ path: '/' });
    }
  },
  created(){
    // because path is '/12345678'
    const param = this.$route.path.substr(1);

    this.$axios.get(`/shorturls/${param}`).then((res) => {
      if (res.data) {
        if(!res.data.room_open){
          this.$router.replace({ path: '/' });
        }
      }
    })

    this.isLoggedIn = !(this.$auth.token===null);
    if(!this.isLoggedIn){
      this.username="";
    }
    this.roomname = param
  }
}
</script>

<style scoped>
  .uk-input{
    margin: 20px 0px;
  }
  .shorturl__enter-username{
    text-align:center;
    width:300px;
    margin:auto;
    margin-top:100px;
  }
</style>
