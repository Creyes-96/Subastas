<template>
 
    <div class="table-responsive">  
        <table class="table mt-3" :items="data" :fields="fields">
        <thead class="thead-dark">
            <tr>
            <th scope="col">ID</th>
            <th scope="col">Name</th>
            <th scope="col">Description</th>
            <th scope="col">Price</th>
            </tr>
        </thead>
        <tbody>
            <tr v-for="product in data" v-bind:key="product.id">          
            <td>{{ product.id }}</td>
            <td>{{ product.name }}</td>
            <td>{{ product.description }}</td>
            <td>{{ product.price }}</td>
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
            fields: ['id', 'name', 'description', 'price'],
    
            // Obtenemos los datos en el array 'data' 
            data: []
        }
        },
    
        // Leemos los datos JSON con axios 
        mounted() {
      
            axios
                .get('http://localhost:3000/products.json/')
                .then(response => {
                    console.log (response)
                    this.data = response.data; 
                });
        },
    
    }
</script>