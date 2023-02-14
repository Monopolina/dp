<template>
  <div class="container">
     <div v-for="product in products" :key="product"> 
      <div class="card mb-3 mx-auto border-info" style="max-width: 740px;">
        <div class="row g-0 catalog-product__image">
          <div class="catalog-product__image col-md-4" @click="getproductdetels(product.id)">
            <img :src=" require('../../assets/img/' + product.img)" class="img-fluid rounded-start" >
          </div>
          <div class="col-md-8">
            <div class="card-body">
              <h5 class="card-title aa" @click="getproductdetels(product.id)">{{ product.product_name }}</h5>
              <p class="card-text">Доступно на складе:{{ product.available_in_stock }} </p>
              <p class="card-text">Доставка: {{ product.delivery }} </p>
              <p class="card-text">{{ product.price }} руб.</p>
              <button type="button" class="btn btn-info" @click="addcart">Добавить в корзину</button>
            </div>
          </div>
        </div>
      </div>
    </div> 
  </div>
</template>

<script>
export default {
  data() {
    return {
      productdata: {},
      products: [],

    };
  },

  methods: {
    async getproduct() {
      let result = await fetch("http://localhost:3000/magazin", {
        method: "GET",

      });
      this.products = await result.json();
    },
    async getproductdetels(id) {
      this.$router.push({ name: 'ProductView', params: { id: id } });
    },
    async addcart(){
      this.$emit('sendid', this.product.id)
    },
  },

  mounted() {
    this.getproduct();
  },
};
</script>
<style>
.aa:hover {
    color: #43afc2; /* Цвет ссылки при наведении на нее курсора мыши */  
    text-decoration: underline; /* Добавляем подчеркивание */
   }
</style>