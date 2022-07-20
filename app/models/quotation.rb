class Quotation < ApplicationRecord
  belongs_to :insurance
  has_one :property_transaction
end
