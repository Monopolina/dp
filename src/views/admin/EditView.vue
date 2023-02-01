<template>
    <div class="container">
      <h1 align="center" class="m-3">Добавление блокнота</h1>
        <form class="row g-3">
          <div class="col-md-6">
            <label class="form-label">Цена</label>
            <input name="Цена" v-model="user.Цена" type="text" class="form-control" />
          </div>
          <div class="col-md-6">
            <label class="form-label">Обложка</label>
            <input name="Обложка" v-model="user.Обложка" type="text" class="form-control" />
          </div>
          <div class="col-md-6">
            <label class="form-label">Бренд</label>
            <input name="Бренд" v-model="user.Бренд" type="text" class="form-control" />
          </div>
          <div class="col-md-6">
            <label class="form-label">Срок_доставки</label>
            <input name="Срок_доставки" v-model="user.Срок_доставки" type="date" class="form-control" />
          </div>
          <div class="col-md-6">
            <label class="form-label">Скидка</label>
            <input name="Скидка" v-model="user.Скидка" type="text" class="form-control" />
          </div>
          <div class="col-md-6">
            <label class="form-label">Формат</label>
            <input name="Формат" v-model="user.Формат" type="text" class="form-control" />
          </div>
          <div class="col-md-6">
            <label class="form-label">Автор</label>
            <input name="Автор" v-model="user.Автор" type="text" class="form-control" />
          </div>
          <div class="col-md-6">
            <label class="form-label">Размер</label>
            <input name="Размер" v-model="user.Размер" type="text" class="form-control" />
          </div>
          <div align="center">
            <input @click="editpanel" type="submit" value="Отправить" class="btn btn-danger m-1"/>
            <a href="/panel" class="btn btn-secondary m-1">Вернуться на таблицу</a>
          </div>
        </form>
       
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
      async getpaneledit() {
        let result = await fetch("http://localhost:3000/panel/"+ this.$route.params.id);
        this.user = await result.json();
      },
      async editpanel() {
        await fetch("http://localhost:3000/panel/edit", {
          method: "POST",
          headers: {
            accept: "application/json",
            "content-type": "application/json",
          },
          body: JSON.stringify(this.user),
        });
        await this.$router.push('/panel')
      },
  
      
    },
   
    mounted() {
       this.getpaneledit();
    },
  };
  </script>