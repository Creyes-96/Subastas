<template>
    <div id="products_form">
        <h2>{{ title }}</h2>
        <form enctype="multipart/form-data" @submit.prevent="submitForm">
            <label for="name">Name</label>
            <input type="text"  class="name" placeholder="Write the product name..." v-model="product.name">

            <label for="description">Description</label>
            <textarea name="description" id="description" cols="30" rows="10" placeholder="Write the product details..." v-model="product.description"></textarea>

            <label for="price">Price</label>
            <input type="number" placeholder="$100.00" v-model="product.price"><br><br>

             <label for="limit_date">Deadline:</label>
            <input type="datetime-local" id="limit_date" name="limit_date"  v-model="product.limit_date"> 
                
            <label for="image">Select a image of the product</label>
    
           

            <input type=file data-direct-upload-url="<%= rails_direct_uploads_url %>" /><br><br>


            <button class="btn btn-primary">Submit</button>
        </form>
    </div>
</template>

<script>
 
    export default {
    
        name: 'Products-form',
    
        data: function () {
        return {
            title: "Add new product - Vue Form",
        
            // Campos 
            product: {
                name: '',
                description: '',
                price: '',
                limit_date: '',
                image: null,
                /*id: '',
                users_id: ''*/
            }
        }

        },
        methods: {
            uploadFile: function() {
                this.product.image = this.$refs.inputFile.files[0];
            },
            submitForm(){
                console.log("Entrando al método POST")

                const token = document.querySelector('[name=csrf-token]').content
                axios.defaults.headers.common['X-CSRF-TOKEN'] = token

                const data = {
                    product: this.product
                }

                axios.post("http://localhost:3000/products", data).then(function (response) {
                    console.log(response)
                    alert("Producto creado exitosamente.")
                })
            }
        },
        // Leemos los datos JSON con axios 
        mounted() {
        /*axios
            .get("http://localhost:3000/products")
            .then(response => {
                this.data = response.data;
                console.log(this.data); 
            });*/
        },
    
    }
</script>