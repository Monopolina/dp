import { VueCookieNext } from 'vue-cookie-next'
import { createStore } from 'vuex'

export default createStore({
  state: { 
    token:""
  },
  getters: { 
    token(){
      return state.token
    },
    isAuthorized(state){
      if(state.token!="") return true
      else return false
    }
  },
  mutations: {
    tokenmutation(state, token){
      state.token = token
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
    
  },
  modules: {
  }
})