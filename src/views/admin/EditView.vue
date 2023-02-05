<template>
  <div class="container">
    <h1 align="center" class="m-3">Изменение продукта {{ product.product_name }}</h1>
    <form class="row g-3">
        <div class="col-md-6">
          <label class="form-label">Продукт</label>
          <input v-model="product.product_name" type="text" class="form-control" placeholder="Продукт"/>
        </div>
        <div class="col-md-6">
          <label class="form-label">id категории</label>
          <input v-model="product.id_categori" type="number" class="form-control" placeholder="Цена"/>
          <!-- <select class="form-select" v-model="selected_categori">
            <option v-for="categori in categoris" :key="categori">
              {{ categori.categoria }}
            </option>
          </select> -->
        </div>
        <div class="col-md-6">
          <label class="form-label">Цена</label>
          <input v-model="product.price" type="number" class="form-control" placeholder="Цена"/>
        </div>
        <div class="col-md-6">
          <label class="form-label">img</label>
          <input v-model="product.img" type="text" class="form-control" placeholder="img"/>
        </div>
        <div class="col-md-6">
          <label class="form-label">Доступно на складе</label>
          <input v-model="product.available_in_stock" type="text" class="form-control" placeholder="Доступно на складе"/>
        </div>
        <div class="col-md-6">
          <label class="form-label">Доставка</label>
          <input v-model="product.delivery" type="text" class="form-control" placeholder="Доставка"/>
        </div>
        <div class="col-md-6">
          <label class="form-label">Описание</label>
          <input v-model="product.description" type="text" class="form-control" placeholder="Описание"/>
        </div>
        <div class="col-md-6">
          <label class="form-label">Характеристика</label>
          <input v-model="product.characteristic" type="text" class="form-control" placeholder="Характеристика"/>
        </div>
        <div class="col-md-6">
          <label class="form-label">id поставщика</label>
          <input v-model="product.id_provider" type="number" class="form-control" placeholder="Характеристика"/>
          
          <!-- <select class="form-select" v-model="selected_provider">
            <option v-for="provider in providers" :key="provider">
              {{ provider.name_provider }}
            </option>
          </select> -->
        </div>
        <div align="center">
          <input @click="editproduct" type="submit" value="Отправить" class="btn btn-danger m-1"/>
          <a href="/AdminView" class="btn btn-secondary m-1">Вернуться на таблицу</a>
        </div>
      </form>
     {{ product }}
    </div>   
</template>

<script>
import store from '@/store';
export default {
  data() {
    return {
      product:{},
      providers: [],
      categoris: [],
      selected_provider: "",
      selected_categori: "", 
    };
  },

  methods: {
    async getproduct() {
      let result = await fetch("http://localhost:3000/product", {
        method: "GET",
        headers: {
          accept: "application/json",
          "content-type": "application/json",
          "Authorization": `Bearer ${store.getters.token}`,
        }
      });
      this.products = await result.json();
    },
    async getproductedit() {
      //let result = await fetch("http://localhost:3000/product/"+ this.$route.params.id);
      let result = await fetch("http://localhost:3000/product/"+ this.$route.params.id, {
        method: "GET",
        headers: {
          accept: "application/json",
          "content-type": "application/json",
          "Authorization": `Bearer ${store.getters.token}`,
        }
      });
      this.product = await result.json();
    },
    async editproduct() {
      this.product.provider_name = this.selected_provider
      this.product.categori_name = this.selected_categori
      await fetch("http://localhost:3000/product/edit", {
        method: "POST",
        headers: {
          accept: "application/json",
          "content-type": "application/json",
          "Authorization": `Bearer ${store.getters.token}`,
        },
        body: JSON.stringify(this.product),
      });
      await this.$router.push('/AdminView')
    },
    async getprovider() {
      let result = await fetch("http://localhost:3000/product/selectprovider", {
        method: "GET",
        headers: {
          accept: "application/json",
          "content-type": "application/json",
          "Authorization": `Bearer ${store.getters.token}`,
        }
      });
      this.providers = await result.json();
    },
    async getcategori() {
      let result = await fetch("http://localhost:3000/product/selectcategori", {
        method: "GET",
        headers: {
          accept: "application/json",
          "content-type": "application/json",
          "Authorization": `Bearer ${store.getters.token}`,
        }
      });
      this.categoris = await result.json();
    },
  },
 
  mounted() {
    this.getproduct();
    this.getprovider();
    this.getcategori();
    this.getproductedit();
  },
};
</script>