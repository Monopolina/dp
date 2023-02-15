import { VueCookieNext } from 'vue-cookie-next'
import { createRouter, createWebHistory } from 'vue-router'
import HomeView from '../views/HomeView.vue'

const isAdmin = async ()=>{
  const role = VueCookieNext.getCookie("role")
  if(role && role==="admin") return true
  else return false 
}

const routes = [
  {
    path: '/',
    name: 'home',
    component: HomeView
  },
  {
    path: '/about',
    name: 'about',
    // route level code-splitting
    // this generates a separate chunk (about.[hash].js) for this route
    // which is lazy-loaded when the route is visited.
    component: () => import(/* webpackChunkName: "about" */ '../views/AboutView.vue')
  },
  {
    path: '/nas',
    name: 'nas',
    component: () => import('../views/ContactView.vue')
  },
  {
    path: '/login',
    name: 'login',
    component: () => import('../views/auth/LoginView.vue')
  },
  {
    path: '/register',
    name: 'register',
    component: () => import('../views/auth/RegisterView.vue')
  },
  {
    path: '/YctrRasshi',
    name: 'YctrRasshi',
    component: () => import('../views/categori/YctrRasshi.vue')
  },
  {
    path: '/OcnComplpc',
    name: 'OcnComplpc',
    component: () => import('../views/categori/OcnComplpc.vue')
  },
  {
    path: '/ModingAnd',
    name: 'ModingAnd',
    component: () => import('../views/categori/ModingAnd.vue')
  },
  {
    path: '/ComplServer',
    name: 'ComplServer',
    component: () => import('../views/categori/ComplServer.vue')
  },
  {
    path: '/MagazinView',
    name: 'MagazinView',
    component: () => import('../views/magazin/MagazinView.vue'),
  },
  {
    path: '/ProductView/:id',
    name: 'ProductView',
    component: () => import('../views/magazin/ProductView.vue'),
  },
  {
    path: '/CartView',
    name: 'CartView',
    component: () => import('../views/magazin/CartView.vue'),
  },
  {
    path: '/v-poverka',
    name: 'v-poverka',
    component: () => import('../views/magazin/v-poverka.vue'),
  },
  {
    path: '/AdminView',
    name: 'AdminView',
    component: () => import('../views/admin/AdminView.vue'),
    beforeEnter: isAdmin
  },
  {
    path: '/CreateView',
    name: 'CreateView',
    component: () => import('../views/admin/CreateView.vue'),
    beforeEnter: isAdmin
  },
  {
    path: '/DetelsView/:id',
    name: 'DetelsView',
    component: () => import('../views/admin/DetelsView.vue'),
    beforeEnter: isAdmin
  },
  {
    path: '/EditView/:id',
    name: 'EditView',
    component: () => import('../views/admin/EditView.vue'),
    beforeEnter: isAdmin
  },
]

const router = createRouter({
  history: createWebHistory(process.env.BASE_URL),
  routes
})

export default router
