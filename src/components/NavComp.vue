<template>
  <header class="p-3">
    <div class="container">
      <div class="d-flex flex-wrap align-items-center justify-content-center justify-content-lg-start">
        <a href="/" class="d-flex align-items-center mb-2 mb-lg-0  text-decoration-none">
          <img src="https://cdn-icons-png.flaticon.com/128/4564/4564517.png" alt="Bootstrap" width="50" height="50">
        </a>

        <ul class="nav col-12 col-lg-auto me-lg-auto mb-2 justify-content-center mb-md-0">
          <li><a href="/" class="nav-link px-2 text-secondary">Главная</a></li>
          <li><a href="/about" class="nav-link px-2 text-black">О нас</a></li>
          <li><a href="/nas" class="nav-link px-2 text-black">Контакты</a></li>
          <li><a href="/AdminView" class="nav-link px-2 text-black" v-if="store.getters.isAdmin === 'admin'">Таблица</a></li>
          <li><a href="#" class="nav-link px-2 text-black">?</a></li>
        </ul>

        <div class="text-end">
          <button v-if="!store.getters.isAuthorized" type="button" class="btn btn-outline me-2"><a class="nav-link text-black" href="/login">Войти</a></button>
          <button v-if ="!store.getters.isAuthorized" type="button" class="btn btn-outline me-2"><a class="nav-link text-black" href="/register">Регистрация</a></button>
          <button v-if="store.getters.isAuthorized" @click="exit()" type="button" class="btn btn-outline me-2">Выйти</button>
        </div>

      </div>
    </div>
  </header>
</template>
<script setup>
import { VueCookieNext } from 'vue-cookie-next'
import { useStore } from 'vuex';
const store = useStore()
const exit = async()=>{
      await VueCookieNext.removeCookie("token")
      await store.dispatch("gettokenfromcookie")
      window.location.reload()
    } 
    
</script>