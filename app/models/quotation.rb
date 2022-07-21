class Quotation < ApplicationRecord
	has_one :property_transaction
	MINIMUM_VALUE_THRESHOLD=500000


	def full_name
		self.first_name.to_s + ' ' + self.last_name.to_s
	end

	def insurance_value

		value = self.municipal_evaluation.to_f

		if value < MINIMUM_VALUE_THRESHOLD
			value = MINIMUM_VALUE_THRESHOLD
		end

		form1 = (((value - 500000)/1000)*1.17)+320
		tax = form1 * 0.09
		emission_fee = 20.0
		"$" + (form1+tax+emission_fee).to_s
	end
end
