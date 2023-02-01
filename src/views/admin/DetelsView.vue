<template>
    <div class="container">
      <div class="card border-info mb-3" align="center" style="max-width: 18rem;">
        <div class="card-body">
          <div class="card-header">ID {{ user.ID }}</div>
          <p class="card-text">Цена: {{ user.Цена }}</p>
          <p class="card-text">Обложка: {{ user.Обложка }}</p>
          <p class="card-text">Бренд: {{ user.Бренд }}</p>
          <p class="card-text">Срок_доставки: {{ user.Срок_доставки }}</p>
          <p class="card-text">Скидка: {{ user.Скидка }}</p>
          <p class="card-text">Формат: {{ user.Формат }}</p>
          <p class="card-text">Автор: {{ user.Автор }}</p>
          <p class="card-text">Размер: {{ user.Размер }}</p>
          <div align="center">
            <a href="/panel" class="btn btn-secondary m-1">Вернуться на таблицу</a>
          </div>      
        </div>
      </div>
    </div>
  </template>
  
  <script>
  export default {
    data() {
      return {
        user:{},
      };
    },
  
    methods: {
      async getpaneldetels() {
        let result = await fetch("http://localhost:3000/panel/"+ this.$route.params.id);
        this.user = await result.json();
      },
    },
   
    mounted() {
       this.getpaneldetels();
    },
  };
  </script>