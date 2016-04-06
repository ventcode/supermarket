ApplicationRecord.transaction do
  Product.create!(name: "Orange", unit: "kg")
  Product.create!(name: "Carrot", unit: "kg")
  Product.create!(name: "Water", unit: "bottle")
  Product.create!(name: "Coca-Cola", unit: "can")
end
