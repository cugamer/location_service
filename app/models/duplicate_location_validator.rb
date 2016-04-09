class DuplicateLocationValidator < ActiveModel::Validator
	def validate(record)
		company = Location.where(company_id: record[:company_id])
		# company = Location.find_by(company_id: record[:company_id])
		# p "------------------------------"
		# p company[:location_title]
		# p record[:location_title]
		# if(company &&
		# 	company[:location_title] == record[:location_title])
		# 	record.errors[:location_title] << " '#{record[:location_title]}' is already present for this company"
		# end
		if company
			company.each do |comp|
				if(comp[:location_title] == record[:location_title])
					record.errors[:location_title] <<" '#{record[:location_title]}' is already present for this company"
					break
				end
			end
		end
	end
end