require "rails_helper"

RSpec.describe Product, type: :model do
  it "is invalid without name" do
    expect(build(:product, name: nil)).not_to be_valid
  end

  it "is invalid without unit" do
    expect(build(:product, unit: nil)).not_to be_valid
  end

  it "is invalid with duplicated name" do
    existing_product = create(:product)

    expect(build(:product, name: existing_product.name)).not_to be_valid
  end
end
