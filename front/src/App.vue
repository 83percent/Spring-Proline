<template>
  <div id="wrap">
    <SideFrame />
    <main>
      <router-view></router-view>
    </main>
  </div>
</template>

<script>
import SideFrame from './components/common/SideFrame.vue';

export default {
  components: { SideFrame },
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
