import { VueCookieNext } from 'vue-cookie-next'
import { createStore } from 'vuex'

export default createStore({
  state: { 
    token:"",
    role: "user"
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
    }
  },
  mutations: {
    tokenmutation(state, token){
      state.token = token
    },
    rolemutation(state, role){
      state.role = role
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
    }
  },
  modules: {
  }
})