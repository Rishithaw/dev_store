class Province < ApplicationRecord
  validates :name, presence: true
  validates :abbreviation, presence: true

  validates :gst, :pst, :hst,
            numericality: { greater_than_or_equal_to: 0 }
end
