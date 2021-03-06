class DuplicateCoordinateValidator < ActiveModel::Validator
	def validate(record)
		current_coord = Location.find_by(lattitude: record[:lattitude])

		if(current_coord && 
			current_coord[:longitude] == record[:longitude] &&
			current_coord[:hemi_e_w] == record[:hemi_e_w].downcase &&
			current_coord[:hemi_n_s] == record[:hemi_n_s].downcase  &&
			!record[:id]) 
			record.errors[:coordinate] << " appears to be in the system already"
		end
	end
end
