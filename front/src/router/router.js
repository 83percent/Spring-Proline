import {createRouter, createWebHistory} from 'vue-router'

// Component
import Home from '../components/home/HomeIndex.vue';

const routes = [{
    path: '/',
    component: Home
}]

const router = createRouter({
    mode: "history",
    history: createWebHistory(),
    routes: routes
    
})

export default router;