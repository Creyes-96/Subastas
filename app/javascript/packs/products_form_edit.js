import Vue from 'vue'
import ProductsFormEdit from '../products_form_edit.vue'
// Creamos una variable global 'axios' 
window.axios = require('axios');
// Creamos una propiedad global para axios 
Vue.prototype.$axios = axios

document.addEventListener('DOMContentLoaded', () => {
  const productformedit = new Vue({
    render: h => h(ProductsFormEdit)
  }).$mount()
  document.body.appendChild(productformedit.$el)

  console.log(productformedit)
})  