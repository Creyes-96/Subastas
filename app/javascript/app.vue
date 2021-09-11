<template>
    <div id="app">
        <div>

        <p>{{ message }}</p>
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
    </div>
</template>

<script>
export default {
    props: ["name","description"],
    data: function () {
        return {
            message: "Products form with Vue"
        }
    }
}

</script>

<style scoped>
p {
    font-size: 2em;
    text-align: center;
}

</style>
