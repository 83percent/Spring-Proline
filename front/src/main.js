import { createApp } from 'vue';
import App from './App.vue';

// Route
import router from './router/router';
import store from './store/store';

const app = createApp(App);
app.use(router);
app.use(store);
app.mount('#app')
// new Vue({
//   router,
//   //store,
//   render: h => h(App),
// }).$mount('#app')
