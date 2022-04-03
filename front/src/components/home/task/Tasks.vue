<template>
  <section>
    <home-title>Project Task</home-title>
    <ul>
      <li v-for="(project, index) in projects" v-bind:key="index">
        <task-element v-bind:project="project"></task-element>
      </li>
    </ul>
  </section>
</template>

<script>
import HomeTitle from "../common/HomeTitle.vue"
import TaskElement from "./TaskElement.vue";



export default {
  components: { HomeTitle, TaskElement },
  props: {projects: {type: Array, required: true}}
}
</script>

<style>
section {
  margin-bottom: 2rem;
}
</style>