<template>
  <div class="container">
    <a href="ProductView">
     <div>
      <div class="card mb-3 mx-auto" style="max-width: 800px;">
        <div class="row g-0">
          <div class="col-md-4">
            <img src="https://c.dns-shop.ru/thumb/st4/fit/200/200/02e1469e2851745608a20b73be650928/6290c85e6f1dea941a3d2ffd85c145add516d8b6771224622f18eb36013dbc0e.jpg.webp" class="img-fluid rounded-start" alt="...">
          </div>
          <div class="col-md-8">
            <div class="card-body">
              <h5 class="card-title">Заголовок карточки</h5>
              <p class="card-text">Это более широкая карта с вспомогательным текстом ниже в качестве естественного
                перехода к дополнительному контенту. Этот контент немного длиннее.</p>
                <button type="button" class="btn btn-warning">Добавить в корзину</button>
            </div>
          </div>
        </div>
      </div>
    </div> 
    </a>
    

    <div class="m-2">
      <table class="table">
        <thead>
          <th>ID</th>
          <th>Продукт</th>
          <th>id категории</th>
          <th>Цена</th>
          <th>img</th>
          <th>Доступно на складе</th>
          <th>Доставка</th>
          <th>Описание</th>
          <th>Характеристика</th>
          <th>id поставщика</th>
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
            </td>
          </tr>
        </tbody>
      </table>
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
  },

  mounted() {
    this.getproduct();
  },
};
</script>

<style>
  a {
  text-decoration: none;
    }
  </style>