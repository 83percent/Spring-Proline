import {createRouter, createWebHistory} from 'vue-router';

// Component
import Home from '../components/home/HomeIndex.vue';
import LoginIndex from '../components/login/LoginIndex.vue';
const routes = [{
    paths: ['/', '/home'],
    component: Home
},
{
    path: '/login',
    component: LoginIndex
}];

const router = createRouter({
    mode: "history",
    history: createWebHistory(),
    routes: routes
    
});

export default router;