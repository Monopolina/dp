<template>
  <div class="container">
    
    <div class="card border-info mb-3" align="center" style="max-width: 40rem;">
      <div class="card-body">
        <div class="card-header">id: {{ product.id }}</div>
        <p class="card-text">Продукт: {{ product.product }}</p>
        <p class="card-text">id категории: {{ product.id_categori }}</p>
        <p class="card-text">Цена: {{ product.price }}</p>
        <p class="card-text">img: {{ product.img }}</p>
        <p class="card-text">Доступно на складе: {{ product.available_in_stock }}</p>
        <p class="card-text">Доставка: {{ product.delivery }}</p>
        <p class="card-text">Описание: {{ product.description }}</p>
        <p class="card-text">Характеристика: {{ product.characteristic }}</p>
        <p class="card-text">id поставщика: {{ product.id_provider }}</p>
        <div align="center">
          <a href="/AdminView" class="btn btn-secondary m-1">Вернуться на таблицу</a>
        </div>      
      </div>
    </div>
  </div>
</template>

<script>
import store from '@/store';
export default {
  data() {
    return {
      product:{},
    };
  },

  methods: {
    async getproductdetels() {
      let result = await fetch("http://localhost:3000/product/"+ this.$route.params.id, {
        method: "GET",
        headers: {
          accept: "application/json",
          "content-type": "application/json",
          "Authorization": `Bearer ${store.getters.token}`,
        }
      });
      this.product = await result.json();
      // let result = await fetch("http://localhost:3000/product/"+ this.$route.params.id);
      // this.product = await result.json();
    },
  },
 
  mounted() {
     this.getproductdetels();
  },
};
</script>