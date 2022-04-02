<template>
  <div v-if="isLogin" id="wrap">
    <SideFrame />
    <main>
      <router-view></router-view>
    </main>
  </div>
  <div v-else id="wrap">
    <router-view></router-view>
  </div>
    
</template>

<script>
import SideFrame from './components/common/SideFrame.vue';

export default {
  data: function() {
    return {
      
    }
  },
  components: { SideFrame },
  computed: {
    isLogin: function() {
      const is = this.$store.state.UserInfo;
      console.log(is);
      return is.isLogin;
    }
  },
  created: function() {
    if(!this.isLogin) this.$router.replace('/login');
  }
}
</script>

<style>
@import "contents/fonts/AppleSDGothicNeo.css";
@import "contents/fonts/Montserrat.css";
@import "contents/css/global.css";

#wrap {
  display: flex;
  width: 100%;
  height: 100vh;
  overflow: hidden;
}
#wrap > main {
  flex-grow: 1;
}

</style>
