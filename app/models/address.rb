class Address < ApplicationRecord
  belongs_to :user
  belongs_to :province

  validates :street, presence: true
  validates :city, presence: true
  validates :postal_code, presence: true,
                          format: { with: /\A[A-Za-z]\d[A-Za-z] ?\d[A-Za-z]\d\z/,
                                    message: "must be a valid Canadian postal code" }

  validates :is_default, inclusion: { in: [true, false] }
end
