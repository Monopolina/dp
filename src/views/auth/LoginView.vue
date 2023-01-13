<template>
   <div class="modal modal-signin position-static d-block bg-secondary py-5" tabindex="-1" role="dialog" id="modalSignin">
  <div class="modal-dialog" role="document">
    <div class="modal-content rounded-4 shadow">
      <div class="modal-header p-5 pb-4 border-bottom-0">
        <h1 class="fw-bold mb-0 fs-2">Вход</h1>
      </div>

      <div class="modal-body p-5 pt-0">
        
          <div class="form-floating mb-3">
            <input type="user" class="form-control rounded-3" v-model="users.user">
            <label for="floatingInput">Имя пользователя</label>
          </div>
          <div class="form-floating mb-3">
            <input type="password" class="form-control rounded-3" v-model="users.password">
            <label for="floatingPassword">Пароль</label>
          </div>
          <button class="w-100 mb-2 btn btn-lg rounded-3 btn-primary" @click="postlogin()">Вход</button>
        
      </div>
    </div>
  </div>
</div>
</template>

<script>
import { VueCookieNext } from 'vue-cookie-next'
import { useStore } from 'vuex';
import { onMounted } from '@vue/runtime-core';
export default {
  data() {
    return {
      users: {}
    };
  },
  
  methods: {
    async postlogin() {
       const data = await fetch("http://localhost:3000/login",{
        method: "POST",
        headers:{
          accept: "application/json",
          "content-type": "application/json",
        },
        body: JSON.stringify(this.users),
      });
      if(data.status==200){
        await VueCookieNext.setCookie("token", await data.text())
       await this.$router.push({ name: "home" })
       window.location.reload()
      }
       
       
    }
  },
 
};
</script>
