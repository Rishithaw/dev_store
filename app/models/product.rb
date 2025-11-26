class Product < ApplicationRecord
  belongs_to :category
  def price
    on_sale? && sale_price.present? ? sale_price : base_price
  end

end
