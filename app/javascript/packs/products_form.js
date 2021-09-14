import Vue from 'vue'
import App from '../app.vue'
import ProductsForm from '../products_form.vue'
// Creamos una variable global 'axios' 
window.axios = require('axios');
// Creamos una propiedad global para axios 
Vue.prototype.$axios = axios

document.addEventListener('DOMContentLoaded', () => {
  const productform = new Vue({
    render: h => h(ProductsForm)
  }).$mount()
  document.body.appendChild(productform.$el)

  console.log(productform)
})