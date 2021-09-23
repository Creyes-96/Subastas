<template>
    <div id="products_form_edit">
        <h2>{{ title }}</h2>
        <form @submit.prevent="submitForm" enctype="multipart/form-data">
            <label for="name">Name</label>
            <input type="text"  class="name" placeholder="Write the product name..." v-model="product.name">

            <label for="description">Description</label>
            <textarea name="description" id="description" cols="30" rows="10" placeholder="Write the product details..." v-model="product.description"></textarea>

            <label for="price">Price</label>
            <input type="number" placeholder="$100.00" v-model="product.price"><br><br>

             <label for="limit_date">Deadline:</label>
            <input type="datetime-local" id="limit_date" name="limit_date"  v-model="product.limit_date"> 
                
            <label for="image">Select a image of the product</label>

            <button class="btn btn-primary">Submit</button>
        </form>
    </div>
</template>

<script>
 
    export default {
    
        name: 'Products-form',
    
        data: function () {
        return {
            title: "Editing a product",
            
            // Campos 
            product: {
                name: '',
                description: '',
                price: '',
                limit_date: '',
                /*image: null
                id: '',
                users_id: ''*/
            }
        }
        },
        methods: {
            /*onFileSelected(event){
                console.log(event)
                this.product.image = this.$refs.inputFile.files[0];
            },*/
            submitForm(){
                console.log("Entrando al método Put - Update")

                const token = document.querySelector('[name=csrf-token]').content
                axios.defaults.headers.common['X-CSRF-TOKEN'] = token

                

                const data = {
                    product: this.product
                }

                axios.put("http://localhost:3000/products/${}", data).then(function (response) {
                    console.log(response)
                    alert("Producto editado exitosamente.")
                })
            }
        },
        mounted() {

        },
    
    }
</script>