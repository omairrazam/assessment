class PropertyTransaction < ApplicationRecord
  belongs_to :property_type
  belongs_to :quotation
  belongs_to :property

  enum language: { english: 0, french: 1 }
  enum is_owner: { no: 0, yes: 1 }, _prefix: :is_owner

  private

  def build_new_property_transaction
  	self.property_transaction||=PropertyTransaction.new
  end
end
