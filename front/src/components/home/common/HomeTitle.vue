<template>
    <div>
      <slot><h1>Project Tasks</h1></slot>
      <router-link to="/home/task">
        <i class="material-icons-outlined">add</i>
        <p>Add a view</p>
      </router-link>
    </div>
</template>

<script>
export default {

}
</script>

<style lang="scss" scoped>
div {
    display: flex;
    align-items: center;
    h1 {
      font-size: 1.6rem;
      font-weight: 500;
    }
    a {
      all: unset;
      display: flex;
      align-items: center;
      color: #000;
      opacity: 0.4;
      margin-left: 1rem;
      transition-duration: 0.2s;
      &:hover {
        opacity: 1;
      }
      cursor: pointer;
      i {
        margin-right: 0.6rem;
        font-size: 1.3rem;
      }
      p {
        font-weight: 600;
        font-size: 0.9rem;
      }
    }
  }
</style>