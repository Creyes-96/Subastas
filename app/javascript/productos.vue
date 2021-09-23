<template>
 
    <div class="table-responsive">  
        <table class="table mt-3" :items="data" :fields="fields">
        <thead class="thead-dark">
            <tr>
            <th scope="col">ID</th>
            <th scope="col">Name</th>
            <th scope="col">Description</th>
            <th scope="col">Price</th>
            <th scope="col">Limit Date</th>
            <th scope="col">Seller</th>
            <th scope="col"></th>
            <!--<th scope="col">Product</th>-->
            </tr>
        </thead>
        <tbody>
            <tr v-for="product in data" v-bind:key="product.id">          
            <td>{{ product.id }}</td>
            <td>{{ product.name }}</td>
            <td>{{ product.description }}</td>
            <td>{{ product.price }}</td>
            <td>{{ product.limit_date }}</td>
            <td>{{ product.users_id }}</td>
            <td><i class="fas fa-trash-alt fa-3x" @click="deleteContact(product)"></i></td>
            
            <!--<td>{{ product.image }}</td>-->
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
        methods: {
            deleteContact(product){
                console.log("Entrando al método DELETE")

                const token = document.querySelector('[name=csrf-token]').content
                axios.defaults.headers.common['X-CSRF-TOKEN'] = token

                const url = `http://localhost:3000/products/${product.id}`;
                return axios.delete(url).then(function (response) {
                    console.log(response)
                    alert("Producto borrado exitosamente.")
                });
                
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