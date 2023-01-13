<template>

    <div class="modal modal-signin position-static d-block bg-secondary py-5" tabindex="-1" role="dialog" id="modalSignin">
  <div class="modal-dialog" role="document">
    <div class="modal-content rounded-4 shadow">
      <div class="modal-header p-5 pb-4 border-bottom-0">
        <!-- <h1 class="modal-title fs-5" >Заголовок модального окна</h1> -->
        <h1 class="fw-bold mb-0 fs-2">Зарегистрируйтесь бесплатно</h1>
      </div>

      <div class="modal-body p-5 pt-0">
        <form class="">
          <div class="form-floating mb-3">
            <input type="name" class="form-control rounded-3"  v-model="users.user">
            <label for="floatingInput">Имя пользователя</label>
          </div>
          <div class="form-floating mb-3">
            <input type="password" class="form-control rounded-3"  v-model="users.password">
            <label for="floatingPassword">Пароль</label>
          </div>
          <div class="form-floating mb-3">
            <input type="email" class="form-control rounded-3" v-model="users.email">
            <label for="floatingPassword">Email</label>
          </div>
          <button class="w-100 mb-2 btn btn-lg rounded-3 btn-primary" @click="postregister()">Зарегистрироваться</button>
          <small class="text-muted">Нажимая Зарегистрироваться, вы соглашаетесь с условиями использования.</small>
        </form>
      </div>
    </div>
  </div>
</div>

</template>

<script>
export default {
  data() {
    return {
      users: {}
    };
  },

  methods: {
    async postregister() {
       await fetch("http://localhost:3000/register",{
        method: "POST",
        headers:{
          accept: "application/json",
          "content-type": "application/json",
        },
        body: JSON.stringify(this.users),
      });
     this.$router.push({ name: "home" })
    },
  },
 
};
</script>