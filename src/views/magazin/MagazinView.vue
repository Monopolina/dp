<template>
  <div class="container">
    <div class="products-list ">
      <div class="products-list__content">
        <div class="catalog-products view-simple" >
          <div data-id="product" class="catalog-product ui-button-widget ">
            
            <div class="catalog-product__image">
              <a class="catalog-product__image-link" href="/product">
                <picture>
                  <source type="image/webp" media="(min-width: 768px)" data-srcset="https://c.dns-shop.ru/thumb/st4/fit/200/200/b87bef09344d0b36952f03a7d23e137f/2f9ac3193c90f895771ba06feaff2ded2dbef0c9f9de1a01b649babddcee7040.jpg.webp"  srcset="https://c.dns-shop.ru/thumb/st4/fit/200/200/b87bef09344d0b36952f03a7d23e137f/2f9ac3193c90f895771ba06feaff2ded2dbef0c9f9de1a01b649babddcee7040.jpg.webp">
                  <source type="image/webp" media="(max-width: 767px)" data-srcset="https://c.dns-shop.ru/thumb/st4/fit/120/120/4564d09d82d20455c45b95b6a6e2f2cd/2f9ac3193c90f895771ba06feaff2ded2dbef0c9f9de1a01b649babddcee7040.jpg.webp" srcset="https://c.dns-shop.ru/thumb/st4/fit/120/120/4564d09d82d20455c45b95b6a6e2f2cd/2f9ac3193c90f895771ba06feaff2ded2dbef0c9f9de1a01b649babddcee7040.jpg.webp">
                  <img alt="Процессор AMD A6-9500E OEM" data-src="https://c.dns-shop.ru/thumb/st4/fit/200/200/b87bef09344d0b36952f03a7d23e137f/2f9ac3193c90f895771ba06feaff2ded2dbef0c9f9de1a01b649babddcee7040.jpg"  class="loaded" src="https://c.dns-shop.ru/thumb/st4/fit/200/200/b87bef09344d0b36952f03a7d23e137f/2f9ac3193c90f895771ba06feaff2ded2dbef0c9f9de1a01b649babddcee7040.jpg">
                </picture>
              </a>
            </div>

            <a class="catalog-product__name ui-link ui-link_black" href="/product/790d362c7e3e3330/processor-amd-a6-9500e-oem/" data-gtm-vis-has-fired-32166084_1461="1">
              <span data-gtm-vis-has-fired-32166084_1461="1">Процессор AMD A6-9500E OEM [AM4, 2 x 3 ГГц, L2 - 1 МБ, 2хDDR4-2400 МГц, AMD Radeon R5, TDP 35 Вт]</span>
            </a>

              <div class="catalog-product__voblers" data-gtm-vis-has-fired-32166084_1461="1">
            </div>
            <div class="catalog-product__stat" data-gtm-vis-has-fired-32166084_1461="1">
              <span class="compare-checkbox">
                <label class="ui-checkbox"><span>Сравнить</span><input type="checkbox" class="ui-checkbox__input">
                <span class="ui-checkbox__box"></span>
              </label>
            </span>
            <a class="catalog-product__rating ui-link ui-link_black" href="/product/790d362c7e3e3330/processor-amd-a6-9500e-oem/opinion/" data-rating="4" data-gtm-vis-has-fired-32166084_1461="1"><i data-gtm-vis-has-fired-32166084_1461="1"></i><i data-gtm-vis-has-fired-32166084_1461="1"></i><i data-gtm-vis-has-fired-32166084_1461="1"></i><i data-gtm-vis-has-fired-32166084_1461="1"></i><i data-gtm-vis-has-fired-32166084_1461="1"></i>52</a><a class="catalog-product__service-rating ui-link ui-link_black" href="/product/790d362c7e3e3330/processor-amd-a6-9500e-oem/service-rating/" data-gtm-vis-has-fired-32166084_1461="1"><i class="catalog-product__service-rating-icon catalog-product__service-rating-icon_5" data-gtm-vis-has-fired-32166084_1461="1"></i>98,77</a><a class="catalog-product__comment ui-link ui-link_black" href="/product/790d362c7e3e3330/processor-amd-a6-9500e-oem/communicator/" data-gtm-vis-has-fired-32166084_1461="1"><i class="catalog-product__comment-icon" data-gtm-vis-has-fired-32166084_1461="1"></i>&nbsp;7</a>
            </div>
            <div class="product-buy product-buy_one-line catalog-product__buy">
              <div class="product-buy__price-wrap product-buy__price-wrap_interactive">
              <div class="product-buy__price">1 399 ₽</div>
              <div class="product-buy__hint"></div>
            </div>
              <button class="button-ui button-ui_white button-ui_icon wishlist-btn"></button>
              <button class="button-ui buy-btn button-ui_brand button-ui_passive">Купить</button>
            </div>
              <span  class="catalog-product__avails avails-container">
                <span class="order-avail-wrap">
              </span>
              <span class="delivery-info-widget">
              </span>
            </span>
          </div>
        </div>
      </div>
    </div>

    <div align="center">
    <h1>Таблица </h1>
    <a href="/productsave" class="btn btn-success m-2">Добавить</a>
    </div>  
    
    <div class="m-2"> 
      <table  class="table">
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
                    <td>{{ product.id	 }}</td>
                    <td>{{ product.product}}</td>
                    <td>{{ product.id_categori }}</td>
                    <td>{{ product.price }}</td>
                    <td>{{ product.img }}</td>
                    <td>{{ product.available_in_stock }}</td>
                    <td>{{ product.delivery }}</td>
                    <td>{{ product.description }}</td>
                    <td>{{ product.characteristic }}</td>
                    <td>{{ product.id_provider	 }}</td>
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
export default {
  data() {
    return {
      productdata: {},
      products: [],
      
    };
  },

  methods: {
    async getproduct() {
      let result = await fetch("http://localhost:3001/product");
      this.products = await result.json();
    },
    async createproduct() {
      fetch("http://localhost:3001/product/create", {
        method: "POST",
        headers: {
          accept: "application/json",
          "content-type": "application/json",
        },
        body: JSON.stringify(this.productdata),
      });
    },
    async deleteproduct(ID) {
      return fetch("http://localhost:3001/product/delete/"+ ID, );
    },
    async button(ID) {
      await this.deleteproduct(ID);
      window.location.reload();  
      
    },
    async getproductedit(ID) {
      this.$router.push({name: 'productedit', params: { id: ID }});
    },
    async getproductdetels(ID){
      this.$router.push({name: 'productdetels', params: { id: ID }});
    }
  },

  mounted() {
    this.getproduct();
  },
};
</script>

<style>

</style>
