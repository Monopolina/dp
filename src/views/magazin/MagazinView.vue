<template>
  <div class="v-catalog">
  <div class="container">
    <h1>Catalog</h1>
    <v-catalog-item 
    v-for="product in products"
    :key="product.id"
    v-bind:product_data="product"
    @addtocart="addtocart"
    />
  </div></div>
</template>

<script>
import vCatalogItem from '@/components/v-catalog-item.vue';
import { mapActions } from 'vuex';
export default {
  components: {
    vCatalogItem
  },
  data() {
    return {
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
    async addtocart(products) {
      this.ADD_TO_CART(products)
    },
    ...mapActions([
      'ADD_TO_CART'
    ]),
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