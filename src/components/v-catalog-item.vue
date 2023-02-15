<template>
  <div class="v-catalog-item">

      <div class="card mb-3 mx-auto border-info" style="max-width: 740px;">
        <div class="row g-0 catalog-product__image">
          <div class="catalog-product__image col-md-4" @click="getproductdetels(product_data.id)">
            <img :src=" require('../assets/img/'+product_data.img) " alt="img" class="imgcat">
          </div>
          <div class="col-md-8">
            <div class="card-body">
              <h5 class="card-title aa" @click="getproductdetels(product_data.id)">{{ product_data.product_name }}</h5>
              <p class="card-text">Доступно на складе:{{ product_data.available_in_stock }} </p>
              <p class="card-text">Доставка: {{ product_data.delivery }} </p>
              <p class="card-text">{{ product_data.price }} руб.</p>
              <button type="button" class="btn btn-info" @click="addcart">Добавить в корзину</button>
            </div>
          </div>
        </div>
      </div>

  </div>
</template>

<script>
import vCatalogItem from '@/components/v-catalog-item.vue';
export default {
  components: {
    vCatalogItem
  },

  data() {
    return {}
  },

  props: {
    product_data: {
      type: Object,
      default() {
        return{}
      }
    }
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
      this.$emit('addtocart', this.product_data);
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