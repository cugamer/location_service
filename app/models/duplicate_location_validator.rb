class DuplicateLocationValidator < ActiveModel::Validator
	def validate(record)
		company = Location.where(company_id: record[:company_id])
		if company
			company.each do |comp|
				if(comp[:location_title] == record[:location_title])
					record.errors[:location_title] << %Q[(#{record[:location_title]}) is already present for this company]
					break
				end
			end
		end
	end
end