class Insurance < ApplicationRecord
	has_one :quotation

	after_initialize :build_quotation


	private
	def build_quotation
		self.quotation ||= Quotation.new
	end
end
