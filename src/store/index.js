import { VueCookieNext } from 'vue-cookie-next'
import { createStore } from 'vuex'

export default createStore({
  state: { 
    token:"",
    role: "user",
    cart: []
  },
  getters: { 
    token(state){
      return state.token
    },
    isAuthorized(state){
      if(state.token!="") return true
      else return false
    },
    isAdmin (state){
      return state.role
    },
    CART(state) {
      return state.cart;
    }
  },
  mutations: {
    tokenmutation(state, token){
      state.token = token
    },
    rolemutation(state, role){
      state.role = role
    },
    SET_CART: (state, product) => {
      if(state.cart.length){
        let isProduct = false;
        state.cart.map(function (item) {
          if (item.id === product.id){
            isProduct = true;
            item.quantity++
          }
          if (!isProduct) {
            state.cart.push(product)
          }
        })
      }
      else{
        state.cart.push(product)
      }
    },
    REMOVE_FROM_CART: (state, index) => {
      state.cart.splice(index,1)
    }
  },
  actions: {
    async gettokenfromcookie(context){
      //const token = context.commit("tokenmutation")
      const token = await VueCookieNext.getCookie("token")
      if (token) {
        context.commit("tokenmutation", token)
        }
      else {
        context.commit("tokenmutation", "")
        }
    },
    async getrolefromJWT(context){
      try
      {
      var base64Url = await VueCookieNext.getCookie("token").split('.')[1]

      var base64 = base64Url.replace(/-/g, '+').replace(/_/g, '/')
      var jsonPayload = decodeURIComponent(window.atob(base64).split('').map((c) => {
          return '%' + ('00' + c.charCodeAt(0).toString(16)).slice(-2)
      }).join(''))

      const result = await JSON.parse(jsonPayload)
      VueCookieNext.setCookie("role", result.admin)
      context.commit("rolemutation",result.admin) 
      }

      catch
      {
        VueCookieNext.setCookie("role", "user")
        context.commit("rolemutation", "user")
      }
    },
    async ADD_TO_CART({commit}, product) {
      commit('SET_CART', product);
    },
    DELETE_FROM_CART({commit}, index) {
      commit('REMOVE_FROM_CART', 'index')
    }
  },
  modules: {
  }
})