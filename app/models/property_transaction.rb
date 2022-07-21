class PropertyTransaction < ApplicationRecord
  belongs_to :property_type
  belongs_to :property
  belongs_to :insurance
  belongs_to :quotation
  
  enum language: { english: 0, french: 1 }
  enum is_owner: { no: 0, yes: 1 }, _prefix: :is_owner

  accepts_nested_attributes_for :property
  accepts_nested_attributes_for :insurance

end
