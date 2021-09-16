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

user = User.create_with(
    :first_name              => "Lomax",
    :last_name              => "Technologies",
    :username              => "Lomax",
    :password              => "123456",
    :password_confirmation => "123456"
).find_or_create_by(
    :email                 => "lomax@gmail.com",
)