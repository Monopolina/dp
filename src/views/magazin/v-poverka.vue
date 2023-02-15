<template>
  <div class="v-poverka">
    <MagazinView />
    <CartView 
    v-if="CART.length"
    :cart_data="CART"
    />
  </div>
</template>

<script>
import MagazinView from './MagazinView.vue';
import CartView from './CartView.vue';
import { mapGetters } from 'vuex';

export default {

  components: {
    MagazinView,
    CartView
  },
  computed: {
    ...mapGetters([
      'CART'
    ])
  }

}
</script>