# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Customer.create!(
  [
    {id: 1, email: "a@a", password: "123123", name: "a", is_deleted: false, status: "item_release"},
    {id: 2, email: "b@b", password: "123123", name: "b", is_deleted: false, status: "item_release"}
  ]
)

Item.create!(
  [
    {id: 1, customer_id: 1, title: "猫1", introduction: "猫に小判", image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/kotowaza_neko_koban.png"), filename:"kotowaza_neko_koban.png")},
    {id: 2, customer_id: 2, title: "猫2", introduction: "こたつ猫", image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/cat_kotatsu_neko.png"), filename:"cat_kotatsu_neko.png")}
  ]
)

Admin.create!(id: 1, email: "a@a", password: "123123")