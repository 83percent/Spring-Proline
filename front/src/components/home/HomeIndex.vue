<template>
  <div id="home">
    <tasks v-bind:projects="projects"></tasks>
    <timeline v-bind:projects="projects"></timeline>
  </div>
</template>

<script>
import Tasks from './task/Tasks.vue';
import Timeline from './timeline/Timeline.vue';
const sampleProjects = [{
  index: "1",
  list_seq: 2,
  name : "Back Office Develop",
  explain: "Spring framework",
  start_date : "2022-03-01",
  end_date : "2022-04-11",
  members : [{
    index: "1",
    name: "Lee JaeHoon",
    color: "#4698f3",
    email: "hoonni2709@naver.com"
  }, {
    index: "3",
    name: "Jang YunHee",
    color: "#ff8888",
    email: "zerojang@google.com"
  }, {
    index: "14",
    name: "Lotte",
    color: "#ff0000",
    email: "jaehoon.lee01@lotte.net"
  }],
  status: "03"
},
{
  index: "2",
  list_seq: 1,
  name : "FO Develop",
  explain: "Vue CLI",
  start_date : "2022-04-05",
  end_date : "2022-04-23",
  members : [{
    index: "1",
    name: "Lee JaeHoon",
    color: "#4698f3",
    email: "hoonni2709@naver.com"
  }, {
    index: "3",
    name: "Jang YunHee",
    color: "#ff8888",
    email: "zerojang@google.com"
  }, {
    index: "14",
    name: "Lotte",
    color: "#ff0000",
    email: "jaehoon.lee01@lotte.net"
  }],
  status: "01"
},
{
  index: "3",
  list_seq: 3,
  name : "Database",
  explain: "Oracle Database",
  start_date : "2022-04-20",
  end_date : "2022-05-03",
  members : [{
    index: "1",
    name: "Lee JaeHoon",
    color: "#4698f3",
    email: "hoonni2709@naver.com"
  }, {
    index: "3",
    name: "Jang YunHee",
    color: "#ff8888",
    email: "zerojang@google.com"
  }, {
    index: "14",
    name: "Lotte",
    color: "#ff0000",
    email: "jaehoon.lee01@lotte.net"
  }],
  status: "02"
}];
export default {
  components: { Tasks, Timeline },
  data: function() {
    return {
      projects: sampleProjects.sort((a,b) => {
        return a.list_seq - b.list_seq;
      })
    }
  }
}
</script>

<style lang="scss" scoped>
#home {
  padding: 2rem;
  
}
</style>