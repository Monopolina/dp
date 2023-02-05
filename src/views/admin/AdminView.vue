<template>
  <div class="container">

    <div align="center">
      <h1>Таблица </h1>
      <a href="/CreateView" class="btn btn-success m-2">Добавить</a>
    </div>

    <div class="m-2">
      <table class="table">
        <thead>
          <th>id</th>
          <th>Продукт</th>
          <th>id категории</th>
          <th>Цена</th>
          <th>img</th>
          <th></th>
          <th></th>
          <th></th>
        </thead>
        <tbody key="componentKey">
          <tr v-for="product in products" :key="product">
            <td>{{ product.id }}</td>
            <td>{{ product.product_name }}</td>
            <td>{{ product.id_categori }}</td>
            <td>{{ product.price }}</td>
            <td>{{ product.img }}</td>
            <td><button @click="getproductdetels(product.id)" class="btn btn-outline-info m-1">Детали</button></td>
            <td><button @click="getproductedit(product.id)" class="btn btn btn-outline-warning m-1">Изменить</button></td>
            <td><button @click="button(product.id)" class="btn btn-danger m-1">Удлаить</button></td>
          </tr>
        </tbody>
      </table>
    </div>

  </div>
</template>

<script>
import store from '@/store';
export default {
  data() {
    return {
      productdata: {},
      products: [],
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
    async deleteproduct(id) {
      let result = await fetch("http://localhost:3000/product/delete/"+ id, {
        method: "GET",
        headers: {
          accept: "application/json",
          "content-type": "application/json",
          "Authorization": `Bearer ${store.getters.token}`,
        }
      });
      this.products = await result.json();
    },
    async button(id) {
      await this.deleteproduct(id);
      window.location.reload();

    },
    async getproductedit(id) {
      this.$router.push({ name: 'EditView', params: { id: id } });
    },
    async getproductdetels(id) {
      this.$router.push({ name: 'DetelsView', params: { id: id } });
    }
  },

  mounted() {
    this.getproduct();
  },
};
</script>