<template>
 
  <div class="table-responsive">  
    <table class="table mt-3" :items="data" :fields="fields">
      <thead class="thead-dark">
        <tr>
          <th scope="col">Nombre</th>
          <th scope="col">Precio</th>
          <th scope="col">Stock</th>
          <th scope="col">Imagen</th>
        </tr>
      </thead>
      <tbody>
        <tr v-for="producto in data" v-bind:key="producto.id">          
          <td>{{ producto.nombre }}</td>
          <td>{{ producto.description }}</td>
          <td>{{ producto.price }}</td>
          <td>
            
          </td>
        </tr>
      </tbody>
    </table> 
  </div>
 
</template>

<script>
 
    export default {
    
        name: 'Products',
    
        data: function () {
        return {
            // Campos 
            fields: ['name', 'description', 'price'],
    
            // Obtenemos los datos en el array 'data' 
            data: []
        }
        },
    
        // Leemos los datos JSON con axios 
        mounted() {
        axios
            .get("http://localhost:3000/products")
            .then(response => {
                this.data = response.data;
                console.log(this.data); 
            });
        },
    
    }
</script>