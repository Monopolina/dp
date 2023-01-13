<template>
  <NavComp/>
  <router-view/>
  <FooterComp/>
</template>

<script>
import NavComp from './components/NavComp.vue';
import FooterComp from './components/FooterComp.vue';
export default {
  name : "App",
  components : {
    NavComp, FooterComp
  }
  }
</script>
<script setup>
import { onMounted } from '@vue/runtime-core';
import { useStore } from 'vuex';
const store = useStore()
onMounted(async()=>{
  store.dispatch("gettokenfromcookie")
})
</script>