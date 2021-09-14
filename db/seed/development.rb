puts "Cargando el seed de Development"

user = User.create_with(
    :first_name              => "Carlos",
    :last_name              => "Reyes",
    :username              => "Creyes",
    :password              => "123456",
    :password_confirmation => "123456"
).find_or_create_by(
    :email                 => "carlos_mlb_reyes@hotmail.com",
)


product = Product.create(
    name: "PC Gaming", 
    description: "Una pc dedicada a gaming", 
    price: 430,
    limit_date: '2021-12-12', 
    users_id: 1
)