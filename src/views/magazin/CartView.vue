<template>
  <div class="container">
    <h1>Cart</h1>

    <div>
      <v-cart-item 
      v-for="(item, index) in cart_data"
      :key="item.id"
      :cart_item_data="item"
      @deleteCart="deleteCart(index)"
      />
    </div>

  </div>
</template>

<script>
import vCartItem from '@/components/v-cart-item.vue';
import { mapActions } from 'vuex';

export default {

  components: {
    vCartItem
  },
  props: {
    cart_data: {
      type: Array,
      default() {
        return []
      }
    }
  },
  methods: {
    ...mapActions([
      'DELETE_FROM_CART'
    ]), 
    async deleteCart(index) {
      this.DELETE_FROM_CART(index)
    },
  }

}
</script>