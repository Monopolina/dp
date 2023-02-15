<template>
  <div class="container">
    <section class="ftco-section bg-light">
<div class="container">
<div class="row">
<div class="col-lg-6 mb-5 ftco-animate fadeInUp ftco-animated">
<a href="" class="image-popup">
  <img src="'../../assets/img/'+product.img" alt="">
  <!-- <img :src=" require('../../assets/img/'+product.img) "> -->
  <!-- <img :src="userWithIcon.img" class="img-fluid"> -->
</a>
</div>
<div class="col-lg-6 product-details pl-md-5 ftco-animate fadeInUp ftco-animated">
<h3>Young Woman Wearing Dress</h3>
<p class="price"><span>$120.00</span></p>
<p>A small river named Duden flows by their place and supplies it with the necessary regelialia. It is a paradisematic country, in which roasted parts of sentences fly into your mouth.</p>
<p>On her way she met a copy. The copy warned the Little Blind Text, that where it came from it would have been rewritten a thousand times and everything that was left from its origin would be the word "and" and the Little Blind Text should turn around and return to its own, safe country. But nothing the copy said could convince her and so it didn’t take long until a few insidious Copy Writers ambushed her, made her drunk with Longe and Parole and dragged her into their agency, where they abused her for their.
</p>
<div class="row mt-4">
<div class="col-md-6">
<div class="form-group d-flex">
<div class="select-wrap">
<div class="icon"><span class="ion-ios-arrow-down"></span></div>
</div>
</div>
</div>
<div class="w-100"></div>
<div class="input-group col-md-6 d-flex mb-3">
<span class="input-group-btn mr-2">
<button type="button" class="quantity-left-minus btn" data-type="minus" data-field="">
<i class="ion-ios-remove"></i>
</button>
</span>
<input type="text" id="quantity" name="quantity" class="form-control input-number" value="1" min="1" max="100">
<span class="input-group-btn ml-2">
<button type="button" class="quantity-right-plus btn" data-type="plus" data-field="">
<i class="ion-ios-add"></i>
</button>
</span>
</div>
</div>
<p><a href="cart.html" class="btn btn-primary py-3 px-5">Add to Cart</a></p>
</div>
</div>
</div>
</section>
    <div class="card border-info mb-3" align="center" style="max-width: 40rem;">
      <div class="card-body">
        <div class="card-header">id: {{ product.id }}</div>
        <p class="card-text">Продукт: {{ product.product_name }}</p>
        <p class="card-text">id категории: {{ product.id_categori }}</p>
        <p class="card-text">Цена: {{ product.price }}</p>
        <p class="card-text">img: {{ product.img }}</p>
        <p class="card-text">Доступно на складе: {{ product.available_in_stock }}</p>
        <p class="card-text">Доставка: {{ product.delivery }}</p>
        <p class="card-text">Описание: {{ product.description }}</p>
        <p class="card-text">Характеристика: {{ product.characteristic }}</p>
        <p class="card-text">id поставщика: {{ product.id_provider }}</p>
        <div align="center">
          <a href="/MagazinView" class="btn btn-secondary m-1">Вернуться на таблицу</a>
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
      let result = await fetch("http://localhost:3000/tovar/"+ this.$route.params.id, {
        method: "GET",
        headers: {
          accept: "application/json",
          "content-type": "application/json",
        }
      });
      this.product = await result.json();
      
    },
  },
  computed: {
  userWithIcon () {
    return {
      ...this.product, 
      icon: this.product.img && require(`../../assets/img/${this.product.img}`)
    }
  }
  },
 
  mounted() {
     this.getproductdetels();
  },
};
</script>