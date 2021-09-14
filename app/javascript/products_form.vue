<template>
    <div id="products_form">
        <h1>{{ title }}</h1>
        <label for="name">Name</label>
        <input type="text"  class="name" placeholder="Write the product name...">

        <label for="description">Description</label>
        <textarea name="description" id="description" cols="30" rows="10" placeholder="Write the product details..."></textarea>

        <label for="price">Price</label>
        <input type="number" placeholder="$100.00"><br><br>
            
        <label for="image">Select a image of the product</label>
        <input type="file" id="image" accept="image/png, image/jpeg"><br><br>

        <input type="submit">
    </div>
</template>

<script>
 
    export default {
    
        name: 'Products-form',
    
        data: function () {
        return {
            title: "Add new product - Vue Form",
            // Campos 
            fields: ['name', 'description', 'price'],
    
            // Obtenemos los datos en el array 'data' 
            data: []
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