class PropertyTransaction < ApplicationRecord
  belongs_to :property_type
  belongs_to :quotation

  private

  def build_new_property_transaction
  	self.property_transaction||=PropertyTransaction.new
  end
end
