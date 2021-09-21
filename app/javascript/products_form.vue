<template>
    <div id="products_form">
        <h2>{{ title }}</h2>
        <form v-on:submit.stop="submitForm">
            <label for="name">Name</label>
            <input type="text"  class="name" placeholder="Write the product name..." v-model="form.name">
            <input type="text"  class="name" placeholder="Write the product name..." v-model="form.id">
            <input type="text"  class="name" placeholder="Write the product name..." v-model="form.users_id">

            <label for="description">Description</label>
            <textarea name="description" id="description" cols="30" rows="10" placeholder="Write the product details..." v-model="form.description"></textarea>

            <label for="price">Price</label>
            <input type="number" placeholder="$100.00" v-model="form.price"><br><br>
                
            <label for="image">Select a image of the product</label>
            <input type="file" id="image" accept="image/png, image/jpeg"><br><br>

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
            form: {
                name: '',
                description: '',
                price: '',
                limit_date: '',
                id: '',
                users_id: ''
            }
        }
        },
        methods: {
            submitForm(){
                axios.post('/products.json', this.form)
                 .then((response) => {
                     //Perform Success Action
                 })
                 .catch((error) => {
                     // error.response.status Check status code
                 }).finally(() => {
                     //Perform action in always
                 });
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