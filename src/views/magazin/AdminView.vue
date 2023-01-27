<template>
  <div class="container">

    <div align="center">
      <h1>Таблица </h1>
      <a href="/productsave" class="btn btn-success m-2">Добавить</a>
    </div>

    <div class="m-2">
      <table class="table">
        <thead>
          <th>ID</th>
          <th>Цена</th>
          <th>Обложка</th>
          <th>Бренд</th>
          <th>Формат</th>
          <th>Срок доставки</th>
          <th>Скидка</th>
          <th>Автор</th>
          <th>Размер</th>
          <th>Gjkdfdk</th>
          <th></th>

        </thead>
        <tbody key="componentKey">
          <tr v-for="product in products" :key="product">
            <td>{{ product.id }}</td>
            <td>{{ product.product }}</td>
            <td>{{ product.id_categori }}</td>
            <td>{{ product.price }}</td>
            <td>{{ product.img }}</td>
            <td>{{ product.available_in_stock }}</td>
            <td>{{ product.delivery }}</td>
            <td>{{ product.description }}</td>
            <td>{{ product.characteristic }}</td>
            <td>{{ product.id_provider }}</td>
            <td>
              <button @click="getproductdetels(product.ID)" class="btn btn-outline-info m-1">Детали</button>
              <button @click="getproductedit(product.ID)" class="btn btn btn-outline-warning m-1">Изменить</button>
              <button @click="button(product.ID)" class="btn btn-danger m-1">Удлаить</button>
            </td>
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
    async createproduct() {
      fetch("http://localhost:3000/product/create", {
        method: "POST",
        headers: {
          accept: "application/json",
          "content-type": "application/json",
        },
        body: JSON.stringify(this.productdata),
      });
    },
    async deleteproduct(ID) {
      return fetch("http://localhost:3000/product/delete/" + ID,);
    },
    async button(ID) {
      await this.deleteproduct(ID);
      window.location.reload();

    },
    async getproductedit(ID) {
      this.$router.push({ name: 'productedit', params: { id: ID } });
    },
    async getproductdetels(ID) {
      this.$router.push({ name: 'productdetels', params: { id: ID } });
    }
  },

  mounted() {
    this.getproduct();
  },
};
</script>