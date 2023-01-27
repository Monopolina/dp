<template>
      <footer class="py-3 my-4">
    <ul class="nav justify-content-center border-bottom pb-3 mb-3">
      <li class="nav-item"><a href="/" class="nav-link px-2 text-muted">Главная</a></li>
      <li class="nav-item"><a href="/about" class="nav-link px-2 text-muted">О нас</a></li>
      <li class="nav-item"><a href="/nas" class="nav-link px-2 text-muted">Контакты</a></li>
      <li class="nav-item"><a href="/AdminView" class="nav-link px-2 text-muted" v-if="store.getters.isAdmin === 'admin'">Таблица админа</a></li>
      <li class="nav-item"><a href="#" class="nav-link px-2 text-muted">?</a></li>
    </ul>
    <p class="text-center text-muted">© 2022 Company, Inc</p>
  </footer>
</template>

<script setup>
import { useStore } from 'vuex';
const store = useStore()
</script>