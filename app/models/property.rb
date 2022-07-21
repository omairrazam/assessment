class Property < ApplicationRecord
	has_many :property_transactions

	enum bound_by_water: { no: 0, yes: 1 }, _prefix: :bound_by_water
	enum on_municipal_water_sewer: { no: 0, yes: 1 }, _prefix: :on_municipal_water_sewer
	enum title_insurance_issued: { no: 0, yes: 1 }, _prefix: :title_insurance_issued
	enum title_insurance_denied: { no: 0, yes: 1 }, _prefix: :title_insurance_denied

end
