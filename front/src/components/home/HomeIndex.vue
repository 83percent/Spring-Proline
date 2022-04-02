<template>
  <div id="home">
    <tasks></tasks>
  </div>
</template>

<script>
import Tasks from './task/Tasks.vue'

export default {
  components: { Tasks },

}
</script>

<style lang="scss" scoped>
#home {
  padding: 2rem;
  
}
</style>